import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'novoRegistro_screen.dart';

class SintomasScreen extends StatefulWidget {
  const SintomasScreen({Key? key}) : super(key: key);

  @override
  _SintomasScreenState createState() => _SintomasScreenState();
}

class _SintomasScreenState extends State<SintomasScreen> {
  final formKey = GlobalKey<FormState>();
  double _currentSliderValue = 1;
  var modelo = ModeloSintomas();
  DateTime date = DateTime.now();
  DateTime date2 = DateTime.now();
  TextEditingController _datecontroller = new TextEditingController();
  TextEditingController _datecontroller2 = new TextEditingController();

  var myFormat = DateFormat('dd/MM/yyyy');
  String hintData = 'Selecione a data de início';
  String hintData2 = 'Selecione a data de fim';

  showAlertDialog1(BuildContext context) {
    AlertDialog alerta = AlertDialog(
      title: Text("Registro realizado com sucesso!"),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2222));
    if (picked != null && picked != date)
      setState(() {
        date = picked;
        hintData = '${myFormat.format(date)}';
        modelo.dataInicio = '${myFormat.format(date)}';
      });
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked2 = await showDatePicker(
        context: context,
        initialDate: date2,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2222));
    if (picked2 != null && picked2 != date2)
      setState(() {
        date2 = picked2;
        hintData2 = '${myFormat.format(date2)}';
        modelo.dataFim = '${myFormat.format(date2)}';
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo registro de sintoma'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextField(
                label: 'Identificação do Sintoma',
                icon: Icons.search,
                hint: 'Qual é o sintoma?...',
                validator: (text) => text == null || text.isEmpty
                    ? 'Esse campo deve ser preenchido!'
                    : null,
                onSaved: (text) => modelo = modelo.copyWith(sintomas: text),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 485,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Intensidade do sintoma',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Slider.adaptive(
                value: _currentSliderValue,
                max: 5,
                divisions: 5,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                    modelo.intensidade = value;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () => _selectDate(context),
                child: IgnorePointer(
                  child: TextFormField(
                    validator: (hintData) =>
                        modelo.dataInicio != '${myFormat.format(date)}'
                            ? 'Esse campo deve ser preenchido!'
                            : null,
                    onSaved: (dataInicio) {
                      debugPrint(dataInicio.toString());
                    },
                    controller: _datecontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today_rounded),
                      hintText: (hintData),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () => _selectDate2(context),
                child: IgnorePointer(
                  child: TextFormField(
                    validator: (dataFim) =>
                        modelo.dataFim != '${myFormat.format(date2)}'
                            ? 'Esse campo deve ser preenchido!'
                            : null,
                    onSaved: (dataFim) {
                      debugPrint(dataFim.toString());
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _datecontroller2,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today_rounded),
                      hintText: (hintData2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(fixedSize: Size(200, 70)),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NovoRegistroScreen(),
                            ),
                          );
                          showAlertDialog1(context);
                          print(modelo.sintomas);
                          print(modelo.intensidade);
                          print(modelo.dataInicio);
                          print(modelo.dataFim);
                        }
                      },
                      icon: Icon(Icons.save_alt),
                      label: Text('Registrar'),
                    ),
                    Padding(padding: EdgeInsets.all(15)),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(fixedSize: Size(200, 70)),
                      onPressed: () {
                        setState(() {
                          hintData = 'Selecione a data de início';
                          hintData2 = 'Selecione a data de fim';
                          date = DateTime.now();
                          date2 = DateTime.now();
                        });
                        formKey.currentState?.reset();
                      },
                      icon: Icon(Icons.delete),
                      label: Text('Limpar'),
                    ),
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

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData? icon;
  final Widget? suffix;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;

  const CustomTextField({
    Key? key,
    required this.label,
    this.icon,
    this.hint,
    this.validator,
    this.onSaved,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(),
        prefixIcon: icon == null ? null : Icon(icon),
        suffixIcon: suffix,
      ),
    );
  }
}

class ModeloSintomas {
  final String sintomas;
  double intensidade;
  String dataInicio;
  String dataFim;

  ModeloSintomas({
    this.sintomas = '',
    this.intensidade = 0,
    this.dataInicio = '',
    this.dataFim = '',
  });

  ModeloSintomas copyWith({
    String? sintomas,
    double? intensidade,
    String? dataInicio,
    String? dataFim,
  }) {
    return ModeloSintomas(
      sintomas: sintomas ?? this.sintomas,
      intensidade: intensidade ?? this.intensidade,
      dataInicio: dataInicio ?? this.dataInicio,
      dataFim: dataFim ?? this.dataFim,
    );
  }
}
