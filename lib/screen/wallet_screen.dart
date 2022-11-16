import 'package:finance_app/widgets/wallet_top.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../data/model/add_date.dart';
import '../globalconst/global_const.dart';
import '../widgets/card_top.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  var history;
  final box = Hive.box<AddData>("data");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, value, child) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                      height: PageSize.screenHeight / 2.5, child: WalletTop()),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: PageSize.width15),
                      child: Text(
                        "Your coming payments",
                        style: TextStyle(
                            color: Color(0xFF035AA6),
                            fontSize: PageSize.font26,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                 SliverToBoxAdapter(
                  child: SizedBox(
                      height: PageSize.height15),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      PaymentCard(
                        imageUrl: "netflix",
                        fee: "19.90",
                        date: "21/11/2022",
                      ),
                      PaymentCard(
                        imageUrl: "spotify",
                        fee: "9.50",
                        date: "24/11/2022",
                      ),
                      PaymentCard(
                        imageUrl: "starbucks",
                        fee: "34.50",
                        date: "27/11/2022",
                      ),
                      PaymentCard(
                        imageUrl: "upwork",
                        fee: "90.00",
                        date: "311/11/2022",
                      ),
                       
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    Key? key, required this.imageUrl, required this.fee, required this.date,
  }) : super(key: key);
  final String imageUrl,fee,date;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: PageSize.width15,right: PageSize.width15,bottom: PageSize.height15),
      width: PageSize.screenWidth,
      height: PageSize.height45*2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(PageSize.width20),
        gradient: LinearGradient(
          
          colors: [
            Color(0xFF40BAD5).withOpacity(0.3),
            Color(0xFF035AA6).withOpacity(0.9),
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Row(
            children: [
               SizedBox(width: PageSize.width15*2,),
              CircleAvatar(
                radius: PageSize.height20*1.8,
                backgroundImage: AssetImage("assets/logos/${imageUrl}.png"),
              ),
              SizedBox(width: PageSize.width15*2,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("\$ ${fee}",style: TextStyle(color: Colors.white,fontSize: PageSize.font20*1.4,fontWeight: FontWeight.bold),),
                  Text("${date}",style: TextStyle(color: Colors.white.withOpacity(0.6),fontSize: PageSize.font20/1.2,fontWeight: FontWeight.bold),),
                ],
              ),
            ],
          ),
          
          Container(
            margin: EdgeInsets.only(right: PageSize.width15),
            width: PageSize.height20*2,
            height: PageSize.height20*2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(PageSize.width10,),
              color: Color(0xffFCBF1E),
            ),
            child: Icon(Icons.arrow_forward_outlined,color: Colors.white,),
          ),
          
        ],
      ),
    );
  }
}
