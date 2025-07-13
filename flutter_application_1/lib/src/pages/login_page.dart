import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/widgets/custom_label_text_field.dart';
import 'package:flutter_application_1/src/methods/showsnackbar.dart';
import 'package:flutter_application_1/src/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  final correo = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    correo.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Inicio Sesion',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('No tienes una cuenta? '),
                  TextButton(
                    onPressed: () {
                      context.push('/registrarse');
                    },
                    child: Text('Registrate aquí'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomLabelTextField(text: 'Correo'),
              CustomTextField(
                hintText: 'Ingrese su correo',
                inputType: TextInputType.emailAddress,
                obscureText: false,
                controller: correo,
                iconData: Icons.email_outlined,
              ),
              SizedBox(height: 10),
              CustomLabelTextField(text: 'Contraseña'),
              CustomTextField(
                hintText: 'Ingrese su contraseña',
                inputType: TextInputType.number,
                obscureText: !_isPasswordVisible,
                controller: password,
                iconData: _isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                onPressIcon: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
              SizedBox(height: 20),
              IniciarSesion(correo: correo, password: password),
            ],
          ),
        ),
      ),
    );
  }
}

class IniciarSesion extends StatelessWidget {
  const IniciarSesion({
    super.key,
    required this.correo,
    required this.password,
  });

  final TextEditingController correo;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (correo.text.isEmpty) {
          showSnackBar(context, 'El correo es requerido');
          return;
        }

        if (password.text.isEmpty) {
          showSnackBar(context, 'La contraseña es requerido');
          return;
        }

        if (correo.text != "cindy.soler@unah.hn") {
          showSnackBar(context, 'Correo inválido');
          return;
        }

        if (password.text != "20192002534") {
          showSnackBar(context, 'Contraseña inválida');
          return;
        }
        
        context.go('/home');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 1, 34, 61),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text(
        'Iniciar Sesión',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
