import 'package:app07_01/TelaAlimen.dart';
import 'package:app07_01/TelaMarke.dart';
import 'package:app07_01/TelaServicos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'TelaHome.dart';
import 'TelaInserir.dart';
import 'TelaLogin.dart';
import 'TelaSobre.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Help',
    home: TelaLogin(),
    initialRoute: 't2',
    routes: {
      't1': (context) => TelaLogin(),
      't2': (context) => TelaPrincipal(),
      'ts': (context) => TelaSobre(),
      'inserir': (context) => TelaInserir(),
    },
  ));
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
