import 'package:finance_app/data/model/add_date.dart';
import 'package:finance_app/globalconst/global_const.dart';
import 'package:finance_app/screen/home_screen.dart';
import 'package:finance_app/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        height: PageSize.screenHeight,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            BackgroundTopContainer(),
            Positioned(
              top: PageSize.height45 * 3,
              child: MainContainer(),
            ),
          ],
        ),
      ),
    );
  }
}

class MainContainer extends StatefulWidget {
  const MainContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  final box = Hive.box<AddData>("data");
  DateTime date = DateTime.now();
  String? selectedItem;
  String? selectedHow;
  final List<String> _item = [
    "food",
    "Transfer",
    "Transportation",
    "Education",
  ];

  final List<String> _how = [
    "Income",
    "Expand",
  ];
  final TextEditingController explaing_C = TextEditingController();
  FocusNode ex = FocusNode();

  final TextEditingController amount = TextEditingController();
  FocusNode amount_ex = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    explaing_C.dispose();
    amount.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ex.addListener(() {
      setState(() {});
    });
    amount_ex.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(PageSize.width20),
        color: Colors.white,
      ),
      width: PageSize.screenWidth / 1.2,
      height: PageSize.screenHeight / 1.35,
      child: Column(
        children: [
          SizedBox(
            height: PageSize.height45,
          ),
          Padding(
             padding: EdgeInsets.symmetric(horizontal: PageSize.width20*1.3),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: PageSize.width15),
              width: PageSize.screenWidth / 1.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(PageSize.width10),
                border: Border.all(
                  width: 2,
                  color: Color(0xffC5C5C5),
                ),
              ),
              child: DropdownButton<String>(
                  value: selectedItem,
                  items: _item
                      .map((e) => DropdownMenuItem(
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: PageSize.height45,
                                    child:
                                        Image.asset("assets/images/${e}.png"),
                                  ),
                                  SizedBox(
                                    height: PageSize.height10,
                                  ),
                                  Text(
                                    e,
                                    style: TextStyle(
                                      fontSize: PageSize.font20 / 1.2,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            value: e,
                          ))
                      .toList(),
                  selectedItemBuilder: (context) => _item
                      .map(
                        (e) => Row(
                          children: [
                            Container(
                              width: PageSize.height45,
                              child: Image.asset("assets/images/${e}.png"),
                            ),
                            SizedBox(
                              width: PageSize.width10,
                            ),
                            Text(e),
                          ],
                        ),
                      )
                      .toList(),
                  hint: Text(
                    "Name",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  underline: Container(),
                  onChanged: (value) {
                    setState(() {
                      selectedItem = value;
                    });
                  }),
            ),
          ),
          SizedBox(
            height: PageSize.height15 * 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: PageSize.width20*1.3),
            child: TextField(
              focusNode: ex,
              controller: explaing_C,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: PageSize.width15, vertical: PageSize.width15),
                labelText: "explain",
                labelStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: PageSize.font20 / 1.2,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(PageSize.width10),
                  borderSide: BorderSide(
                    width: 2,
                    color: Color(0xffC5C5C5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(PageSize.width10),
                  borderSide: BorderSide(
                    width: 2,
                    color: Color(0xff368983),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: PageSize.height15 * 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: PageSize.width20*1.3),
            child: TextField(
              keyboardType: TextInputType.number,
              focusNode: amount_ex,
              controller: amount,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: PageSize.width15, vertical: PageSize.width15),
                labelText: "amount",
                labelStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: PageSize.font20 / 1.2,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(PageSize.width10),
                  borderSide: BorderSide(
                    width: 2,
                    color: Color(0xffC5C5C5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(PageSize.width10),
                  borderSide: BorderSide(
                    width: 2,
                    color: Color(0xff368983),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: PageSize.height15 * 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: PageSize.width20*1.3),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: PageSize.width15),
              width: PageSize.screenWidth / 1.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(PageSize.width10),
                border: Border.all(
                  width: 2,
                  color: Color(0xffC5C5C5),
                ),
              ),
              child: DropdownButton<String>(
                  value: selectedHow,
                  items: _how
                      .map((e) => DropdownMenuItem(
                            child: Container(
                              child: Row(
                                children: [
                                  Text(
                                    e,
                                    style: TextStyle(
                                      fontSize: PageSize.font20 / 1.2,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            value: e,
                          ))
                      .toList(),
                  selectedItemBuilder: (context) => _how
                      .map(
                        (e) => Row(
                          children: [
                            Text(e),
                          ],
                        ),
                      )
                      .toList(),
                  hint: Text(
                    "How",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  underline: Container(),
                  onChanged: (value) {
                    setState(() {
                      selectedHow = value;
                    });
                  }),
            ),
          ),
          SizedBox(
            height: PageSize.height15 * 2,
          ),
          Padding(
             padding: EdgeInsets.symmetric(horizontal: PageSize.width20*1.3),
            child: Container(
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(PageSize.width10),
                border: Border.all(
                  width: 2,
                  color: Color(0xffC5C5C5),
                ),
              ),
              width: PageSize.screenWidth / 1.2,
              child: TextButton(
                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2102),
                    );
                    if (newDate == null) return;
                    setState(() {
                      date = newDate;
                    });
                  },
                  child: Text(
                    "Date : ${date.year}/ ${date.month}/ ${date.day}",
                    style: TextStyle(
                        color: Colors.black, fontSize: PageSize.font26 / 1.7),
                  )),
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              var add = AddData(selectedItem!, amount.text, date, explaing_C.text, selectedHow!);
             
              box.add(add);

              Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomBar()));
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(PageSize.width15),
                color: Color(0xffFCBF1E),
              ),
              width: PageSize.height45 * 3,
              height: PageSize.height45,
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: PageSize.font20 / 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: PageSize.height20,
          ),
        ],
      ),
    );
  }
}

class BackgroundTopContainer extends StatelessWidget {
  const BackgroundTopContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: PageSize.screenHeight / 3.5,
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
              bottomLeft: Radius.circular(
                PageSize.width20,
              ),
              bottomRight: Radius.circular(
                PageSize.width20,
              ),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: PageSize.height45 / 1.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: PageSize.width15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Adding",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: PageSize.font20,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.attach_file_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
