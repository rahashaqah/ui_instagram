import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final String? label;
  final bool isPassword;
  final String? errorText;
  final String? hintText;
  final Widget? prefixIcon;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final double? width;

  InputWidget({
    super.key,
    required this.textEditingController,
    this.label,
    this.isPassword = false,
    this.prefixIcon,
    this.maxLines,
    this.keyboardType,
    this.hintText,
    this.errorText,
    this.validator,
    this.width,
  });



  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool _obscureText = true;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        decoration: BoxDecoration(
          color: Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(10),),
      child: TextFormField(
        obscureText: _obscureText,
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        maxLines: widget.maxLines ?? 1,
        validator: widget.validator,
        decoration: InputDecoration(
          labelText: widget.label,
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText,
          hintStyle:  TextStyle(
            color: Colors.grey[400],
            fontSize: 15,
            fontWeight: FontWeight.w500
          ),
          errorText: widget.errorText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red[900]!, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red[900]!, width: 1),
          ),


        ),
      ),
    );
  }
}
