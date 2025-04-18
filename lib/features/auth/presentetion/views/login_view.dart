import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/core/services/auth_services.dart';
import 'package:login/features/auth/data/repos/auth_repo_impl.dart';
import 'package:login/features/auth/presentetion/cubit/auth_cubit.dart';
import 'package:login/features/auth/presentetion/views/widgets/login_view_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: AuthRepoImpl(firebaseAuthServices: DatabaseAuthServices())),
      child: const Scaffold(
        body: LoginPageBody(),
      ),
    );
  }
}
