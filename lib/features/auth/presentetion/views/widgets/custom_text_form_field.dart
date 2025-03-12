import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  const CustomTextFormFieldWidget({
    super.key,
    this.onChanged,
    required this.labelText,
    required this.icon,
    this.controller,
    this.suufixIcon,
    this.isPassword = false, this.keyboardType, this.onSaved, 
  });

  final String labelText;
  final IconData icon;
  final IconData? suufixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool isPassword; 
  final TextInputType? keyboardType ;
  final void Function(String?)? onSaved ;

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  bool _obscureText = true; // Default: Password is hidden (dots)

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false, // Toggle obscureText
      validator: (value) {
        if (value!.isEmpty) {
          return "Field Is Required";
        } else {
          return null;
        }
      },
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText; // Toggle password visibility
                  });
                },
              )
            : Icon(widget.suufixIcon),
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}