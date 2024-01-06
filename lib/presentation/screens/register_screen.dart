import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ) 
    );
  }
}

class _RegisterView extends StatelessWidget {



  const _RegisterView(

  );

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
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


class _RegisterForm extends StatelessWidget {
  const _RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    final username = registerCubit.state.username;
    final password = registerCubit.state.password;

    return Form(
      child: Column(
        children: [
              CustomTextFormField(
                label: 'Nombre de usuario',
                onChanged: registerCubit.usernameChanged,
                errorMessage: username.errorMessage,

              ),
              SizedBox(height: 10.0),
              CustomTextFormField(
                label: 'Correo electronico',
                onChanged: (value) {
                  registerCubit.emailChanged(value);
                },
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
                onChanged: registerCubit.passwordChanged,
                errorMessage: password.errorMessage,
                obscureText: true,
              ),
              const SizedBox(height: 10.0),
              FilledButton.tonalIcon(
                onPressed: (){
                  
                  registerCubit.onSubmitted();
                }, 
                icon: Icon(Icons.save),
                label: const Text('Crear Usuario'), 
                
                ),
        ],
      ) 
      
      );
  }
}
