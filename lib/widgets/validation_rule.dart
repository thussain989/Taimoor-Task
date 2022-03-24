import 'package:flutter/material.dart';

class ValidationRule extends StatefulWidget {
  const ValidationRule({required this.rule, required this.ruleIsTrue, Key? key})
      : super(key: key);
  final String rule;
  final bool Function() ruleIsTrue;

  @override
  _ValidationRuleState createState() => _ValidationRuleState();
}

class _ValidationRuleState extends State<ValidationRule> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: widget.ruleIsTrue() ? Colors.green[600] : Colors.grey[600],
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          widget.rule,
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
