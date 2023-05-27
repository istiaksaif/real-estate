import 'package:flutter/material.dart';

class VerticalSeekBar extends StatefulWidget {
  final Color thumbColor;
  final Color progressColor;
  final Color backgroundColor;
  final double startValue;
  final double endValue;
  final double maxValue;
  final double minValue;
  final Function onChangedValue;

  const VerticalSeekBar({
    super.key,
    required this.thumbColor,
    required this.progressColor,
    required this.backgroundColor,
    required this.onChangedValue,
    required this.maxValue,
    required this.minValue,
    required this.startValue,
    required this.endValue,
  });

  @override
  _VerticalSeekBarState createState() => _VerticalSeekBarState();
}

class _VerticalSeekBarState extends State<VerticalSeekBar> {
  RangeValues _values = const RangeValues(0.0, 100.0);

  @override
  void initState() {
    super.initState();
    _values = RangeValues(widget.startValue, widget.endValue);
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 20.0,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 15,
          disabledThumbRadius: 15,
          elevation: 0,
        ),
        thumbColor: widget.thumbColor,
        overlayColor: Colors.transparent,
        overlappingShapeStrokeColor: Colors.transparent,
        activeTrackColor: widget.progressColor,
        inactiveTrackColor: widget.backgroundColor,
      ),
      child: RangeSlider(
        values: _values,
        min: widget.minValue,
        max: widget.maxValue,
        onChanged: (newValue) {
          setState(() {
            _values = newValue;
          });
          widget.onChangedValue(newValue);
        },
      ),
    );
  }
}
