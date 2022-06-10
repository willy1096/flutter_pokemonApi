import 'package:dio/dio.dart';

import 'package:myapptest/src/bloc/home/home_bloc.dart';

import 'package:myapptest/src/services/api_service.dart' as api;
class HomeService{


  static Future<HomeState> getPokemones() async {
    
      print("Eastoy en el http");
      try{
        final _dio =  new Dio();
        final resp =  await _dio.get(
          '${api.ApiService.urlApi}?offset=20&limit=20',
        );

        return HomeState.fromJson(resp.data);

      }on DioError catch (e) {
       
        return HomeState(
          count: 0,
          next: '',
          previous: '',
          results: []
        );
        
      }
  }

}
