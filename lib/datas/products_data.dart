import 'package:cloud_firestore/cloud_firestore.dart';


class ProductData {

  String category;
  String id;
  String title;
  String description;
  String observation;

  double price;

  List images;
  List Adicionais;

  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    price = snapshot.data["price"];
    images = snapshot.data["images"];
    Adicionais = snapshot.data["Adicionais"];
  }

  Map<String, dynamic> toResumedMap(){
    return{
      "title": title,
      "description": description,
      "price": price,
      "Adicionais": Adicionais,
      "observation": observation
      };

  }
  
  


}
