import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key, required this.txt, this.suffixIcon, this.keyboardType, this.onSaved,  this.isPassword = false, this.controller});
  final String txt ;
  final IconData? suffixIcon ;
  final TextInputType? keyboardType ;
  final void Function(String?)? onSaved ;
  final bool isPassword;
  final TextEditingController? controller ;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      obscureText: widget.isPassword ? isObscure : false,
      onSaved: widget.onSaved,
      
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        
        return null;
      },
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration:  InputDecoration(
        
        hintText: widget.txt,
        suffixIcon: widget.isPassword?IconButton(
          
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure; // Toggle visibility
                  });
                },
                icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
              ) : widget.suffixIcon != null ? Icon(widget.suffixIcon) : null,
         
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE6E9EA)),
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          
        ),
      )
    );
  }
}