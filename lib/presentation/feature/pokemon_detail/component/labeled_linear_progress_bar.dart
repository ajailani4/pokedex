import 'package:flutter/material.dart';

class LabeledLinearProgressBar extends StatelessWidget {
  const LabeledLinearProgressBar({
    super.key,
    required this.value
  });

  final int value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      children: [
        Text(
          '$value',
          style: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold
          )
        ),
        const SizedBox(width: 10.0),
        Expanded(child: LinearProgressIndicator(value: value/100))
      ],
    );
  }
}