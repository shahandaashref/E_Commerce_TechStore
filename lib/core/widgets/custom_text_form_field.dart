import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String?  labelText;
  final Icon? icon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const CustomTextFormField({super.key, required this.hintText,this.labelText, this.icon, this.controller, this.keyboardType, this.validator});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText??'', style: theme.textTheme.bodyLarge,),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration:  InputDecoration(
            hintText:hintText,
            prefixIcon: icon,
        
            
          ),
          validator: validator,
        ),
      ],
    );
  }
}