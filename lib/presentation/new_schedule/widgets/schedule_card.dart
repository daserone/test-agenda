import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test/data/models/schedule_model.dart';
import 'package:test/domain/provider/schedule_provider.dart';
import 'package:test/presentation/new_schedule/widgets/card_row.dart';
import 'package:test/presentation/new_schedule/widgets/delete_dialog.dart';
import 'package:test/shared/utils/capitalize.dart';

class ScheduleCard extends StatelessWidget {
  final ScheduleModel schedule;
  const ScheduleCard({Key? key, required this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es_ES', null);

    final DateFormat formatter = DateFormat.yMMMMEEEEd('es_ES');
    final String formatted = formatter.format(schedule.date);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      elevation: 3,
      child: SizedBox(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      schedule.fieldName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    IconButton(
                        onPressed: () => showAlertDialog(context, () {
                              final scheduleProvider =
                                  context.read<ScheduleProvider>();
                              scheduleProvider.deleteItem(schedule);
                              Navigator.pop(context);
                            }),
                        icon: const Icon(Icons.delete))
                  ],
                ),
                textRow(context, 'Fecha: ', capitalizeAll(formatted)),
                textRow(context, 'Usuario: ', schedule.username),
                textRow(context, 'Clima: ',
                    capitalizeAll(schedule.rainProbability)),
              ],
            ),
          )),
    );
  }
}
