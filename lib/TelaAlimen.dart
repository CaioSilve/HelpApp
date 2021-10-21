import 'package:flutter/material.Dart';
import 'package:flutter/material.dart';

class TelaAlimen extends StatefulWidget {
  const TelaAlimen({Key? key}) : super(key: key);

  @override
  _TelaAlimenState createState() => _TelaAlimenState();
}

class _TelaAlimenState extends State<TelaAlimen> {
  Widget appBarTitle = new Text(
    "Alimentação",
    style: new TextStyle(color: Colors.white),
  );
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );

  var lista = [];

  @override
  void initState() {
    lista.add("Batata recheada");
    lista.add("Batata frita");
    lista.add("Porção de camarão");
    lista.add("Porção de peixe");
    lista.add("X-Tudo");
    lista.add("X-Salada");
    lista.add("X-Bacon");
    lista.add("Sushi");
    lista.add("Filé Mignom");
    lista.add("Arroz e Feijão");
    lista.add("Saladinha");
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
                      "Alimentação",
                      style: new TextStyle(color: Colors.white),
                    );
                  }
                });
              },
            ),
          ]),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.black45,
        child: ListView.separated(
              itemCount: lista.length,
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey.shade400,
                  thickness: 0.75,
                );
              },
              itemBuilder: (context, index) {
                return Card(
                  elevation: 100,
                  shadowColor: Colors.grey.shade200,
                  child: ListTile(

                      //SELECIONAR ITEM DA LISTA
                      hoverColor: Colors.red.shade100,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Comida Selecionada: ${lista[index]}'),
                          duration: Duration(seconds: 2),
                        ));
                      },
                      title: Text(
                        lista[index],
                        style: TextStyle(fontSize: 22),
                      )),
                );
              },
            ),
      ),
    );
  }
}
