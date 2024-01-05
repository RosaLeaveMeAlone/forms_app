import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {



  const _RegisterView(

  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const[
              const FlutterLogo(size: 100.0),
              _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}


class _RegisterForm extends StatefulWidget {
  const _RegisterForm({super.key});

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username = '';
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
              CustomTextFormField(
                label: 'Nombre de usuario',
                onChanged: (value) => username = value,
                validator: (value) {
                  if(value == null || value.isEmpty) return 'El nombre de usuario es requerido';
                  if(value.trim().isEmpty ) return 'El nombre de usuario es requerido';
                  if(value.length < 6 ) return 'El nombre de usuario debe tener mas de 6 letras';
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              CustomTextFormField(
                label: 'Correo electronico',
                onChanged: (value) => email = value,
                  validator: (value) {
                  if(value == null || value.isEmpty) return 'El correo electronico es requerido';
                  if(value.trim().isEmpty ) return 'El correo electronico es requerido';
                  final emailRegExp = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );

                  if(!emailRegExp.hasMatch(value)) return 'El correo electronico no es valido';

                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              CustomTextFormField(
                label: 'Clave',
                onChanged: (value) => password = value,
                validator: (value) {
                  if(value == null || value.isEmpty) return 'La clave es requerida';
                  if(value.trim().isEmpty ) return 'La clave es requerida';
                  if(value.length < 6 ) return 'La clave debe tener mas de 6 caracteres';
                  return null;
                },
                obscureText: true,
              ),
              const SizedBox(height: 10.0),
              FilledButton.tonalIcon(
                onPressed: (){
                  final isValid = _formKey.currentState!.validate();
                  if(!isValid) return;
                }, 
                icon: Icon(Icons.save),
                label: const Text('Crear Usuario'), 
                
                ),
        ],
      ) 
      
      );
  }
}
