import 'package:flutter/material.dart';

class TipRow extends StatelessWidget {
  const TipRow({
    super.key,
    required this.theme,
    required this.totalTp,
  });

  final ThemeData theme;
  final double totalTp;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Tip',
        style: theme.textTheme.titleMedium,),
        Text('$totalTp',
        style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}