import 'package:get/get_connect/http/src/utils/utils.dart';

import '1.dart';

List<Money> geter(){
  Money upwork = Money();
  upwork.name="upwork";
  upwork.fee="650";
  upwork.time="today";
  upwork.image="up.png";
  upwork.buy=false;
  Money starbucks =Money();
  starbucks.buy=true;
  starbucks.fee="15";
  starbucks.name="Starbucks";
  starbucks.time="today";
  starbucks.image="starbucks.png";
  Money transfer = Money();
  transfer.buy=true;
  transfer.fee="100";
  transfer.name="transfer for Sam";
  transfer.time="jan 30,2022";
  transfer.image="Transfer.png";

  return [upwork,starbucks,transfer,upwork,transfer,starbucks];  
}