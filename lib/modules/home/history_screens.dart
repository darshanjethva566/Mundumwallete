import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mundumwallet/global/common_page.dart';




class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  @override
  Widget build(BuildContext context) {
    var data = null;

    return Scaffold(
        body:Padding(
          padding:  EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              u_static.textWithPro("Transaction History", 28.0, FontWeight.w700, Colors.black,1),

              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: InkWell(
                  onTap: () {

                  },
                  child: Row(
                    children: [
                      Icon(Icons.file_download_outlined,color: u_static.comm_green_collor,),
                      u_static.textWithPro(" Export transaction data", 14.0, FontWeight.w400,u_static.comm_green_collor ,1)
                    ],
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
