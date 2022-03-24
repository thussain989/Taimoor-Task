import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTextField extends StatefulWidget {
  const PrimaryTextField({
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.textEditingController,
    this.inputFormatters,
    this.enabled = true,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final List<TextInputFormatter>? inputFormatters;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final bool enabled;
  final Function(String)? onChanged;

  @override
  _PrimaryTextFieldState createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  bool showText = false;
  OutlineInputBorder textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Colors.white,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: widget.textEditingController,
        enabled: widget.enabled,
        inputFormatters: widget.inputFormatters,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: widget.obscureText && !showText,
        keyboardType: widget.keyboardType,
        style: const TextStyle(
          fontSize: 16,
        ),
        onChanged: widget.onChanged ?? (value) {},
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: const Color.fromRGBO(237, 237, 237, 1.0),
          isDense: true,
          focusedBorder: textFieldBorder,
          enabledBorder: textFieldBorder,
          disabledBorder: textFieldBorder,
          errorBorder: textFieldBorder,
          focusedErrorBorder: textFieldBorder,
          border: textFieldBorder,
          suffixIcon: widget.obscureText
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      showText = !showText;
                    });
                  },
                  child: showText
                      ? Icon(
                          Icons.visibility,
                          color: Colors.grey[600],
                          size: 25,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: Colors.grey[600],
                          size: 25,
                        ),
                )
              : null,
        ),
        validator: widget.validator,
      ),
    );
  }
}
