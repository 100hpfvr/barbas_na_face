import 'dart:convert';
import 'package:barbasnaface/Screens/home_screen.dart';
import 'package:barbasnaface/Screens/login_screen.dart';
import 'package:barbasnaface/Screens/signup_screen.dart';
import 'package:barbasnaface/mapas/mapashome.dart';
import 'package:barbasnaface/models/cart_model.dart';
import 'package:barbasnaface/models/user_model.dart';
import 'package:barbasnaface/tabs/profile_edit_tab.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: UserModel(),
        child: ScopedModelDescendant<UserModel>(
            builder: (context, child, model){
              return ScopedModel<CartModel>(
                model: CartModel(model),
                child: MaterialApp(
                    title: 'Barbasnacara',
                    theme: ThemeData(
                      textTheme: TextTheme(
                        subhead:
                        new TextStyle(color: Colors.white), // <-- that's the one
                      ),


                      brightness: Brightness.dark,
                      cursorColor: Colors.white,
                      hintColor: Colors.grey,
                      cardColor: Colors.grey[900],
                      accentColor: Colors.black,
                      //canvasColor: Colors.black,
                      primarySwatch: Colors.yellow,
                      primaryColor: Colors.yellow,
                      selectedRowColor: Colors.yellow,
                    ),
                    home: HomeScreen()),
              );

            }

        )

    );
  }
}

/*




Future<String> main() async {
  http.Response response = await http.get("https://www.motoboy.com/apiV1/orcamento?cidade=rs%2Fporto-alegre&endereco1_cep=91788112&endereco2_cep=90690000",
      headers: {
        "Content-Type" : "application/json"
      }
  );
  double distanciamapeada = json.decode(response.body)["distancia"];
  //double distancianumerada = double.parse(source);

  distancianumerada = distanciamapeada + 3;
  print(distancianumerada);


}





*/
