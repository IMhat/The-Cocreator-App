import 'package:cocreator/pages/screens/socialmedia/home/components/flutter_flow/flutter_flow_theme.dart';
import 'package:cocreator/pages/screens/socialmedia/home/controllers/profile_controller.dart';
import 'package:cocreator/pages/screens/socialmedia/models/blog_model.dart';
import 'package:cocreator/pages/screens/socialmedia/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BlogCard extends StatelessWidget {
  final BlogModel blogModel;
  BlogCard({Key? key, required this.blogModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.only(top: 20, bottom: 0),
      //decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _BlogCardDetails(
              //title: taskListProvider.tasks[i].title,
              // subTitle: taskListProvider.tasks[i].description,
              // title: account.title,
              id: blogModel.id,
              body: blogModel.body
              // item: account.item,
              // isSelected: isItemSelected,

              //subTitle: widget.task.description,
              ),
        ],
      ),
    );
  }
}

class _BlogCardDetails extends StatefulWidget {
  final String? id;
  final String? body;

  const _BlogCardDetails({this.id, this.body});

  @override
  State<_BlogCardDetails> createState() => _BlogCardDetailsState();
}

class _BlogCardDetailsState extends State<_BlogCardDetails> {
  final HttpService httpService = HttpService();
  final controller = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          // child: Image
                          //     .asset(
                          //   'assets/images/fguzhtnvdm6r42bl8dte0c5i8x6a.jfif',
                          // ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: HttpService().getImage(
                                controller.profileModel.value!.username),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    controller.profileModel.value!.name,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 0, 0),
                                    child: Icon(
                                      Icons.verified_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '@${controller.profileModel.value!.username}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF787878),
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  Text(
                                    ' • ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF787878),
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  Text(
                                    '2 hours ago',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF787878),
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    FaIcon(
                      FontAwesomeIcons.ellipsisV,
                      color: Color(0xFF787878),
                      size: 16,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                        child: Text(
                          widget.body.toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),

                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      //   child: Text(
                      //     'Cocreator 3.0 is here:\n🏬 FlutterFlow Marketplace\n👩‍💻 Support For Web Applications\n🚀 Web Deployment\n🎨Design Systems and Shared Media Assets for Teams\n👥 Custom Code Library for Teams\n\nLearn more and share your feedback 👇\nhttps://producthunt.com/posts/flutterflow-3-0\n\n#flutter #nocode',
                      //     style:
                      //         FlutterFlowTheme.of(context).bodyText1.override(
                      //               fontFamily: 'Poppins',
                      //               fontSize: 10,
                      //               fontWeight: FontWeight.normal,
                      //             ),
                      //   ),
                      // ),
                      // Image.asset(
                      //   'assets/images/FaQ4OguVEAExEh3.jfif',
                      //   width: 500,
                      //   height: 200,
                      //   fit: BoxFit.cover,
                      // ),
                      Container(
                        width: 500,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: httpService.getImage(widget.id.toString()),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 40,
                          child: Stack(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                ),
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/711/600',
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.1, 0),
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.commentAlt,
                                      color: Color(0xFF787878),
                                      size: 12,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 0, 2, 0),
                                      child: Text(
                                        '21',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.favorite,
                                color: FlutterFlowTheme.of(context).alternate,
                                size: 16,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(3, 0, 2, 0),
                                child: Text(
                                  '212',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.bookmark_border_outlined,
                      color: Color(0xFF333333),
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // child: Padding(
      //   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
      //   child: Container(
      //     width: double.infinity,
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.circular(20),
      //     ),
      //     child: Padding(
      //       padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      //       child: Column(
      //         mainAxisSize: MainAxisSize.max,
      //         children: [
      //           Padding(
      //             padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      //             child: Row(
      //               mainAxisSize: MainAxisSize.max,
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Row(
      //                   mainAxisSize: MainAxisSize.max,
      //                   children: [
      //                     Container(
      //                       width: 40,
      //                       height: 40,
      //                       clipBehavior: Clip.antiAlias,
      //                       decoration: BoxDecoration(
      //                         shape: BoxShape.circle,
      //                       ),
      //                       // child: Image
      //                       //     .asset(
      //                       //   'assets/images/fguzhtnvdm6r42bl8dte0c5i8x6a.jfif',
      //                       // ),
      //                       child: CircleAvatar(
      //                         radius: 50,
      //                         backgroundImage: HttpService().getImage(
      //                             controller.profileModel.value!.username),
      //                       ),
      //                     ),
      //                     Padding(
      //                       padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
      //                       child: Column(
      //                         mainAxisSize: MainAxisSize.max,
      //                         mainAxisAlignment: MainAxisAlignment.start,
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Row(
      //                             mainAxisSize: MainAxisSize.max,
      //                             children: [
      //                               Text(
      //                                 controller.profileModel.value!.name,
      //                                 style: FlutterFlowTheme.of(context)
      //                                     .bodyText1
      //                                     .override(
      //                                       fontFamily: 'Poppins',
      //                                       fontSize: 12,
      //                                     ),
      //                               ),
      //                               Padding(
      //                                 padding: EdgeInsetsDirectional.fromSTEB(
      //                                     2, 0, 0, 0),
      //                                 child: Icon(
      //                                   Icons.verified_rounded,
      //                                   color: FlutterFlowTheme.of(context)
      //                                       .primaryColor,
      //                                   size: 12,
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                           Row(
      //                             mainAxisSize: MainAxisSize.max,
      //                             children: [
      //                               Text(
      //                                 '@${controller.profileModel.value!.username}',
      //                                 style: FlutterFlowTheme.of(context)
      //                                     .bodyText1
      //                                     .override(
      //                                       fontFamily: 'Poppins',
      //                                       color: Color(0xFF787878),
      //                                       fontSize: 10,
      //                                       fontWeight: FontWeight.normal,
      //                                     ),
      //                               ),
      //                               Text(
      //                                 ' • ',
      //                                 style: FlutterFlowTheme.of(context)
      //                                     .bodyText1
      //                                     .override(
      //                                       fontFamily: 'Poppins',
      //                                       color: Color(0xFF787878),
      //                                       fontSize: 10,
      //                                       fontWeight: FontWeight.normal,
      //                                     ),
      //                               ),
      //                               Text(
      //                                 '2 hours ago',
      //                                 style: FlutterFlowTheme.of(context)
      //                                     .bodyText1
      //                                     .override(
      //                                       fontFamily: 'Poppins',
      //                                       color: Color(0xFF787878),
      //                                       fontSize: 10,
      //                                       fontWeight: FontWeight.normal,
      //                                     ),
      //                               ),
      //                             ],
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 FaIcon(
      //                   FontAwesomeIcons.ellipsisV,
      //                   color: Color(0xFF787878),
      //                   size: 16,
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Padding(
      //             padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
      //             child: Container(
      //               width: double.infinity,
      //               decoration: BoxDecoration(),
      //               child: Column(
      //                 mainAxisSize: MainAxisSize.max,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Padding(
      //                     padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
      //                     child: Text(
      //                       widget.body.toString(),
      //                       style:
      //                           FlutterFlowTheme.of(context).bodyText1.override(
      //                                 fontFamily: 'Poppins',
      //                                 fontSize: 10,
      //                                 fontWeight: FontWeight.normal,
      //                               ),
      //                     ),
      //                   ),
      //                   // Padding(
      //                   //   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
      //                   //   child: Text(
      //                   //     'Cocreator 3.0 is here:\n🏬 FlutterFlow Marketplace\n👩‍💻 Support For Web Applications\n🚀 Web Deployment\n🎨Design Systems and Shared Media Assets for Teams\n👥 Custom Code Library for Teams\n\nLearn more and share your feedback 👇\nhttps://producthunt.com/posts/flutterflow-3-0\n\n#flutter #nocode',
      //                   //     style:
      //                   //         FlutterFlowTheme.of(context).bodyText1.override(
      //                   //               fontFamily: 'Poppins',
      //                   //               fontSize: 10,
      //                   //               fontWeight: FontWeight.normal,
      //                   //             ),
      //                   //   ),
      //                   // ),
      //                   // Image.asset(
      //                   //   'assets/images/FaQ4OguVEAExEh3.jfif',
      //                   //   width: 500,
      //                   //   height: 200,
      //                   //   fit: BoxFit.cover,
      //                   // ),
      //                   Container(
      //                     height: MediaQuery.of(context).size.height,
      //                     width: MediaQuery.of(context).size.width,
      //                     decoration: BoxDecoration(
      //                       image: DecorationImage(
      //                           image:
      //                               httpService.getImage(widget.id.toString()),
      //                           fit: BoxFit.fill),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //           Padding(
      //             padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
      //             child: Row(
      //               mainAxisSize: MainAxisSize.max,
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Row(
      //                   mainAxisSize: MainAxisSize.max,
      //                   children: [
      //                     Container(
      //                       width: 40,
      //                       child: Stack(
      //                         children: [
      //                           Container(
      //                             width: 20,
      //                             height: 20,
      //                             decoration: BoxDecoration(
      //                               color: Colors.white,
      //                               shape: BoxShape.circle,
      //                               border: Border.all(
      //                                 color: Colors.white,
      //                                 width: 1,
      //                               ),
      //                             ),
      //                             child: Container(
      //                               width: 20,
      //                               height: 20,
      //                               clipBehavior: Clip.antiAlias,
      //                               decoration: BoxDecoration(
      //                                 shape: BoxShape.circle,
      //                               ),
      //                               child: Image.network(
      //                                 'https://picsum.photos/seed/711/600',
      //                               ),
      //                             ),
      //                           ),
      //                           Align(
      //                             alignment: AlignmentDirectional(0.1, 0),
      //                             child: Container(
      //                               width: 20,
      //                               height: 20,
      //                               decoration: BoxDecoration(
      //                                 color: FlutterFlowTheme.of(context)
      //                                     .secondaryBackground,
      //                                 shape: BoxShape.circle,
      //                                 border: Border.all(
      //                                   color: Colors.white,
      //                                   width: 1,
      //                                 ),
      //                               ),
      //                               child: Container(
      //                                 width: 20,
      //                                 height: 20,
      //                                 clipBehavior: Clip.antiAlias,
      //                                 decoration: BoxDecoration(
      //                                   shape: BoxShape.circle,
      //                                 ),
      //                                 child: Image.network(
      //                                   'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      //                                   fit: BoxFit.cover,
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     Padding(
      //                       padding:
      //                           EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
      //                       child: Row(
      //                         mainAxisSize: MainAxisSize.max,
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: [
      //                           Padding(
      //                             padding: EdgeInsetsDirectional.fromSTEB(
      //                                 0, 0, 5, 0),
      //                             child: Row(
      //                               mainAxisSize: MainAxisSize.max,
      //                               crossAxisAlignment: CrossAxisAlignment.end,
      //                               children: [
      //                                 FaIcon(
      //                                   FontAwesomeIcons.commentAlt,
      //                                   color: Color(0xFF787878),
      //                                   size: 12,
      //                                 ),
      //                                 Padding(
      //                                   padding: EdgeInsetsDirectional.fromSTEB(
      //                                       3, 0, 2, 0),
      //                                   child: Text(
      //                                     '21',
      //                                     style: FlutterFlowTheme.of(context)
      //                                         .bodyText1
      //                                         .override(
      //                                           fontFamily: 'Poppins',
      //                                           fontSize: 10,
      //                                           fontWeight: FontWeight.w500,
      //                                         ),
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                           Icon(
      //                             Icons.favorite,
      //                             color: FlutterFlowTheme.of(context).alternate,
      //                             size: 16,
      //                           ),
      //                           Padding(
      //                             padding: EdgeInsetsDirectional.fromSTEB(
      //                                 3, 0, 2, 0),
      //                             child: Text(
      //                               '212',
      //                               style: FlutterFlowTheme.of(context)
      //                                   .bodyText1
      //                                   .override(
      //                                     fontFamily: 'Poppins',
      //                                     fontSize: 10,
      //                                     fontWeight: FontWeight.w500,
      //                                   ),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 Icon(
      //                   Icons.bookmark_border_outlined,
      //                   color: Color(0xFF333333),
      //                   size: 16,
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      // child: Card(
      //   child: Stack(
      //     children: <Widget>[
      //       Container(
      //         height: MediaQuery.of(context).size.height,
      //         width: MediaQuery.of(context).size.width,
      //         decoration: BoxDecoration(
      //           image: DecorationImage(
      //               image: httpService.getImage(blogModel.id),
      //               fit: BoxFit.fill),
      //         ),
      //       ),
      //       Positioned(
      //         bottom: 2,
      //         child: Container(
      //           padding: const EdgeInsets.all(7),
      //           height: 60,
      //           width: MediaQuery.of(context).size.width - 30,
      //           decoration: BoxDecoration(
      //               color: Colors.white,
      //               borderRadius: BorderRadius.circular(8)),
      //           child: Text(
      //             blogModel.title,
      //             textAlign: TextAlign.center,
      //             style: const TextStyle(
      //               fontWeight: FontWeight.bold,
      //               fontSize: 15,
      //             ),
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
