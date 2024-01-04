
import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

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
      onChanged: (value) {
        print(value);
      },
      validator: (value) {
        
        return 'Error en el formulario';
      },
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary)),
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

