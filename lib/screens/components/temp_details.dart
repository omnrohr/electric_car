import 'package:flutter/material.dart';

import '../../screens/components/temp_button.dart';
import '../../constanins.dart';
import '../../home_controller.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({
    Key? key,
    required HomeController controller,
    required this.temp,
  })  : _controller = controller,
        super(key: key);

  final HomeController _controller;
  final int temp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [
                TempButton(
                  svgSrc: 'assets/icons/coolShape.svg',
                  onPress: () {
                    _controller.updateCoolSelect();
                  },
                  title: 'cool',
                  isActive: _controller.isCoolSelected,
                ),
                const SizedBox(
                  width: defaultPadding,
                ),
                TempButton(
                  svgSrc: 'assets/icons/heatShape.svg',
                  onPress: () {
                    _controller.updateCoolSelect();
                  },
                  title: 'heat',
                  isActive: !_controller.isCoolSelected,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_drop_up,
                    color: Colors.white,
                    size: 48,
                  )),
              Text(
                '$temp \u2103',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 86,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  // ignore: todo
                  //TODO: add functionality to update temperature
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: 48,
                  )),
            ],
          ),
          const Spacer(),
          Text(
            'Current temperature'.toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'inside'.toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    '20 \u2103',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'outside'.toUpperCase(),
                    style: const TextStyle(color: Colors.white54),
                  ),
                  Text(
                    '39 \u2103',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white54),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
