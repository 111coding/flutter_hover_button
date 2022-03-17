import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgButton extends StatefulWidget {
  const SvgButton({
    Key? key,
    required this.assets,
    this.defaultColor = Colors.black,
    this.hoverColor = Colors.orange,
    this.onClick,
  }) : super(key: key);

  final String assets;
  final Color defaultColor;
  final Color hoverColor;
  final Function()? onClick;

  @override
  State<SvgButton> createState() => _SvgButtonState();
}

class _SvgButtonState extends State<SvgButton> {
  late Color currentColor = widget.defaultColor;

  void setDefaultColor() => setState(() {
        currentColor = widget.defaultColor;
      });

  void setHoverColor() => setState(() {
        currentColor = widget.hoverColor;
      });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (d) => setHoverColor(),
      onExit: (d) => setDefaultColor(),
      child: GestureDetector(
        onTapDown: (d) => setHoverColor(),
        onTapUp: (d) {
          setDefaultColor();
          widget.onClick?.call();
        },
        onTapCancel: setDefaultColor,
        child: SvgPicture.asset(
          widget.assets,
          color: currentColor,
        ),
      ),
    );
  }
}
