import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  late var toggleTransactionType;
  late var _isTransactionCredit;

  CustomSwitch(this._isTransactionCredit, this.toggleTransactionType,
      {super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Chip(
        label: widget._isTransactionCredit
            ? const Text('Credit + ')
            : const Text('Debit -'),
        labelStyle: const TextStyle(color: Colors.white, fontSize: 20.0),
        backgroundColor:
            widget._isTransactionCredit ? Colors.green : Colors.red,
      ),
      Switch(
        activeColor: Colors.green,
        inactiveTrackColor: Colors.red.shade100,
        inactiveThumbColor: Colors.red,
        thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return const Icon(Icons.add);
          }
          return null; // All other states will use the default thumbIcon.
        }),
        value: widget._isTransactionCredit,
        onChanged: (bool value) {
          widget.toggleTransactionType();
        },
      ),
    ]);
  }
}
