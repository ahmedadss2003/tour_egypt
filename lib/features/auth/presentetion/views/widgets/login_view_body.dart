import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/features/auth/presentetion/cubit/auth_cubit.dart';
import 'package:login/features/auth/presentetion/views/register_view.dart';
import 'package:login/features/auth/presentetion/views/widgets/custom_button.dart';
import 'package:login/features/auth/presentetion/views/widgets/custom_button_for_register.dart';
import 'package:login/features/auth/presentetion/views/widgets/custom_sigin_with_google.dart';
import 'package:login/features/auth/presentetion/views/widgets/custom_text_form_field.dart';
import 'package:login/features/home/presentation/views/home_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  GlobalKey <FormState>formKey = GlobalKey();
  bool inAsyncCall = false ;
    final TextEditingController emailController = TextEditingController() ;
    final TextEditingController passController = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
  listener: (context, state) {
    if (state is AuthLoading) {
      setState(() => inAsyncCall = true);
    } else {
      setState(() => inAsyncCall = false);
    }

    if (state is AuthFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.errorMessage)),
      );
    }

    if (state is AuthSuccess) {
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    }
  },
  child: ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      child: Form(
        key: formKey,
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 20),
          child:  SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100,),
                SizedBox(
                  height: 180,
                  width: 180,
                  child: ClipOval(child: Image.asset("assets/images/logo1.jpg" ,fit: BoxFit.cover, )),
                ),
                const SizedBox(height: 50,),
                CustomTextFormFieldWidget(labelText: "Login",icon: Icons.email,controller:emailController , ),
                const SizedBox(height: 10,),
                CustomTextFormFieldWidget(
                  labelText: "Password",
                  icon:Icons.lock,
                  controller: passController,
                  isPassword: true, ),
                const SizedBox(height: 20,),
                CustomButton(
                  txt: "Login",
                  onPressed: () {
                  if (formKey.currentState!.validate()) {
                    setState(() => inAsyncCall = true);
                    context.read<AuthCubit>().login(
                      email: emailController.text.trim(),
                      password: passController.text.trim(),
                    );
                  }
                },
                ),
                const SizedBox(height: 10,),
                CustomButtonForRegister(
                  
                  txt: "havn't An Account ?",
                  txtButton: "Register",
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const RegisterView() ;
                    })) ;
                  },
                ),
                const SizedBox(height: 20,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SocialAuth(
                      icon: FontAwesomeIcons.google,
                     ),
                     SizedBox(width: 40,),
                     SocialAuth(

                      icon: FontAwesomeIcons.facebook,
                      
                     ),
                  ],
                )
                
                
              ],
            ),
          ),
        ),
      ),
    ),
);
  }
}
