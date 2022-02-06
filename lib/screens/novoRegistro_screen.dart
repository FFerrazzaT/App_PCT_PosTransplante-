import 'package:app_helptmo/screens/consultas_screen.dart';
import 'package:app_helptmo/screens/medicamentos_screen.dart';
import 'package:app_helptmo/screens/outrasInformacoes_screen.dart';
import 'package:app_helptmo/screens/sintomas_screen.dart';
import 'package:flutter/material.dart';

class NovoRegistroScreen extends StatefulWidget {
  const NovoRegistroScreen({Key? key}) : super(key: key);

  @override
  _NovoRegistroScreenState createState() => _NovoRegistroScreenState();
}

class _NovoRegistroScreenState extends State<NovoRegistroScreen> {
  Color topColor = Color.fromARGB(255, 42, 74, 117);
  Color bottomColor = Color.fromARGB(255, 28, 218, 195);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [topColor, bottomColor]),
        ),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 50,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 15,
                ),
              ),
              Text(
                "Novo Registro",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(bottom: 40)),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 15,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MedicamentosScreen(),
                          ),
                        );
                      },
                      label: Text(
                        "Medicamentos",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: topColor,
                        fixedSize: Size(240, 80),
                      ),
                      icon: const Icon(Icons.add),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SintomasScreen(),
                          ),
                        );
                      },
                      label: Text(
                        "Sintomas",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: topColor,
                        fixedSize: Size(240, 80),
                      ),
                      icon: const Icon(Icons.add),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConsultasScreen(),
                          ),
                        );
                      },
                      label: Text(
                        "Consultas",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: topColor,
                        fixedSize: Size(240, 80),
                      ),
                      icon: const Icon(Icons.add),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OutrasInformacoesScreen(),
                          ),
                        );
                      },
                      label: Text(
                        "Outras Informações",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: topColor,
                        fixedSize: Size(240, 80),
                      ),
                      icon: const Icon(Icons.add),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
