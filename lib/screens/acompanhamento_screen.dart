import 'package:app_helptmo/screens/novoRegistro_screen.dart';
import 'package:app_helptmo/screens/visualizarRegistros_screen.dart';
import 'package:flutter/material.dart';

class AcompanhamentoScreen extends StatefulWidget {
  const AcompanhamentoScreen({Key? key}) : super(key: key);

  @override
  _AcompanhamentoScreenState createState() => _AcompanhamentoScreenState();
}

class _AcompanhamentoScreenState extends State<AcompanhamentoScreen> {
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
                "Acompanhamento",
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
                            builder: (context) => VisualizarRegistrosScreen(),
                          ),
                        );
                      },
                      label: Text(
                        "Visualizar Registros",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: topColor,
                        fixedSize: Size(240, 80),
                      ),
                      icon: const Icon(Icons.remove_red_eye_outlined),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NovoRegistroScreen(),
                          ),
                        );
                      },
                      label: Text(
                        "Novo Registro",
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
