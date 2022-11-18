import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, Function() delete) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancelar"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    onPressed: delete,
    child: const Text("Eliminar"),
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    icon: const Icon(Icons.dangerous, color: Colors.red),
    title: const Text("Eliminar fecha agendada"),
    content: const Text("¿Esta seguro de eliminar la fecha seleccionada?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
