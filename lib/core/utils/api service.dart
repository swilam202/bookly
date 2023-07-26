

import 'package:dio/dio.dart';

 class APIService{

  String baseURL = 'https://www.googleapis.com/books/v1/volumes?';
  late Dio _dio;

  Future<Map<String,dynamic>> getData({required String endpoint})async{
    Response response = await _dio.get('$baseURL$endpoint');
    return response.data;
  }




}