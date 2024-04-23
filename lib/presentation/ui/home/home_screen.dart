import 'package:ecommerce_app_c10_frida/presentation/ui/home/home_screen_view_model.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/categories_tab/categories_tab.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/home_tab/home_tab_view.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/profile_tab/profile_tab.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/wish_list_tab/wish_list_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
int selectedIndex = 0;
var viewModel = HomeScreenViewModel();
Widget tabPreview = HomeTabView();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenState>(

      bloc: viewModel,
      builder: (context, state) {
        if(state is HomeTabState){
          tabPreview = HomeTabView();
        }else if(state is HomeCategoriesTabState){
          tabPreview = CategoriesTab();
        }else if(state is HomeWishListTabState){
          tabPreview = WishListTab();
        }else{
          tabPreview = ProfileTab();
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Route ecommmerce app'),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              selectedIndex = index;
              viewModel.getTabs(selectedIndex);
            },
            currentIndex: selectedIndex,
            backgroundColor: Colors.blue,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.blue,
                  icon: selectedIndex == 0 ?
                  CircleAvatar(child: ImageIcon(AssetImage('assets/images/home.png'))): ImageIcon(AssetImage('assets/images/home.png')) , label: ''),
              BottomNavigationBarItem(
                  backgroundColor: Colors.blue,
                  icon: selectedIndex == 1 ?
                  CircleAvatar(child: ImageIcon(AssetImage('assets/images/categories.png'))): ImageIcon(AssetImage('assets/images/categories.png')) , label: ''),
              BottomNavigationBarItem(
                  backgroundColor: Colors.blue,
                  icon: selectedIndex == 2 ?
                  CircleAvatar(child: ImageIcon(AssetImage('assets/images/ic_wish_list.png'))): ImageIcon(AssetImage('assets/images/ic_wish_list.png')) , label: ''),
              BottomNavigationBarItem(
                  backgroundColor: Colors.blue,
                  icon: selectedIndex == 3 ?
                  CircleAvatar(child: ImageIcon(AssetImage('assets/images/ic_profile.png'))): ImageIcon(AssetImage('assets/images/ic_profile.png')) , label: ''),

            ],
          ),
          body: tabPreview,
        );
      },
    );
  }

}
