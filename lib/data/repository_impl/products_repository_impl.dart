import 'package:ecommerce_app_c10_frida/data/datasource_contract/Products_datasource.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Product.dart';
import 'package:ecommerce_app_c10_frida/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository{
  ProductDataSource productDataSource;
  @factoryMethod
  ProductRepositoryImpl({required this.productDataSource});
  @override
  Future<List<Product>?> getProducts({ProductSort? sortBy}) {
    return productDataSource.getProducts();
  }
}