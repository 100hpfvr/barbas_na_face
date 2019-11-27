import 'package:barbasnaface/datas/products_data.dart';
import 'package:barbasnaface/tiles/product_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CategoryScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(snapshot.data["title"]),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.grid_on),
                ),
                Tab(
                  icon: Icon(Icons.shopping_cart),
                )
              ],
            ),
          ),
          body: FutureBuilder<QuerySnapshot>(
              future: Firestore.instance
                  .collection("products")
                  .document(snapshot.documentID)
                  .collection("Itens")
                  .getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              ProductData data = ProductData.fromDocument(
                                  snapshot.data.documents[index]);
                              data.category = this.snapshot.documentID;

                              return ProductTile(
                                  "grid",
                                  data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {



                              ProductData data = ProductData.fromDocument(
                                  snapshot.data.documents[index]);
                              data.category = this.snapshot.documentID;
                              return ProductTile("list", data);
                            })
                      ]);
              })),
    );
  }
}
