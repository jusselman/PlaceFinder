import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for U/I //
  String time; // time in location //
  String flag; // url to an asset flag icon //
  String url; // location url for api endpoints //
  bool isDaytime; // true day, false night

  WorldTime({ this.location, this.flag, this.url});

  Future<void > getTime() async {

    try {
      //make request //
      Response resp = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(resp.body);

      //get props from data //
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);


      //create DateTime Object//
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set time property //
      isDaytime = now.hour > 5  && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }

    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }

  }
}

