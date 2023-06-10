import 'package:code_app/widgets/button.dart';
import 'package:code_app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrarse'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Center(
          child: Column(
            children: [
              const FlutterLogo(
                size: 100,
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              CustomTextFieldWidget(
                icon: Icons.person,
                label: 'Nombre de Usuario',
                controller: _usuarioController,
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              CustomTextFieldWidget(
                icon: Icons.calendar_today,
                label: 'Edad',
                controller: _edadController,
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
                controller: _passwordController,
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              CustomTextFieldWidget(
                icon: Icons.lock,
                label: 'Confirmar contraseña',
                controller: _confirmPasswordController,
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              const Padding(
                padding: EdgeInsets.only(right: 40, left: 40),
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              CustomButtomWidget(
                label: 'Crear cuenta',
                onPressed: () {
                  //Navigator.pushNamed(context, '/register');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
