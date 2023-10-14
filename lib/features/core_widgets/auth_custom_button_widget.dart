import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthCustomButtonWidget extends StatelessWidget {
  const AuthCustomButtonWidget({
    this.text,
    this.icon,
    this.onTap,
    this.height,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.alignment,
    this.fontSize,
    this.linearGradient,
    Key? key,
  })  : assert(
          text != null || icon != null,
          'need set text or icon',
        ),
        super(key: key);

  final String? text;
  final Widget? icon;
  final Function()? onTap;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final MainAxisAlignment? alignment;
  final double? fontSize;
  final LinearGradient? linearGradient;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(44),
      color: Colors.transparent,
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? 60,
        child: Ink(
          //color: backgroundColor,
          //color: Colors.black,
          decoration: ShapeDecoration(
            color: backgroundColor,
            gradient: linearGradient,
            /* 
            LinearGradient(
              begin: const Alignment(0.99, -0.10),
              end: const Alignment(-0.99, 0.1),
              colors: [
                const Color(0xFFCECECE).withOpacity(0.2),
                Colors.white.withOpacity(0.35),
              ],
            ),
             */
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.white.withOpacity(0.3),
              ),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(7),
            onTap: onTap,
            child: Row(
              mainAxisAlignment: alignment ?? MainAxisAlignment.center,
              children: [
                icon ?? const SizedBox.shrink(),
                //SvgPicture.asset('images/icons/qrcode.svg'),
                //const SizedBox(width: 9),
                Text(
                  text ?? '',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
