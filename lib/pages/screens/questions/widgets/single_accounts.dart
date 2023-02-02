import 'package:cocreator/models/accounts.dart';
import 'package:flutter/material.dart';

class SingleAccounts extends StatelessWidget {
  final AccountsConnect account;

  final bool isItemSelected;

  const SingleAccounts(
      {Key? key, required this.account, required this.isItemSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.only(top: 20, bottom: 0),
      //decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _AccountsDetails(
            //title: taskListProvider.tasks[i].title,
            // subTitle: taskListProvider.tasks[i].description,
            title: account.title,
            image: account.image,
            item: account.item,
            isSelected: isItemSelected,

            //subTitle: widget.task.description,
          ),
        ],
      ),
    );
  }
}

class _AccountsDetails extends StatefulWidget {
  final String? title;
  final String? image;
  final String? item;
  final bool isSelected;

  const _AccountsDetails(
      {this.title, this.image, this.item, required this.isSelected});

  @override
  State<_AccountsDetails> createState() => _AccountsDetailsState();
}

class _AccountsDetailsState extends State<_AccountsDetails> {
  //Estilo de ElevatedButton
  // final elevatedButtonStyle = ElevatedButton.styleFrom(
  //     shadowColor: const Color.fromARGB(255, 54, 57, 244),
  //     elevation: 10,
  //     primary: Colors.deepPurple,
  //     onPrimary: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: 320,
      // height: 250,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[850]!.withOpacity(0.29),
              offset: const Offset(-10, 10),
              blurRadius: 10,
            )
          ]),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            // child: Icon(
            //   Icons.person_outline_outlined,
            //   color: Colors.white,
            // ),
            child: Image.network(widget.image.toString())),
        title: Text(
          widget.title.toString(),
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
        ),
        trailing: widget.isSelected
            ? Icon(
                Icons.check_circle_outlined,
                color: Colors.blue,
              )
            : Icon(
                Icons.circle_outlined,
                color: Color.fromARGB(255, 129, 129, 129),
              ),
        onTap: () {},
      ),
    );
    // return Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //   width: 320,
    //   height: 125,
    //   decoration: BoxDecoration(
    //       color: const Color.fromARGB(255, 237, 236, 237),
    //       borderRadius: const BorderRadius.all(Radius.circular(8)),
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.grey[850]!.withOpacity(0.29),
    //           offset: const Offset(-10, 10),
    //           blurRadius: 10,
    //         )
    //       ]),
    //   child: Row(
    //     children: [
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             children: [
    //               // Container(
    //               //   padding: const EdgeInsets.only(top: 5),
    //               //   width: 10,
    //               //   height: 10,
    //               //   decoration: BoxDecoration(
    //               //       color: const Color.fromARGB(166, 239, 41, 27),
    //               //       border: Border.all(
    //               //           color: const Color.fromARGB(255, 255, 251, 251)),
    //               //       borderRadius: BorderRadius.circular(50)),
    //               // ),
    //               SizedBox(
    //                 width: 150,
    //                 height: 45,
    //                 child: Text(
    //                   widget.title.toString(),
    //                   style: const TextStyle(
    //                       fontSize: 18,
    //                       color: Color.fromARGB(255, 7, 0, 0),
    //                       fontWeight: FontWeight.bold),
    //                   maxLines: 2,
    //                   overflow: TextOverflow.ellipsis,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: [
    //               const Icon(Icons.today_outlined),
    //               const Text("2 hours ago"),
    //               Container(
    //                 margin: const EdgeInsets.only(left: 50),
    //                 padding: const EdgeInsets.only(
    //                   top: 10,
    //                 ),
    //                 width: 100,
    //                 height: 45,
    //                 decoration: BoxDecoration(
    //                     color: const Color.fromARGB(166, 239, 41, 27),
    //                     border: Border.all(
    //                         color: const Color.fromARGB(255, 255, 251, 251)),
    //                     borderRadius: BorderRadius.circular(50)),
    //                 child: Text(
    //                   widget.item.toString(),
    //                   style: const TextStyle(
    //                       fontSize: 15,
    //                       fontWeight: FontWeight.bold,
    //                       color: Color.fromARGB(255, 0, 0, 0)),
    //                   textAlign: TextAlign.center,
    //                 ),
    //               ),
    //             ],
    //           )
    //           // Text(
    //           //   widget.subTitle.toString(),
    //           //   style: const TextStyle(
    //           //       fontSize: 15, color: Color.fromARGB(255, 9, 0, 0)),
    //           // ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }

  // BoxDecoration _buildBoxDecoration() => const BoxDecoration(
  //     color: Colors.indigo,
  //     borderRadius: BorderRadius.only(
  //         bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
}

class MyButtonBeginning extends StatelessWidget {
  const MyButtonBeginning({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.pushNamed(
          context,
          'tasksPost',
        );
      },

      child: Container(
        width: 130,
        height: 30,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: AlignmentDirectional.topEnd,
              colors: [
                Color.fromARGB(255, 242, 133, 157),
                Color.fromARGB(255, 167, 79, 211)
              ]),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text(
          'Empezar',
          style: TextStyle(color: Colors.white, fontSize: 10),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// ElevatedButton(
//   style: elevatedButtonStyle,
//   onPressed: () {
//     Navigator.pushNamed(
//       context,
//       'TaskDetail',
//     );
//   },
//   child: const Text("Ver"),
// ),
// ElevatedButton(
//   style: elevatedButtonStyle,
//   onPressed: () {
//     Navigator.pushNamed(
//       context,
//       'tasksPost',
//     );
//   },
//   child: const Text("Empezar"),
// ),

//   Widget ContactItem(
//       String name, String phoneNumber, bool isSelected, int index) {
//     return ListTile(
//       leading: CircleAvatar(
//         backgroundColor: Colors.green[700],
//         child: Icon(
//           Icons.person_outline_outlined,
//           color: Colors.white,
//         ),
//       ),
//       title: Text(
//         name,
//         style: TextStyle(
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       subtitle: Text(phoneNumber),
//       trailing: isSelected
//           ? Icon(
//               Icons.check_circle,
//               color: Colors.green[700],
//             )
//           : Icon(
//               Icons.check_circle_outline,
//               color: Colors.grey,
//             ),
//       onTap: () {
//         setState(() {
//           contacts[index].isSelected = !contacts[index].isSelected;
//           if (contacts[index].isSelected == true) {
//             selectedContacts.add(ContactModel(name, phoneNumber, true));
//           } else if (contacts[index].isSelected == false) {
//             selectedContacts
//                 .removeWhere((element) => element.name == contacts[index].name);
//           }
//         });
//       },
//     );
//   }
// }
