import 'package:flutter/material.dart';
class OrderScreen extends StatelessWidget {

  final String orderId;

  OrderScreen(this.orderId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedido realizado"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.00),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.check, color: Colors.yellow, size: 80.0,),
            Text("Pedido realizado com Sucesso", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),),
            Text("Código do pedido: $orderId", style: TextStyle(fontSize: 16.0),)
          ],
        ),
      ),

    );
  }
}
