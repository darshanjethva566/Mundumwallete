import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HRDivider extends StatelessWidget {
  final bool isActive;
  const HRDivider({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return isActive ? Container(
      width: 76.w,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFFFFC763),
          ),
        ),
      ),
    ) : Opacity(
                  opacity: 0.30,
                  child: Container(
                    width: 76.w,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.50.w,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: const Color(0xFFADADAD),
                        ),
                      ),
                    ),
                  ),
                );
  }
}
