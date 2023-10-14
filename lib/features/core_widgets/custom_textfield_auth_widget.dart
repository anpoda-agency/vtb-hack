import 'package:flutter/material.dart';

class CustomTextFieldAuthWidget extends StatefulWidget {
  const CustomTextFieldAuthWidget({
    super.key,
    this.controller,
    this.hintText,
    required this.inputType,
    this.onChanged,
  });
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType inputType;
  final Function(String)? onChanged;

  @override
  State<CustomTextFieldAuthWidget> createState() => _CustomTextFieldAuthWidgetState();
}

class _CustomTextFieldAuthWidgetState extends State<CustomTextFieldAuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
          ),
          TextField(
            onChanged: widget.onChanged,
            controller: widget.controller,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(20, 17, 20, 17),
                border: const OutlineInputBorder(
                  borderSide: const BorderSide(width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                ),
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFFCAD1DD),
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  height: 0.08,
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7), borderSide: const BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(7),
                )),
            keyboardType: widget.inputType,
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
