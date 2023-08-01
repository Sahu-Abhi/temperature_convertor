import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double kelvin = 273.15;
  double fahrenheit = 32;
  Color dotColor = Colors.orangeAccent.withOpacity(0.7);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFcccddb),
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: const Color(0xFFf3f4fb),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Temp Convertor',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins'),
                ),
                const SizedBox(
                  height: 60,
                ),
                Material(
                  elevation: 7,
                  shape: const CircleBorder(),
                  child: CircleAvatar(
                    radius: 135,
                    backgroundColor: const Color(0xFFf3f4fb),
                    child: SleekCircularSlider(
                      appearance: CircularSliderAppearance(
                        infoProperties: InfoProperties(
                            mainLabelStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF555a73),
                                fontSize: 32,
                                fontWeight: FontWeight.w600),
                            modifier: (double value) {
                              final roundedValue = value.toStringAsFixed(2);
                              return '$roundedValue°';
                            }),
                        customColors: CustomSliderColors(
                            dynamicGradient: true,
                            dotColor: dotColor,
                            trackColor: Colors.transparent,
                            progressBarColor: Colors.transparent,
                            hideShadow: true),
                        customWidths: CustomSliderWidths(
                          trackWidth: 0,
                          progressBarWidth: 0,
                          handlerSize: 17,
                        ),
                        startAngle: 0,
                        size: 220,
                        angleRange: 360,
                      ),
                      min: -273.15,
                      max: 273.15,
                      initialValue: 0,
                      onChange: (double value) {
                        setState(() {
                          kelvin = value + 273.15;
                          fahrenheit = (value * (9 / 5)) + 32;
                        });
                      },
                      onChangeStart: (double startValue) {
// callback providing a starting value (when a pan gesture starts)
                      },
                      onChangeEnd: (double endValue) {
// ucallback providing an ending value (when a pan gesture ends)
                      },
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: const Color(0xFFdfe0eb),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        const Text(
                          'Fahrenheit',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF8f95a8)),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text('${fahrenheit.toStringAsFixed(2)}°F',
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF474b5e))),
                      ]),
                      Column(children: [
                        const Text(
                          'Kelvin',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF8f95a8)),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text('${kelvin.toStringAsFixed(2)} K',
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF474b5e))),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
