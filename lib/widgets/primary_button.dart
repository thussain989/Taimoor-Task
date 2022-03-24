import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);
  final String buttonText;
  final Function onTap;
  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
        print('On Tap');
      },
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(106, 176, 209, 1.0),
                  Color.fromRGBO(92, 186, 205, 1.0),
                  Color.fromRGBO(111, 210, 210, 1.0),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                topLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              )),
          child: Center(
            child: Text(
              widget.buttonText,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          )),
    );
  }
}
