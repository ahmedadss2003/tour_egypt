import 'package:flutter/material.dart';
import 'package:login/core/widgets/custom_text_button.dart';
import 'package:login/core/widgets/custom_text_form_field.dart';
import 'package:login/features/custom_trip/presentation/views/widgets/generated_trip.dart';

class CustomTripViewBody extends StatelessWidget {
  const CustomTripViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTextFormField(txt: "Number of dayes",keyboardType: TextInputType.number,),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.4,child: const CustomTextFormField(txt: "Min Pudget",keyboardType: TextInputType.number,)),
                const SizedBox(width: 20,),
                SizedBox(width: MediaQuery.of(context).size.width * 0.4,child: const CustomTextFormField(txt: "Max Pudget",keyboardType: TextInputType.number, )),
              ],
            ),
            const SizedBox(height: 20,),
            CustomTextButton(onPressed: (){
              Navigator.pushNamed(context, GeneratedTrip.routeName);
            },txt: "Generate Trip",)
          ],
        ),
      ),
    );
  }
}