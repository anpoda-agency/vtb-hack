import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vtb_hack/core/constants.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    Key? key,
    required this.value,
    required this.onTap,
    required this.text,
    this.padding,
  }) : super(key: key);

  final bool value;
  final EdgeInsetsGeometry? padding;
  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          value
              ? SvgPicture.asset('${AppConstants.icons}checkbox_on.svg')
              : SvgPicture.asset('${AppConstants.icons}checkbox_off.svg'),
          const SizedBox(
            width: 16,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF1A1D22),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
