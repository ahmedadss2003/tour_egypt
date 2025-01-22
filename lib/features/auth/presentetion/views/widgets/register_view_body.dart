  import 'package:flutter/material.dart';
  import 'package:login/features/auth/presentetion/views/widgets/custom_button.dart';
  import 'package:login/features/auth/presentetion/views/widgets/custom_button_for_register.dart';
  import 'package:login/features/auth/presentetion/views/widgets/custom_text_form_field.dart';
  import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

  class RegisterViewBody extends StatefulWidget {
    const RegisterViewBody({super.key});

    @override
    State<RegisterViewBody> createState() => _RegisterViewBodyState();
  }

  class _RegisterViewBodyState extends State<RegisterViewBody> {
    GlobalKey<FormState> formKey =GlobalKey();
    bool isloading=false;
    final TextEditingController emailController = TextEditingController() ;
    final TextEditingController passController = TextEditingController() ;


    

    @override
    Widget build(BuildContext context) {
      return  ModalProgressHUD(
        inAsyncCall:isloading ,
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 20),
          child:  Form(
            key:formKey ,
            child: SingleChildScrollView(
              child: Column(
                
                children: [
                  const SizedBox(height: 100,),
                   SizedBox(
                  height: 180,
                  width: 180,
                  child: ClipOval(child: Image.asset("assets/images/logo1.jpg" ,fit: BoxFit.cover, )),
                ),
                  const SizedBox(height: 10,),
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
                    const SizedBox(height: 40,),
                  CustomTextFormFieldWidget(
                    labelText: "Email",
                    icon: Icons.email,
                    controller: emailController,
                    ),
                  const SizedBox(height: 20,),
                  CustomTextFormFieldWidget(
                    labelText: "Password",
                    icon:Icons.lock,
                    controller: passController,
                    isPassword:true 
                    ),
                  const SizedBox(height: 20,),
                  const CustomTextFormFieldWidget(labelText: "Confirm Pasword",icon:Icons.lock,isPassword:true ,),
                  const SizedBox(height: 20,),
                  CustomButton(
                    txt: "Register",
                    onPressed: (){
                        if(formKey.currentState!.validate()){
                          setState(() {
                            isloading = true ;
                          });
                        
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
      );
    }
      

  }

