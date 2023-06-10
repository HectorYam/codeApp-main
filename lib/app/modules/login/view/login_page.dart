import 'package:code_app/widgets/button.dart';
import 'package:code_app/widgets/divider_widget.dart';
import 'package:code_app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  // ignore: unused_field
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de sesion'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: [
              const FlutterLogo(
                size: 100,
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              CustomTextFieldWidget(
                icon: Icons.email,
                label: 'Correo electronico',
                controller: _emailController,
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              CustomTextFieldWidget(
                icon: Icons.lock,
                label: 'Contraseña',
                controller: _emailController,
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              CustomButtomWidget(
                label: 'Iniciar sesion',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/main',
                    (route) => false,
                  );
                },
              ),

              //link text
              const Padding(padding: EdgeInsets.only(top: 20)),
              TextButton(
                onPressed: () {},
                child: const Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: DividerWidget(title: 'O'),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              CustomButtomWidget(
                label: 'Crear cuenta',
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
