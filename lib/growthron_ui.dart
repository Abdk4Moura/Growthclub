import 'package:flutter/material.dart';

typedef VoidCallback<T> = void Function(T);
typedef VoidVoidCallback = void Function();

class GrowthronDropdown extends StatefulWidget {
  final List options;
  final VoidCallback? onChanged;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final String? hintText;
  final Icon icon;
  final Color? fillColor;
  final int? elevation;
  final int? borderRadius;
  final Color? borderColor;
  final EdgeInsetsDirectional? margin;
  final bool hidesUnderline;
  final double? borderWidth;

  const GrowthronDropdown(
      {required this.options,
      this.width,
      this.height,
      this.hintText,
      required this.icon,
      this.fillColor,
      this.elevation,
      this.borderColor,
      this.borderWidth,
      this.borderRadius,
      this.margin,
      this.hidesUnderline = true,
      this.textStyle,
      this.onChanged,
      key})
      : super(key: key);
  @override
  State<GrowthronDropdown> createState() => _GrowthronDropdownState();
}

class _GrowthronDropdownState extends State<GrowthronDropdown> {
  @override
  Widget build(BuildContext context) {
    var selected = widget.options.isEmpty ? null : widget.options[0];

    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: widget.fillColor,
        border: Border.all(
            color: widget.borderColor as Color,
            width: widget.borderWidth as double),
      ),
      child: DropdownButton(
          hint: Text(widget.hintText as String),
          icon: widget.icon,
          value: selected,
          dropdownColor: widget.fillColor,
          elevation: widget.elevation as int,
          borderRadius: BorderRadius.circular(widget.borderRadius as double),
          underline: widget.hidesUnderline
              ? null
              : Divider(color: Theme.of(context).primaryColor),
          items: widget.options
              .map((e) => DropdownMenuItem(child: Text(e)))
              .toList(),
          onChanged:
              widget.onChanged ?? (dynamic newValue) => selected = newValue),
    );
  }
}

class GrowthronButtonOptions {
  final double? width;
  final double? height;
  final Color? color;
  final TextStyle? textStyle;
  final double? elevation;
  final BorderSide? borderSide;
  final BorderRadius? borderRadius;

  const GrowthronButtonOptions(
      {this.width,
      this.height,
      this.color,
      this.textStyle,
      this.elevation,
      this.borderSide,
      this.borderRadius});
}

class GrowthronButton extends StatelessWidget {
  const GrowthronButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.options});

  final VoidVoidCallback onPressed;
  final String text;
  final GrowthronButtonOptions options;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: options.width,
      height: options.height,
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStatePropertyAll<EdgeInsets?>(EdgeInsets.all(20)),
            backgroundColor: MaterialStatePropertyAll<Color?>(options.color),
            elevation: MaterialStatePropertyAll<double?>(options.elevation),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: options.borderRadius ?? BorderRadius.zero,
                side: options.borderSide ?? BorderSide.none))),
        onPressed: onPressed,
        child: Text(text, style: options.textStyle),
      ),
    );
  }
}

class GrowthronIconButton extends StatelessWidget {
  const GrowthronIconButton(
      {super.key,
      this.borderRadius,
      this.borderColor,
      this.borderWidth,
      required this.onPressed,
      required this.icon,
      this.buttonSize});

  final Color? borderColor;
  final double? borderRadius;
  final double? borderWidth;
  final double? buttonSize;
  final Icon icon;
  final VoidVoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: borderColor ?? Colors.transparent,
                  width: borderWidth ?? 0))),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
        iconSize: buttonSize,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
