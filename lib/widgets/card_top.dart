import 'package:finance_app/data/utilty.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../data/model/add_date.dart';
import '../globalconst/global_const.dart';



class CardTop extends StatefulWidget {
  const CardTop({super.key});

  @override
  State<CardTop> createState() => _CardTopState();
}

class _CardTopState extends State<CardTop> {
  var history;
  final box = Hive.box<AddData>("data");
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: box.listenable(),
        builder: (context, value, child) {
      return Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top:PageSize.height15,),
                    width: PageSize.screenWidth,
                    height: PageSize.screenHeight / 3.2,
                    decoration: BoxDecoration(
                         gradient: LinearGradient(
                  colors: [
                    
                  
                    Color(0xFF035AA6),
                    Color(0xFF120136),

                    
                    
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(PageSize.height20),
                          bottomRight: Radius.circular(PageSize.height20),
                        )),
                    child: Stack(
                      children: [
                        Positioned(
                          top: PageSize.height10 * 3,
                          left: PageSize.screenWidth / 1.2,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(PageSize.height10),
                            child: Container(
                              height: PageSize.height45,
                              width: PageSize.height45,
                              color: Color.fromRGBO(250, 250, 250, 0.1),
                              child: Icon(
                                Icons.notification_add_outlined,
                                size: PageSize.width20 * 1.5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: PageSize.width15 * 2, left: PageSize.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Good afternoon",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: PageSize.font20 / 1.2,
                                  color: Color.fromARGB(255, 224, 223, 223),
                                ),
                              ),
                              Text(
                                "John Doe",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: PageSize.font20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: PageSize.width20 * 2.7,
                top: PageSize.height45 * 2.5,
                child: Container(
                  height: PageSize.screenHeight / 4.8,
                  width: PageSize.screenWidth / 1.4,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF035AA6).withOpacity(0.5),
                        offset: Offset(0,6),
                        blurRadius: 12,
                        spreadRadius: 6,
                      ),
                    ],
                     gradient: LinearGradient(
                  colors: [
                    
                    Color(0xFF40BAD5),
                    Color(0xFF035AA6),
                    
                    
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
                    borderRadius: BorderRadius.circular(PageSize.width15),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: PageSize.height10,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: PageSize.width10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Balance",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: PageSize.font20 / 1.3,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: PageSize.height10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: PageSize.width10),
                        child: Row(
                          children: [
                            Text(
                              "\$ ${total()}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: PageSize.font26,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: PageSize.height20,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: PageSize.width10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: PageSize.width15,
                                  backgroundColor:
                                      Color(0xFFFCBF1E),
                                  child: Icon(
                                    Icons.arrow_downward,
                                    color: Colors.white,
                                    size: PageSize.width20,
                                  ),
                                ),
                                SizedBox(
                                  width: PageSize.width10,
                                ),
                                Text(
                                  "Income",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: PageSize.font20 / 1.2,
                                    color: Color.fromARGB(255, 216, 216, 216),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: PageSize.width15,
                                  backgroundColor:
                                      Color(0xFFFCBF1E),
                                  child: Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                    size: PageSize.width20,
                                  ),
                                ),
                                SizedBox(
                                  width: PageSize.width10,
                                ),
                                Text(
                                  "Expenses",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: PageSize.font20 / 1.2,
                                    color: Color.fromARGB(255, 216, 216, 216),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: PageSize.height10/2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "\$ ${income()}",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: PageSize.font20 / 1.2,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "\$ ${expand()}",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: PageSize.font20 / 1.2,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
            
            ],
          );}
    );
  }
}