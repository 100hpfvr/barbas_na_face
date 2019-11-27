import 'package:barbasnaface/models/cart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DiscountCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
        title: Text(
          "Cupom de Desconto",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        leading: Icon(Icons.card_giftcard, color: Colors.black),
        trailing: Icon(Icons.add, color: Colors.black,),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Digite o código do seu cupom"),
              initialValue: CartModel.of(context).couponCode ?? "",
              onFieldSubmitted: (text) {
                Firestore.instance
                    .collection("coupons")
                    .document(text)
                    .get()
                    .then((docSnap) {
                  if (docSnap.data != null) {
                    CartModel.of(context).setCoupon(text, docSnap.data["percent"]);
                    Scaffold.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                          "Desconto de ${docSnap.data["percent"]}% aplicado! "),
                    ));
                  } else {{
                    CartModel.of(context).setCoupon(null, 0);
                    Scaffold.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                          "Cupom não existente!"),
                    ));
                  }

                  }
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
