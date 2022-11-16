import 'package:finance_app/globalconst/global_const.dart';
import 'package:finance_app/screen/add_screen.dart';
import 'package:finance_app/screen/home_screen.dart';
import 'package:finance_app/screen/profile_screen.dart';
import 'package:finance_app/screen/statics_screen.dart';
import 'package:flutter/material.dart';

import '../screen/wallet_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int index_color = 0;
  List screen = [
    HomeScreen(),
    StaticsScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[index_color],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFFFCBF1E)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.only(
              top: PageSize.height20*1.2, bottom: PageSize.height20*1.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    index_color = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: PageSize.width20 * 1.5,
                  color: index_color == 0 ? Color(0xFF035AA6) : Color(0xff40BAD5).withOpacity(0.5),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    index_color = 1;
                  });
                },
                child: Icon(
                  Icons.bar_chart_outlined,
                  size: PageSize.width20 * 1.5,
                  color: index_color == 1 ? Color(0xFF035AA6): Color(0xff40BAD5).withOpacity(0.5),
                ),
              ),
              SizedBox(
                width: PageSize.width20,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    index_color = 2;
                  });
                },
                child: Icon(
                  Icons.account_balance_wallet_outlined,
                  size: PageSize.width20 * 1.5,
                  color: index_color == 2 ? Color(0xFF035AA6) : Color(0xff40BAD5).withOpacity(0.5),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    index_color = 3;
                  });
                },
                child: Icon(
                  Icons.person_outlined,
                  size: PageSize.width20 * 1.5,
                  color: index_color == 3 ? Color(0xFF035AA6) : Color(0xff40BAD5).withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
