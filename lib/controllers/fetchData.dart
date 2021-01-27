import 'dart:convert';

import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = new Dio();

  //ios
  //dio.options.baseUrl = "http://localhost:8000/api";
  //android
  dio.options.baseUrl = "http://10.0.2.2:8000/api";

  dio.options.headers['accept'] = 'Application/Json';

  Map<String, dynamic> json = {
    "الاحد 12/3": {
      "1": {
        "name": "خالد",
        "hfrom": "القارعة",
        "hto": "الليل",
        "mto": "الناس",
        "mfrom": "المسد",
        "starsCount": "3",
        "list": "true,true,true",
        "hasFire": "true",
      },
      "2": {
        "name": "خالد",
        "hfrom": "القارعة",
        "hto": "الليل",
        "mto": "الناس",
        "mfrom": "المسد",
        "starsCount": "3",
        "list": "true,true,true",
        "hasFire": "true",
      },
    },
    "الاثنين 12/4": {
      "1": {
        "name": "خالد",
        "hfrom": "القارعة",
        "hto": "الليل",
        "mto": "الناس",
        "mfrom": "المسد",
        "starsCount": "3",
        "list": "true,true,true",
        "hasFire": "true",
      },
    },
    "الاثلاثاء 12/5": {}
  };

  return json ?? dio;
}
