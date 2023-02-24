import 'dart:convert';

import 'package:betterfood_app_android/common/globals.dart';
import 'package:betterfood_app_android/dtos/response/productresponse.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class ProductsProvider extends ChangeNotifier {
  bool isLoading = false;
  final logger = Logger();

  List<ProductResponseDto>? _products = [];

  List<ProductResponseDto>? get products => _products;

  Future<dynamic> getAll() async {
    try {
      isLoading = true;
      final url = "${Globals.apiURL}/api/m/product/";
      final response = await http.get(Uri.parse(url));
      logger.d(response);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final List<dynamic> results = json["results"];
        _products = results.map((e) => ProductResponseDto.fromJson(e)).toList();

        isLoading = false;
        logger.d(_products);
        notifyListeners();
      } else {
        logger.e("Failed to load Productss");
        throw Exception('Failed to load products');
      }
    } catch (e) {
      logger.e(e);
    }

    return [];
  }
}