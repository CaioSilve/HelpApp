import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  late CollectionReference comidas;

  @override
  void initState() {
    super.initState();

    comidas = FirebaseFirestore.instance.collection('comidas');
  }

  Widget itemLista(item) {
    String nome = item.data()['nome'];
    String preco = item.data()['preco'];

    return ListTile(
      title: Row(
        children: [
          SizedBox(
            width: 180,
            child: Text(nome, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(width: 160),
          Text('R\$ $preco', style: TextStyle(fontSize: 18)),
        ],
      ),
      /*title: Text(nome, style: const TextStyle(fontSize: 30)),*/
      trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            //
            // APAGAR UM DOCUMENTO DA COLEÇÃO
            //
            comidas.doc(item.id).delete();
          }),
      onTap: () {
        Navigator.pushNamed(context, 'inserir', arguments: item.id);
      },
    );
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
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, 't1');
              },
            )
          ]),
      body: StreamBuilder<QuerySnapshot>(

          //fonte de dados (coleção)
          stream: comidas.snapshots(),

          //exibir os dados retornados
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                    child: Text('Não foi possível conectar ao Firebase'));

              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());

              //dados recebidos
              default:
                final dados = snapshot.requireData;
                return ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.redAccent.shade400,
                          thickness: 0.3,
                          height: 0.5
                    ),
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      return itemLista(dados.docs[index]);
                    });
            }
          }),
      backgroundColor: Colors.black45,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.redAccent.shade700,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'inserir');
        },
      ),

      /*Container(
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
      ),*/
    );
  }
}
