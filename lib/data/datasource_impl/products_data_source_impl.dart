import 'package:ecommerce_app_c10_frida/data/api_manager/api_manager.dart';
import 'package:ecommerce_app_c10_frida/data/datasource_contract/Products_datasource.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Product.dart';
import 'package:ecommerce_app_c10_frida/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductDataSource)
class ProductsDataSourceImpl extends ProductDataSource{
  ApiManager apiManager ;
  @factoryMethod
  ProductsDataSourceImpl({required this.apiManager});
  @override
  Future<List<Product>?> getProducts({ProductSort? sort}) async{
    var response = await apiManager.getProducts();
    return response.data?.map((productDto) => productDto.toProduct()).toList();
  }

}