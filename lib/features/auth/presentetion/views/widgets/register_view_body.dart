  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/features/auth/presentetion/cubit/auth_cubit.dart';
  import 'package:login/features/auth/presentetion/views/widgets/custom_button.dart';
  import 'package:login/features/auth/presentetion/views/widgets/custom_button_for_register.dart';
  import 'package:login/features/auth/presentetion/views/widgets/custom_text_form_field.dart';
import 'package:login/features/home/presentation/views/home_view.dart';
  import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

  class RegisterViewBody extends StatefulWidget {
    const RegisterViewBody({super.key});

    @override
    State<RegisterViewBody> createState() => _RegisterViewBodyState();
  }

class _RegisterViewBodyState extends State<RegisterViewBody> {
    GlobalKey<FormState> formKey =GlobalKey();
    bool inAsyncCall=false;
    final TextEditingController emailController = TextEditingController() ;
    final TextEditingController passController = TextEditingController() ;
    final TextEditingController nameController = TextEditingController() ;


    

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
        inAsyncCall:inAsyncCall ,
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 20),
          child:  Form(
            key:formKey ,
            child: SingleChildScrollView(
              child: Column(
                
                children: [
                  const SizedBox(height: 100,),
                  
                   const Row(
                     children: [
                      Text(
                        "Create Account.",
                        style: TextStyle(
                          fontSize: 30
                        ),
                        ),
                     ],
                   ),
                    const SizedBox(height: 20,),
                    
                  const SizedBox(height: 20,),
                  CustomTextFormFieldWidget(
                    onSaved: (value){
                      emailController.text = value!;
                    },
                    labelText: "Email",
                    icon: Icons.email,
                    controller: emailController,
                    ),
                  const SizedBox(height: 20,),
                  CustomTextFormFieldWidget(
                    onSaved: (value){
                      passController.text = value! ;
                    },
                    labelText: "Password",
                    icon:Icons.lock,
                    controller: passController,
                    isPassword:true 
                    ),
                  const SizedBox(height: 20,),
                  CustomTextFormFieldWidget(
                    labelText: "Name",
                    controller: nameController,
                  ),
                  const SizedBox(height: 20,),
                  CustomButton(
                    txt: "Register",
                    onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() => inAsyncCall = true);
                      context.read<AuthCubit>().register(
                        email: emailController.text.trim(),
                        password: passController.text.trim(),
                        name: nameController.text.trim(), 
                      );
                    }
                  },

                  ) ,
                  const SizedBox(height: 10,),
                  CustomButtonForRegister(
                    txt: "Already Have An Account ?",
                    txtButton: "Login",
                    onPressed: (){
                      Navigator.pop(context) ;
                    },
                  ) ,
                  const SizedBox(height: 20,),
                  
                ],
                
              ),
            ),
          ),
        ),
      ),
      );
    }
      

  }

