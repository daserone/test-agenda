// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:test/data/models/field_model.dart';
import 'package:test/data/models/schedule_model.dart';
import 'package:test/domain/provider/field_provider.dart';
import 'package:test/domain/provider/schedule_provider.dart';
import 'package:test/domain/provider/weather_provider.dart';
import 'package:test/presentation/new_schedule/widgets/date_selector.dart';
import 'package:test/presentation/new_schedule/widgets/field_selector.dart';
import 'package:test/presentation/new_schedule/widgets/text_input.dart';

class NewScheduleView extends StatefulWidget {
  const NewScheduleView({Key? key}) : super(key: key);

  @override
  State<NewScheduleView> createState() => _NewScheduleViewState();
}

class _NewScheduleViewState extends State<NewScheduleView> {
  TextEditingController _username = TextEditingController();
  TextEditingController _fieldName = TextEditingController();
  late TextEditingController _rainProb;
  TextEditingController _date = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _rainProb = TextEditingController();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _rainProb.text = Provider.of<WeatherProvider>(
      context,
      listen: true, // Be sure to listen
    ).rainProb;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _username.dispose();
    _fieldName.dispose();
    _rainProb.dispose();
    _date.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const FieldSelector(),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFieldInput(
                        ctl: _username,
                        hint: 'Ingrese nombre de usuario',
                        label: 'Nombre de usuario',
                        isDisabled: false,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      dateSelector(context, _date, 'Ingrese fecha'),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFieldInput(
                        ctl: _rainProb,
                        hint: 'Clima del dia seleccionado',
                        label: 'Clima',
                        isDisabled: true,
                      ),
                    ],
                  ),
                ),
              ),
              // Consumer<WeatherProvider>(
              //     builder: ((context, value, child) => TextFieldInput(
              //         ctl: _rainProb, hint: 'Ingrese probabilidad de lluvia'))),
              Center(
                child: Consumer<ScheduleProvider>(
                  builder: (context, scheduleService, child) =>
                      ElevatedButton.icon(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final fieldProvider = Provider.of<FieldProvider>(
                                  context,
                                  listen: false);
                              final date = DateTime.parse(_date.text);
                              if (fieldProvider.selectedField.id != null) {
                                if (!scheduleService.checkIfRepeated(
                                    fieldProvider.selectedField.id!, date)) {
                                  final weatherProvider =
                                      Provider.of<WeatherProvider>(context,
                                          listen: false);

                                  scheduleService.createItem(ScheduleModel(
                                      fieldName:
                                          fieldProvider.selectedField.name!,
                                      fieldId: fieldProvider.selectedField.id!,
                                      username: _username.text,
                                      rainProbability: _rainProb.text,
                                      date: date));
                                  fieldProvider.selectField(FieldsModels());
                                  weatherProvider.setRaingProb('');
                                  Navigator.of(context).pop();
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'Ya hay tres agendas para esa fecha',
                                      backgroundColor: Colors.red);
                                }
                              }
                            }
                          },
                          icon: const Icon(Icons.add),
                          label: const Text('Agendar')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
