

import 'package:finance_app/data/1.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

List<Money> geter_top(){
  Money snap_food =Money();
  snap_food.time="jan 30,2022";
  snap_food.image="food.png";
  snap_food.buy=true;
  snap_food.fee="- \$ 100";
  snap_food.name="Snap food";
  Money snap =Money();
  snap.image="Education.png";
  snap.time="today";
  snap.buy=true;
  snap.fee="- \$ 60";
  snap.name="Transfer";

  return [snap_food,snap];

}