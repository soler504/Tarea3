import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/methods/showsnackbar.dart';
import 'package:flutter_application_1/src/widgets/custom_label_text_field.dart';
import 'package:flutter_application_1/src/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPasswordVisible = false;
  final nombre = TextEditingController();
  final correo = TextEditingController();
  final password = TextEditingController();
  final telefono = TextEditingController();

  @override
  void dispose() {
    correo.dispose();
    password.dispose();
    telefono.dispose();
    nombre.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Crear una cuenta',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                SizedBox(height: 20),
                CustomLabelTextField(text: 'Nombre'),
                CustomTextField(
                  hintText: 'Ingrese su nombre',
                  inputType: TextInputType.text,
                  obscureText: false,
                  controller: nombre,
                  iconData: Icons.account_circle_outlined,
                ),
                SizedBox(height: 10),
                CustomLabelTextField(text: 'Correo'),
                CustomTextField(
                  hintText: 'Ingrese su correo',
                  inputType: TextInputType.emailAddress,
                  obscureText: false,
                  controller: correo,
                  iconData: Icons.email_outlined,
                  helperText: "El correo debe ser @unah.hn",
                ),
                SizedBox(height: 10),
                CustomLabelTextField(text: 'Teléfono'),
                CustomTextField(
                  hintText: 'Ingrese su teléfono',
                  inputType: TextInputType.number,
                  obscureText: false,
                  controller: telefono,
                  iconData: Icons.phone_outlined,
                ),
                SizedBox(height: 10),
                CustomLabelTextField(text: 'Contraseña'),
                CustomTextField(
                  hintText: 'Ingrese su contraseña',
                  inputType: TextInputType.visiblePassword,
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
                  helperText:
                      "La contraseña debe tener al menos un caracter especial",
                ),
                SizedBox(height: 20),
                Registrarse(
                  correo: correo,
                  password: password,
                  nombre: nombre,
                  telefono: telefono,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Registrarse extends StatelessWidget {
  const Registrarse({
    super.key,
    required this.correo,
    required this.password,
    required this.nombre,
    required this.telefono,
  });

  final TextEditingController correo;
  final TextEditingController password;
  final TextEditingController nombre;
  final TextEditingController telefono;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (nombre.text.isEmpty) {
          showSnackBar(context, 'El nombre es requerido');
          return;
        }

        if (correo.text.isEmpty) {
          showSnackBar(context, 'El correo es requerido');
          return;
        }

        if (telefono.text.isEmpty) {
          showSnackBar(context, 'El teléfono es requerido');
          return;
        }

        if (password.text.isEmpty) {
          showSnackBar(context, 'La contraseña es requerido');
          return;
        }

        if (password.text.length < 6) {
          showSnackBar(
            context,
            'La contraseña debe tener al menos 6 caracteres',
          );
          return;
        }

        if (telefono.text.length < 8) {
          showSnackBar(
            context,
            'El teléfono es inválido',
          );
          return;
        }

        if (!correo.text.endsWith("@unah.hn")) {
          showSnackBar(context, 'Correo inválido.');
          return;
        }

        bool hasSpecialCharacters = password.text.contains(
          RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
        );
        if (!hasSpecialCharacters) {
          showSnackBar(
            context,
            'La contraseña debe tener al menos un caracter especial',
          );
          return;
        }

        context.go('/home');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 1, 34, 61),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text('Registrar', style: TextStyle(color: Colors.white)),
    );
  }
}
