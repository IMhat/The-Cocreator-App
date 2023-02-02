import 'package:cocreator/helpers/widgets/loader.dart';
import 'package:cocreator/models/accounts.dart';
import 'package:cocreator/pages/screens/questions/service/account_services.dart';
import 'package:flutter/material.dart';

class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  // temporary list
  List<AccountsConnect>? accounts;

  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchWallet();
  }

  void fetchWallet() async {
    accounts = (await accountServices.fetchAccounts(context: context))
        .cast<AccountsConnect>();
    setState(() {});
  }

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return accounts == null
        ? const Loader()
        : Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                width: 330,
                padding: const EdgeInsets.only(left: 10, top: 0, right: 0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: accounts!.length,
                  itemBuilder: (context, index) {
                    // PickerItem pickerItem = widget.pickerItems[index];
                    bool isItemSelected = index == selectedIndex;
                    return GestureDetector(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      // child: SingleAccounts(
                      //   account: accounts![index],
                      //   isItemSelected,
                      // ),
                      child: Container(
                        //padding: const EdgeInsets.all(2.0),
                        margin: const EdgeInsets.only(top: 20, bottom: 0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 0),
                        width: 320,
                        // height: 250,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[850]!.withOpacity(0.29),
                                offset: const Offset(-10, 10),
                                blurRadius: 10,
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                height: 55,
                                child: Image.network(accounts![index].image,
                                    fit: BoxFit.cover, width: 75),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Center(
                                child: Text(
                                  accounts![index].title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 25),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                  child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: isItemSelected
                                    ? const Icon(
                                        Icons.circle_outlined,
                                        size: 35,
                                        color: Colors.blue,
                                      )
                                    : const Icon(
                                        Icons.circle_outlined,
                                        size: 35,
                                        color:
                                            Color.fromARGB(255, 197, 197, 197),
                                      ),
                              )),
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
                ),
              ),
            ],
          );
  }
}


// ListView.builder(
//  itemCount: appliances.length,
//  scrollDirection: Axis.horizontal,
//  itemBuilder: (context, index) {
//   return ApplicancesTile(
//    appliancesData: appliances[index],
//    onChanged: (value){
//     setState(() {
//      selected = value;
//     });
//    },
//   );
//  },
// ),
