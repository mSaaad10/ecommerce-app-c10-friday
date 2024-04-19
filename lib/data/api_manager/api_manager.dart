import 'dart:convert';

import 'package:ecommerce_app_c10_frida/data/model/brands_response/BrandsResponse.dart';
import 'package:ecommerce_app_c10_frida/data/model/categories_response/CategoriesResponse.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
@singleton
@injectable
class ApiManager{
  static const baseUrl = 'ecommerce.routemisr.com';

  Future<CategoriesResponse>getCategories()async{
    var url = Uri.https(baseUrl, '/api/v1/categories');
   var response = await http.get(url);
   var json = jsonDecode(response.body);
   CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(json);
   return categoriesResponse;
  }

  Future<BrandsResponse>getBrands()async{
    var url = Uri.https(baseUrl, '/api/v1/brands');
   var response = await http.get(url);
   var json = jsonDecode(response.body);
   BrandsResponse brandsResponse = BrandsResponse.fromJson(json);
   return brandsResponse;
  }
}