import 'package:flutter/material.dart';
import 'package:login/core/utils/app_colors.dart';
import 'package:login/features/auth/presentetion/views/login_view.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BottomSection extends StatefulWidget {
  const BottomSection({super.key, required this.controller, required this.currentPage});
  final PageController controller ;
  final int currentPage;
  @override
  State<BottomSection> createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  double getPercentValue(){
    switch(widget.currentPage){
      case 0:
        return 0.3;
      case 1:
        return 0.7;
      case 2:
        return 1.0;
      default:
        return 0.0;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SmoothPageIndicator(controller: widget.controller, count: 3),
          const SizedBox(height: 20,),
          CircularPercentIndicator(
            percent: getPercentValue(),
            animateFromLastPercent: true,
            progressColor:AppColors.mainColor,
            radius: 40 ,
            animation: true,
            animationDuration: 300,
            center: CircleAvatar(
              backgroundColor:AppColors.mainColor,
              radius: 30,
              child: IconButton(
                onPressed: (){
                  if(widget.controller.page!.toInt()==2){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const LoginPage() ;
                    })) ;
                  }else{
                    widget.controller.nextPage(
                    duration:const Duration(microseconds: 300) ,
                   curve: Curves.easeInOut) ;
                  }
                }, 
                icon: Icon(widget.currentPage ==2 ? Icons.check:Icons.keyboard_arrow_right ,size: 30,),
                )
            ),
            ),
          const SizedBox(height: 40,),
    
        ],
      ),
    );
  }
} 