import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? initialValue;

  final String label;
  final double? labelFontSize;
  final dynamic validatorLabel;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? obscured;
  final int? maxLength;

  final dynamic suffixIcon;
  final FormFieldValidator<String?>? validatorFunc;
  final dynamic maxline;

  const MyTextField({
    super.key,
    required this.controller,
    this.initialValue,
    required this.label,
    this.labelFontSize,
    this.validatorLabel,
    this.inputFormatters,
    this.keyboardType,
    this.obscured,
    this.suffixIcon,
    this.validatorFunc,
    this.maxline,
    this.maxLength,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      controller: widget.controller,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        counterText: '',
        labelText: widget.label ?? '',
        filled: true,
        fillColor: Colors.blueGrey[50],
        labelStyle: TextStyle(fontSize: 3.sp),
        contentPadding: EdgeInsets.only(left: 30),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey.shade50),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey.shade50),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey.shade50),
            borderRadius: BorderRadius.circular(15)),
      ),
      validator: widget.validatorFunc,
    );
  }
}
