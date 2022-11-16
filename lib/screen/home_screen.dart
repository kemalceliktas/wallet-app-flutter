import 'package:finance_app/data/model/add_date.dart';
import 'package:finance_app/globalconst/global_const.dart';
import 'package:finance_app/widgets/card_top.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/list_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                    height: PageSize.screenHeight / 2.75, child: CardTop()),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: PageSize.width15,
                      vertical: PageSize.height20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Transactions History",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: PageSize.font20 / 1.2,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: PageSize.font20 / 1.5,
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    history = box.values.toList()[index];
                    return getList(history, index);
                  },
                  childCount: box.length,
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}

Widget getList(AddData history, int index) {
  return Dismissible(
    onDismissed: (direction) {
      history.delete();
    },
    key: UniqueKey(),
    child: get(index, history),
  );
}

ListTile get(int index, AddData history) {
  return ListTile(
     leading: Image.asset(
      "assets/images/${history.IN}.png",
      width: PageSize.height45,
    ), 
    title: Text(
      history.name,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: PageSize.font20 / 1.3,
        color: Colors.black,
      ),
    ),
    subtitle: Text(
      "${history.dateTime.toString().substring(0, 16)}",
      style: TextStyle(
        fontWeight: FontWeight.w700,
      ),
    ),
    trailing: Text(
      history.name == "Income"
          ? "+" + history.amount + " \$"
          : "-" + history.amount + " \$",
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: PageSize.font20,
        color: history.name == "Income" ? Colors.green : Colors.red,
      ),
    ),
  );
}
