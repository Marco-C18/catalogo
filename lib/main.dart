import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_catalogo/auth/auth_service.dart';
import 'package:web_catalogo/cart.dart';
import 'package:web_catalogo/cart_service.dart';
import 'package:web_catalogo/home.dart';
import 'package:web_catalogo/login.dart';
import 'package:web_catalogo/register.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => CartService()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
      initialRoute: 'home',
      routes: {
        'login': (context) => const Login(),
        'register': (context) => const Register(),
        'home': (context) => const Home(),
        'cart': (context) => const Cart(),
      },
    );
  }
}
