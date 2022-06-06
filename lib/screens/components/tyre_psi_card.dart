import 'package:flutter/material.dart';

import '../../constantine.dart';
import '../../models/tyre_psi.dart';

class TyrePsiCard extends StatelessWidget {
  const TyrePsiCard({
    Key? key,
    required this.tyrePsi,
  }) : super(key: key);

  final TyrePsi tyrePsi;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: tyrePsi.isLowPressure
            ? Colors.red.withOpacity(0.1)
            : Colors.white10,
        border: Border.all(
          color: tyrePsi.isLowPressure ? Colors.red : primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: tyrePsi.isLowPressure
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                psiText(context, psi: tyrePsi.psi.toString()),
                const SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  '${tyrePsi.temp}\u2103',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const Spacer(),
                lowPressureText(context),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                psiText(context, psi: tyrePsi.psi.toString()),
                const SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  '${tyrePsi.temp}\u2103',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const Spacer(),
                lowPressureText(context),
              ],
            ),
    );
  }

  Column lowPressureText(BuildContext context) {
    return Column(
      children: [
        Text(
          'low'.toUpperCase(),
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          'Pressure'.toUpperCase(),
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }

  Text psiText(BuildContext context, {required String psi}) {
    return Text.rich(
      TextSpan(
        text: psi,
        style: Theme.of(context).textTheme.headline4!.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
        children: const [TextSpan(text: 'psi', style: TextStyle(fontSize: 24))],
      ),
    );
  }
}
