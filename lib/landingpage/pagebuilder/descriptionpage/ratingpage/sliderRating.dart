import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SliderPage extends StatefulWidget {
  Function callback;
  SliderPage(this.callback, {Key? key}) : super(key: key);
  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        value == 0
            ? Container(
                height: h * 0.025,
                width: double.infinity,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("SLIDE TO RATE",
                      style:
                          TextStyle(fontSize: w * 0.025, color: Colors.grey)),
                  Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.grey,
                    size: w * 0.025,
                  )
                ]))
            : SizedBox(
                height: h * 0.025,
              ),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Row(
            children: [
              // Spacer(),
              SizedBox(
                width: w * 0.80,
                child: SliderTheme(
                    data: SliderThemeData(
                        inactiveTickMarkColor: Colors.grey[400],
                        activeTickMarkColor: Colors.white,
                        trackHeight: h * 0.007,
                        activeTrackColor: Colors.red,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: Colors.redAccent,
                        trackShape: const RectangularSliderTrackShape(),
                        thumbShape: const RoundSliderThumbShape(
                            elevation: 0, enabledThumbRadius: 8)),
                    child: Slider(
                      value: value,
                      min: 0,
                      max: 10,
                      label: value.round().toString(),
                      divisions: 10,
                      onChanged: (double value) {
                        setState(() {
                          this.value = value;
                          widget.callback(value);
                        });
                      },
                    )),
              ),
              buildTextRating(value),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }

  buildTextRating(double value) {
    return Text(
      "${value.toInt()}/10",
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
