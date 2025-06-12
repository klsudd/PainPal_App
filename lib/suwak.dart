import 'package:flutter/material.dart';

class PainIntensitySlider extends StatefulWidget {
  final ValueChanged<double> onChanged;

  const PainIntensitySlider({Key? key, required this.onChanged}) : super(key: key);

  @override
  _PainIntensitySliderState createState() => _PainIntensitySliderState();
}

class _PainIntensitySliderState extends State<PainIntensitySlider> {
  double _value = 5.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Natężenie bólu: ${_value.toInt()} / 10',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Slider(
          min: 0,
          max: 10,
          divisions: 10,
          value: _value,
          label: _value.toInt().toString(),
          onChanged: (newValue) {
            setState(() {
              _value = newValue;
            });
            widget.onChanged(newValue);
          },
        ),
      ],
    );
  }
}

