import 'package:cocreator/helpers/widgets/loader.dart';
import 'package:cocreator/models/accounts.dart';
import 'package:cocreator/pages/screens/home/services/quickbooks/models/balance.dart';
import 'package:cocreator/pages/screens/home/services/quickbooks/models/transaction.dart';
import 'package:cocreator/pages/screens/home/services/quickbooks/service/quickbooks_apiCall.dart';
import 'package:cocreator/pages/screens/questions/service/account_services.dart';
import 'package:cocreator/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionQuickbooks extends StatefulWidget {
  const TransactionQuickbooks({Key? key}) : super(key: key);

  @override
  State<TransactionQuickbooks> createState() => _TransactionQuickbooksState();
}

class _TransactionQuickbooksState extends State<TransactionQuickbooks> {
  // temporary list
  List<Transanction>? transaction;

  final QuickbookService quickbookServices = QuickbookService();

  @override
  void initState() {
    super.initState();
    fetchWallet();
  }

  void fetchWallet() async {
    transaction = await quickbookServices.getTransaction(context: context);
    setState(() {});
  }

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context);
    final usuario = authService.usuario;
    final String nombreUsuario = (usuario == null ? "" : usuario.name);

    return transaction == null
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
                    itemCount: transaction!.length,
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
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              children: [
                                                SizedBox(
                                                  child: Text(
                                                      transaction![index].title,
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black)),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: SizedBox(
                                                    child: Text(
                                                        transaction![index]
                                                            .date,
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
                                              ],
                                            ),
                                            SizedBox(
                                              width: 100,
                                            ),
                                            SizedBox(
                                                child: Text(
                                                    '\$ ${transaction![index].value.toString()}',
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.green)))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Color.fromARGB(255, 151, 151, 151),
                                    thickness: 1,
                                  ),
                                ]),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          );
  }
}
