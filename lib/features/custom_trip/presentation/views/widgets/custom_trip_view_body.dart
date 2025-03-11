import 'package:flutter/material.dart';
import 'package:login/core/widgets/custom_text_button.dart';
import 'package:login/core/widgets/custom_text_form_field.dart';
import 'package:login/features/custom_trip/presentation/views/widgets/generated_trip.dart';

class CustomTripViewBody extends StatefulWidget {
  const CustomTripViewBody({super.key});

  @override
  State<CustomTripViewBody> createState() => _CustomTripViewBodyState();
}

class _CustomTripViewBodyState extends State<CustomTripViewBody> {
  final TextEditingController daysController = TextEditingController();
  final TextEditingController minBudgetController = TextEditingController();
  final TextEditingController maxBudgetController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,),
        child: Form(
          key: _formKey,
          autovalidateMode:autovalidateMode,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               CustomTextFormField(txt: "Number of dayes",keyboardType: TextInputType.number,controller: daysController,),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.4,child:  CustomTextFormField(txt: "Min Pudget",keyboardType: TextInputType.number,controller:minBudgetController ,)),
                  const SizedBox(width: 20,),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.4,child:  CustomTextFormField(txt: "Max Pudget",keyboardType: TextInputType.number, controller: maxBudgetController,)),
                ],
              ),
              
              const SizedBox(height: 20,),
              CustomTextButton(onPressed: (){
                final days = int.tryParse(daysController.text)?? 0;
                final minBudget = double.tryParse(minBudgetController.text) ??0;
                final maxBudget = double.tryParse(maxBudgetController.text)??0 ;

                if (days <= 0 || minBudget <= 0 || maxBudget <= 0 || minBudget > maxBudget) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter valid values')),
                  );
                  return;
                }
                if(_formKey.currentState!.validate()){
                  setState(() {
                    autovalidateMode = AutovalidateMode.disabled;
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  GeneratedTrip(
                    days: days,
                    price: (minBudget+maxBudget)/2,
                  ),));
                }else{
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              txt: "Generate Trip",)
            ],
          ),
        ),
      ),
    );
  }
}