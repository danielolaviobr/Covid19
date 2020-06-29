import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ApiData extends GetxController {
  var _response;
  var _data;

  // ignore: missing_return
  Future<Map<String, int>> countryCurrentData() async {
    getPastWeekData();
    try {
      _response = await http
          .get('https://covid19-brazil-api.now.sh/api/report/v1/brazil');
      _response.statusCode == 200
          ? _data = await jsonDecode(_response.body)
          : print(_response.statusCode);
      if (_data != null) {
        //print(_data);
        return {
          'confirmedCases': _data['data']['confirmed'],
          'deaths': _data['data']['deaths'],
          'recovered': _data['data']['recovered'],
        };
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, int>> RioCurrentData() async {
    getPastWeekData();
    try {
      _response = await http
          .get('https://covid19-brazil-api.now.sh/api/report/v1/brazil/uf/rj');
      _response.statusCode == 200
          ? _data = await jsonDecode(_response.body)
          : print(_response.statusCode);
      if (_data != null) {
        //print(_data);
        print(_data);
        return {
          'confirmedCases': _data['cases'],
          'deaths': _data['deaths'],
          //'recovered': _data['data']['recovered'],
        };
      }
    } catch (e) {
      print(e);
    }
  }

  void getPastWeekData() async {
    Map<int, int> weekData;
    int _currentDay = DateTime.now().day;
    int _currentMonth = DateTime.now().month;
    int _currentYear = DateTime.now().year;
    //print(_currentMonth);
    for (int i = 1; i <= 7; i++) {
      //print(i);
      int _day = _currentDay - i;
      var dayData = await http.get(
          'https://covid19-brazil-api.now.sh/api/report/v1/brazil/202006$_day');
      //print(jsonDecode(dayData.body)['data']);
    }
  }
}
