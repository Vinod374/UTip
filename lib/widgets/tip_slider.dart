import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({
    super.key,
    required double tipPercentage, required this.onChanged,
  }) : _tipPercentage = tipPercentage;

  final double _tipPercentage;
  final ValueChanged<double> onChanged;

//refracting Tipslider widget > variable..valuechanged&returning value in <> angular braces >doing needful for other errors > setState in main dart  

  @override
  Widget build(BuildContext context) {
    return Slider(value: _tipPercentage,
    onChanged: onChanged,
    // onChanged:(value) {
    //   // setState(() {
    //   // _tipPercentage = value;
    //   // });
    // },
    min: 0,
    max: 0.5,
    label: '${(_tipPercentage*100).round()}',
    divisions: 5,
    );
  }
}