import 'package:dotted_border/dotted_border.dart';
import 'package:finance_app/data/utilty.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../data/model/add_date.dart';
import '../globalconst/global_const.dart';

class ProfileTop extends StatefulWidget {
  const ProfileTop({super.key});

  @override
  State<ProfileTop> createState() => _ProfileTopState();
}

class _ProfileTopState extends State<ProfileTop> {
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
                    padding: EdgeInsets.only(
                      top: PageSize.height15,
                    ),
                    width: PageSize.screenWidth,
                    height: PageSize.screenHeight,
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
                              top: PageSize.width15 * 2,
                              left: PageSize.width10),
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
                              SizedBox(
                                height: PageSize.height10 / 2,
                              ),
                              Text(
                                "11 JAN 2022",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: PageSize.font20 / 1.5,
                                  color: Color(0xFF40BAD5).withOpacity(0.7),
                                  letterSpacing: 2,
                                ),
                              ),
                              SizedBox(
                                height: PageSize.height20,
                              ),
                              Text(
                                "Payment",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: PageSize.font26 * 1.6,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: PageSize.width20,
                                    top: PageSize.height10 / 2,
                                    bottom: PageSize.height20),
                                child: Text(
                                  "Methods",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: PageSize.font26 * 1.6,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: PageSize.width10),
                                  child: Row(
                                    children: [
                                      DottedBorder(
                                        padding:
                                            EdgeInsets.all(PageSize.height10),
                                        color:
                                            Color(0xFF40BAD5).withOpacity(0.7),
                                        dashPattern: [8, 12],
                                        strokeWidth: 1.5,
                                        strokeCap: StrokeCap.round,
                                        child: Container(
                                          width: PageSize.height45 * 4,
                                          height: PageSize.height45 * 2.5,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width:
                                                        PageSize.height20 * 2,
                                                    height:
                                                        PageSize.height20 * 2,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                PageSize
                                                                    .width10),
                                                        color:
                                                            Color(0xFF40BAD5)),
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "Add New",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize:
                                                              PageSize.font20,
                                                          color: Colors.white
                                                              .withOpacity(0.8),
                                                        ),
                                                      ),
                                                      Text(
                                                        "Card",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize:
                                                              PageSize.font20,
                                                          color: Colors.white
                                                              .withOpacity(0.8),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: PageSize.width20,
                                      ),
                                      PaidCardWidget(
                                        name: "Apple Pay",
                                        imageUrl: "apple",
                                        color: Color(0xFF120136),
                                      ),
                                      SizedBox(
                                        width: PageSize.width20,
                                      ),
                                      PaidCardWidget(
                                        name: "Master Card",
                                        imageUrl: "mastercard",
                                        color: Color(0xFFFCBF1E),
                                      ),
                                      SizedBox(
                                        width: PageSize.width20,
                                      ),
                                      PaidCardWidget(
                                        name: "PayPal",
                                        imageUrl: "paypal",
                                        color: Color(0xFF40BAD5),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: PageSize.height20,
                              ),
                              Text(
                                "Credit",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: PageSize.font26,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: PageSize.width20,
                                    top: PageSize.height10 / 2,
                                    bottom: PageSize.height20),
                                child: Text(
                                  "Cards",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: PageSize.font26,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: PageSize.height10,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SizedBox(
                                  width: PageSize.screenWidth,
                                  height: PageSize.height45 * 4,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: PageSize.height45 * 7,
                                        height: PageSize.height45 * 4.5,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                    255, 250, 250, 250)
                                                .withOpacity(0.12),
                                            borderRadius: BorderRadius.circular(
                                                PageSize.width20 * 1.5)),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.all(PageSize.width15),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "CITY BANK",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          PageSize.font20 / 1.3,
                                                      letterSpacing: 2,
                                                    ),
                                                  ),
                                                  Image.asset("assets/logos/mastercard.png",width: PageSize.height45*1.5,)
                                                ],
                                              ),
                                             Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "JOHN DOE",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          PageSize.font20 / 1.3,
                                                      letterSpacing: 2,
                                                      fontWeight: FontWeight.w500
                                                    ),
                                                  ),
                                                  SizedBox(height: PageSize.height20,),
                                                  Text(
                                                    "1000 0000 0000 0001",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          PageSize.font20 / 1.3,
                                                      letterSpacing: 3.5,
                                                    ),
                                                  ),
                                                  SizedBox(height: PageSize.height10,),
                                              ],
                                             )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
            ],
          );
        });
  }
}

class PaidCardWidget extends StatelessWidget {
  const PaidCardWidget({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.color,
  }) : super(key: key);
  final String name, imageUrl;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(PageSize.width10),
      width: PageSize.height45 * 4.5,
      height: PageSize.height45 * 3,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.8),
              Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          borderRadius: BorderRadius.circular(PageSize.width20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FittedBox(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: PageSize.width10 / 2,
                      vertical: PageSize.width10 / 2),
                  width: PageSize.height20 * 2.5,
                  height: PageSize.height20 * 2.5,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(PageSize.width15)),
                  child: Image.asset(
                    "assets/logos/${imageUrl}.png",
                    fit: BoxFit.contain,
                    width: PageSize.width20 * 2,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${name}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: PageSize.font20,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
