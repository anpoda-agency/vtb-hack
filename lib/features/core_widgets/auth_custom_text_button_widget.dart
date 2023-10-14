import 'package:flutter/material.dart';

class AuthCustomTextButton extends StatelessWidget {
  const AuthCustomTextButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isUnderline,
    this.textStyle,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.prefIcon,
    this.innerPadding,
    this.width,
    this.endIcon,
  });

  final Function()? onTap;
  final String text;
  final bool? isUnderline;
  final TextStyle? textStyle;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Widget? prefIcon;
  final EdgeInsetsGeometry? innerPadding;
  final double? width;
  final Widget? endIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: const Color(0xFFF3F7FA),
      highlightColor: const Color(0xFFF3F7FA),
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          prefIcon ?? const SizedBox.shrink(),
          SizedBox(
              height: 2,
              width: (width == null) ? null : width,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: text,
                      style: const TextStyle(
                        color: Color(0xFF5786CE),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        height: 0.09,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              )
              /* 
            Text(
              text,
              style: textStyle ??
                  TextStyle(
                      fontSize: fontSize ?? 14,
                      fontWeight: fontWeight ?? FontWeight.w400,
                      color: color ?? Colors.white,
                      decoration: isUnderline != null && isUnderline == true ? TextDecoration.underline : null),
            ),
             */
              ),
          endIcon ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
