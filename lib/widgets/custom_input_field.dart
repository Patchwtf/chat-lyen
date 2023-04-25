import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField(
      {super.key,
      this.hintText,
      this.labelText,
      this.helperText,
      this.icon,
      this.suffixIcon,
      this.keyBoardType,
      this.isPassword = false,
      required this.formProperty,
      required this.formValues,
      this.validator});

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyBoardType;
  final bool isPassword;

  final String formProperty;
  final Map<String, String> formValues;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    String themeID = "Color(0xffffffff)";
    String currentScaffoldColor =
        Theme.of(context).scaffoldBackgroundColor.toString();
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            style: TextStyle(
                color: currentScaffoldColor == themeID
                    ? Colors.black
                    : Colors.white),
            initialValue: '',
            keyboardType: keyBoardType,
            obscureText: isPassword,
            onChanged: (value) => formValues[formProperty] = value,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: hintText,
              labelText: labelText,
              helperText: helperText,
              suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
              icon: icon == null ? null : Icon(icon),
            ),
          ),
        ),
      ],
    );
  }
}

class DateFormField extends StatelessWidget {
  const DateFormField({
    super.key,
    required this.dateTextController,
    required this.formValues,
  });

  final TextEditingController dateTextController;
  final Map<String, String> formValues;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dateTextController,
      keyboardType: TextInputType.datetime,
      validator: (value) {
        int intValue;
        try {
          intValue = DateTime.now()
              .compareTo(DateTime.parse(value!.replaceAll('/', '-')));
        } catch (e) {
          intValue = -1;
        }

        if (value == null) {
          return 'Esta campo no puede estar vacio';
        } else if (intValue > 0) {
          return 'La fecha deberá ser posterior al dia de hoy';
        } else {
          return null;
        }
      },
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(), //get today's date
            firstDate: DateTime(
                2000), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101));
        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy/MM/dd').format(pickedDate);
          formValues['start-date'] = formattedDate;
          dateTextController.text = formattedDate;
        }
      },
      decoration: const InputDecoration(
          labelText: "Fecha de inicio", icon: Icon(Icons.date_range)),
    );
  }
}
