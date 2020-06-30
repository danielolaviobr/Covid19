import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ApiData extends GetxController {
  http.Response _response;
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

  Future<Map<String, int>> StateCurrentData(String state) async {
    String stateCode = stateCatcher(state);
    try {
      _response = await http.get(
          'https://covid19-brazil-api.now.sh/api/report/v1/brazil/uf/$stateCode');
      _response.statusCode == 200
          ? _data = await jsonDecode(_response.body)
          : print(_response.statusCode);
      if (_data != null) {
        //print(_data);
        print(_data);
        return {
          'confirmedCases': _data['cases'],
          'deaths': _data['deaths'],
        };
      }
    } catch (e) {
      print(e);
    }
  }

// ! Deprecated
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

// ignore: missing_return
String stateCatcher(String state) {
  switch (state) {
    case 'Rio de Janeiro':
      return 'rj';
      break;
    case 'Sao Paulo':
      return 'sp';
      break;
    case 'Acre':
      return 'ac';
      break;
    case 'Alagoas':
      return 'al';
      break;
    case 'Amazonas':
      return 'am';
      break;
    case 'Bahia':
      return 'ba';
      break;
    case 'Ceará':
      return 'ce';
      break;
    case 'Brasilia':
      return 'df';
      break;
    case 'Espirito Santo':
      return 'es';
      break;
    case 'Goaiás':
      return 'go';
      break;
    case 'Maranhão':
      return 'ma';
      break;
    case 'Mato Grosso':
      return 'mt';
      break;
    case 'Mato Grosso do Sul':
      return 'ms';
      break;
    case 'Minas Gerais':
      return 'mg';
      break;
    case 'Pará':
      return 'pa';
      break;
    case 'Paraíba':
      return 'pb';
      break;
    case 'Parana':
      return 'pr';
      break;
    case 'Pernambuco':
      return 'pe';
      break;
    case 'Piauí':
      return 'pi';
      break;
    case 'Rio Grande do Norte':
      return 'rn';
      break;
    case 'Rio Grande do Sul':
      return 'rs';
      break;
    case 'Rondônia':
      return 'ro';
      break;
    case 'Roraima':
      return 'rr';
      break;
    case 'Santa Catarina':
      return 'sc';
      break;
    case 'Sergipe':
      return 'se';
      break;
    case 'Tocantins':
      return 'to';
      break;
  }
}
