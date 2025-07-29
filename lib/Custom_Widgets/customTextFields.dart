import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widgets/app_setup/core/extensions/sizes_extensions.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController textController;
  String hint;
  IconData? prefixIcon;
  IconData? suffixIcon;
  TextInputType? type;
  int? maxLines;
  bool? disable;
  int? maxLength;
  double? width;
  double? height;
  FocusNode? focus;
  List<FocusNode>? focusList;
  ValueChanged<String>? onTextChanged;
  Function()? onTap;
  Widget? prefix;
  Widget? suffix;
  Color? prefixIconColor;
  Color? suffixIconColor;
  String? Function(String?)? validator;
  Function(PointerDownEvent)? onTapOutside;
  bool readOnly;
  bool required;

  CustomTextField({
    super.key,
    required this.textController,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.type,
    this.maxLines,
    this.disable,
    this.maxLength,
    this.focus,
    this.onTap,
    this.width,
    this.prefix,
    this.suffix,
    this.validator,
    this.suffixIconColor,
    this.prefixIconColor,
    this.onTapOutside,
    this.onTextChanged,
    this.height,
    this.readOnly = false,
    this.required = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Color focusColor = AppColors.textFieldColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? context.wid,
      height: widget.height ?? 60.h,
      decoration: BoxDecoration(
        color:
            // widget.focus?.hasFocus ?? false
            //     ? AppColors.primaryColor.withOpacity(0.1)
            //     :
            AppColors.textFieldColor,
        borderRadius: BorderRadius.circular(10),
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.shadowColor,
        //     blurRadius: 10,
        //     spreadRadius: 1,
        //     offset: Offset(0, 5), // Shadow position
        //   ),
        // ],
      ),
      child: TextFormField(
        readOnly: widget.readOnly,
        validator: (value) {
          if (!widget.required) return null;

          // Use custom validator if provided
          if (widget.validator != null) return widget.validator!(value);

          // Default required validator
          return (value == null || value.trim().isEmpty)
              ? 'Please Enter ${widget.hint}'
              : null;
        },
        onTap: widget.onTap,
        onTapOutside: widget.onTapOutside,
        focusNode: widget.focus,
        maxLines: widget.maxLines ?? 1,
        obscureText: widget.type == TextInputType.visiblePassword
            ? true
            : false,
        controller: widget.textController,
        enabled: widget.disable ?? widget.disable,
        maxLength: widget.maxLength,
        keyboardType: widget.type ?? TextInputType.text,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          fontSize: 16.sp,
          color: AppColors.textBlackColor,
          fontWeight: FontWeight.w600,
        ),
        onChanged: (text) {
          if (widget.onTextChanged != null) {
            widget.onTextChanged!(text);
          }
        },
        decoration: InputDecoration(
          isDense: true,

          hintText: widget.required ? "${widget.hint} (required)" : widget.hint,
          hintStyle: TextStyle(
            fontFamily: "Gellix",
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            height: 1.2125,
            color: AppColors.textGreyColor,
          ),
          prefix: widget.prefix,
          suffix: widget.suffix,
          prefixIconColor: widget.textController.text.isNotEmpty
              ? Colors.black
              : const Color(0xffa8aaac),
          suffixIconColor: widget.suffixIconColor,
          prefixIcon: widget.prefixIcon == null
              ? null
              : Icon(
                  widget.prefixIcon,
                  size: 20.h,
                  color: widget.focus?.hasFocus ?? false
                      ? AppColors.primaryColor
                      : widget.textController.text.isNotEmpty
                      ? Colors.black
                      : const Color(0xffa8aaac),
                ),
          suffixIcon: widget.suffixIcon == null
              ? null
              : Icon(
                  widget.suffixIcon,
                  size: 20.h,
                  color: widget.focus?.hasFocus ?? false
                      ? AppColors.primaryColor
                      : widget.textController.text.isNotEmpty
                      ? Colors.black
                      : const Color(0xffa8aaac),
                ),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.lightPrimaryColor,
              width: 1,
            ),
          ),
          contentPadding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 20,
            bottom: 20,
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  PasswordTextField({
    super.key,
    required this.controller,
    required this.focus,
    required this.isObscureText,
    required this.hint,
    this.onTap,
    this.onTextChanged,
    this.validator,
  });

  TextEditingController controller;
  FocusNode focus;
  bool isObscureText;
  String hint;
  ValueChanged<String>? onTextChanged;
  Function()? onTap;
  String? Function(String?)? validator;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validator: widget.validator,
      onTap: widget.onTap,
      onTextChanged: widget.onTextChanged,
      focus: widget.focus,
      type: widget.isObscureText
          ? TextInputType.visiblePassword
          : TextInputType.text,
      prefixIcon: Icons.lock,
      suffix: GestureDetector(
        onTap: () {
          widget.isObscureText = !widget.isObscureText;
          setState(() {});
        },
        child: widget.isObscureText
            ? Icon(
                Icons.password_rounded,
                color: widget.focus.hasFocus
                    ? AppColors.primaryColor
                    : widget.controller.text.isNotEmpty
                    ? Colors.black
                    : const Color(0xffa8aaac),
              )
            : Icon(
                Icons.remove_red_eye,
                color: widget.focus.hasFocus ?? false
                    ? AppColors.primaryColor
                    : widget.controller.text.isNotEmpty
                    ? Colors.black
                    : const Color(0xffa8aaac),
              ),
      ),
      textController: widget.controller,
      hint: widget.hint,
    );
  }
}

class CustomFieldDropDown extends StatefulWidget {
  CustomFieldDropDown({
    super.key,
    this.hint,
    required this.focus,
    required this.selectedValue,
    required this.dropdownItems,
    this.onTap,
    required this.onChanged,
    this.width,
  });

  String? hint;
  String selectedValue;
  final FocusNode focus;
  List<String>? dropdownItems;
  final Function()? onTap;
  final Function(String value) onChanged;
  final double? width;
  @override
  State<CustomFieldDropDown> createState() => _CustomFieldDropDownState();
}

class _CustomFieldDropDownState extends State<CustomFieldDropDown> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(20),

        child: Container(
          height: 60.h,
          width: widget.width ?? double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.textFieldColor),
            color: AppColors.textFieldColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(0, 5), // Shadow position
              ),
            ],
          ),
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              focusNode: widget.focus,
              buttonStyleData: ButtonStyleData(
                overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              hint: Text(
                widget.hint ?? "",
                style: TextStyle(
                  fontFamily: "Gellix",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.2125,
                  color: AppColors.textGreyColor,
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                offset: const Offset(170, 0),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: WidgetStateProperty.all<double>(6),
                  thumbVisibility: WidgetStateProperty.all<bool>(true),
                ),
              ),
              value: widget.selectedValue,
              items: widget.dropdownItems?.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                widget.onChanged(newValue!);
                setState(() {
                  widget.selectedValue = newValue;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ReadOnlyContainer extends StatelessWidget {
  ReadOnlyContainer({super.key, this.width, this.text});
  double? width;
  String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.wid,
      height: 60.h,
      decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        borderRadius: BorderRadius.circular(10),
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.shadowColor,
        //     blurRadius: 5,
        //     spreadRadius: 1,
        //     offset: Offset(0, 5), // Shadow position
        //   ),
        // ],
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 15.h, horizontal: 10.w),
        child: Text(
          text ?? "auto",
          style: TextStyle(
            fontFamily: "Gellix",
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            height: 1.2125,
            color: AppColors.textGreyColor,
          ),
        ),
      ),
    );
  }
}
