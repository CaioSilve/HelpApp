import 'package:app07_01/WidgetVenda.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  late CollectionReference produtos;

  @override
  void initState() {
    super.initState();

    produtos = FirebaseFirestore.instance.collection('produtos');
  }

  Widget produto(item) {
    String nome = item.data()['nome'];
    String preco = item.data()['preco'];
    String foto = "foto.png";

    /*return ListTile(
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
      trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            //
            // APAGAR UM DOCUMENTO DA COLEÇÃO
            //
            produtos.doc(item.id).delete();
      }),
      onTap: () {
        Navigator.pushNamed(context, 'inserirProd', arguments: item.id);
      },
    );
  }*/

    return Container(
      //margin: EdgeInsets.all(5),
      margin: EdgeInsets.only(left: 5),
      //margin: EdgeInsets.fromLTRB(30, 15, 30, 15),
      padding: EdgeInsets.only(top: 5),

      width: 150,
      height: 70,

      decoration: BoxDecoration(
          //color: Colors.purple.shade600,
          color: Colors.grey.shade700,
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          )),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: Text(
                  nome,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(width: 5),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    produtos.doc(item.id).delete();
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.wifi_protected_setup),
                onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, 'inserirProd',
                        arguments: item.id);
                  });
                },
              ),
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            'R\$ $preco',
            style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.white70),
          ),

          //SizedBox(height: 30),
          /*Padding(padding: EdgeInsets.only(top: 30),
          child: 
            Image.asset(this.foto),
        ),*/
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.asset(foto),
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
                height: 220,
                child: StreamBuilder<QuerySnapshot>(

                    //fonte de dados (coleção)
                    stream: produtos.snapshots(),

                    //exibir os dados retornados
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return const Center(
                              child: Text(
                                  'Não foi possível conectar ao Firebase'));

                        case ConnectionState.waiting:
                          return const Center(
                              child: CircularProgressIndicator());

                        //dados recebidos
                        default:
                          final dados = snapshot.requireData;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: dados.size,
                              itemBuilder: (context, index) {
                                return produto(dados.docs[index]);
                              });
                      }
                    }),

                /*ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    WidgetVenda("Panela", "RS 70.000", "foto.png"),
                    WidgetVenda("Fogão", "RS 800", "foto.png"),
                    WidgetVenda("Avião", "RS 1.500.000", "foto.png"),
                  ],
                ),*/
              )
            ],
          )),

      /*StreamBuilder<QuerySnapshot>(

          //fonte de dados (coleção)
          stream: produtos.snapshots(),

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
                return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      return produto(dados.docs[index]);
                    });
            }
          }),*/
      backgroundColor: Colors.black45,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.redAccent.shade700,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'inserirProd');
        },
      ),
    );
  }
}
