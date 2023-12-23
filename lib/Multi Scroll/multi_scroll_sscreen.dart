import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mundumwallet/Common/common_page.dart';

import '../Common/size_config.dart';
import '../Create Wallet/create_pass_screen.dart';
class multi_scroll_screen extends StatefulWidget {
  const multi_scroll_screen({super.key});

  @override
  State<multi_scroll_screen> createState() => _multi_scroll_screenState();
}

class _multi_scroll_screenState extends State<multi_scroll_screen> {

  int _current = 0;
  final CarouselController _controller = CarouselController();

  List scroll_title=[
    "Multicurrency",
    "Send",
    "Security",
    "MUNDUM",
  ];

  List scroll_desc=[
    "Get access to your favorite  ERC 20 cryptocurrencies",
    "Fast and secure sending of cryptocurrencies",
    "Conduct secure receive with cryptocurrencies",
    "Enjoy your wallet",
  ];

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: w*0.02),
      height: h,
      width: w,
      decoration: BoxDecoration(
        gradient: u_static.comm_grad,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),

            //CONTAINER
            Expanded(
              child: Container(
                width: w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8)),
                child: CarouselSlider(
                  items: List.generate(
                      4, (index) {
                    return InkWell(
                      onTap: () {
              
                      },
                      child:Column(
                        children: [
                          Container(
                            height: h*0.14,
                            width: w*0.3,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/multi_scroll.png"),
                                fit: BoxFit.fill
                              )
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(scroll_title[index],style: u_static.scroll_title_style,),
                          SizedBox(height: 10,),
                          Expanded(
                              child: Text(scroll_desc[index],style: u_static.scroll_desc_style,textAlign: TextAlign.center,)
                          ),
                        ],
                      )
                    );
                  }),
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      reverse: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
            ),
            SizedBox(height: 10,),

            //SCROLL EFFECT
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              scroll_title.asMap().entries.map((entry) {
                return InkWell(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: _current == entry.key ? 20 : 7.0,
                    height: _current == entry.key ? 22:7.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/scroll_star.png")
                      ),
                        borderRadius:
                        // _current == entry.key
                        //     ? BorderRadius.circular(20):
                        BorderRadius.circular(100),
                        color: _current == entry.key
                            ? Colors.transparent
                            : Colors.white),
                  ),
                );
              }).toList(),
            ),
            Spacer(),

            //CREATE NEW WALLET
            InkWell(
              onTap: () {
                Get.to(create_pass_screen());
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text("Ceate a new wallet"),
              ),
            ),
            SizedBox(height: 10,),

            //ALREADY HAVE WALLET
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text("I already have a wallet",style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
