import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'novoRegistro_screen.dart';

class ConsultasScreen extends StatefulWidget {
  const ConsultasScreen({Key? key}) : super(key: key);

  @override
  _ConsultasScreenState createState() => _ConsultasScreenState();
}

class _ConsultasScreenState extends State<ConsultasScreen> {
  final formKey = GlobalKey<FormState>();

  var modelo = ModeloConsulta();
  DateTime date = DateTime.now();
  TextEditingController _datecontroller = new TextEditingController();

  var myFormat = DateFormat('dd/MM/yyyy');
  String hintData = 'Data da consulta';

  TimeOfDay? time;

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

  String validacaoHorario = 'a';

  String getTextTime() {
    if (time == null) {
      return 'Horário da Consulta';
    } else {
      final hours = time!.hour.toString().padLeft(2, '0');
      final minutes = time!.minute.toString().padLeft(2, '0');
      modelo.horarioConsulta = '$hours:$minutes';
      validacaoHorario = '$hours:$minutes';
      return '$hours:$minutes';
    }
  }

  Future<void> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );
    if (newTime == null) return;
    setState(() {
      time = newTime;
    });
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
        modelo.dataConsulta = '${myFormat.format(date)}';
      });
  }

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.2;
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo registro de consulta'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextField(
                border: OutlineInputBorder(),
                label: 'Nome do profissional',
                icon: Icons.person,
                hint: 'Digita o nome do profissional...',
                validator: (text) => text == null || text.isEmpty
                    ? 'Esse campo deve ser preenchido!'
                    : null,
                onSaved: (text) =>
                    modelo = modelo.copyWith(nomeProfissional: text),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    width: halfMediaWidth,
                    child: InkWell(
                      onTap: () => _selectDate(context),
                      child: IgnorePointer(
                        child: TextFormField(
                          validator: (dataConsulta) =>
                              modelo.dataConsulta != '${myFormat.format(date)}'
                                  ? 'Esse campo deve ser preenchido!'
                                  : null,
                          onSaved: (dataConsulta) {
                            debugPrint(dataConsulta.toString());
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
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: halfMediaWidth,
                    alignment: Alignment.topCenter,
                    child: InkWell(
                      onTap: () => pickTime(context),
                      child: IgnorePointer(
                        child: TextFormField(
                          validator: (horarioConsulta) =>
                              modelo.horarioConsulta != validacaoHorario
                                  ? 'Esse campo deve ser preenchido!'
                                  : null,
                          onSaved: (horarioConsulta) {
                            debugPrint(horarioConsulta.toString());
                          },
                          controller: _datecontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.access_time_outlined),
                            hintText: (getTextTime()),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              CustomTextField(
                border: OutlineInputBorder(),
                label: 'Local da consulta',
                icon: Icons.local_hospital,
                hint: 'Digite o local da consulta...',
                validator: (text) => text == null || text.isEmpty
                    ? 'Esse campo deve ser preenchido!'
                    : null,
                onSaved: (text) =>
                    modelo = modelo.copyWith(localConsulta: text),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLines: 5,
                  validator: (text) => text == null || text.isEmpty
                      ? 'Esse campo deve ser preenchido!'
                      : null,
                  onSaved: (text) =>
                      modelo = modelo.copyWith(outrasInformacoes: text),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: Icon(
                        Icons.more,
                      ),
                    ),
                    hintText: 'Digite informações adicionais...',
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
                          print(modelo.nomeProfissional);
                          print(modelo.localConsulta);
                          print(modelo.dataConsulta);
                          print(modelo.horarioConsulta);
                          print(modelo.outrasInformacoes);
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
                          hintData = 'Selecione a data da consulta';
                          date = DateTime.now();
                          time = null;
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
  final InputBorder border;
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
    required this.border,
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
        border: border,
        prefixIcon: icon == null ? null : Icon(icon),
        suffixIcon: suffix,
      ),
    );
  }
}

class ModeloConsulta {
  final String nomeProfissional;
  final String localConsulta;
  String dataConsulta;
  String horarioConsulta;
  final String outrasInformacoes;

  ModeloConsulta({
    this.nomeProfissional = '',
    this.localConsulta = '',
    this.dataConsulta = '',
    this.horarioConsulta = '',
    this.outrasInformacoes = '',
  });

  ModeloConsulta copyWith({
    String? nomeProfissional,
    String? localConsulta,
    String? dataConsulta,
    String? horarioConsulta,
    String? outrasInformacoes,
  }) {
    return ModeloConsulta(
      nomeProfissional: nomeProfissional ?? this.nomeProfissional,
      localConsulta: localConsulta ?? this.localConsulta,
      dataConsulta: dataConsulta ?? this.dataConsulta,
      horarioConsulta: horarioConsulta ?? this.horarioConsulta,
      outrasInformacoes: outrasInformacoes ?? this.outrasInformacoes,
    );
  }
}
