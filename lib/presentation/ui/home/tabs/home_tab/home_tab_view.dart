import 'package:ecommerce_app_c10_frida/data/api_manager/api_manager.dart';
import 'package:ecommerce_app_c10_frida/data/datasource_impl/categories_datasource_impl.dart';
import 'package:ecommerce_app_c10_frida/data/repository_impl/categories_repository_impl.dart';
import 'package:ecommerce_app_c10_frida/di/di.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Brand.dart';
import 'package:ecommerce_app_c10_frida/domain/repository/categories_repository.dart';
import 'package:ecommerce_app_c10_frida/domain/usecases/get_categories_usecase.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/home_tab/brand_item_widget.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/home_tab/category_item_widget.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/home_tab/home_tab_view_model.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/widgets/product_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabView extends StatefulWidget {
  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.initPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          case ErrorState():
            {
              return Center(
                child: Column(
                  children: [
                    Expanded(child: Text(state.errorMessage ?? '')),
                    ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                  ],
                ),
              );
            }
          case SuccessState():
            {
              var categories = state.categories;
              var brands = state.brands;
              var products = state.products;
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 18,
                            crossAxisSpacing: 18,
                            childAspectRatio: 1 / 2),
                        itemBuilder: (context, index) =>
                            CategoryItemWidget(category: categories![index]),
                        itemCount: categories?.length,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Container(
                        height: MediaQuery.of(context).size.height * .2,
                        child: ListView.builder(

                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) =>
                          BrandItemWidget(brand: brands![index]),
                                            itemCount: brands?.length,
                                          ),
                      )),
                  SliverToBoxAdapter(
                      child: Container(
                        height: MediaQuery.of(context).size.height * .3,
                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) =>
                          ProductItemWidget(product: products![index]),
                                            itemCount: products?.length,
                                          ),
                      )),
                ],
                // child: Column(
                //   children: [
                //     Expanded(
                //
                //       child: GridView.builder(
                //
                //         scrollDirection: Axis.horizontal,
                //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:  2,mainAxisSpacing: 18,crossAxisSpacing: 18,childAspectRatio: 1/2),
                //           itemBuilder: (context, index) => CategoryItemWidget(category: categories![index]),itemCount: categories?.length,),
                //     ),
                //     Expanded(child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) =>BrandItemWidget(brand: brands![index]) ,itemCount: brands?.length,))
                //   ],
                // ),
              );
            }
        }
      },
    );
    // return BlocConsumer<HomeTabViewModel, HomeTabState>(
    //   bloc: viewModel,
    //   buildWhen: (previous, current) {
    //     if(current is SuccessState) return true;
    //     return false;
    //   },
    //   listenWhen: (previous, current) {
    //     if(current is LoadingState) {
    //       return true;
    //     }
    //     if(current is ErrorState){
    //       return true;
    //     }
    //     return false;
    //   },
    //   listener: (context, state) {
    //     if(state is LoadingState){
    //       // show Loading dialog
    //     }
    //     if(state is ErrorState){
    //       // show error dialog with error message
    //     }
    //   },
    //   builder: (context, state){
    //     if(state is SuccessState){
    //       // rebuild ur widget
    //       return Scaffold();
    //     }
    // }
    // );
  }
}
