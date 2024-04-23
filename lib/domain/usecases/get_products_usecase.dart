import 'package:ecommerce_app_c10_frida/domain/entities/Product.dart';
import 'package:ecommerce_app_c10_frida/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetProductsUseCase{
  ProductRepository productRepository;
  @factoryMethod
  GetProductsUseCase({required this.productRepository});

  Future<List<Product>?> invoke(){
    return productRepository.getProducts();
  }
}