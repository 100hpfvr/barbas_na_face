import 'package:barbasnaface/Screens/cart_screen.dart';
import 'package:barbasnaface/Screens/category_screen.dart';
import 'package:barbasnaface/Screens/product_screen.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {

final PageController pageController;

HomeTab(this.pageController);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Image.network(
              "https://firebasestorage.googleapis.com/v0/b/barbasnaface.appspot.com/o/barbas.jpeg?alt=media&token=32990f3f-bed3-4923-91bc-36528eee0037"),
        ),
        Expanded(
          child: Container(
            color: Color.fromARGB(255, 244, 240, 33),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        pageController.jumpToPage(1);

                      },
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.fastfood,
                            size: 100,
                            color: Colors.black,
                          ),
                          Text(
                            "Produtos",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        pageController.jumpToPage(3);


                      },
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.view_list,
                            size: 100,
                            color: Colors.black,
                          ),
                          Text(
                            "Pedidos",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.shopping_cart,
                            size: 100,
                            color: Colors.black,
                          ),
                          Text(
                            "Carrinho",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        pageController.jumpToPage(4);
    
    
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.account_circle,
                            size: 100,
                            color: Colors.black,
                          ),
                          Text(
                            "Perfil",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
