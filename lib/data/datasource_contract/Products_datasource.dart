import 'package:ecommerce_app_c10_frida/domain/entities/Product.dart';
import 'package:ecommerce_app_c10_frida/domain/repository/products_repository.dart';

abstract class ProductDataSource{
  Future<List<Product>?> getProducts({ProductSort? sort});
}