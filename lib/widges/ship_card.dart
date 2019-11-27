import 'package:flutter/material.dart';
import 'package:barbasnaface/models/user_model.dart';
import 'package:flutter/scheduler.dart';
import 'package:scoped_model/scoped_model.dart';

class ShipCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return Card(
        color: Colors.yellow,
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ExpansionTile(
          title: Text(
            "Endereço de entrega",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
          ),
          trailing: Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          leading: Icon(Icons.location_on, color: Colors.black),
          children: <Widget>[
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                  child: Text(
                    "O CEP atual do seu perfil é: ${model.userData["address"]}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixText: "CEP: ",
                  hintText: "Digite o CEP",
                ),
                initialValue: "${model.userData["address"]}",
                style: TextStyle(color: Colors.black),
                onFieldSubmitted: (text) {},
              ),
            )
          ],
        ),
      );
    });
  }
}
