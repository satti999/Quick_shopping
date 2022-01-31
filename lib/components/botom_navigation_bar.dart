import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/main_screen_home/main_home_screen.dart';
import 'package:shop_app/screens/order/order_screen.dart';
import 'package:shop_app/screens/user_profile_screen/user_profile_screen.dart';

import '../home_constans.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) :super (key: key);
  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor=Colors.black26;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40)),
          boxShadow: [

            BoxShadow(
                offset: Offset(0,-10),
                blurRadius: 20,
                color: Color(0xffdadada).withOpacity(0.15)
            )
          ]
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainHomeScreen()  ),
              );
            },
                icon: SvgPicture.asset("assets/icons/bar_home_icon.svg",
                  color: MenuState.home==selectedMenu
                      ?kPrimaryColor
                      :inActiveIconColor,)),
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderScreen() ),
              );

            }, icon:
            SvgPicture.asset("assets/icons/cart_beg.svg",
              color: MenuState.cart==selectedMenu
                  ?kPrimaryColor
                  :inActiveIconColor,)),
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen() ),
              );
            },
                icon: SvgPicture.asset("assets/icons/bar_profile_icon.svg",
                  color: MenuState.profile==selectedMenu
                      ?kPrimaryColor
                      :inActiveIconColor,)),

          ],
        ),
      ),
    );
  }
}
