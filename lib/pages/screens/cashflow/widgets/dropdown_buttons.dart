import 'package:flutter/material.dart';

class DropButtons extends StatefulWidget {
  const DropButtons({Key? key}) : super(key: key);

  @override
  State<DropButtons> createState() => _DropButtonsState();
}

class _DropButtonsState extends State<DropButtons> {
  @override
  Widget build(BuildContext context) {
    String status = 'Shoppe';

    List<String> statusCategories = [
      'gfgf',
      'fgfg',
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(5.0),
          width: 120,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: DropdownButton(
            hint: const Text(
              'Shoppe',
              style:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.w600),
            ),
            style: const TextStyle(color: Colors.black),
            icon: const Icon(Icons.keyboard_arrow_down),
            items: statusCategories.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String? newVal) {
              setState(() {
                status = newVal!;
              });
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: DropdownButton(
            hint: const Text('Friday, 11 June 2022'),
            style: const TextStyle(color: Colors.black),
            icon: const Icon(Icons.keyboard_arrow_down),
            items: statusCategories.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String? newVal) {
              setState(() {
                status = newVal!;
              });
            },
          ),
        ),
      ],
    );
  }
}
