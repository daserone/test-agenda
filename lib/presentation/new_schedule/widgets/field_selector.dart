import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/data/models/field_model.dart';
import 'package:test/domain/provider/field_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class FieldSelector extends StatelessWidget {
  const FieldSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FieldProvider>(builder: ((context, fieldProvider, child) {
      return SizedBox(
        height: 70,
        child: DropdownButtonFormField(
          decoration: const InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
            hintText: 'Seleccione un campo',
            labelText: 'Campo',
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 5.0),
            ),
          ),
          isExpanded: true,
          value: fieldProvider.fieldList
              .firstWhereOrNull((e) => e.id == fieldProvider.selectedField.id),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(
            color: Colors.black,
          ),
          // underline: Container(
          //   height: 2,
          //   color: Color.fromARGB(255, 0, 30, 97),
          // ),
          onChanged: (newValue) {
            fieldProvider.selectField(newValue!);
          },
          validator: (value) {
            return value == null ? 'Seleccione un campo' : null;
          },
          items: fieldProvider.fieldList.map((field) {
            return DropdownMenuItem<FieldsModels>(
              value: field,
              child: Text(field.name!),
            );
          }).toList(),
        ),
      );
    }));
  }
}
