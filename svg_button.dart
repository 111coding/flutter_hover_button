import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgButton extends StatefulWidget {
  const SvgButton({
    Key? key,
    required this.assets,
    this.defaultColor = Colors.black,
    this.hoverColor = Colors.orange,
    this.clickColor = Colors.red,
    this.onClick,
  }) : super(key: key);

  final String assets;
  final Color defaultColor;
  final Color hoverColor;
  final Color clickColor;
  final Function()? onClick;

  @override
  State<SvgButton> createState() => _SvgButtonState();
}

class _SvgButtonState extends State<SvgButton> {
  bool _hover = false;
  set hover(bool v) {
    setState(() {
      _hover = v;
    });
  }

  bool _click = false;
  set click(bool v) {
    setState(() {
      _click = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (d) => hover = true,
      onExit: (d) => hover = false,
      child: GestureDetector(
        onTapDown: (d) => click = true,
        onTapUp: (d) {
          click = false;
          widget.onClick?.call();
        },
        onTapCancel: () => click = false,
        child: SvgPicture.asset(
          widget.assets,
          color: _click ? widget.clickColor : (_hover ? widget.hoverColor : widget.defaultColor),
        ),
      ),
    );
  }
}
