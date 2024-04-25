import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class WishListViewModel extends Cubit<WishListState>{
  @factoryMethod 
  WishListViewModel():super(UnAuthenticatedUser());

}
sealed class WishListState{

}

class UnAuthenticatedUser extends WishListState{

}