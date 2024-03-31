import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_catalogo/auth/auth_service.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
              const Text("REGISTRO"),
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
                        await authService.createUser(userEmail, userEmail);

                    if (errorMessage == null) {
                      Navigator.pushNamed(context, 'home');
                    } else {
                      print("cuenta existente");
                    }
                    // print('Hola mundo');
                  },
                  child: const Text("Registrar")),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  child: const Text("Inicia Sesión")),
            ],
          ),
        ),
      ),
    );
  }
}
