import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldInput extends StatefulWidget {
  TextEditingController ctl;
  String hint;
  bool isDisabled;
  String label;

  TextFieldInput(
      {Key? key,
      required this.ctl,
      required this.hint,
      required this.label,
      required this.isDisabled})
      : super(key: key);

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        readOnly: widget.isDisabled,
        controller: widget.ctl,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          labelText: widget.label,
          hintText: widget.hint,
          border: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 5.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Campo ${widget.label} es requerido';
          }

          return null;
        },
      ),
    );
  }
}
