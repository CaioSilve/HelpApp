import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TelaInserirAlimen extends StatefulWidget {
  const TelaInserirAlimen({Key? key}) : super(key: key);

  @override
  _TelaInserirAlimenState createState() => _TelaInserirAlimenState();
}

class _TelaInserirAlimenState extends State<TelaInserirAlimen> {
  var txtNome = TextEditingController();
  var txtPreco = TextEditingController();

  //RETORNAR UM DOCUMENTO A PARTIR DO ID
  getDocumentById(id) async {
    await FirebaseFirestore.instance
        .collection('comidas')
        .doc(id)
        .get()
        .then((doc) {
      txtNome.text = doc.get('nome');
      txtPreco.text = doc.get('preco');
    });
  }

  @override
  Widget build(BuildContext context) {
    //RECUPERAR O ID DA COMIDA

    var id = ModalRoute.of(context)?.settings.arguments;
    if (id != null) {
      if (txtNome.text.isEmpty && txtPreco.text.isEmpty) {
        getDocumentById(id);
      }
    }

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.redAccent.shade700,
          automaticallyImplyLeading: false,
          title: new Text("Inserir Comida",
              style: new TextStyle(color: Colors.white))),
      backgroundColor: Colors.black45,
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(children: [
          TextField(
            controller: txtNome,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300),
            decoration: const InputDecoration(
              labelText: 'Nome',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: txtPreco,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300),
            decoration: const InputDecoration(
              labelText: 'Preço',
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: ElevatedButton(
                  child: const Text('Salvar'),
                  onPressed: () {
                    setState(() {
                      if (id == null) {
                        //
                        //ADICIONAR DOCUIMENTO NO FIRESTORE
                        FirebaseFirestore.instance.collection('comidas').add(
                            {'nome': txtNome.text, 'preco': txtPreco.text});
                      } else {
                        FirebaseFirestore.instance
                            .collection('comidas')
                            .doc(id.toString())
                            .set(
                                {'nome': txtNome.text, 'preco': txtPreco.text});
                      }

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Adicionado/Salvo com sucesso'),
                      ));

                      Navigator.pop(context);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent.shade400,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 14),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ),

              ),
              Container(
                width: 150,
                child: ElevatedButton(
                  child: const Text('Cancelar'),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent.shade400,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 14),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
