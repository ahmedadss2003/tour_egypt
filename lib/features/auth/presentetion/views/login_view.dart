import 'package:flutter/material.dart';
import 'package:login/features/auth/presentetion/views/widgets/login_view_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    body: LoginPageBody(),
    ) ;
  }
}

