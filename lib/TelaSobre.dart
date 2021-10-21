import 'package:flutter/material.dart';

class TelaSobre extends StatefulWidget {
  const TelaSobre({Key? key}) : super(key: key);

  @override
  _TelaSobreState createState() => _TelaSobreState();
}

class _TelaSobreState extends State<TelaSobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
        backgroundColor: Colors.redAccent.shade700,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 25,
          ),
          Text('Help',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Expanded(
              child: Text(
            'O Help é um aplicativo baseado no já existente Ding Dom, um aplicativo para receber aquela mãozinha quando se precisa, desde serviços de alimentação a serviços de venda e compra regionais.',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          )),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(

              children: [
                SizedBox(
                  width: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image.asset("dev.jpg", scale: 8,),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(fontSize: 16),
                          children: <TextSpan>[
                        TextSpan(text: "Olá, me chamo "),
                        TextSpan(
                            text: "Caio Silveira ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent.shade400)),
                        TextSpan(text: "e sou o desenvolvedor do Help."),
                      ])),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
