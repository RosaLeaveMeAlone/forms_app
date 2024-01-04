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


class _RegisterForm extends StatelessWidget {
  const _RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
              CustomTextFormField(),
              SizedBox(height: 10.0),
              CustomTextFormField(),
              const SizedBox(height: 20.0),
              FilledButton.tonalIcon(
                onPressed: (){}, 
                icon: Icon(Icons.save),
                label: const Text('Crear Usuario'), 
                ),
        ],
      ) 
      
      );
  }
}
