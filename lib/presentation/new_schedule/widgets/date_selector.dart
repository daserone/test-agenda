import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test/domain/provider/weather_provider.dart';
import 'package:test/theme/color_constants.dart';

@override
Widget dateSelector(
    BuildContext context, TextEditingController controller, String hint) {
  return SizedBox(
    height: 70,
    child: TextFormField(
      readOnly: true,
      controller: controller,
      autofocus: false,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        hintText: 'Seleccione fecha',
        labelText: 'Fecha',
        border: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 5.0),
        ),
        suffixIcon: IconButton(
          iconSize: 16,
          icon: const Icon(Icons.calendar_today),
          onPressed: () async {
            var picker = await showDatePicker(
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: ColorScheme.fromSwatch()
                          .copyWith(primary: ColorConstants.primary),
                      dialogBackgroundColor:
                          ColorConstants.lightScaffoldBackgroundColor,
                    ),
                    child: child!,
                  );
                },
                locale: const Locale("es", "ES"),
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900, DateTime.now().month),
                lastDate: DateTime(2101));

            if (picker != null) {
              final weatherProvider =
                  Provider.of<WeatherProvider>(context, listen: false);
              weatherProvider.getWeather(context);

              final DateFormat formatter = DateFormat('yyyy-MM-dd');
              final String formatted = formatter.format(picker);

              controller.text = formatted;
            }
          },
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Seleccione una fecha";
        }
        return null;
      },
    ),
  );
}
