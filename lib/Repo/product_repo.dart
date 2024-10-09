import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:test/model/product_model.dart';

class ProductRepo {
  static Future<List<Products>?> getProducts() async{
    List<Products> data = [];
    Dio _dio = Dio();
    try{
    final response = await _dio.get("https://fakestoreapi.com/products");
    if(response.statusCode == 200){
      final json = response.data;
      json.map((e)=>data.add(Products.fromJson(e))).toList();
      if (kDebugMode) {
        print(json);
      }
    }
    }catch (e){
      rethrow;
    }
    return data;
  }
}