import 'package:flutter/material.dart';


class TelaHome extends StatefulWidget {
  const TelaHome({Key? key}) : super(key: key);

  @override
  _TelaHomeState createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Bem-vindo'),
          backgroundColor: Colors.redAccent.shade700,
          automaticallyImplyLeading: false,
        ),
        body: Container(
            color: Colors.black45,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    child: Container(
                        width: 450,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.yellow.shade700,
                            image: DecorationImage(
                              image: AssetImage("fundoAlime.png"),
                            )),
                        child: Center(
                          child: Text(
                            'Alimentação',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )),
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, '');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.yellow.shade700,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    child: Container(
                        width: 450,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            image: DecorationImage(
                              image: AssetImage("fundoServico.png"),
                            )),
                        child: Center(
                          child: Text(
                            'Serviços',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )),
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, '');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade700,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    child: Container(
                        width: 450,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.green.shade700,
                            image: DecorationImage(
                              image: AssetImage("fundoMarke.png"),
                            )),
                        child: Center(
                          child: Text(
                            'Marketing',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )),
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, '');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade700,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    child: Container(
                        width: 450,
                        height: 100,
                        decoration: BoxDecoration(
                            //color: Colors.yellow.shade700,
                            image: DecorationImage(
                              image: AssetImage("fundoSobre.png"),
                            )),
                        child: Center(
                          child: Text(
                            'Sobre',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )),
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, 'ts');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow.shade700,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )));
  }
}
