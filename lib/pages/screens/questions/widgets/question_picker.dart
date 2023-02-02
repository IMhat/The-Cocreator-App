import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class PickerItem {
  String label;
  //String icon;

  PickerItem(this.label);
}

class PickerWidget extends StatefulWidget {
  final List<PickerItem> pickerItems;

  PickerWidget({
    Key? key,
    required this.pickerItems,
  }) : super(key: key);

  @override
  _PickerWidgetState createState() => _PickerWidgetState();
}

class _PickerWidgetState extends State<PickerWidget> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        PickerItem pickerItem = widget.pickerItems[index];
        bool isItemSelected = index == selectedIndex;
        return InkWell(
          onTap: () {
            // selectedIndex = index;
            // setState(() {});
          },
          child: Container(
            height: 75,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            decoration: BoxDecoration(
              // color: Color(0xff04385f),
              border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Container(
                  //   height: 75,
                  //   child: Image.asset(pickerItem.icon,
                  //       fit: BoxFit.cover, width: 75),
                  // ),
                  // const SizedBox(
                  //   width: 80,
                  // ),
                  Center(
                    child: Text(
                      pickerItem.label,
                      style: const TextStyle(
                          fontFamily: 'Sans',
                          color: Color.fromARGB(255, 148, 148, 148),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  isItemSelected
                      ? Icon(
                          Icons.circle_outlined,
                          size: 35,
                          color: Colors.blue,
                        )
                      : Container(),
                ],
              ),
              // child: Row(
              //   children: [
              //     Container(
              //       height: 75,
              //       child: Image.asset(pickerItem.icon,
              //           fit: BoxFit.cover, width: 75),
              //     ),
              //     // SizedBox(width: 4),
              //     Expanded(
              //       child: Text(
              //         pickerItem.label,
              //         style: const TextStyle(
              //             fontFamily: 'Sans',
              //             color: Color.fromARGB(255, 148, 148, 148),
              //             fontSize: 30,
              //             fontWeight: FontWeight.bold),
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //     isItemSelected
              //         ? Icon(
              //             Icons.circle_outlined,
              //             size: 26,
              //             color: Colors.blue,
              //           )
              //         : Container(),
              //   ],
              // ),
            ),
          ),
        );
      },
      itemCount: widget.pickerItems.length,
    );
  }
}
