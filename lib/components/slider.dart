import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key, required this.onChanged, required this.currentSliderValue, required this.id});
  final double currentSliderValue;
  final String id;
  final void Function(double, String) onChanged;
 
  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: widget.currentSliderValue,
      max: 100,
      divisions: 5,
      label: widget.currentSliderValue.round().toString(),
      onChanged: (value){
        widget.onChanged(value, widget.id);
      }
    );
  }
}
