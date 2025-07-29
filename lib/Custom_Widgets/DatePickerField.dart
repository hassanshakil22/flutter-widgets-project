import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widgets/Custom_Widgets/customTextFields.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DatePickerField extends StatefulWidget {
  DatePickerField({
    super.key,
    required this.hint,
    required this.controller,
    this.validator,
    this.setAge,
    this.required = false,
  });
  String? Function(String?)? validator;
  String hint;
  TextEditingController controller;
  bool? setAge;
  bool required;

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  bool isDatePicked = false;
  void setText(String value) {
    setState(() {
      widget.controller.text = value;
      isDatePicked = true;
    });
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now(); // Initial date value

    final DateTime? picked = await showDatePicker(
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            // useMaterial3: true,
            appBarTheme: const AppBarTheme(),
            scaffoldBackgroundColor: Colors.white,
            buttonTheme: ButtonThemeData(
              colorScheme: const ColorScheme.light(
                primary: AppColors.primaryColor,
              ).copyWith(secondary: AppColors.primaryColor),
              buttonColor: AppColors.primaryColor,
            ),
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                color: AppColors.primaryColor, // Day text color
              ),
              bodyMedium: TextStyle(
                color: AppColors.primaryColor, // Year text color
              ),
            ),
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
            ).copyWith(secondary: AppColors.primaryColor),
          ),
          child: child!,
        );
      },
      context: context,

      initialDate: selectedDate,
      firstDate: DateTime(2000), // Adjust the range as needed
      lastDate: DateTime(2101), // Adjust the range as needed

      fieldHintText: widget.hint,
    );

    if (picked != null && picked != selectedDate) {
      // Date selected, do something with it
      selectedDate = picked;

      setText(DateFormat('yyyy-MM-dd').format(selectedDate));
      if (widget.setAge != null) {
        // calculateAge(DateTime val) {
        //   print("calling Calculate Age");
        //   final birthDate = val;
        //   final today = DateTime.now();
        //   int currentAge = today.year - birthDate.year;
        //   if (today.month < birthDate.month ||
        //       (today.month == birthDate.month && today.day < birthDate.day)) {
        //     currentAge--;
        //   }
        //   age = currentAge.toString();
        //   print(age);
        //   notifyListeners();
        // }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      required: widget.required,
      validator: (value) {
        if (!widget.required) return null;
        // Use custom validator if provided
        if (widget.validator != null) return widget.validator!(value);
        // Default required validator
        return (value == null || value.trim().isEmpty)
            ? 'Please Select ${widget.hint}'
            : null;
      },

      readOnly: true,
      onTap: () => selectDate(context),
      textController: widget.controller,
      hint: widget.hint,
      suffixIcon: Icons.calendar_month,
    );
  }
}
