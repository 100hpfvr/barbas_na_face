import 'package:barbasnaface/Screens/product_screen.dart';
import 'package:barbasnaface/datas/products_data.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final String type;
  final ProductData product;

  ProductTile(this.type, this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProductScreen(product)));
      },
      child: Card(
        //elevation: 80,

        shape: Border(left: BorderSide(width: 5.0, color: Colors.yellow)),
        //new RoundedRectangleBorder(side: BorderSide (color: Colors.yellow, width: 2.0), borderRadius: new BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30), )),

        // Cartão inteiro

        child: Row(
          // Objetos do cartão adicionados em linha
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(4.0),
              child: Container(
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    border: new Border.all(
                      color: Colors.black,
                      width: 3.0,
                    )),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(product.images[0]),
                  radius: 70,
                ),
              ),
            ),
            Expanded(
              child: Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(

                    product.title,
                    style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                  Text(
                    "R\$ ${product.price.toStringAsFixed(2)}",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            ),

          ],
        ),
      ),


    );
  }
}
