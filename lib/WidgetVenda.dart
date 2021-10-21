import 'package:flutter/material.dart';

class WidgetVenda extends StatelessWidget {

  final String prod;
  final String preco;
  final String imagem;


  const WidgetVenda(this.prod, this.preco, this.imagem, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      //margin: EdgeInsets.all(5),
      margin: EdgeInsets.only(left: 10),
      //margin: EdgeInsets.fromLTRB(30, 15, 30, 15),
      padding: EdgeInsets.only(top: 10),

  

      width: 150,
      height: 70,

      decoration: BoxDecoration(
        //color: Colors.purple.shade600,
        color: Colors.grey.shade700,

        border: Border.all(
          color: Colors.white,
          width: 1
        ),

        borderRadius: BorderRadius.all(
          Radius.circular(20),
        )
      ),
      child: Column(
        children: [
          Text(this.prod, style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),),
          SizedBox(
            width: 15,
          ),
          Text(this.preco, style: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.italic,
            color: Colors.white70
          ),
        ),

        //SizedBox(height: 30),
        /*Padding(padding: EdgeInsets.only(top: 30),
          child: 
            Image.asset(this.foto),
        ),*/
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Image.asset(this.imagem),
        ),
        //Image.asset(this.foto),


        //GRADIENTE
        /*Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.green, Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
        )*/


        ],
      ),
    );
  }
}