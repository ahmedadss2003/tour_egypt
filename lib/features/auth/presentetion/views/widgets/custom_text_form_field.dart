import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  const CustomTextFormFieldWidget({
    super.key,
    this.onChanged,
    required this.labelText,
     this.icon,
    this.controller,
    this.suufixIcon,
    this.isPassword = false,
    this.keyboardType,
    this.onSaved,
    this.initialValue,
  });

  final String labelText;
  final IconData? icon;
  final IconData? suufixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool isPassword;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final String? initialValue;

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  bool _obscureText = true; // Default: Password is hidden

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height: 8),
        TextFormField(
          initialValue: widget.initialValue,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
          obscureText: widget.isPassword ? _obscureText : false,
          textAlign: TextAlign.right,
          textDirection: TextDirection.ltr,
          validator: (value) {
            if (value!.isEmpty) {
              return "Field Is Required";
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
            ),
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : (widget.suufixIcon != null ? Icon(widget.suufixIcon) : null),
            labelText: widget.labelText,
            labelStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
            floatingLabelStyle: const TextStyle(
              color: Color(0xffFD6B22),
              fontWeight: FontWeight.w500,
            ),
            hintTextDirection: TextDirection.ltr,
          ),
        ),
      ],
    );
  }
}