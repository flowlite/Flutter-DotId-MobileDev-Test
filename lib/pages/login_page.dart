import 'package:flutter/material.dart';
import 'package:flutter_dotid_mobiledev_test/constants.dart';
import 'package:flutter_dotid_mobiledev_test/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 50, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 25.0),
              child: const Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15.0),
              child: TextFormField(
                initialValue: _email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 3.0
                    )
                  ),
                  hintText: "Email"
                ),
                onChanged: (value) {
                  _email = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40.0),
              child: TextFormField(
                initialValue: _password,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 3.0
                    )
                  ),
                    hintText: "Password",
                ),
                onChanged: (value) {
                  _password = value;
                },
              ),
            ),
            InkWell(
              onTap: () {
                _validateLogin(_email, _password);
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 15, top: 15),
                alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(4.0))
                  ),
                  child: Text(
                      'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
  
  _showMessage(String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  _showLoading(){
    var loadDialog = AlertDialog(
      content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(value: null),
            SizedBox(width: 20,),
            Text('Now Loading')
          ],
      ),
    );

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return loadDialog.build(context);
    });
  }

  _dismissDialog(){
    Navigator.of(context).pop();
  }

  _validateLogin(String email, String password) {

    if(RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$", caseSensitive: false).hasMatch(email) == false){
      _showMessage("Email tidak valid!");
    } else if(_password.length < 6){
      _showMessage("Panjang password tidak valid!");
    } else if(_password.contains(RegExp("[A-Z]")) == false
        || _password.contains(RegExp("[a-z]")) == false){
      _showMessage("Password harus mengandung 1 huruf besar dan kecil!");
    } else {
      _postLogin();
    }

  }

  _postLogin(){
    _showLoading();
    Future.delayed(Duration(seconds: 3)).then(
        (value) {
          _onLoginSuccess();
        }
    );
  }

  _saveCredentials() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    if(pref.containsKey(Constants.loggedEmail)
        && pref.containsKey(Constants.password)){
      pref.setString(_email, "");
      pref.setString(_password, "");
    }
  }


  _onLoginSuccess(){
    _saveCredentials();
    _dismissDialog();
    Future.delayed(Duration(seconds: 1)).then(
      (value) {
        _goToHomePage();
      });
  }

  _goToHomePage() async {
    await Navigator.pushNamed(context, Routes.homePage);
  }
}