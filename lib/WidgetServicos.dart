import 'package:flutter/material.dart';

class WidgetServicos extends StatelessWidget {
  final String nome;
  final Icon icone;

  const WidgetServicos(this.nome, this.icone, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        ElevatedButton(
          child: Container(
              color: Colors.grey.shade800,
              width: 450,
              height: 70,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      this.nome,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    icone,
                  ],
                ),
              )),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: Colors.grey.shade800,
              padding: EdgeInsets.all(20),
          )
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );

    /*Container(
      //margin: EdgeInsets.all(25),
      //margin: EdgeInset.only(top: 50, bottom: 50),
      margin: EdgeInsets.fromLTRB(30, 15, 30, 15),
      padding: EdgeInsets.all(20),

      width: MediaQuery.of(context).size.width,
      //height: 300,

      decoration: BoxDecoration(
          //color: Colors.purple.shade600,
          color: Colors.grey.shade800,
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          )),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade800),
        onPressed: () {

        }, 
        child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: icone,
          ),
          Text(
            this.nome,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
        ],
      ),
      ),
      
    );*/
  }
}
