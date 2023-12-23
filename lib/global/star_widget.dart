import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarWidget extends StatelessWidget {
  final bool isActivated;
  const StarWidget({
    super.key,
    this.isActivated = true,
  });

  @override
  Widget build(BuildContext context) {
    return isActivated ?
     AnimatedContainer(
       width: 16.w,
       height: 16.w,
       decoration: 
        const ShapeDecoration(
         gradient: LinearGradient(
           begin: Alignment(0.00, -1.00),
           end: Alignment(0, 1),
           colors: [Color(0xFFD89F3C), Color(0xFFFFE9C0)],
         ),
         shape: StarBorder(
           points: 4,
           innerRadiusRatio: 0.38,
           pointRounding: 0,
           valleyRounding: 0,
           rotation: 0,
           squash: 0,
         ),
       ),
        duration: 600.ms,
     ):
     Opacity(
      opacity:0.30 ,
      child: AnimatedContainer(
        width: 16.w,
        height: 16.w,
        decoration:
         const ShapeDecoration(
          color: Color(0xFFADADAD),
          shape:  StarBorder(
            points: 4,
            innerRadiusRatio: 0.38,
            pointRounding: 0,
            valleyRounding: 0,
            rotation: 0,
            squash: 0,
          ),
        ),
         duration: 600.ms,
      ),
    );
  }
}
