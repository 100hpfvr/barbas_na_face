import 'package:barbasnaface/Screens/signup_screen.dart';
import 'package:barbasnaface/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Entrar"),
          centerTitle: true,
          actions: <Widget>[
            FlatButton(
              child: Text(
                "CRIAR CONTA",
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
            ),
          ],
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading)
              return Center(
                child: CircularProgressIndicator(),
              );
            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "E-mail",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text.isEmpty || !text.contains("@"))
                        return "E-mail Inválido";
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _passController,
                    decoration: InputDecoration(hintText: "Senha"),
                    obscureText: true,
                    validator: (text) {
                      if (text.isEmpty || text.length < 6)
                        return "Senha inválida!";
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                        padding: EdgeInsets.all(8),
                        onPressed: () {
                          if (_emailController.text.isEmpty)
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text("Insira seu e-mail para recuperação!"),
                              backgroundColor: Colors.redAccent,
                              duration: Duration(seconds: 3),
                            )
                            );
                           else {
                             model.recoverPass(_emailController.text);
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text("Confira seu e-mail!"),
                              backgroundColor: Colors.black,
                              duration: Duration(seconds: 3),
                            )
                            );

                          }

                        },
                        child: Text(
                          "Esqueci minha senha",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.right,
                        )),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 44,
                    child: RaisedButton(
                      color: Colors.yellow,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {}
                        model.signIn(
                          email: _emailController.text,
                          pass: _passController.text,
                          onSucces: _onSuccess,
                          onFail: _onFail,
                        );
                      },
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),



    );
  }

  void _onSuccess() {
    Navigator.of(context).pop();
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao entrar!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 3),
    ));
  }
}
