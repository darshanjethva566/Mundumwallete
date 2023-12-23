import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mundumwallet/global/common_page.dart';
import 'package:mundumwallet/global/size_config.dart';

class create_pass_screen extends StatefulWidget {
  const create_pass_screen({super.key});

  @override
  State<create_pass_screen> createState() => _create_pass_screenState();
}

class _create_pass_screenState extends State<create_pass_screen> {

  bool terms_agreed=false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth*0.04),
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        gradient: u_static.comm_grad
      ),
      child:  Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white.withOpacity(0.8),)
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),

            //CREATE PASS TITLE
            Center(
                child: Text("Create Password",style: TextStyle(color: Color(0xffEFBB5E).withOpacity(0.7),fontFamily: "DM Sans",fontSize: 24,fontWeight: FontWeight.w400),)
            ),

            SizedBox(height: 10,),

            //THIS PASS TXT
            Center(
                child: Text("This password will unlock your Rabbit wallet only on this service",textAlign: TextAlign.center,style: TextStyle(color: Colors.white.withOpacity(0.7),fontFamily: "DM Sans",fontSize: 14,fontWeight: FontWeight.w400),)
            ),
           SizedBox(height: 80,),

            //NEW PASS
            TextFormField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: "New password",
                labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                contentPadding: EdgeInsets.only(left: 8),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.7),style: BorderStyle.solid),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.7),style: BorderStyle.solid),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.7),style: BorderStyle.solid)
                )
              ),
            ),
            SizedBox(height: 8,),

            Text("Must be at least 8 characters",textAlign: TextAlign.center,style: TextStyle(color: Color(0xff999999).withOpacity(0.7),fontFamily: "DM Sans",fontSize: 12)),
            SizedBox(height: 20,),

            //CONF PASS
            TextFormField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  labelText: "Confirm password",
                  labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                  contentPadding: EdgeInsets.only(left: 8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.7),style: BorderStyle.solid),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.7),style: BorderStyle.solid),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.7),style: BorderStyle.solid)
                  )
              ),
            ),
            SizedBox(height: 20,),
            
            Container(
              width: SizeConfig.screenWidth,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if(terms_agreed==true){
                            terms_agreed=false;
                          }
                          else{
                            terms_agreed=true;
                          }
                        });
                      },
                      icon: terms_agreed==true?Icon(Icons.check_box,color: Color(0xffB3B3B3).withOpacity(0.7),):Icon(Icons.check_box_outline_blank,color: Color(0xffB3B3B3).withOpacity(0.7),)
                  ),
                  Expanded(
                      child: Text("By proceeding, you agree to these Term and Conditions.",style: TextStyle(color: Color(0xffB3B3B3).withOpacity(0.7),fontSize: 12,fontFamily: "Poppins",fontWeight: FontWeight.w400),)
                  )
                ],
              ),
            ),

            Spacer(),

            //NEXT
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Color(0xff9493AC)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text("Next",style: TextStyle(color: Color(0xff9493AC)),),
            ),
            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}
