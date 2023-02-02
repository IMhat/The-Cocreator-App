import 'package:cocreator/helpers/widgets/loader.dart';
import 'package:cocreator/models/question.dart';
import 'package:cocreator/pages/screens/questions/service/account_services.dart';
import 'package:expandable_text/expandable_text.dart';

import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  // temporary list
  List<Question>? questions;

  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchWallet();
  }

  void fetchWallet() async {
    questions = (await accountServices.fetchQuestions(context: context))
        .cast<Question>();
    setState(() {});
  }

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return questions == null
        ? const Loader()
        : Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 0),
                width: 330,
                padding: const EdgeInsets.only(left: 0, top: 0, right: 0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: questions!.length,
                  itemBuilder: (context, index) {
                    bool isItemSelected = index == selectedIndex;
                    return GestureDetector(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      // child: SingleQuestion(
                      //   question: questions![index],
                      //   isSelected: false,
                      // ),
                      child: Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
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
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    // Container(
                                    //   padding: const EdgeInsets.only(top: 5),
                                    //   width: 10,
                                    //   height: 10,
                                    //   decoration: BoxDecoration(
                                    //       color: const Color.fromARGB(166, 239, 41, 27),
                                    //       border: Border.all(
                                    //           color: const Color.fromARGB(255, 255, 251, 251)),
                                    //       borderRadius: BorderRadius.circular(50)),
                                    // ),
                                    SizedBox(
                                      width: 235,
                                      height: 35,
                                      child: Text(
                                        questions![index].title.toString(),
                                        style: const TextStyle(
                                            fontSize: 25,
                                            color: Color.fromARGB(255, 7, 0, 0),
                                            fontWeight: FontWeight.bold),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                        child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: isItemSelected
                                          ? const Icon(
                                              Icons.circle_outlined,
                                              size: 35,
                                              color: Colors.blue,
                                            )
                                          : const Icon(
                                              Icons.circle_outlined,
                                              size: 35,
                                              color: Color.fromARGB(
                                                  255, 197, 197, 197),
                                            ),
                                    )),
                                    // SizedBox(
                                    //   child: widget.isSelected
                                    //       ? Icon(
                                    //           Icons.check_circle_outlined,
                                    //           color: Colors.blue,
                                    //         )
                                    //       : Icon(
                                    //           Icons.circle_outlined,
                                    //           color: Color.fromARGB(
                                    //               255, 129, 129, 129),
                                    //         ),
                                    // )
                                  ],
                                ),

                                Row(
                                  children: [
                                    SizedBox(
                                      width: 270,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          const SizedBox(
                                            child: Divider(
                                              thickness: 1,
                                              color: Colors.black,
                                            ),
                                          ),
                                          // ExpandableText(
                                          //   '',
                                          //   expandText: 'show more',
                                          //   collapseText: 'show less',
                                          // ),
                                          // SizedBox(height: 10.0),
                                          ExpandableText(
                                            questions![index].description,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromARGB(
                                                    255, 99, 99, 99)),
                                            expandText: '🔽',
                                            collapseText: '🔼',
                                            maxLines: 1,
                                            linkColor:
                                                Color.fromARGB(255, 0, 0, 0),
                                            linkStyle: TextStyle(
                                              fontSize: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),

                                // Row(
                                //   children: [
                                //     Container(
                                //       width: 250,
                                //       child: Column(
                                //         crossAxisAlignment: CrossAxisAlignment.start,
                                //         children: <Widget>[
                                //           ExpandableText(
                                //             '',
                                //             expandText: 'show more',
                                //             collapseText: 'show less',
                                //           ),
                                //           SizedBox(height: 10.0),
                                //           ExpandableText(
                                //             widget.description,
                                //             expandText: 'show more',
                                //             collapseText: 'show less',
                                //             maxLines: 1,
                                //             linkColor: Colors.blue,
                                //           ),
                                //         ],
                                //       ),
                                //     )
                                //   ],
                                // ),

                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                //   children: [
                                //     const Icon(Icons.today_outlined),
                                //     // const Text("2 hours ago"),
                                //     Container(
                                //       margin: const EdgeInsets.only(left: 50),
                                //       padding: const EdgeInsets.only(
                                //         top: 10,
                                //       ),
                                //       width: 100,
                                //       height: 45,
                                //       decoration: BoxDecoration(
                                //           color: const Color.fromARGB(166, 239, 41, 27),
                                //           border: Border.all(
                                //               color: const Color.fromARGB(255, 255, 251, 251)),
                                //           borderRadius: BorderRadius.circular(50)),
                                //       // child: Text(
                                //       //   widget.item.toString(),
                                //       //   style: const TextStyle(
                                //       //       fontSize: 15,
                                //       //       fontWeight: FontWeight.bold,
                                //       //       color: Color.fromARGB(255, 0, 0, 0)),
                                //       //   textAlign: TextAlign.center,
                                //       // ),
                                //     ),
                                //   ],
                                // )
                                // // // Text(
                                // // //   widget.subTitle.toString(),
                                // // //   style: const TextStyle(
                                // // //       fontSize: 15, color: Color.fromARGB(255, 9, 0, 0)),
                                // // // ),
                              ],
                            ),
                          ],
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
