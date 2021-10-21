import 'package:app07_01/WidgetVenda.dart';
import 'package:flutter/material.dart';

class TelaMarke extends StatefulWidget {
  const TelaMarke({Key? key}) : super(key: key);

  @override
  _TelaMarkeState createState() => _TelaMarkeState();
}

class _TelaMarkeState extends State<TelaMarke> {
  Widget appBarTitle = new Text(
    "Marketing",
    style: new TextStyle(color: Colors.white),
  );
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.redAccent.shade700,
            automaticallyImplyLeading: false,
            title: appBarTitle,
            actions: <Widget>[
              new IconButton(
                icon: actionIcon,
                onPressed: () {
                  setState(() {
                    if (this.actionIcon.icon == Icons.search) {
                      this.actionIcon = new Icon(
                        Icons.close,
                        color: Colors.white,
                      );
                      this.appBarTitle = new TextField(
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                        decoration: new InputDecoration(
                            prefixIcon:
                                new Icon(Icons.search, color: Colors.white),
                            hintText: "Pesquisar...",
                            hintStyle: new TextStyle(color: Colors.white)),
                        cursorColor: Colors.white,
                      );
                    } else {
                      this.actionIcon = new Icon(
                        Icons.search,
                        color: Colors.white,
                      );
                      this.appBarTitle = new Text(
                        "Marketing",
                        style: new TextStyle(color: Colors.white),
                      );
                    }
                  });
                },
              ),
            ]),
        body: Container(
            color: Colors.black54,
            width: MediaQuery.of(context).size.width,
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    'Produtos mais vistos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  width: 500,
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      WidgetVenda("Carro", "RS 15.000", "foto.png"),
                      WidgetVenda("Panela", "RS 70.000", "foto.png"),
                      WidgetVenda("Fogão", "RS 800", "foto.png"),
                      WidgetVenda("Avião", "RS 1.500.000", "foto.png"),
                    ],
                  ),
                )
              ],
            )));
  }
}
