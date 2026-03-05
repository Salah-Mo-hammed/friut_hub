
import 'package:flutter/material.dart';

class SwitchButtonWidget extends StatefulWidget {
  const SwitchButtonWidget({super.key});

  @override
  State<SwitchButtonWidget> createState() =>
      _SwitchButtonWidgetState();
}

class _SwitchButtonWidgetState extends State<SwitchButtonWidget> {
  late bool _value;
  @override
  void initState() {
    // TODO: to call the real value from backend (later)
    // ! for now we will make it false
    _value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _value,
      onChanged: (newValue) {
        // ! here is also some work when the backend be ready
        setState(() {
          _value = newValue;
        });
      },
    );
  }
}
