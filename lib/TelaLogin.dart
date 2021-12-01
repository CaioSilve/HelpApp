import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black54,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
                height: 45,
            ),
            Center(
              child: 
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 90,
                child: Image.asset("logo.jpg", scale: 3.2,),),
            ),
            SizedBox(
                height: 15,
            ),
            Expanded(
                child: Column(
              children: [
                TextField(
                  controller: txtEmail,
                  style: TextStyle(decorationColor: Colors.white, color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent.shade400)
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  controller: txtSenha,
                  style: TextStyle(decorationColor: Colors.white, color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent.shade400)
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.redAccent.shade400,
                  child: ElevatedButton(
                    child: const Text('Logar'),
                    onPressed: () {
                      setState(() {
                        login(txtEmail.text, txtSenha.text);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent.shade400,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 18),
                        textStyle: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
  void login(email, senha){
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, password: senha).then((resultado){
        Navigator.pushReplacementNamed(context, 't2');
       /* Navigator.pushReplacementNamed(context, 't2', arguments: resultado.user!.uid);*/
    }).catchError((erro){
      var mensagem = '';
      if (erro.code == 'user-not-found'){mensagem = 'ERRO: Usuário não encontrado.';
      }else if (erro.code == 'wrong-password'){mensagem = 'ERRO: Senha incorreta.';
      }else if (erro.code == 'invalid-email'){mensagem = 'ERRO: Email inválido.';
      }else{ mensagem = 'ERRO: ${erro.message}';}
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$mensagem'), duration: Duration(seconds: 2)
          )
        );
    });
  }
}


