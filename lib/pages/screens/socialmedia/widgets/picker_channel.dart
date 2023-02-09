import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class PickerItem {
  String label;

  PickerItem(this.label);
}

class PickerChannel extends StatefulWidget {
  final List<PickerItem> pickerItems;

  PickerChannel({
    Key? key,
    required this.pickerItems,
  }) : super(key: key);

  @override
  _PickerChannelState createState() => _PickerChannelState();
}

class _PickerChannelState extends State<PickerChannel> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        PickerItem pickerItem = widget.pickerItems[index];
        bool isItemSelected = index == selectedIndex;
        return InkWell(
          onTap: () {
            selectedIndex = index;
            setState(() {});
          },
          child: Container(
            height: 100,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
            decoration: BoxDecoration(
              // color: Color(0xff04385f),
              color: Colors.white,
              border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Container(
              // padding: const EdgeInsets.all(8.0),

              //padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Center(
                      child: Text(
                        pickerItem.label,
                        style: const TextStyle(
                            fontFamily: 'Sans',
                            color: Color.fromARGB(255, 148, 148, 148),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: isItemSelected
                        ? Icon(
                            Icons.circle_outlined,
                            size: 35,
                            color: Colors.blue,
                          )
                        : Container(),
                  ),
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
