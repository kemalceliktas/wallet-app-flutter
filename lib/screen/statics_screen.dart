import 'package:finance_app/data/model/add_date.dart';
import 'package:finance_app/data/utilty.dart';
import 'package:finance_app/globalconst/global_const.dart';
import 'package:finance_app/widgets/chart_widget.dart';
import 'package:flutter/material.dart';

import '../data/top_chart.dart';

class StaticsScreen extends StatefulWidget {
  const StaticsScreen({super.key});

  @override
  State<StaticsScreen> createState() => _StaticsScreenState();
}

class _StaticsScreenState extends State<StaticsScreen> {
  int IndexColor = 0;
  @override
  Widget build(BuildContext context) {
    List day = ["Day", "Week", "Month", "Year"];
    List f = [today(), week(), month(), year()];
    List<AddData> a = [];
    ValueNotifier kh = ValueNotifier(0);
    return Scaffold(
      
      body: Container(
        width: PageSize.screenWidth,
        height: PageSize.screenHeight,
        decoration: BoxDecoration(
             
        ),
        child: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: kh,
            builder: (context, dynamic value, child) {
              a = f[value];
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(
                          height: PageSize.height20,
                        ),
                        Text(
                          "Statistics",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: PageSize.font20,
                            fontWeight: FontWeight.bold,
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
                                ...List.generate(
                                  4,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          IndexColor = index;
                                          kh.value = index;
                                        });
                                      },
                                      child: Container(
                                        height: PageSize.height45,
                                        width: PageSize.width20 * 4,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              PageSize.width10),
                                          color: IndexColor == index
                                              ? Color(0xFF035AA6)
                                              : Colors.white,
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          day[index].toString(),
                                          style: TextStyle(
                                            color: IndexColor == index
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: PageSize.font20 / 1.2,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: PageSize.height20,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: PageSize.width15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: PageSize.width20 * 6,
                                height: PageSize.height20 * 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Expense",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: PageSize.font20 / 1.2,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_downward_sharp,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1.5,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(PageSize.width10)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: PageSize.height20,
                        ),
                        Chart(indexx: IndexColor,),
                        SizedBox(
                          height: PageSize.height20,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: PageSize.width15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Top Spending",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: PageSize.font20 / 1.2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.swap_vert,
                                size: PageSize.width20,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ListTile(
                          leading: Image.asset(
                            "assets/images/${a[index].IN}.png",
                            width: PageSize.height45,
                          ),
                          title: Text(
                            a[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: PageSize.font20 / 1.3,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            "${a[index].dateTime.toString().substring(0, 16)}",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          trailing: Text(
                            a[index].name == "Income"
                                ? "+" + a[index].amount + " \$"
                                : "-" + a[index].amount + " \$",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: PageSize.font20,
                              color: a[index].name == "Income"
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        );
                      },
                      childCount: a.length,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
