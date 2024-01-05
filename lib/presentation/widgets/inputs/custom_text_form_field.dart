
import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {

  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final bool obscureText;

  const CustomTextFormField({
    super.key, 
    this.label, 
    this.hint, 
    this.errorMessage, 
    this.onChanged, 
    this.validator, 
    this.prefixIcon, 
    this.obscureText = false,
    });

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        // borderSide: BorderSide(
        //   color: colors.primary,
        //   width: 2.0,
        // ),
      );
    
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder: border.copyWith(borderSide: BorderSide(color: colors.error)),        
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: colors.error)),


        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        focusColor: colors.primary,
        prefixIcon: prefixIcon,
        errorText: errorMessage,
      ),


      // decoration: InputDecoration(
      //   labelText: 'Nombre',
      //   hintText: 'Ingrese su nombre',
      //   border: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(10.0),
      //   ),
      // ),
    );
  }
}

