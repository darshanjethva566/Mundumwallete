import 'package:flutter/material.dart';

class u_static{
  static Color comm_green_collor=Color(0xff225A27);
  static Color comm_scroll_title=Color(0xffC8AE8D);
  static TextStyle scroll_title_style=TextStyle(
    color: comm_scroll_title,fontSize: 24,fontFamily: "DM Sans"
  );
  static TextStyle scroll_desc_style=TextStyle(
      color: Color(0xffADADAD),fontSize: 16,fontFamily: "DM Sans"
  );
  static RadialGradient comm_grad=RadialGradient(
      colors: [
        u_static.comm_green_collor,
        Colors.black
      ],
      radius: 1.2
  );
  // static
}

