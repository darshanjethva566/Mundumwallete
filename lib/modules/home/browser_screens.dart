import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mundumwallet/global/common_page.dart';




class Browser extends StatefulWidget {
  const Browser({Key? key}) : super(key: key);

  @override
  State<Browser> createState() => _BrowserState();
}

class _BrowserState extends State<Browser> {

  @override
  Widget build(BuildContext context) {
    var data = null;

    return Scaffold(
        body:Padding(
          padding:  EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              u_static.textWithPro("Browser", 28.0, FontWeight.w700, Colors.black,1),
              Padding(
                padding:  EdgeInsets.only(top: 12.h),
                child: TextFormField(

                  textCapitalization: TextCapitalization.words,

                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.done,
                  // initialValue: get.house.value,
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  onChanged: (value) {

                  },
                  decoration: InputDecoration(

                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    //  border: InputBorder.none,
                    prefixIcon:
                    Icon(Icons.search_rounded, color: u_static.grey),

                    hintText: "Search",

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1, color:u_static.grey ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1, color: u_static.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          width: 1, color: u_static.grey), //<-- SEE HERE
                    ),
                  ),
                ),
              ),
              Expanded(
                  child:data==null?Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/Star 4 1.png"),
                        u_static.sPacerheight(10.h),
                        u_static.textWithPro("No assets found, Receive the funds please", 12.0, FontWeight.w400,u_static.grey,1)
                      ],
                    ),
                  ):
                  ListView.builder(itemCount: 10,shrinkWrap: true,itemBuilder: (context, index) {
                    return  Padding(
                      padding:  EdgeInsets.only(top: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage: AssetImage('assets/image 1.png'),
                                      ),
                                      u_static.sPacerWidth(10.w),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          u_static.textWithPro("Stride (STRD)", 16.0, FontWeight.w500, u_static.black_font,1),
                                          SizedBox(width: 70.w,child: u_static.sPacerheight(2.h)),

                                          Row(
                                            children: [
                                              u_static.textWithPro("APR : ", 14.0, FontWeight.w400, u_static.grey,1),
                                              u_static.textWithPro("+2.06%", 14.0, FontWeight.w400, Colors.green,1),

                                            ],
                                          ),

                                        ],
                                      )

                                    ],
                                  ),



                                ],),



                            ],),
                          u_static.sPacerheight( 5.h,),
                          Container(width: 1.sw,height: 1,color: u_static.grey.withOpacity(0.4),)
                        ],
                      ),
                    );
                  },)
              )

            ],
          ),
        ));

  }
}
