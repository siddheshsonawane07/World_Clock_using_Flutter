import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; //location name of the UI
  late String time; //the time in that location
  late String flag; //url to asset flag icon
  late String url; //location url for api endpoint
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      final url1 = "http://worldtimeapi.org/api/timezone/$url";

      final response = await get(Uri.parse(url1));
      final jsonData = jsonDecode(response.body);

      //get properties from data
      String datetime = jsonData['datetime'];
      String offset = jsonData['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now);
    } catch (e) {
      // ignore: avoid_print
      print("Error");
    }
  }
}
