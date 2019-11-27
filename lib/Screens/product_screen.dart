import 'package:barbasnaface/Screens/cart_screen.dart';
import 'package:barbasnaface/Screens/login_screen.dart';
import 'package:barbasnaface/datas/cart_product.dart';
import 'package:barbasnaface/datas/products_data.dart';
import 'package:barbasnaface/models/cart_model.dart';
import 'package:barbasnaface/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ProductScreen extends StatefulWidget {
  final ProductData product;

  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData product;
  final _textControler = TextEditingController();
  //List passarAdicionaisbanco = [];

  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: product.images.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: 8.0,
              dotSpacing: 40,
              dotBgColor: Colors.transparent,
              dotColor: Colors.yellow,
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  product.title,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  maxLines: 3,
                ),
                Text(
                  "R\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                  ),
                ),
                SizedBox(height: 26.0),
                Text(
                  "Descrição",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                SizedBox(height: 26.0),
                Text(
                  "Observações",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                TextFormField(
                  controller: _textControler,
                  onChanged: (Adicionais){
                  
                  },
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: "EX: Sem cebola, aquecer mais ou não aquecer",
                  ),
                ),

//                Container(
//                  height: 250,
//                  child: ListView.builder(
//                      padding: EdgeInsets.only(top: 10.0),
//                      itemCount: product.Adicionais.length,
//                      itemBuilder: (context, index) {
//
//                        return CheckboxListTile(
//                          title: Text(product.Adicionais[index]),
//                          value: product.Adicionais[index],
////                          secondary: CircleAvatar(
////                            child: Icon(_boxController == true
////                                ? Icons.check_circle
////                                : Icons.check_circle_outline),
////                          ),
//                          onChanged: (c) {
//                            setState(() {
//
//
//
//                            });
//
//                          },
//                        );
//                      }),
//                ),
//                                               GRID VIEW FUNCIONANDOAOAAOAOOAOA
//               GridView(
//                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,
//                  mainAxisSpacing: 8.0, childAspectRatio: 6.0
//                  ),
//                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 10),
//                  scrollDirection: Axis.vertical,
//                  shrinkWrap: true,
//                  children: product.adicionais.map((a) {
//                    return GestureDetector(
//                      onTap: (){
//                        adicionais != null ? setState(() {
//                          adicionais = null;
//                        }) : setState(() {
//                          adicionais = a;
//                        });
//
//
//                      },
//
//                      child: Container(
//                        padding: EdgeInsets.all(10),
//
//
//                        alignment: Alignment.centerLeft,
//                        decoration: BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                          border: Border.all(color: adicionais == a ? Colors.blue : Colors.grey[500], width: 4.0),
//
//                        ),
//                        child: Text(a, style: TextStyle(color: Colors.white),),
//
//                      ),
//                    );
//
//                  }).toList(),
//                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  //ARRUMAR O BOTÃO CARRINHO DO LADO DIREITO DO STACK

                  height: 40.0,

                  child: RaisedButton(
                    elevation: 20,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      if (UserModel.of(context).isLoggedIn()) {
                        //adicionar ao carrinho
                        CartProduct cartProduct = CartProduct();
                        cartProduct.Adicionais = _textControler.text ;
                        cartProduct.pid = product.id;
                        cartProduct.quantity = 1;
                        cartProduct.category = product.category;
                        cartProduct.productData = product;

                        CartModel.of(context).addCartItem(cartProduct);

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartScreen()));
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      }
                    },
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          //margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 26.0) ,
                          child: Text(
                            UserModel.of(context).isLoggedIn()
                                ? "Adicionar ao carrinho"
                                : "Entre para comprar",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.add_shopping_cart,
                            size: 32.0,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
              /*   fazer a colum com nome preço e descrição.       */
            ),
          ),
        ],
      ),
    );
  }
}
