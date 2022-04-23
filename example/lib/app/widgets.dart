import 'package:example/app/styles.dart';
import 'package:flutter/material.dart';

Widget gap8 = const SizedBox(width: 8, height: 8);
Widget gap16 = const SizedBox(width: 16, height: 16);

class DetailsTile extends StatelessWidget {
  const DetailsTile({
    Key? key,
    required this.label,
    required this.value,
    this.onTap,
  }) : super(key: key);

  final String label;
  final String value;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: onTap!= null? () => onTap!(): null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: bold),
          Text(value),
        ],
      ),
    );
  }
}
