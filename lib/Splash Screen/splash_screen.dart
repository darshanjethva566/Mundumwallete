import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mundumwallet/Common/common_page.dart';
import 'package:mundumwallet/Multi%20Scroll/multi_scroll_sscreen.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 2), () {
      Get.to(multi_scroll_screen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return Container(
      height:h,
        width: w,
        decoration: BoxDecoration(
          gradient: u_static.comm_grad
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: h*0.12,
                  width: w*0.25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/mundum_logo.png"),
                      fit: BoxFit.fill
                    )
                  ),
                ),
              ),
              SizedBox(height: 10,),

              Center(
                child: Container(
                  height: h*0.2,
                  width: w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/mundum_txt.png"),
                        fit: BoxFit.fill
                      )
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
