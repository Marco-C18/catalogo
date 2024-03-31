import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_catalogo/auth/auth_service.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    String userEmail = '';
    String userPass = '';

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(50),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("INCIO DE SESION"),
              TextField(
                decoration: const InputDecoration(hintText: "Correo"),
                onChanged: (value) {
                  userEmail = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(hintText: "Contraseña"),
                onChanged: (value) {
                  userPass = value;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () async {
                    final authService =
                        Provider.of<AuthService>(context, listen: false);

                    final String? errorMessage =
                        await authService.login(userEmail, userEmail);

                    if (errorMessage == null) {
                      Navigator.pushReplacementNamed(context, 'home');
                    } else {
                      print("cuenta existente");
                    }
                  },
                  child: const Text("Ingresar")),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'register');
                  },
                  child: const Text("Registrate")),
            ],
          ),
        ),
      ),
    );
  }
}
