import 'package:app07_01/WidgetServicos.dart';
import 'package:flutter/material.dart';

class TelaServicos extends StatefulWidget {
  const TelaServicos({ Key? key }) : super(key: key);

  @override
  _TelaServicosState createState() => _TelaServicosState();
}

class _TelaServicosState extends State<TelaServicos> {
  Widget appBarTitle = new Text(
    "Serviços",
    style: new TextStyle(color: Colors.white),
  );
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );

  var lista = [];

  @override
  void initState() {
    lista.add("Entrega e busca");
    lista.add("Transporte");
    lista.add("Encanamento");
    lista.add("Mecânica");
    lista.add("Marcenaria");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.redAccent.shade700,
          automaticallyImplyLeading: false,
          title: appBarTitle,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              WidgetServicos('Delivery', Icon(Icons.directions_bike, color: Colors.white,)),
              WidgetServicos('Transporte', Icon(Icons.directions_bus, color: Colors.white)),
              WidgetServicos('Encanamento', Icon(Icons.water_damage, color: Colors.white)),
              WidgetServicos('Mecânica', Icon(Icons.car_repair, color: Colors.white)),
              WidgetServicos('Marcenaria', Icon(Icons.handyman, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}