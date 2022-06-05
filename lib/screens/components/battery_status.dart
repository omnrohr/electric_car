import 'package:flutter/material.dart';

class BatteryStatus extends StatelessWidget {
  const BatteryStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '220 mi',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white),
        ),
        const Text(
          '62%',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        const Spacer(),
        const Text(
          'Charging',
          style: TextStyle(color: Colors.green, fontSize: 20),
        ),
        const Text(
          '18 min remaining',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DefaultTextStyle(
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            child: Row(
              children: const [
                Text(
                  '22mi/hr',
                ),
                Spacer(),
                Text(
                  '232 v',
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
