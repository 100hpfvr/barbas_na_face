import 'package:barbasnaface/tabs/home_tab.dart';
import 'package:barbasnaface/tabs/orders_tab.dart';
import 'package:barbasnaface/tabs/productstab.dart';
import 'package:barbasnaface/tabs/profile_edit_tab.dart';
import 'package:barbasnaface/widges/cart_button.dart';
import 'package:barbasnaface/widges/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(_pageController),
          drawer: CustomDrawer(_pageController),
          //floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            //backgroundColor: Colors.black,
            title: Text("Produtos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
          floatingActionButton: CartButton(),
        ),
        Container(color: Colors.yellow,),
        Scaffold(
          appBar: AppBar(
            title: Text("Meus Pedidos"),
            centerTitle: true,
          ),
          body: OrdersTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            //backgroundColor: Colors.black,
            title: Text("Perfil"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProfileEditTab(),
          //floatingActionButton: CartButton(),
        )
      ],
    );
  }
}
