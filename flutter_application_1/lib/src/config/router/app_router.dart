import 'package:flutter_application_1/src/pages/home_page.dart';
import 'package:flutter_application_1/src/pages/login_page.dart';
import 'package:flutter_application_1/src/pages/register_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/iniciarSesion',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/registrarse',
      builder: (context, state) => RegisterPage(),
    ),
     GoRoute(
      path: '/home',
      builder: (context, state) => HomePage(),
    ),
  ],
);