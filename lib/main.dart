import 'package:app07_01/TelaAlimen.dart';
import 'package:app07_01/TelaMarke.dart';
import 'package:app07_01/TelaServicos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'TelaHome.dart';
import 'TelaSobre.dart';
import 'Usuario.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Help',
    home: TelaLogin(),
    initialRoute: 't1',
    routes: {
      't1': (context) => TelaLogin(),
      't2': (context) => TelaPrincipal(),
      'ts': (context) => TelaSobre(),
    },
  ));
}

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  var email = TextEditingController();
  var senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black54,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
                height: 45,
            ),
            Center(
              child: 
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 90,
                child: Image.asset("logo.jpg", scale: 3.2,),),
            ),
            SizedBox(
                height: 15,
            ),
            Expanded(
                child: Column(
              children: [
                TextField(
                  controller: email,
                  style: TextStyle(decorationColor: Colors.white, color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent.shade400)
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: senha,
                  style: TextStyle(decorationColor: Colors.white, color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent.shade400)
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.redAccent.shade400,
                  child: ElevatedButton(
                    child: const Text('Logar'),
                    onPressed: () {
                      setState(() {
                        var obj = Usuario(email.text, senha.text);

                        Navigator.pushNamed(context, 't2', arguments: obj);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent.shade400,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 18),
                        textStyle: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  var telaAtual = 0;

  var pgController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pgController,
        children: [
          TelaHome(),
          TelaAlimen(),
          TelaServicos(),
          TelaMarke(),
        ],

        //mudança de página -> atualizar o valor telaAtual
        onPageChanged: (index) {
          setState(() {
            telaAtual = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,

        iconSize: 25,

        selectedItemColor: Colors.redAccent.shade700,
        unselectedItemColor: Colors.white,

        selectedFontSize: 16,
        unselectedFontSize: 14,

        //index do selecionado
        currentIndex: telaAtual,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.dining), label: 'Alimentação'),
          BottomNavigationBarItem(
              icon: Icon(Icons.construction), label: 'Serviços'),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Marketing',
          ),
          /*BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Sobre',
          ),*/
        ],

        //mudança de pagina pelos botoes
        onTap: (index) {
          setState(() {
            telaAtual = index;
          });

          pgController.animateToPage(index,
              duration: Duration(milliseconds: 600), curve: Curves.easeInQuad);
        },
      ),
    );
  }
}
