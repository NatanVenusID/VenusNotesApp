import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phpmysqlcrud/main.dart';
import 'package:phpmysqlcrud/registerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

enum statusLogin { signIn, notSignIn }

class _PageLoginState extends State<PageLogin> {
  statusLogin _loginStatus = statusLogin.notSignIn;
  final _keyForm = GlobalKey<FormState>();
  String nUsername, nPassword;
// check ketika klik tombol login
  checkForm() {
    final form = _keyForm.currentState;
    if (form.validate()) {
      form.save();
      submitDataLogin();
    }
  }

// mengirim request dan menanggapinya
  submitDataLogin() async {
    final responseData =
        await http.post("http://10.0.2.2/notes-server/login.php", body: {
      "username": nUsername,
      "password": nPassword,
    });
    final data = jsonDecode(responseData.body);
    int value = data['value'];
    String pesan = data['message'];
    print(data);
// get data respon
    String dataUsername = data['username'];
    String dataPassword = data['password'];
// cek value 1 atau 0
    if (value == 1) {
      setState(() {
// set status loginnya sebagai login
        _loginStatus = statusLogin.notSignIn;
// simpan data ke share preferences
        saveDataPref(value, dataUsername, dataPassword);
      });
    } else if (value == 2) {
      print(pesan);
    } else {
      print(pesan);
    }
  }

// method untuk soimpan share pref
  saveDataPref(int value, String dUsername, dPassword) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setInt("value", value);
      sharedPreferences.setString("username", dUsername);
      sharedPreferences.setString("password", dPassword);
    });
  }

  getDataPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      int nvalue = sharedPreferences.getInt("value");
      _loginStatus = nvalue == 1 ? statusLogin.signIn : statusLogin.notSignIn;
    });
  }

  @override
  void initState() {
    getDataPref();
    super.initState();
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case statusLogin.notSignIn:
        return Scaffold(
          backgroundColor: Colors.amber,
          body: Form(
            key: _keyForm,
            child: ListView(
              children: <Widget>[
                Center(
                  child: Text(
                    'Venus Notes Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              
                Container(
                  height: 136,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/venus.png"))),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: Colors.amber,
                    validator: (value) {
//cek kalau value nya kosong
                      if (value.isEmpty) {
                        return 'Please Input Username';
                      }
                      return null;
                    },
                    onSaved: (value) => nUsername = value,
                    decoration: InputDecoration(
                        hintText: 'Username',
                        labelText: 'Input Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    cursorColor: Colors.amber,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Input Password';
                      }
                      return null;
                    },
                    onSaved: (value) => nPassword = value,
                    obscureText: true,
                    decoration: InputDecoration(        
                        hintText: 'Password',
                        labelText: 'Input Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0),
                  child: MaterialButton(
                    color: Colors.black,
                    textColor: Colors.white,
                    child: Text('Login'),
                    onPressed: () {
                      setState(() {
                        checkForm();
                      });
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                  child: MaterialButton(
                    textColor: Colors.black,
                    child: Text('Belum Punya Akun ? Silahkan Daftar'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                  ),
                )
              ],
            ),
          ),
        );
        break;
      case statusLogin.signIn:
        return MyHomePage();
        break;
      
    }
  }
}
