import 'package:cocreator/helpers/widgets/loader.dart';
import 'package:cocreator/models/accounts.dart';
import 'package:cocreator/pages/screens/home/services/quickbooks/models/balance.dart';
import 'package:cocreator/pages/screens/home/services/quickbooks/service/quickbooks_apiCall.dart';
import 'package:cocreator/pages/screens/questions/service/account_services.dart';
import 'package:cocreator/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BalanceQuickbooks extends StatefulWidget {
  const BalanceQuickbooks({Key? key}) : super(key: key);

  @override
  State<BalanceQuickbooks> createState() => _BalanceQuickbooksState();
}

class _BalanceQuickbooksState extends State<BalanceQuickbooks> {
  // temporary list
  List<Balance>? balance;

  final QuickbookService quickbookServices = QuickbookService();

  @override
  void initState() {
    super.initState();
    fetchWallet();
  }

  void fetchWallet() async {
    balance = await quickbookServices.getBalance(context: context);
    setState(() {});
  }

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context);
    final usuario = authService.usuario;
    final String nombreUsuario = (usuario == null ? "" : usuario.name);

    return balance == null
        ? const Loader()
        : Column(
            children: [
              Container(
                //margin: const EdgeInsets.only(right: 20),
                //width: 350,
                //padding: const EdgeInsets.only(left: 10, top: 0, right: 0),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: balance!.length,
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
                            child: Column(children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 0,
                                    ),
                                    Text(
                                      // 'Hi Guest',
                                      'Hello ',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '${nombreUsuario} !',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.waving_hand,
                                      color: Colors.amber,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 350,
                                height: 370,
                                //margin: EdgeInsets.symmetric(vertical: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 20, top: 10),
                                            alignment: Alignment.topLeft,
                                            child: SizedBox(
                                                child: Text(
                                              'My ${balance![index].title}',
                                              style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            )),
                                          ),
                                          // SizedBox(
                                          //   width: 100,
                                          // ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: 15, top: 10),
                                            alignment: Alignment.topRight,
                                            child: SizedBox(
                                              child: Text(
                                                'Custome',
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromARGB(
                                                        255, 151, 151, 151)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Column(children: [
                                                Container(
                                                  // margin: EdgeInsets.only(
                                                  //     left: 80, top: 10),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: SizedBox(
                                                    child: Text('Income',
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    151,
                                                                    151,
                                                                    151))),
                                                  ),
                                                ),
                                                // const SizedBox(
                                                //   height: 5,
                                                // ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 20,
                                                      top: 5,
                                                      right: 10),
                                                  alignment: Alignment.topLeft,
                                                  child: SizedBox(
                                                    child: Text(
                                                        '\$ ${balance![index].totalIncome}'
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color:
                                                                Colors.green)),
                                                  ),
                                                ),
                                              ]),
                                            ),
                                            Container(
                                              color: Colors.black45,
                                              height: 50,
                                              width: 2,
                                            ),
                                            Container(
                                              child: Column(children: [
                                                Container(
                                                  // margin: EdgeInsets.only(
                                                  //     right: 80, top: 10),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: SizedBox(
                                                    child: Text('Expense',
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    151,
                                                                    151,
                                                                    151))),
                                                  ),
                                                ),
                                                // const SizedBox(
                                                //   height: 5,
                                                // ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 20,
                                                      top: 5,
                                                      left: 10),
                                                  alignment: Alignment.topRight,
                                                  child: SizedBox(
                                                    child: Text(
                                                        '\$ ${balance![index].totalExpense.toString()}',
                                                        style: const TextStyle(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color: Colors.red)),
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: SizedBox(
                                        child: Row(children: [
                                          SizedBox(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.circle,
                                                  color: Colors.green,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text('Income',
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Color.fromARGB(
                                                            255,
                                                            151,
                                                            151,
                                                            151))),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          SizedBox(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.circle,
                                                  color: Colors.red,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text('Expense',
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Color.fromARGB(
                                                            255,
                                                            151,
                                                            151,
                                                            151))),
                                              ],
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 30,
                                    // ),
                                    Container(
                                      //height: 200,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child:
                                          Image.asset('assets/imagesheet.png'),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                          ));
                    }),
              ),
            ],
          );
  }
}
