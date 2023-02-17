import 'package:cocreator/pages/screens/socialmedia/home/components/editprofile/editprofile_widget.dart';
import 'package:cocreator/pages/screens/socialmedia/home/components/profile_model.dart';
import 'package:cocreator/pages/screens/socialmedia/home/controllers/profile_controller.dart';
import 'package:cocreator/pages/screens/socialmedia/services/http_service.dart';
import 'package:cocreator/pages/screens/socialmedia/widgets/blogs_list.dart';
import 'package:cocreator/pages/screens/socialmedia/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/nav_bar_with_middle_button_widget.dart';
import 'editprofile/editprofile_widget.dart';
import 'flutter_flow/flutter_flow_choice_chips.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'profile_model.dart';
// export 'profile_model.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({Key? key}) : super(key: key);

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  final controller = Get.put(ProfileController());

  // @override
  // void initState() {
  //   super.initState();
  //   controller.fetchData();
  // }

  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    controller.fetchData();
    _model = createModel(context, () => ProfileModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   //key: scaffoldKey,
    //   backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
    //   body: GestureDetector(
    //     //onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.max,
    //       children: [
    //         Expanded(
    //           child: Stack(
    //             children: [
    //               Column(
    //                 mainAxisSize: MainAxisSize.max,
    //                 children: [
    //                   InkWell(
    //                     onTap: () async {
    //                       await Future.delayed(
    //                           const Duration(milliseconds: 1000));
    //                     },
    //                     child: ClipRRect(
    //                       child: BackdropFilter(
    //                         filter: ImageFilter.blur(
    //                           sigmaX: 2,
    //                           sigmaY: 2,
    //                         ),
    //                         child: Align(
    //                           alignment: AlignmentDirectional(0, 0),
    //                           child: Image.asset(
    //                             'assets/images/5447432.jpg',
    //                             width: double.infinity,
    //                             height: 200,
    //                             fit: BoxFit.cover,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Align(
    //                 alignment: AlignmentDirectional(0, -0.85),
    //                 child: Padding(
    //                   padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
    //                   child: Row(
    //                     mainAxisSize: MainAxisSize.max,
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Container(
    //                         width: 40,
    //                         height: 40,
    //                         decoration: BoxDecoration(
    //                           color: Color(0x724B39EF),
    //                           borderRadius: BorderRadius.circular(10),
    //                         ),
    //                         child: ClipRRect(
    //                           child: BackdropFilter(
    //                             filter: ImageFilter.blur(
    //                               sigmaX: 1,
    //                               sigmaY: 1,
    //                             ),
    //                             child: Icon(
    //                               Icons.photo_camera_outlined,
    //                               color: Colors.white,
    //                               size: 24,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       Container(
    //                         width: 40,
    //                         height: 40,
    //                         decoration: BoxDecoration(
    //                           color: Color(0x724B39EF),
    //                           borderRadius: BorderRadius.circular(10),
    //                         ),
    //                         child: ClipRRect(
    //                           child: BackdropFilter(
    //                             filter: ImageFilter.blur(
    //                               sigmaX: 1,
    //                               sigmaY: 1,
    //                             ),
    //                             child: Icon(
    //                               Icons.keyboard_control_sharp,
    //                               color: Colors.white,
    //                               size: 20,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 80),
    //                 child: ListView(
    //                   padding: EdgeInsets.zero,
    //                   shrinkWrap: true,
    //                   scrollDirection: Axis.vertical,
    //                   children: [
    //                     Padding(
    //                       padding: EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
    //                       child: Container(
    //                         width: double.infinity,
    //                         decoration: BoxDecoration(
    //                           color: Color(0xFFF9F9F9),
    //                           borderRadius: BorderRadius.only(
    //                             bottomLeft: Radius.circular(0),
    //                             bottomRight: Radius.circular(0),
    //                             topLeft: Radius.circular(30),
    //                             topRight: Radius.circular(30),
    //                           ),
    //                         ),
    //                         child: Column(
    //                           mainAxisSize: MainAxisSize.max,
    //                           children: [
    //                             Padding(
    //                               padding: EdgeInsetsDirectional.fromSTEB(
    //                                   20, 20, 20, 0),
    //                               child: Row(
    //                                 mainAxisSize: MainAxisSize.max,
    //                                 mainAxisAlignment:
    //                                     MainAxisAlignment.spaceBetween,
    //                                 children: [
    //                                   Stack(
    //                                     children: [
    //                                       InkWell(
    //                                         onTap: () async {
    //                                           await Navigator.push(
    //                                             context,
    //                                             PageTransition(
    //                                               type: PageTransitionType.fade,
    //                                               duration: Duration(
    //                                                   milliseconds: 300),
    //                                               reverseDuration: Duration(
    //                                                   milliseconds: 300),
    //                                               child: EditprofileWidget(),
    //                                             ),
    //                                           );
    //                                         },
    //                                         child: Container(
    //                                           width: 50,
    //                                           height: 50,
    //                                           clipBehavior: Clip.antiAlias,
    //                                           decoration: BoxDecoration(
    //                                             shape: BoxShape.circle,
    //                                           ),
    //                                           child: Image.asset(
    //                                             'assets/images/fguzhtnvdm6r42bl8dte0c5i8x6a.jfif',
    //                                           ),
    //                                         ),
    //                                       ),
    //                                       Padding(
    //                                         padding:
    //                                             EdgeInsetsDirectional.fromSTEB(
    //                                                 35, 40, 0, 0),
    //                                         child: FaIcon(
    //                                           FontAwesomeIcons.solidCircle,
    //                                           color: Color(0xFF27DA3E),
    //                                           size: 10,
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                   Expanded(
    //                                     child: Row(
    //                                       mainAxisSize: MainAxisSize.max,
    //                                       mainAxisAlignment:
    //                                           MainAxisAlignment.spaceEvenly,
    //                                       children: [
    //                                         Row(
    //                                           mainAxisSize: MainAxisSize.max,
    //                                           children: [
    //                                             Padding(
    //                                               padding: EdgeInsetsDirectional
    //                                                   .fromSTEB(5, 0, 0, 0),
    //                                               child: Container(
    //                                                 width: 70,
    //                                                 height: 50,
    //                                                 decoration: BoxDecoration(
    //                                                   color: Colors.white,
    //                                                   borderRadius:
    //                                                       BorderRadius.circular(
    //                                                           10),
    //                                                 ),
    //                                                 child: Column(
    //                                                   mainAxisSize:
    //                                                       MainAxisSize.max,
    //                                                   mainAxisAlignment:
    //                                                       MainAxisAlignment
    //                                                           .center,
    //                                                   children: [
    //                                                     Text(
    //                                                       '604',
    //                                                       textAlign:
    //                                                           TextAlign.center,
    //                                                       style: FlutterFlowTheme
    //                                                               .of(context)
    //                                                           .bodyText1,
    //                                                     ),
    //                                                     Text(
    //                                                       'Posts',
    //                                                       textAlign:
    //                                                           TextAlign.center,
    //                                                       style: FlutterFlowTheme
    //                                                               .of(context)
    //                                                           .bodyText1
    //                                                           .override(
    //                                                             fontFamily:
    //                                                                 'Poppins',
    //                                                             color: Color(
    //                                                                 0xFFB3B3B3),
    //                                                             fontSize: 8,
    //                                                           ),
    //                                                     ),
    //                                                   ],
    //                                                 ),
    //                                               ),
    //                                             ),
    //                                             Padding(
    //                                               padding: EdgeInsetsDirectional
    //                                                   .fromSTEB(5, 0, 0, 0),
    //                                               child: Container(
    //                                                 width: 70,
    //                                                 height: 50,
    //                                                 decoration: BoxDecoration(
    //                                                   color: Colors.white,
    //                                                   borderRadius:
    //                                                       BorderRadius.circular(
    //                                                           10),
    //                                                 ),
    //                                                 child: Column(
    //                                                   mainAxisSize:
    //                                                       MainAxisSize.max,
    //                                                   mainAxisAlignment:
    //                                                       MainAxisAlignment
    //                                                           .center,
    //                                                   children: [
    //                                                     Text(
    //                                                       '705k',
    //                                                       textAlign:
    //                                                           TextAlign.center,
    //                                                       style: FlutterFlowTheme
    //                                                               .of(context)
    //                                                           .bodyText1,
    //                                                     ),
    //                                                     Text(
    //                                                       'Followers',
    //                                                       textAlign:
    //                                                           TextAlign.center,
    //                                                       style: FlutterFlowTheme
    //                                                               .of(context)
    //                                                           .bodyText1
    //                                                           .override(
    //                                                             fontFamily:
    //                                                                 'Poppins',
    //                                                             color: Color(
    //                                                                 0xFFB3B3B3),
    //                                                             fontSize: 8,
    //                                                           ),
    //                                                     ),
    //                                                   ],
    //                                                 ),
    //                                               ),
    //                                             ),
    //                                             Padding(
    //                                               padding: EdgeInsetsDirectional
    //                                                   .fromSTEB(5, 0, 0, 0),
    //                                               child: Container(
    //                                                 width: 70,
    //                                                 height: 50,
    //                                                 decoration: BoxDecoration(
    //                                                   color: Colors.white,
    //                                                   borderRadius:
    //                                                       BorderRadius.circular(
    //                                                           10),
    //                                                 ),
    //                                                 child: Column(
    //                                                   mainAxisSize:
    //                                                       MainAxisSize.max,
    //                                                   mainAxisAlignment:
    //                                                       MainAxisAlignment
    //                                                           .center,
    //                                                   children: [
    //                                                     Text(
    //                                                       '12',
    //                                                       textAlign:
    //                                                           TextAlign.center,
    //                                                       style: FlutterFlowTheme
    //                                                               .of(context)
    //                                                           .bodyText1,
    //                                                     ),
    //                                                     Text(
    //                                                       'Following',
    //                                                       textAlign:
    //                                                           TextAlign.center,
    //                                                       style: FlutterFlowTheme
    //                                                               .of(context)
    //                                                           .bodyText1
    //                                                           .override(
    //                                                             fontFamily:
    //                                                                 'Poppins',
    //                                                             color: Color(
    //                                                                 0xFFB3B3B3),
    //                                                             fontSize: 8,
    //                                                           ),
    //                                                     ),
    //                                                   ],
    //                                                 ),
    //                                               ),
    //                                             ),
    //                                             Padding(
    //                                               padding: EdgeInsetsDirectional
    //                                                   .fromSTEB(5, 0, 0, 0),
    //                                               child: Container(
    //                                                 width: 30,
    //                                                 height: 50,
    //                                                 decoration: BoxDecoration(
    //                                                   color: Colors.white,
    //                                                   borderRadius:
    //                                                       BorderRadius.circular(
    //                                                           10),
    //                                                 ),
    //                                                 child: Icon(
    //                                                   Icons
    //                                                       .arrow_drop_down_rounded,
    //                                                   color: Color(0xFF333333),
    //                                                   size: 20,
    //                                                 ),
    //                                               ),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                             Padding(
    //                               padding: EdgeInsetsDirectional.fromSTEB(
    //                                   20, 20, 20, 0),
    //                               child: Row(
    //                                 mainAxisSize: MainAxisSize.max,
    //                                 children: [
    //                                   Text(
    //                                     'Abel Mengistu',
    //                                     style: FlutterFlowTheme.of(context)
    //                                         .bodyText1,
    //                                   ),
    //                                   Padding(
    //                                     padding: EdgeInsetsDirectional.fromSTEB(
    //                                         5, 0, 0, 0),
    //                                     child: Icon(
    //                                       Icons.verified_rounded,
    //                                       color: FlutterFlowTheme.of(context)
    //                                           .primaryColor,
    //                                       size: 16,
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                             Padding(
    //                               padding: EdgeInsetsDirectional.fromSTEB(
    //                                   20, 0, 20, 0),
    //                               child: Row(
    //                                 mainAxisSize: MainAxisSize.max,
    //                                 children: [
    //                                   Text(
    //                                     '@abelmengistu',
    //                                     style: FlutterFlowTheme.of(context)
    //                                         .bodyText1
    //                                         .override(
    //                                           fontFamily: 'Poppins',
    //                                           color: Color(0xFF787878),
    //                                           fontSize: 12,
    //                                           fontWeight: FontWeight.normal,
    //                                         ),
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                             Padding(
    //                               padding: EdgeInsetsDirectional.fromSTEB(
    //                                   20, 20, 20, 0),
    //                               child: Row(
    //                                 mainAxisSize: MainAxisSize.max,
    //                                 children: [
    //                                   Expanded(
    //                                     child: FlutterFlowChoiceChips(
    //                                       initiallySelected: ['Posts'],
    //                                       options: [
    //                                         ChipData('Posts'),
    //                                         ChipData('Status'),
    //                                         ChipData('Bio')
    //                                       ],
    //                                       onChanged: (val) => setState(() =>
    //                                           _model.choiceChipsValue =
    //                                               val?.first),
    //                                       selectedChipStyle: ChipStyle(
    //                                         backgroundColor:
    //                                             FlutterFlowTheme.of(context)
    //                                                 .primaryColor,
    //                                         textStyle:
    //                                             FlutterFlowTheme.of(context)
    //                                                 .bodyText1
    //                                                 .override(
    //                                                   fontFamily: 'Poppins',
    //                                                   color: Colors.white,
    //                                                 ),
    //                                         iconColor: Colors.white,
    //                                         iconSize: 0,
    //                                         elevation: 0,
    //                                       ),
    //                                       unselectedChipStyle: ChipStyle(
    //                                         backgroundColor: Colors.white,
    //                                         textStyle:
    //                                             FlutterFlowTheme.of(context)
    //                                                 .bodyText2
    //                                                 .override(
    //                                                   fontFamily: 'Poppins',
    //                                                   color: Color(0xFF787878),
    //                                                   fontSize: 12,
    //                                                 ),
    //                                         iconColor: Color(0xFFB3B3B3),
    //                                         iconSize: 18,
    //                                         elevation: 0,
    //                                       ),
    //                                       chipSpacing: 20,
    //                                       multiselect: false,
    //                                       initialized:
    //                                           _model.choiceChipsValue != null,
    //                                       alignment: WrapAlignment.start,
    //                                     ),
    //                                   ),
    //                                   Row(
    //                                     mainAxisSize: MainAxisSize.max,
    //                                     children: [
    //                                       Icon(
    //                                         Icons.filter_list,
    //                                         color: Color(0xFF787878),
    //                                         size: 24,
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                             Padding(
    //                               padding: EdgeInsetsDirectional.fromSTEB(
    //                                   10, 10, 10, 15),
    //                               child: ListView(
    //                                 padding: EdgeInsets.zero,
    //                                 primary: false,
    //                                 shrinkWrap: true,
    //                                 scrollDirection: Axis.vertical,
    //                                 children: [
    //                                   Padding(
    //                                     padding: EdgeInsetsDirectional.fromSTEB(
    //                                         0, 0, 0, 10),
    //                                     child: Container(
    //                                       width: double.infinity,
    //                                       decoration: BoxDecoration(
    //                                         color: Colors.white,
    //                                         borderRadius:
    //                                             BorderRadius.circular(20),
    //                                       ),
    //                                       child: Padding(
    //                                         padding:
    //                                             EdgeInsetsDirectional.fromSTEB(
    //                                                 10, 10, 10, 10),
    //                                         child: Column(
    //                                           mainAxisSize: MainAxisSize.max,
    //                                           children: [
    //                                             Padding(
    //                                               padding: EdgeInsetsDirectional
    //                                                   .fromSTEB(10, 0, 10, 0),
    //                                               child: Row(
    //                                                 mainAxisSize:
    //                                                     MainAxisSize.max,
    //                                                 mainAxisAlignment:
    //                                                     MainAxisAlignment
    //                                                         .spaceBetween,
    //                                                 children: [
    //                                                   Row(
    //                                                     mainAxisSize:
    //                                                         MainAxisSize.max,
    //                                                     children: [
    //                                                       Container(
    //                                                         width: 40,
    //                                                         height: 40,
    //                                                         clipBehavior:
    //                                                             Clip.antiAlias,
    //                                                         decoration:
    //                                                             BoxDecoration(
    //                                                           shape: BoxShape
    //                                                               .circle,
    //                                                         ),
    //                                                         child: Image.asset(
    //                                                           'assets/images/fguzhtnvdm6r42bl8dte0c5i8x6a.jfif',
    //                                                         ),
    //                                                       ),
    //                                                       Padding(
    //                                                         padding:
    //                                                             EdgeInsetsDirectional
    //                                                                 .fromSTEB(
    //                                                                     5,
    //                                                                     0,
    //                                                                     0,
    //                                                                     0),
    //                                                         child: Column(
    //                                                           mainAxisSize:
    //                                                               MainAxisSize
    //                                                                   .max,
    //                                                           mainAxisAlignment:
    //                                                               MainAxisAlignment
    //                                                                   .start,
    //                                                           crossAxisAlignment:
    //                                                               CrossAxisAlignment
    //                                                                   .start,
    //                                                           children: [
    //                                                             Row(
    //                                                               mainAxisSize:
    //                                                                   MainAxisSize
    //                                                                       .max,
    //                                                               children: [
    //                                                                 Text(
    //                                                                   'Abel Mengistu',
    //                                                                   style: FlutterFlowTheme.of(
    //                                                                           context)
    //                                                                       .bodyText1
    //                                                                       .override(
    //                                                                         fontFamily:
    //                                                                             'Poppins',
    //                                                                         fontSize:
    //                                                                             12,
    //                                                                       ),
    //                                                                 ),
    //                                                                 Padding(
    //                                                                   padding: EdgeInsetsDirectional
    //                                                                       .fromSTEB(
    //                                                                           2,
    //                                                                           0,
    //                                                                           0,
    //                                                                           0),
    //                                                                   child:
    //                                                                       Icon(
    //                                                                     Icons
    //                                                                         .verified_rounded,
    //                                                                     color: FlutterFlowTheme.of(context)
    //                                                                         .primaryColor,
    //                                                                     size:
    //                                                                         12,
    //                                                                   ),
    //                                                                 ),
    //                                                               ],
    //                                                             ),
    //                                                             Row(
    //                                                               mainAxisSize:
    //                                                                   MainAxisSize
    //                                                                       .max,
    //                                                               children: [
    //                                                                 Text(
    //                                                                   '@abelmengistu',
    //                                                                   style: FlutterFlowTheme.of(
    //                                                                           context)
    //                                                                       .bodyText1
    //                                                                       .override(
    //                                                                         fontFamily:
    //                                                                             'Poppins',
    //                                                                         color:
    //                                                                             Color(0xFF787878),
    //                                                                         fontSize:
    //                                                                             10,
    //                                                                         fontWeight:
    //                                                                             FontWeight.normal,
    //                                                                       ),
    //                                                                 ),
    //                                                                 Text(
    //                                                                   ' • ',
    //                                                                   style: FlutterFlowTheme.of(
    //                                                                           context)
    //                                                                       .bodyText1
    //                                                                       .override(
    //                                                                         fontFamily:
    //                                                                             'Poppins',
    //                                                                         color:
    //                                                                             Color(0xFF787878),
    //                                                                         fontSize:
    //                                                                             10,
    //                                                                         fontWeight:
    //                                                                             FontWeight.normal,
    //                                                                       ),
    //                                                                 ),
    //                                                                 Text(
    //                                                                   '2 hours ago',
    //                                                                   style: FlutterFlowTheme.of(
    //                                                                           context)
    //                                                                       .bodyText1
    //                                                                       .override(
    //                                                                         fontFamily:
    //                                                                             'Poppins',
    //                                                                         color:
    //                                                                             Color(0xFF787878),
    //                                                                         fontSize:
    //                                                                             10,
    //                                                                         fontWeight:
    //                                                                             FontWeight.normal,
    //                                                                       ),
    //                                                                 ),
    //                                                               ],
    //                                                             ),
    //                                                           ],
    //                                                         ),
    //                                                       ),
    //                                                     ],
    //                                                   ),
    //                                                   FaIcon(
    //                                                     FontAwesomeIcons
    //                                                         .ellipsisV,
    //                                                     color:
    //                                                         Color(0xFF787878),
    //                                                     size: 16,
    //                                                   ),
    //                                                 ],
    //                                               ),
    //                                             ),
    //                                             Padding(
    //                                               padding: EdgeInsetsDirectional
    //                                                   .fromSTEB(0, 5, 0, 0),
    //                                               child: Container(
    //                                                 width: double.infinity,
    //                                                 decoration: BoxDecoration(),
    //                                                 child: Column(
    //                                                   mainAxisSize:
    //                                                       MainAxisSize.max,
    //                                                   crossAxisAlignment:
    //                                                       CrossAxisAlignment
    //                                                           .start,
    //                                                   children: [
    //                                                     Padding(
    //                                                       padding:
    //                                                           EdgeInsetsDirectional
    //                                                               .fromSTEB(0,
    //                                                                   0, 0, 5),
    //                                                       child: Text(
    //                                                         'FlutterFlow 3.0 is here:\n🏬 FlutterFlow Marketplace\n👩‍💻 Support For Web Applications\n🚀 Web Deployment\n🎨Design Systems and Shared Media Assets for Teams\n👥 Custom Code Library for Teams\n\nLearn more and share your feedback 👇\nhttps://producthunt.com/posts/flutterflow-3-0\n\n#flutter #nocode',
    //                                                         style: FlutterFlowTheme
    //                                                                 .of(context)
    //                                                             .bodyText1
    //                                                             .override(
    //                                                               fontFamily:
    //                                                                   'Poppins',
    //                                                               fontSize: 10,
    //                                                               fontWeight:
    //                                                                   FontWeight
    //                                                                       .normal,
    //                                                             ),
    //                                                       ),
    //                                                     ),
    //                                                     Image.asset(
    //                                                       'assets/images/FaQ4OguVEAExEh3.jfif',
    //                                                       width: 500,
    //                                                       height: 200,
    //                                                       fit: BoxFit.cover,
    //                                                     ),
    //                                                   ],
    //                                                 ),
    //                                               ),
    //                                             ),
    //                                             Padding(
    //                                               padding: EdgeInsetsDirectional
    //                                                   .fromSTEB(0, 5, 0, 0),
    //                                               child: Row(
    //                                                 mainAxisSize:
    //                                                     MainAxisSize.max,
    //                                                 mainAxisAlignment:
    //                                                     MainAxisAlignment
    //                                                         .spaceBetween,
    //                                                 children: [
    //                                                   Row(
    //                                                     mainAxisSize:
    //                                                         MainAxisSize.max,
    //                                                     children: [
    //                                                       Container(
    //                                                         width: 40,
    //                                                         child: Stack(
    //                                                           children: [
    //                                                             Container(
    //                                                               width: 20,
    //                                                               height: 20,
    //                                                               decoration:
    //                                                                   BoxDecoration(
    //                                                                 color: Colors
    //                                                                     .white,
    //                                                                 shape: BoxShape
    //                                                                     .circle,
    //                                                                 border:
    //                                                                     Border
    //                                                                         .all(
    //                                                                   color: Colors
    //                                                                       .white,
    //                                                                   width: 1,
    //                                                                 ),
    //                                                               ),
    //                                                               child:
    //                                                                   Container(
    //                                                                 width: 20,
    //                                                                 height: 20,
    //                                                                 clipBehavior:
    //                                                                     Clip.antiAlias,
    //                                                                 decoration:
    //                                                                     BoxDecoration(
    //                                                                   shape: BoxShape
    //                                                                       .circle,
    //                                                                 ),
    //                                                                 child: Image
    //                                                                     .network(
    //                                                                   'https://picsum.photos/seed/711/600',
    //                                                                 ),
    //                                                               ),
    //                                                             ),
    //                                                             Align(
    //                                                               alignment:
    //                                                                   AlignmentDirectional(
    //                                                                       0.1,
    //                                                                       0),
    //                                                               child:
    //                                                                   Container(
    //                                                                 width: 20,
    //                                                                 height: 20,
    //                                                                 decoration:
    //                                                                     BoxDecoration(
    //                                                                   color: FlutterFlowTheme.of(
    //                                                                           context)
    //                                                                       .secondaryBackground,
    //                                                                   shape: BoxShape
    //                                                                       .circle,
    //                                                                   border:
    //                                                                       Border
    //                                                                           .all(
    //                                                                     color: Colors
    //                                                                         .white,
    //                                                                     width:
    //                                                                         1,
    //                                                                   ),
    //                                                                 ),
    //                                                                 child:
    //                                                                     Container(
    //                                                                   width: 20,
    //                                                                   height:
    //                                                                       20,
    //                                                                   clipBehavior:
    //                                                                       Clip.antiAlias,
    //                                                                   decoration:
    //                                                                       BoxDecoration(
    //                                                                     shape: BoxShape
    //                                                                         .circle,
    //                                                                   ),
    //                                                                   child: Image
    //                                                                       .network(
    //                                                                     'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    //                                                                     fit: BoxFit
    //                                                                         .cover,
    //                                                                   ),
    //                                                                 ),
    //                                                               ),
    //                                                             ),
    //                                                           ],
    //                                                         ),
    //                                                       ),
    //                                                       Padding(
    //                                                         padding:
    //                                                             EdgeInsetsDirectional
    //                                                                 .fromSTEB(
    //                                                                     0,
    //                                                                     0,
    //                                                                     10,
    //                                                                     0),
    //                                                         child: Row(
    //                                                           mainAxisSize:
    //                                                               MainAxisSize
    //                                                                   .max,
    //                                                           crossAxisAlignment:
    //                                                               CrossAxisAlignment
    //                                                                   .center,
    //                                                           children: [
    //                                                             Padding(
    //                                                               padding: EdgeInsetsDirectional
    //                                                                   .fromSTEB(
    //                                                                       0,
    //                                                                       0,
    //                                                                       5,
    //                                                                       0),
    //                                                               child: Row(
    //                                                                 mainAxisSize:
    //                                                                     MainAxisSize
    //                                                                         .max,
    //                                                                 crossAxisAlignment:
    //                                                                     CrossAxisAlignment
    //                                                                         .end,
    //                                                                 children: [
    //                                                                   FaIcon(
    //                                                                     FontAwesomeIcons
    //                                                                         .commentAlt,
    //                                                                     color: Color(
    //                                                                         0xFF787878),
    //                                                                     size:
    //                                                                         12,
    //                                                                   ),
    //                                                                   Padding(
    //                                                                     padding: EdgeInsetsDirectional.fromSTEB(
    //                                                                         3,
    //                                                                         0,
    //                                                                         2,
    //                                                                         0),
    //                                                                     child:
    //                                                                         Text(
    //                                                                       '21',
    //                                                                       style: FlutterFlowTheme.of(context)
    //                                                                           .bodyText1
    //                                                                           .override(
    //                                                                             fontFamily: 'Poppins',
    //                                                                             fontSize: 10,
    //                                                                             fontWeight: FontWeight.w500,
    //                                                                           ),
    //                                                                     ),
    //                                                                   ),
    //                                                                 ],
    //                                                               ),
    //                                                             ),
    //                                                             Icon(
    //                                                               Icons
    //                                                                   .favorite,
    //                                                               color: FlutterFlowTheme.of(
    //                                                                       context)
    //                                                                   .alternate,
    //                                                               size: 16,
    //                                                             ),
    //                                                             Padding(
    //                                                               padding: EdgeInsetsDirectional
    //                                                                   .fromSTEB(
    //                                                                       3,
    //                                                                       0,
    //                                                                       2,
    //                                                                       0),
    //                                                               child: Text(
    //                                                                 '212',
    //                                                                 style: FlutterFlowTheme.of(
    //                                                                         context)
    //                                                                     .bodyText1
    //                                                                     .override(
    //                                                                       fontFamily:
    //                                                                           'Poppins',
    //                                                                       fontSize:
    //                                                                           10,
    //                                                                       fontWeight:
    //                                                                           FontWeight.w500,
    //                                                                     ),
    //                                                               ),
    //                                                             ),
    //                                                           ],
    //                                                         ),
    //                                                       ),
    //                                                     ],
    //                                                   ),
    //                                                   Icon(
    //                                                     Icons
    //                                                         .bookmark_border_outlined,
    //                                                     color:
    //                                                         Color(0xFF333333),
    //                                                     size: 16,
    //                                                   ),
    //                                                 ],
    //                                               ),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                   Padding(
    //                                     padding: EdgeInsetsDirectional.fromSTEB(
    //                                         0, 0, 0, 10),
    //                                     child: Container(
    //                                       width: double.infinity,
    //                                       decoration: BoxDecoration(
    //                                         color: Colors.white,
    //                                         borderRadius:
    //                                             BorderRadius.circular(20),
    //                                       ),
    //                                       child: Padding(
    //                                         padding:
    //                                             EdgeInsetsDirectional.fromSTEB(
    //                                                 10, 10, 10, 10),
    //                                         child: Column(
    //                                           mainAxisSize: MainAxisSize.max,
    //                                           children: [
    //                                             Padding(
    //                                               padding: EdgeInsetsDirectional
    //                                                   .fromSTEB(10, 0, 10, 0),
    //                                               child: Row(
    //                                                 mainAxisSize:
    //                                                     MainAxisSize.max,
    //                                                 mainAxisAlignment:
    //                                                     MainAxisAlignment
    //                                                         .spaceBetween,
    //                                                 children: [
    //                                                   Row(
    //                                                     mainAxisSize:
    //                                                         MainAxisSize.max,
    //                                                     children: [
    //                                                       Container(
    //                                                         width: 40,
    //                                                         height: 40,
    //                                                         clipBehavior:
    //                                                             Clip.antiAlias,
    //                                                         decoration:
    //                                                             BoxDecoration(
    //                                                           shape: BoxShape
    //                                                               .circle,
    //                                                         ),
    //                                                         child: Image.asset(
    //                                                           'assets/images/fguzhtnvdm6r42bl8dte0c5i8x6a.jfif',
    //                                                         ),
    //                                                       ),
    //                                                       Padding(
    //                                                         padding:
    //                                                             EdgeInsetsDirectional
    //                                                                 .fromSTEB(
    //                                                                     5,
    //                                                                     0,
    //                                                                     0,
    //                                                                     0),
    //                                                         child: Column(
    //                                                           mainAxisSize:
    //                                                               MainAxisSize
    //                                                                   .max,
    //                                                           mainAxisAlignment:
    //                                                               MainAxisAlignment
    //                                                                   .start,
    //                                                           crossAxisAlignment:
    //                                                               CrossAxisAlignment
    //                                                                   .start,
    //                                                           children: [
    //                                                             Row(
    //                                                               mainAxisSize:
    //                                                                   MainAxisSize
    //                                                                       .max,
    //                                                               children: [
    //                                                                 Text(
    //                                                                   'Abel Mengistu',
    //                                                                   style: FlutterFlowTheme.of(
    //                                                                           context)
    //                                                                       .bodyText1
    //                                                                       .override(
    //                                                                         fontFamily:
    //                                                                             'Poppins',
    //                                                                         fontSize:
    //                                                                             12,
    //                                                                       ),
    //                                                                 ),
    //                                                                 Padding(
    //                                                                   padding: EdgeInsetsDirectional
    //                                                                       .fromSTEB(
    //                                                                           2,
    //                                                                           0,
    //                                                                           0,
    //                                                                           0),
    //                                                                   child:
    //                                                                       Icon(
    //                                                                     Icons
    //                                                                         .verified_rounded,
    //                                                                     color: FlutterFlowTheme.of(context)
    //                                                                         .primaryColor,
    //                                                                     size:
    //                                                                         12,
    //                                                                   ),
    //                                                                 ),
    //                                                               ],
    //                                                             ),
    //                                                             Text(
    //                                                               '@abelmengistu',
    //                                                               style: FlutterFlowTheme.of(
    //                                                                       context)
    //                                                                   .bodyText1
    //                                                                   .override(
    //                                                                     fontFamily:
    //                                                                         'Poppins',
    //                                                                     color: Color(
    //                                                                         0xFF787878),
    //                                                                     fontSize:
    //                                                                         10,
    //                                                                     fontWeight:
    //                                                                         FontWeight.normal,
    //                                                                   ),
    //                                                             ),
    //                                                           ],
    //                                                         ),
    //                                                       ),
    //                                                     ],
    //                                                   ),
    //                                                   FaIcon(
    //                                                     FontAwesomeIcons
    //                                                         .ellipsisV,
    //                                                     color:
    //                                                         Color(0xFF787878),
    //                                                     size: 16,
    //                                                   ),
    //                                                 ],
    //                                               ),
    //                                             ),
    //                                             Padding(
    //                                               padding: EdgeInsetsDirectional
    //                                                   .fromSTEB(0, 5, 0, 0),
    //                                               child: Container(
    //                                                 width: double.infinity,
    //                                                 decoration: BoxDecoration(),
    //                                                 child: Text(
    //                                                   'I\'m going to improve Flutter Flow for the whole community, implementing features to improve the user experience.',
    //                                                   style:
    //                                                       FlutterFlowTheme.of(
    //                                                               context)
    //                                                           .bodyText1
    //                                                           .override(
    //                                                             fontFamily:
    //                                                                 'Poppins',
    //                                                             fontSize: 10,
    //                                                             fontWeight:
    //                                                                 FontWeight
    //                                                                     .normal,
    //                                                           ),
    //                                                 ),
    //                                               ),
    //                                             ),
    //                                             Padding(
    //                                               padding: EdgeInsetsDirectional
    //                                                   .fromSTEB(0, 5, 0, 0),
    //                                               child: Row(
    //                                                 mainAxisSize:
    //                                                     MainAxisSize.max,
    //                                                 mainAxisAlignment:
    //                                                     MainAxisAlignment
    //                                                         .spaceBetween,
    //                                                 children: [
    //                                                   Row(
    //                                                     mainAxisSize:
    //                                                         MainAxisSize.max,
    //                                                     children: [
    //                                                       Container(
    //                                                         width: 40,
    //                                                         child: Stack(
    //                                                           children: [
    //                                                             Container(
    //                                                               width: 20,
    //                                                               height: 20,
    //                                                               decoration:
    //                                                                   BoxDecoration(
    //                                                                 color: Colors
    //                                                                     .white,
    //                                                                 shape: BoxShape
    //                                                                     .circle,
    //                                                                 border:
    //                                                                     Border
    //                                                                         .all(
    //                                                                   color: Colors
    //                                                                       .white,
    //                                                                   width: 1,
    //                                                                 ),
    //                                                               ),
    //                                                               child:
    //                                                                   Container(
    //                                                                 width: 20,
    //                                                                 height: 20,
    //                                                                 clipBehavior:
    //                                                                     Clip.antiAlias,
    //                                                                 decoration:
    //                                                                     BoxDecoration(
    //                                                                   shape: BoxShape
    //                                                                       .circle,
    //                                                                 ),
    //                                                                 child: Image
    //                                                                     .network(
    //                                                                   'https://picsum.photos/seed/711/600',
    //                                                                 ),
    //                                                               ),
    //                                                             ),
    //                                                             Align(
    //                                                               alignment:
    //                                                                   AlignmentDirectional(
    //                                                                       0.1,
    //                                                                       0),
    //                                                               child:
    //                                                                   Container(
    //                                                                 width: 20,
    //                                                                 height: 20,
    //                                                                 decoration:
    //                                                                     BoxDecoration(
    //                                                                   color: FlutterFlowTheme.of(
    //                                                                           context)
    //                                                                       .secondaryBackground,
    //                                                                   shape: BoxShape
    //                                                                       .circle,
    //                                                                   border:
    //                                                                       Border
    //                                                                           .all(
    //                                                                     color: Colors
    //                                                                         .white,
    //                                                                     width:
    //                                                                         1,
    //                                                                   ),
    //                                                                 ),
    //                                                                 child:
    //                                                                     Container(
    //                                                                   width: 20,
    //                                                                   height:
    //                                                                       20,
    //                                                                   clipBehavior:
    //                                                                       Clip.antiAlias,
    //                                                                   decoration:
    //                                                                       BoxDecoration(
    //                                                                     shape: BoxShape
    //                                                                         .circle,
    //                                                                   ),
    //                                                                   child: Image
    //                                                                       .network(
    //                                                                     'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    //                                                                     fit: BoxFit
    //                                                                         .cover,
    //                                                                   ),
    //                                                                 ),
    //                                                               ),
    //                                                             ),
    //                                                           ],
    //                                                         ),
    //                                                       ),
    //                                                       Padding(
    //                                                         padding:
    //                                                             EdgeInsetsDirectional
    //                                                                 .fromSTEB(
    //                                                                     0,
    //                                                                     0,
    //                                                                     10,
    //                                                                     0),
    //                                                         child: Row(
    //                                                           mainAxisSize:
    //                                                               MainAxisSize
    //                                                                   .max,
    //                                                           crossAxisAlignment:
    //                                                               CrossAxisAlignment
    //                                                                   .center,
    //                                                           children: [
    //                                                             Padding(
    //                                                               padding: EdgeInsetsDirectional
    //                                                                   .fromSTEB(
    //                                                                       0,
    //                                                                       0,
    //                                                                       5,
    //                                                                       0),
    //                                                               child: Row(
    //                                                                 mainAxisSize:
    //                                                                     MainAxisSize
    //                                                                         .max,
    //                                                                 crossAxisAlignment:
    //                                                                     CrossAxisAlignment
    //                                                                         .end,
    //                                                                 children: [
    //                                                                   FaIcon(
    //                                                                     FontAwesomeIcons
    //                                                                         .commentAlt,
    //                                                                     color: Color(
    //                                                                         0xFF787878),
    //                                                                     size:
    //                                                                         12,
    //                                                                   ),
    //                                                                   Padding(
    //                                                                     padding: EdgeInsetsDirectional.fromSTEB(
    //                                                                         3,
    //                                                                         0,
    //                                                                         2,
    //                                                                         0),
    //                                                                     child:
    //                                                                         Text(
    //                                                                       '4',
    //                                                                       style: FlutterFlowTheme.of(context)
    //                                                                           .bodyText1
    //                                                                           .override(
    //                                                                             fontFamily: 'Poppins',
    //                                                                             fontSize: 10,
    //                                                                             fontWeight: FontWeight.w500,
    //                                                                           ),
    //                                                                     ),
    //                                                                   ),
    //                                                                 ],
    //                                                               ),
    //                                                             ),
    //                                                             Icon(
    //                                                               Icons
    //                                                                   .favorite,
    //                                                               color: FlutterFlowTheme.of(
    //                                                                       context)
    //                                                                   .alternate,
    //                                                               size: 16,
    //                                                             ),
    //                                                             Padding(
    //                                                               padding: EdgeInsetsDirectional
    //                                                                   .fromSTEB(
    //                                                                       3,
    //                                                                       0,
    //                                                                       2,
    //                                                                       0),
    //                                                               child: Text(
    //                                                                 '12',
    //                                                                 style: FlutterFlowTheme.of(
    //                                                                         context)
    //                                                                     .bodyText1
    //                                                                     .override(
    //                                                                       fontFamily:
    //                                                                           'Poppins',
    //                                                                       fontSize:
    //                                                                           10,
    //                                                                       fontWeight:
    //                                                                           FontWeight.w500,
    //                                                                     ),
    //                                                               ),
    //                                                             ),
    //                                                           ],
    //                                                         ),
    //                                                       ),
    //                                                     ],
    //                                                   ),
    //                                                   Icon(
    //                                                     Icons
    //                                                         .bookmark_border_outlined,
    //                                                     color:
    //                                                         Color(0xFF333333),
    //                                                     size: 16,
    //                                                   ),
    //                                                 ],
    //                                               ),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                   Padding(
    //                                     padding: EdgeInsetsDirectional.fromSTEB(
    //                                         0, 0, 0, 10),
    //                                     child: Container(
    //                                       width: double.infinity,
    //                                       decoration: BoxDecoration(
    //                                         color: Colors.white,
    //                                         borderRadius:
    //                                             BorderRadius.circular(20),
    //                                       ),
    //                                       child: Padding(
    //                                         padding:
    //                                             EdgeInsetsDirectional.fromSTEB(
    //                                                 10, 10, 10, 10),
    //                                         child: Column(
    //                                           mainAxisSize: MainAxisSize.max,
    //                                           children: [
    //                                             Padding(
    //                                               padding: EdgeInsetsDirectional
    //                                                   .fromSTEB(10, 0, 10, 0),
    //                                               child: Row(
    //                                                 mainAxisSize:
    //                                                     MainAxisSize.max,
    //                                                 mainAxisAlignment:
    //                                                     MainAxisAlignment
    //                                                         .spaceBetween,
    //                                                 children: [
    //                                                   Row(
    //                                                     mainAxisSize:
    //                                                         MainAxisSize.max,
    //                                                     children: [
    //                                                       Container(
    //                                                         width: 40,
    //                                                         height: 40,
    //                                                         clipBehavior:
    //                                                             Clip.antiAlias,
    //                                                         decoration:
    //                                                             BoxDecoration(
    //                                                           shape: BoxShape
    //                                                               .circle,
    //                                                         ),
    //                                                         child: Image.asset(
    //                                                           'assets/images/fguzhtnvdm6r42bl8dte0c5i8x6a.jfif',
    //                                                         ),
    //                                                       ),
    //                                                       Padding(
    //                                                         padding:
    //                                                             EdgeInsetsDirectional
    //                                                                 .fromSTEB(
    //                                                                     5,
    //                                                                     0,
    //                                                                     0,
    //                                                                     0),
    //                                                         child: Column(
    //                                                           mainAxisSize:
    //                                                               MainAxisSize
    //                                                                   .max,
    //                                                           mainAxisAlignment:
    //                                                               MainAxisAlignment
    //                                                                   .start,
    //                                                           crossAxisAlignment:
    //                                                               CrossAxisAlignment
    //                                                                   .start,
    //                                                           children: [
    //                                                             Row(
    //                                                               mainAxisSize:
    //                                                                   MainAxisSize
    //                                                                       .max,
    //                                                               children: [
    //                                                                 // Text(
    //                                                                 //   'Abel Mengistu',
    //                                                                 //   style: FlutterFlowTheme.of(
    //                                                                 //           context)
    //                                                                 //       .bodyText1
    //                                                                 //       .override(
    //                                                                 //         fontFamily:
    //                                                                 //             'Poppins',
    //                                                                 //         fontSize:
    //                                                                 //             12,
    //                                                                 //       ),
    //                                                                 // ),
    //                                                                 // otherDetails(
    //                                                                 //     'Name',
    //                                                                 //     controller
    //                                                                 //         .profileModel
    //                                                                 //         .value!
    //                                                                 //         .name),
    //                                                                 Text(
    //                                                                   'Abel Mengistu',
    //                                                                   style: FlutterFlowTheme.of(
    //                                                                           context)
    //                                                                       .bodyText1
    //                                                                       .override(
    //                                                                         fontFamily:
    //                                                                             'Poppins',
    //                                                                         fontSize:
    //                                                                             12,
    //                                                                       ),
    //                                                                 ),
    //                                                                 Padding(
    //                                                                   padding: EdgeInsetsDirectional
    //                                                                       .fromSTEB(
    //                                                                           2,
    //                                                                           0,
    //                                                                           0,
    //                                                                           0),
    //                                                                   child:
    //                                                                       Icon(
    //                                                                     Icons
    //                                                                         .verified_rounded,
    //                                                                     color: FlutterFlowTheme.of(context)
    //                                                                         .primaryColor,
    //                                                                     size:
    //                                                                         12,
    //                                                                   ),
    //                                                                 ),
    //                                                               ],
    //                                                             ),
    //                                                             Text(
    //                                                               '@abelmengistu',
    //                                                               style: FlutterFlowTheme.of(
    //                                                                       context)
    //                                                                   .bodyText1
    //                                                                   .override(
    //                                                                     fontFamily:
    //                                                                         'Poppins',
    //                                                                     color: Color(
    //                                                                         0xFF787878),
    //                                                                     fontSize:
    //                                                                         10,
    //                                                                     fontWeight:
    //                                                                         FontWeight.normal,
    //                                                                   ),
    //                                                             ),
    //                                                           ],
    //                                                         ),
    //                                                       ),
    //                                                     ],
    //                                                   ),
    //                                                   FaIcon(
    //                                                     FontAwesomeIcons
    //                                                         .ellipsisV,
    //                                                     color:
    //                                                         Color(0xFF787878),
    //                                                     size: 16,
    //                                                   ),
    //                                                 ],
    //                                               ),
    //                                             ),
    //                                             Padding(
    //                                               padding: EdgeInsetsDirectional
    //                                                   .fromSTEB(0, 5, 0, 0),
    //                                               child: Container(
    //                                                 width: double.infinity,
    //                                                 decoration: BoxDecoration(),
    //                                                 child: Text(
    //                                                   'I\'m going to improve Flutter Flow for the whole community, implementing features to improve the user experience.',
    //                                                   style:
    //                                                       FlutterFlowTheme.of(
    //                                                               context)
    //                                                           .bodyText1
    //                                                           .override(
    //                                                             fontFamily:
    //                                                                 'Poppins',
    //                                                             fontSize: 10,
    //                                                             fontWeight:
    //                                                                 FontWeight
    //                                                                     .normal,
    //                                                           ),
    //                                                 ),
    //                                               ),
    //                                             ),
    //                                             Padding(
    //                                               padding: EdgeInsetsDirectional
    //                                                   .fromSTEB(0, 5, 0, 0),
    //                                               child: Row(
    //                                                 mainAxisSize:
    //                                                     MainAxisSize.max,
    //                                                 mainAxisAlignment:
    //                                                     MainAxisAlignment
    //                                                         .spaceBetween,
    //                                                 children: [
    //                                                   Row(
    //                                                     mainAxisSize:
    //                                                         MainAxisSize.max,
    //                                                     children: [
    //                                                       Container(
    //                                                         width: 40,
    //                                                         child: Stack(
    //                                                           children: [
    //                                                             Container(
    //                                                               width: 20,
    //                                                               height: 20,
    //                                                               decoration:
    //                                                                   BoxDecoration(
    //                                                                 color: Colors
    //                                                                     .white,
    //                                                                 shape: BoxShape
    //                                                                     .circle,
    //                                                                 border:
    //                                                                     Border
    //                                                                         .all(
    //                                                                   color: Colors
    //                                                                       .white,
    //                                                                   width: 1,
    //                                                                 ),
    //                                                               ),
    //                                                               child:
    //                                                                   Container(
    //                                                                 width: 20,
    //                                                                 height: 20,
    //                                                                 clipBehavior:
    //                                                                     Clip.antiAlias,
    //                                                                 decoration:
    //                                                                     BoxDecoration(
    //                                                                   shape: BoxShape
    //                                                                       .circle,
    //                                                                 ),
    //                                                                 child: Image
    //                                                                     .network(
    //                                                                   'https://picsum.photos/seed/711/600',
    //                                                                 ),
    //                                                               ),
    //                                                             ),
    //                                                             Align(
    //                                                               alignment:
    //                                                                   AlignmentDirectional(
    //                                                                       0.1,
    //                                                                       0),
    //                                                               child:
    //                                                                   Container(
    //                                                                 width: 20,
    //                                                                 height: 20,
    //                                                                 decoration:
    //                                                                     BoxDecoration(
    //                                                                   color: FlutterFlowTheme.of(
    //                                                                           context)
    //                                                                       .secondaryBackground,
    //                                                                   shape: BoxShape
    //                                                                       .circle,
    //                                                                   border:
    //                                                                       Border
    //                                                                           .all(
    //                                                                     color: Colors
    //                                                                         .white,
    //                                                                     width:
    //                                                                         1,
    //                                                                   ),
    //                                                                 ),
    //                                                                 child:
    //                                                                     Container(
    //                                                                   width: 20,
    //                                                                   height:
    //                                                                       20,
    //                                                                   clipBehavior:
    //                                                                       Clip.antiAlias,
    //                                                                   decoration:
    //                                                                       BoxDecoration(
    //                                                                     shape: BoxShape
    //                                                                         .circle,
    //                                                                   ),
    //                                                                   child: Image
    //                                                                       .network(
    //                                                                     'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    //                                                                     fit: BoxFit
    //                                                                         .cover,
    //                                                                   ),
    //                                                                 ),
    //                                                               ),
    //                                                             ),
    //                                                           ],
    //                                                         ),
    //                                                       ),
    //                                                       Padding(
    //                                                         padding:
    //                                                             EdgeInsetsDirectional
    //                                                                 .fromSTEB(
    //                                                                     0,
    //                                                                     0,
    //                                                                     10,
    //                                                                     0),
    //                                                         child: Row(
    //                                                           mainAxisSize:
    //                                                               MainAxisSize
    //                                                                   .max,
    //                                                           crossAxisAlignment:
    //                                                               CrossAxisAlignment
    //                                                                   .center,
    //                                                           children: [
    //                                                             Padding(
    //                                                               padding: EdgeInsetsDirectional
    //                                                                   .fromSTEB(
    //                                                                       0,
    //                                                                       0,
    //                                                                       5,
    //                                                                       0),
    //                                                               child: Row(
    //                                                                 mainAxisSize:
    //                                                                     MainAxisSize
    //                                                                         .max,
    //                                                                 crossAxisAlignment:
    //                                                                     CrossAxisAlignment
    //                                                                         .end,
    //                                                                 children: [
    //                                                                   FaIcon(
    //                                                                     FontAwesomeIcons
    //                                                                         .commentAlt,
    //                                                                     color: Color(
    //                                                                         0xFF787878),
    //                                                                     size:
    //                                                                         12,
    //                                                                   ),
    //                                                                   Padding(
    //                                                                     padding: EdgeInsetsDirectional.fromSTEB(
    //                                                                         3,
    //                                                                         0,
    //                                                                         2,
    //                                                                         0),
    //                                                                     child:
    //                                                                         Text(
    //                                                                       '4',
    //                                                                       style: FlutterFlowTheme.of(context)
    //                                                                           .bodyText1
    //                                                                           .override(
    //                                                                             fontFamily: 'Poppins',
    //                                                                             fontSize: 10,
    //                                                                             fontWeight: FontWeight.w500,
    //                                                                           ),
    //                                                                     ),
    //                                                                   ),
    //                                                                 ],
    //                                                               ),
    //                                                             ),
    //                                                             Icon(
    //                                                               Icons
    //                                                                   .favorite,
    //                                                               color: FlutterFlowTheme.of(
    //                                                                       context)
    //                                                                   .alternate,
    //                                                               size: 16,
    //                                                             ),
    //                                                             Padding(
    //                                                               padding: EdgeInsetsDirectional
    //                                                                   .fromSTEB(
    //                                                                       3,
    //                                                                       0,
    //                                                                       2,
    //                                                                       0),
    //                                                               child: Text(
    //                                                                 '12',
    //                                                                 style: FlutterFlowTheme.of(
    //                                                                         context)
    //                                                                     .bodyText1
    //                                                                     .override(
    //                                                                       fontFamily:
    //                                                                           'Poppins',
    //                                                                       fontSize:
    //                                                                           10,
    //                                                                       fontWeight:
    //                                                                           FontWeight.w500,
    //                                                                     ),
    //                                                               ),
    //                                                             ),
    //                                                           ],
    //                                                         ),
    //                                                       ),
    //                                                     ],
    //                                                   ),
    //                                                   Icon(
    //                                                     Icons
    //                                                         .bookmark_border_outlined,
    //                                                     color:
    //                                                         Color(0xFF333333),
    //                                                     size: 16,
    //                                                   ),
    //                                                 ],
    //                                               ),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                   Padding(
    //                                     padding: EdgeInsetsDirectional.fromSTEB(
    //                                         0, 0, 0, 10),
    //                                     child: Container(
    //                                       width: double.infinity,
    //                                       decoration: BoxDecoration(
    //                                         color: Colors.white,
    //                                         borderRadius:
    //                                             BorderRadius.circular(20),
    //                                       ),
    //                                       child: Padding(
    //                                         padding:
    //                                             EdgeInsetsDirectional.fromSTEB(
    //                                                 10, 10, 10, 10),
    //                                         child: Column(
    //                                           mainAxisSize: MainAxisSize.max,
    //                                           children: [
    //                                             Padding(
    //                                               padding: EdgeInsetsDirectional
    //                                                   .fromSTEB(10, 0, 10, 0),
    //                                               child: Row(
    //                                                 mainAxisSize:
    //                                                     MainAxisSize.max,
    //                                                 mainAxisAlignment:
    //                                                     MainAxisAlignment
    //                                                         .spaceBetween,
    //                                                 children: [
    //                                                   Row(
    //                                                     mainAxisSize:
    //                                                         MainAxisSize.max,
    //                                                     children: [
    //                                                       Container(
    //                                                         width: 40,
    //                                                         height: 40,
    //                                                         clipBehavior:
    //                                                             Clip.antiAlias,
    //                                                         decoration:
    //                                                             BoxDecoration(
    //                                                           shape: BoxShape
    //                                                               .circle,
    //                                                         ),
    //                                                         child: Image.asset(
    //                                                           'assets/images/fguzhtnvdm6r42bl8dte0c5i8x6a.jfif',
    //                                                         ),
    //                                                       ),
    //                                                       Padding(
    //                                                         padding:
    //                                                             EdgeInsetsDirectional
    //                                                                 .fromSTEB(
    //                                                                     5,
    //                                                                     0,
    //                                                                     0,
    //                                                                     0),
    //                                                         child: Column(
    //                                                           mainAxisSize:
    //                                                               MainAxisSize
    //                                                                   .max,
    //                                                           mainAxisAlignment:
    //                                                               MainAxisAlignment
    //                                                                   .start,
    //                                                           crossAxisAlignment:
    //                                                               CrossAxisAlignment
    //                                                                   .start,
    //                                                           children: [
    //                                                             Row(
    //                                                               mainAxisSize:
    //                                                                   MainAxisSize
    //                                                                       .max,
    //                                                               children: [
    //                                                                 Text(
    //                                                                   'Abel Mengistu',
    //                                                                   style: FlutterFlowTheme.of(
    //                                                                           context)
    //                                                                       .bodyText1
    //                                                                       .override(
    //                                                                         fontFamily:
    //                                                                             'Poppins',
    //                                                                         fontSize:
    //                                                                             12,
    //                                                                       ),
    //                                                                 ),
    //                                                                 Padding(
    //                                                                   padding: EdgeInsetsDirectional
    //                                                                       .fromSTEB(
    //                                                                           2,
    //                                                                           0,
    //                                                                           0,
    //                                                                           0),
    //                                                                   child:
    //                                                                       Icon(
    //                                                                     Icons
    //                                                                         .verified_rounded,
    //                                                                     color: FlutterFlowTheme.of(context)
    //                                                                         .primaryColor,
    //                                                                     size:
    //                                                                         12,
    //                                                                   ),
    //                                                                 ),
    //                                                               ],
    //                                                             ),
    //                                                             Text(
    //                                                               '@abelmengistu',
    //                                                               style: FlutterFlowTheme.of(
    //                                                                       context)
    //                                                                   .bodyText1
    //                                                                   .override(
    //                                                                     fontFamily:
    //                                                                         'Poppins',
    //                                                                     color: Color(
    //                                                                         0xFF787878),
    //                                                                     fontSize:
    //                                                                         10,
    //                                                                     fontWeight:
    //                                                                         FontWeight.normal,
    //                                                                   ),
    //                                                             ),
    //                                                           ],
    //                                                         ),
    //                                                       ),
    //                                                     ],
    //                                                   ),
    //                                                   FaIcon(
    //                                                     FontAwesomeIcons
    //                                                         .ellipsisV,
    //                                                     color:
    //                                                         Color(0xFF787878),
    //                                                     size: 16,
    //                                                   ),
    //                                                 ],
    //                                               ),
    //                                             ),
    //                                             Padding(
    //                                               padding: EdgeInsetsDirectional
    //                                                   .fromSTEB(0, 5, 0, 0),
    //                                               child: Container(
    //                                                 width: double.infinity,
    //                                                 decoration: BoxDecoration(),
    //                                                 child: Text(
    //                                                   'I\'m going to improve Flutter Flow for the whole community, implementing features to improve the user experience.',
    //                                                   style:
    //                                                       FlutterFlowTheme.of(
    //                                                               context)
    //                                                           .bodyText1
    //                                                           .override(
    //                                                             fontFamily:
    //                                                                 'Poppins',
    //                                                             fontSize: 10,
    //                                                             fontWeight:
    //                                                                 FontWeight
    //                                                                     .normal,
    //                                                           ),
    //                                                 ),
    //                                               ),
    //                                             ),
    //                                             Padding(
    //                                               padding: EdgeInsetsDirectional
    //                                                   .fromSTEB(0, 5, 0, 0),
    //                                               child: Row(
    //                                                 mainAxisSize:
    //                                                     MainAxisSize.max,
    //                                                 mainAxisAlignment:
    //                                                     MainAxisAlignment
    //                                                         .spaceBetween,
    //                                                 children: [
    //                                                   Row(
    //                                                     mainAxisSize:
    //                                                         MainAxisSize.max,
    //                                                     children: [
    //                                                       Container(
    //                                                         width: 40,
    //                                                         child: Stack(
    //                                                           children: [
    //                                                             Container(
    //                                                               width: 20,
    //                                                               height: 20,
    //                                                               decoration:
    //                                                                   BoxDecoration(
    //                                                                 color: Colors
    //                                                                     .white,
    //                                                                 shape: BoxShape
    //                                                                     .circle,
    //                                                                 border:
    //                                                                     Border
    //                                                                         .all(
    //                                                                   color: Colors
    //                                                                       .white,
    //                                                                   width: 1,
    //                                                                 ),
    //                                                               ),
    //                                                               child:
    //                                                                   Container(
    //                                                                 width: 20,
    //                                                                 height: 20,
    //                                                                 clipBehavior:
    //                                                                     Clip.antiAlias,
    //                                                                 decoration:
    //                                                                     BoxDecoration(
    //                                                                   shape: BoxShape
    //                                                                       .circle,
    //                                                                 ),
    //                                                                 child: Image
    //                                                                     .network(
    //                                                                   'https://picsum.photos/seed/711/600',
    //                                                                 ),
    //                                                               ),
    //                                                             ),
    //                                                             Align(
    //                                                               alignment:
    //                                                                   AlignmentDirectional(
    //                                                                       0.1,
    //                                                                       0),
    //                                                               child:
    //                                                                   Container(
    //                                                                 width: 20,
    //                                                                 height: 20,
    //                                                                 decoration:
    //                                                                     BoxDecoration(
    //                                                                   color: FlutterFlowTheme.of(
    //                                                                           context)
    //                                                                       .secondaryBackground,
    //                                                                   shape: BoxShape
    //                                                                       .circle,
    //                                                                   border:
    //                                                                       Border
    //                                                                           .all(
    //                                                                     color: Colors
    //                                                                         .white,
    //                                                                     width:
    //                                                                         1,
    //                                                                   ),
    //                                                                 ),
    //                                                                 child:
    //                                                                     Container(
    //                                                                   width: 20,
    //                                                                   height:
    //                                                                       20,
    //                                                                   clipBehavior:
    //                                                                       Clip.antiAlias,
    //                                                                   decoration:
    //                                                                       BoxDecoration(
    //                                                                     shape: BoxShape
    //                                                                         .circle,
    //                                                                   ),
    //                                                                   child: Image
    //                                                                       .network(
    //                                                                     'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    //                                                                     fit: BoxFit
    //                                                                         .cover,
    //                                                                   ),
    //                                                                 ),
    //                                                               ),
    //                                                             ),
    //                                                           ],
    //                                                         ),
    //                                                       ),
    //                                                       Padding(
    //                                                         padding:
    //                                                             EdgeInsetsDirectional
    //                                                                 .fromSTEB(
    //                                                                     0,
    //                                                                     0,
    //                                                                     10,
    //                                                                     0),
    //                                                         child: Row(
    //                                                           mainAxisSize:
    //                                                               MainAxisSize
    //                                                                   .max,
    //                                                           crossAxisAlignment:
    //                                                               CrossAxisAlignment
    //                                                                   .center,
    //                                                           children: [
    //                                                             Padding(
    //                                                               padding: EdgeInsetsDirectional
    //                                                                   .fromSTEB(
    //                                                                       0,
    //                                                                       0,
    //                                                                       5,
    //                                                                       0),
    //                                                               child: Row(
    //                                                                 mainAxisSize:
    //                                                                     MainAxisSize
    //                                                                         .max,
    //                                                                 crossAxisAlignment:
    //                                                                     CrossAxisAlignment
    //                                                                         .end,
    //                                                                 children: [
    //                                                                   FaIcon(
    //                                                                     FontAwesomeIcons
    //                                                                         .commentAlt,
    //                                                                     color: Color(
    //                                                                         0xFF787878),
    //                                                                     size:
    //                                                                         12,
    //                                                                   ),
    //                                                                   Padding(
    //                                                                     padding: EdgeInsetsDirectional.fromSTEB(
    //                                                                         3,
    //                                                                         0,
    //                                                                         2,
    //                                                                         0),
    //                                                                     child:
    //                                                                         Text(
    //                                                                       '4',
    //                                                                       style: FlutterFlowTheme.of(context)
    //                                                                           .bodyText1
    //                                                                           .override(
    //                                                                             fontFamily: 'Poppins',
    //                                                                             fontSize: 10,
    //                                                                             fontWeight: FontWeight.w500,
    //                                                                           ),
    //                                                                     ),
    //                                                                   ),
    //                                                                 ],
    //                                                               ),
    //                                                             ),
    //                                                             Icon(
    //                                                               Icons
    //                                                                   .favorite,
    //                                                               color: FlutterFlowTheme.of(
    //                                                                       context)
    //                                                                   .alternate,
    //                                                               size: 16,
    //                                                             ),
    //                                                             Padding(
    //                                                               padding: EdgeInsetsDirectional
    //                                                                   .fromSTEB(
    //                                                                       3,
    //                                                                       0,
    //                                                                       2,
    //                                                                       0),
    //                                                               child: Text(
    //                                                                 '12',
    //                                                                 style: FlutterFlowTheme.of(
    //                                                                         context)
    //                                                                     .bodyText1
    //                                                                     .override(
    //                                                                       fontFamily:
    //                                                                           'Poppins',
    //                                                                       fontSize:
    //                                                                           10,
    //                                                                       fontWeight:
    //                                                                           FontWeight.w500,
    //                                                                     ),
    //                                                               ),
    //                                                             ),
    //                                                           ],
    //                                                         ),
    //                                                       ),
    //                                                     ],
    //                                                   ),
    //                                                   Icon(
    //                                                     Icons
    //                                                         .bookmark_border_outlined,
    //                                                     color:
    //                                                         Color(0xFF333333),
    //                                                     size: 16,
    //                                                   ),
    //                                                 ],
    //                                               ),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               // Align(
    //               //   alignment: AlignmentDirectional(0, 1),
    //               //   child: wrapWithModel(
    //               //     model: _model.navBarWithMiddleButtonModel,
    //               //     updateCallback: () => setState(() {}),
    //               //     child: NavBarWithMiddleButtonWidget(),
    //               //   ),
    //               // ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Obx(
            // body: Obx(
            () => controller.profileModel.value == null
                ? Center(child: circularProgress())
                : GestureDetector(
                    onTap: () =>
                        FocusScope.of(context).requestFocus(_unfocusNode),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // head(),
                        // const Divider(thickness: 0.8),
                        // otherDetails('About', controller.profileModel.value!.about),
                        // otherDetails('Name', controller.profileModel.value!.name),
                        // otherDetails('Profession',
                        //     controller.profileModel.value!.profession),
                        // otherDetails('DOB', controller.profileModel.value!.dob),
                        // const Divider(thickness: 0.8),
                        // const SizedBox(height: 20),
                        // const BlogsList(url: '/blogpost/getOwnBlogs'),

                        Expanded(
                          child: Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await Future.delayed(
                                          const Duration(milliseconds: 1000));
                                    },
                                    child: ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 2,
                                          sigmaY: 2,
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Image.asset(
                                            'assets/images/5447432.jpg',
                                            width: double.infinity,
                                            height: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, -0.85),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0x724B39EF),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 1,
                                              sigmaY: 1,
                                            ),
                                            child: Icon(
                                              Icons.photo_camera_outlined,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0x724B39EF),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 1,
                                              sigmaY: 1,
                                            ),
                                            child: Icon(
                                              Icons.keyboard_control_sharp,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 150, 0, 0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF9F9F9),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 20, 20, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          await Navigator.push(
                                                            context,
                                                            PageTransition(
                                                              type:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      300),
                                                              reverseDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          300),
                                                              child:
                                                                  EditprofileWidget(),
                                                            ),
                                                          );
                                                        },
                                                        child: Container(
                                                          width: 50,
                                                          height: 50,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: CircleAvatar(
                                                            radius: 50,
                                                            backgroundImage: HttpService()
                                                                .getImage(controller
                                                                    .profileModel
                                                                    .value!
                                                                    .username),
                                                          ),
                                                          // child: Image.asset(
                                                          //   'assets/images/fguzhtnvdm6r42bl8dte0c5i8x6a.jfif',
                                                          // ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(35,
                                                                    40, 0, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .solidCircle,
                                                          color:
                                                              Color(0xFF27DA3E),
                                                          size: 10,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Container(
                                                                width: 70,
                                                                height: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      '604',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                    ),
                                                                    Text(
                                                                      'Posts',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFFB3B3B3),
                                                                            fontSize:
                                                                                8,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Container(
                                                                width: 70,
                                                                height: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      '705k',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                    ),
                                                                    Text(
                                                                      'Followers',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFFB3B3B3),
                                                                            fontSize:
                                                                                8,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Container(
                                                                width: 70,
                                                                height: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      '12',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                    ),
                                                                    Text(
                                                                      'Following',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFFB3B3B3),
                                                                            fontSize:
                                                                                8,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Container(
                                                                width: 30,
                                                                height: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_drop_down_rounded,
                                                                  color: Color(
                                                                      0xFF333333),
                                                                  size: 20,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 20, 20, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    // 'Abel Mengistu',
                                                    controller.profileModel
                                                        .value!.name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 0, 0),
                                                    child: Icon(
                                                      Icons.verified_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 20, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '@${controller.profileModel.value!.username}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF787878),
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 20, 20, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child:
                                                        FlutterFlowChoiceChips(
                                                      initiallySelected: [
                                                        'Posts'
                                                      ],
                                                      options: [
                                                        ChipData('Posts'),
                                                        ChipData('Status'),
                                                        ChipData('Bio')
                                                      ],
                                                      onChanged: (val) =>
                                                          setState(() => _model
                                                                  .choiceChipsValue =
                                                              val?.first),
                                                      selectedChipStyle:
                                                          ChipStyle(
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        iconColor: Colors.white,
                                                        iconSize: 0,
                                                        elevation: 0,
                                                      ),
                                                      unselectedChipStyle:
                                                          ChipStyle(
                                                        backgroundColor:
                                                            Colors.white,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF787878),
                                                                  fontSize: 12,
                                                                ),
                                                        iconColor:
                                                            Color(0xFFB3B3B3),
                                                        iconSize: 18,
                                                        elevation: 0,
                                                      ),
                                                      chipSpacing: 20,
                                                      multiselect: false,
                                                      initialized: _model
                                                              .choiceChipsValue !=
                                                          null,
                                                      alignment:
                                                          WrapAlignment.start,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.filter_list,
                                                        color:
                                                            Color(0xFF787878),
                                                        size: 24,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: EdgeInsetsDirectional
                                            //       .fromSTEB(10, 10, 10, 15),
                                            //   child: ListView(
                                            //     padding: EdgeInsets.zero,
                                            //     primary: false,
                                            //     shrinkWrap: true,
                                            //     scrollDirection: Axis.vertical,
                                            //     children: [
                                            //       Padding(
                                            //         padding:
                                            //             EdgeInsetsDirectional
                                            //                 .fromSTEB(
                                            //                     0, 0, 0, 10),
                                            //         child: Container(
                                            //           width: double.infinity,
                                            //           decoration: BoxDecoration(
                                            //             color: Colors.white,
                                            //             borderRadius:
                                            //                 BorderRadius
                                            //                     .circular(20),
                                            //           ),
                                            //           child: Padding(
                                            //             padding:
                                            //                 EdgeInsetsDirectional
                                            //                     .fromSTEB(10,
                                            //                         10, 10, 10),
                                            //             child: Column(
                                            //               mainAxisSize:
                                            //                   MainAxisSize.max,
                                            //               children: [
                                            //                 Padding(
                                            //                   padding:
                                            //                       EdgeInsetsDirectional
                                            //                           .fromSTEB(
                                            //                               10,
                                            //                               0,
                                            //                               10,
                                            //                               0),
                                            //                   child: Row(
                                            //                     mainAxisSize:
                                            //                         MainAxisSize
                                            //                             .max,
                                            //                     mainAxisAlignment:
                                            //                         MainAxisAlignment
                                            //                             .spaceBetween,
                                            //                     children: [
                                            //                       Row(
                                            //                         mainAxisSize:
                                            //                             MainAxisSize
                                            //                                 .max,
                                            //                         children: [
                                            //                           Container(
                                            //                             width:
                                            //                                 40,
                                            //                             height:
                                            //                                 40,
                                            //                             clipBehavior:
                                            //                                 Clip.antiAlias,
                                            //                             decoration:
                                            //                                 BoxDecoration(
                                            //                               shape:
                                            //                                   BoxShape.circle,
                                            //                             ),
                                            //                             // child: Image
                                            //                             //     .asset(
                                            //                             //   'assets/images/fguzhtnvdm6r42bl8dte0c5i8x6a.jfif',
                                            //                             // ),
                                            //                             child:
                                            //                                 CircleAvatar(
                                            //                               radius:
                                            //                                   50,
                                            //                               backgroundImage: HttpService().getImage(controller
                                            //                                   .profileModel
                                            //                                   .value!
                                            //                                   .username),
                                            //                             ),
                                            //                           ),
                                            //                           Padding(
                                            //                             padding: EdgeInsetsDirectional.fromSTEB(
                                            //                                 5,
                                            //                                 0,
                                            //                                 0,
                                            //                                 0),
                                            //                             child:
                                            //                                 Column(
                                            //                               mainAxisSize:
                                            //                                   MainAxisSize.max,
                                            //                               mainAxisAlignment:
                                            //                                   MainAxisAlignment.start,
                                            //                               crossAxisAlignment:
                                            //                                   CrossAxisAlignment.start,
                                            //                               children: [
                                            //                                 Row(
                                            //                                   mainAxisSize: MainAxisSize.max,
                                            //                                   children: [
                                            //                                     Text(
                                            //                                       controller.profileModel.value!.name,
                                            //                                       style: FlutterFlowTheme.of(context).bodyText1.override(
                                            //                                             fontFamily: 'Poppins',
                                            //                                             fontSize: 12,
                                            //                                           ),
                                            //                                     ),
                                            //                                     Padding(
                                            //                                       padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                            //                                       child: Icon(
                                            //                                         Icons.verified_rounded,
                                            //                                         color: FlutterFlowTheme.of(context).primaryColor,
                                            //                                         size: 12,
                                            //                                       ),
                                            //                                     ),
                                            //                                   ],
                                            //                                 ),
                                            //                                 Row(
                                            //                                   mainAxisSize: MainAxisSize.max,
                                            //                                   children: [
                                            //                                     Text(
                                            //                                       '@${controller.profileModel.value!.username}',
                                            //                                       style: FlutterFlowTheme.of(context).bodyText1.override(
                                            //                                             fontFamily: 'Poppins',
                                            //                                             color: Color(0xFF787878),
                                            //                                             fontSize: 10,
                                            //                                             fontWeight: FontWeight.normal,
                                            //                                           ),
                                            //                                     ),
                                            //                                     Text(
                                            //                                       ' • ',
                                            //                                       style: FlutterFlowTheme.of(context).bodyText1.override(
                                            //                                             fontFamily: 'Poppins',
                                            //                                             color: Color(0xFF787878),
                                            //                                             fontSize: 10,
                                            //                                             fontWeight: FontWeight.normal,
                                            //                                           ),
                                            //                                     ),
                                            //                                     Text(
                                            //                                       '2 hours ago',
                                            //                                       style: FlutterFlowTheme.of(context).bodyText1.override(
                                            //                                             fontFamily: 'Poppins',
                                            //                                             color: Color(0xFF787878),
                                            //                                             fontSize: 10,
                                            //                                             fontWeight: FontWeight.normal,
                                            //                                           ),
                                            //                                     ),
                                            //                                   ],
                                            //                                 ),
                                            //                               ],
                                            //                             ),
                                            //                           ),
                                            //                         ],
                                            //                       ),
                                            //                       FaIcon(
                                            //                         FontAwesomeIcons
                                            //                             .ellipsisV,
                                            //                         color: Color(
                                            //                             0xFF787878),
                                            //                         size: 16,
                                            //                       ),
                                            //                     ],
                                            //                   ),
                                            //                 ),
                                            //                 Padding(
                                            //                   padding:
                                            //                       EdgeInsetsDirectional
                                            //                           .fromSTEB(
                                            //                               0,
                                            //                               5,
                                            //                               0,
                                            //                               0),
                                            //                   child: Container(
                                            //                     width: double
                                            //                         .infinity,
                                            //                     decoration:
                                            //                         BoxDecoration(),
                                            //                     child: Column(
                                            //                       mainAxisSize:
                                            //                           MainAxisSize
                                            //                               .max,
                                            //                       crossAxisAlignment:
                                            //                           CrossAxisAlignment
                                            //                               .start,
                                            //                       children: [
                                            //                         Padding(
                                            //                           padding: EdgeInsetsDirectional
                                            //                               .fromSTEB(
                                            //                                   0,
                                            //                                   0,
                                            //                                   0,
                                            //                                   5),
                                            //                           child:
                                            //                               Text(
                                            //                             'Cocreator 3.0 is here:\n🏬 FlutterFlow Marketplace\n👩‍💻 Support For Web Applications\n🚀 Web Deployment\n🎨Design Systems and Shared Media Assets for Teams\n👥 Custom Code Library for Teams\n\nLearn more and share your feedback 👇\nhttps://producthunt.com/posts/flutterflow-3-0\n\n#flutter #nocode',
                                            //                             style: FlutterFlowTheme.of(context)
                                            //                                 .bodyText1
                                            //                                 .override(
                                            //                                   fontFamily: 'Poppins',
                                            //                                   fontSize: 10,
                                            //                                   fontWeight: FontWeight.normal,
                                            //                                 ),
                                            //                           ),
                                            //                         ),
                                            //                         Image.asset(
                                            //                           'assets/images/FaQ4OguVEAExEh3.jfif',
                                            //                           width:
                                            //                               500,
                                            //                           height:
                                            //                               200,
                                            //                           fit: BoxFit
                                            //                               .cover,
                                            //                         ),
                                            //                       ],
                                            //                     ),
                                            //                   ),
                                            //                 ),
                                            //                 Padding(
                                            //                   padding:
                                            //                       EdgeInsetsDirectional
                                            //                           .fromSTEB(
                                            //                               0,
                                            //                               5,
                                            //                               0,
                                            //                               0),
                                            //                   child: Row(
                                            //                     mainAxisSize:
                                            //                         MainAxisSize
                                            //                             .max,
                                            //                     mainAxisAlignment:
                                            //                         MainAxisAlignment
                                            //                             .spaceBetween,
                                            //                     children: [
                                            //                       Row(
                                            //                         mainAxisSize:
                                            //                             MainAxisSize
                                            //                                 .max,
                                            //                         children: [
                                            //                           Container(
                                            //                             width:
                                            //                                 40,
                                            //                             child:
                                            //                                 Stack(
                                            //                               children: [
                                            //                                 Container(
                                            //                                   width: 20,
                                            //                                   height: 20,
                                            //                                   decoration: BoxDecoration(
                                            //                                     color: Colors.white,
                                            //                                     shape: BoxShape.circle,
                                            //                                     border: Border.all(
                                            //                                       color: Colors.white,
                                            //                                       width: 1,
                                            //                                     ),
                                            //                                   ),
                                            //                                   child: Container(
                                            //                                     width: 20,
                                            //                                     height: 20,
                                            //                                     clipBehavior: Clip.antiAlias,
                                            //                                     decoration: BoxDecoration(
                                            //                                       shape: BoxShape.circle,
                                            //                                     ),
                                            //                                     child: Image.network(
                                            //                                       'https://picsum.photos/seed/711/600',
                                            //                                     ),
                                            //                                   ),
                                            //                                 ),
                                            //                                 Align(
                                            //                                   alignment: AlignmentDirectional(0.1, 0),
                                            //                                   child: Container(
                                            //                                     width: 20,
                                            //                                     height: 20,
                                            //                                     decoration: BoxDecoration(
                                            //                                       color: FlutterFlowTheme.of(context).secondaryBackground,
                                            //                                       shape: BoxShape.circle,
                                            //                                       border: Border.all(
                                            //                                         color: Colors.white,
                                            //                                         width: 1,
                                            //                                       ),
                                            //                                     ),
                                            //                                     child: Container(
                                            //                                       width: 20,
                                            //                                       height: 20,
                                            //                                       clipBehavior: Clip.antiAlias,
                                            //                                       decoration: BoxDecoration(
                                            //                                         shape: BoxShape.circle,
                                            //                                       ),
                                            //                                       child: Image.network(
                                            //                                         'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                            //                                         fit: BoxFit.cover,
                                            //                                       ),
                                            //                                     ),
                                            //                                   ),
                                            //                                 ),
                                            //                               ],
                                            //                             ),
                                            //                           ),
                                            //                           Padding(
                                            //                             padding: EdgeInsetsDirectional.fromSTEB(
                                            //                                 0,
                                            //                                 0,
                                            //                                 10,
                                            //                                 0),
                                            //                             child:
                                            //                                 Row(
                                            //                               mainAxisSize:
                                            //                                   MainAxisSize.max,
                                            //                               crossAxisAlignment:
                                            //                                   CrossAxisAlignment.center,
                                            //                               children: [
                                            //                                 Padding(
                                            //                                   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                            //                                   child: Row(
                                            //                                     mainAxisSize: MainAxisSize.max,
                                            //                                     crossAxisAlignment: CrossAxisAlignment.end,
                                            //                                     children: [
                                            //                                       FaIcon(
                                            //                                         FontAwesomeIcons.commentAlt,
                                            //                                         color: Color(0xFF787878),
                                            //                                         size: 12,
                                            //                                       ),
                                            //                                       Padding(
                                            //                                         padding: EdgeInsetsDirectional.fromSTEB(3, 0, 2, 0),
                                            //                                         child: Text(
                                            //                                           '21',
                                            //                                           style: FlutterFlowTheme.of(context).bodyText1.override(
                                            //                                                 fontFamily: 'Poppins',
                                            //                                                 fontSize: 10,
                                            //                                                 fontWeight: FontWeight.w500,
                                            //                                               ),
                                            //                                         ),
                                            //                                       ),
                                            //                                     ],
                                            //                                   ),
                                            //                                 ),
                                            //                                 Icon(
                                            //                                   Icons.favorite,
                                            //                                   color: FlutterFlowTheme.of(context).alternate,
                                            //                                   size: 16,
                                            //                                 ),
                                            //                                 Padding(
                                            //                                   padding: EdgeInsetsDirectional.fromSTEB(3, 0, 2, 0),
                                            //                                   child: Text(
                                            //                                     '212',
                                            //                                     style: FlutterFlowTheme.of(context).bodyText1.override(
                                            //                                           fontFamily: 'Poppins',
                                            //                                           fontSize: 10,
                                            //                                           fontWeight: FontWeight.w500,
                                            //                                         ),
                                            //                                   ),
                                            //                                 ),
                                            //                               ],
                                            //                             ),
                                            //                           ),
                                            //                         ],
                                            //                       ),
                                            //                       Icon(
                                            //                         Icons
                                            //                             .bookmark_border_outlined,
                                            //                         color: Color(
                                            //                             0xFF333333),
                                            //                         size: 16,
                                            //                       ),
                                            //                     ],
                                            //                   ),
                                            //                 ),
                                            //               ],
                                            //             ),
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       Padding(
                                            //         padding:
                                            //             EdgeInsetsDirectional
                                            //                 .fromSTEB(
                                            //                     0, 0, 0, 10),
                                            //         child: Container(
                                            //           width: double.infinity,
                                            //           decoration: BoxDecoration(
                                            //             color: Colors.white,
                                            //             borderRadius:
                                            //                 BorderRadius
                                            //                     .circular(20),
                                            //           ),
                                            //           child: Padding(
                                            //             padding:
                                            //                 EdgeInsetsDirectional
                                            //                     .fromSTEB(10,
                                            //                         10, 10, 10),
                                            //             child: Column(
                                            //               mainAxisSize:
                                            //                   MainAxisSize.max,
                                            //               children: [
                                            //                 Padding(
                                            //                   padding:
                                            //                       EdgeInsetsDirectional
                                            //                           .fromSTEB(
                                            //                               10,
                                            //                               0,
                                            //                               10,
                                            //                               0),
                                            //                   child: Row(
                                            //                     mainAxisSize:
                                            //                         MainAxisSize
                                            //                             .max,
                                            //                     mainAxisAlignment:
                                            //                         MainAxisAlignment
                                            //                             .spaceBetween,
                                            //                     children: [
                                            //                       Row(
                                            //                         mainAxisSize:
                                            //                             MainAxisSize
                                            //                                 .max,
                                            //                         children: [
                                            //                           Container(
                                            //                             width:
                                            //                                 40,
                                            //                             height:
                                            //                                 40,
                                            //                             clipBehavior:
                                            //                                 Clip.antiAlias,
                                            //                             decoration:
                                            //                                 BoxDecoration(
                                            //                               shape:
                                            //                                   BoxShape.circle,
                                            //                             ),
                                            //                             child:
                                            //                                 CircleAvatar(
                                            //                               radius:
                                            //                                   50,
                                            //                               backgroundImage: HttpService().getImage(controller
                                            //                                   .profileModel
                                            //                                   .value!
                                            //                                   .username),
                                            //                             ),
                                            //                             // child: Image
                                            //                             //     .asset(
                                            //                             //   'assets/images/fguzhtnvdm6r42bl8dte0c5i8x6a.jfif',
                                            //                             // ),
                                            //                           ),
                                            //                           Padding(
                                            //                             padding: EdgeInsetsDirectional.fromSTEB(
                                            //                                 5,
                                            //                                 0,
                                            //                                 0,
                                            //                                 0),
                                            //                             child:
                                            //                                 Column(
                                            //                               mainAxisSize:
                                            //                                   MainAxisSize.max,
                                            //                               mainAxisAlignment:
                                            //                                   MainAxisAlignment.start,
                                            //                               crossAxisAlignment:
                                            //                                   CrossAxisAlignment.start,
                                            //                               children: [
                                            //                                 Row(
                                            //                                   mainAxisSize: MainAxisSize.max,
                                            //                                   children: [
                                            //                                     Text(
                                            //                                       controller.profileModel.value!.name,
                                            //                                       style: FlutterFlowTheme.of(context).bodyText1.override(
                                            //                                             fontFamily: 'Poppins',
                                            //                                             fontSize: 12,
                                            //                                           ),
                                            //                                     ),
                                            //                                     Padding(
                                            //                                       padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                            //                                       child: Icon(
                                            //                                         Icons.verified_rounded,
                                            //                                         color: FlutterFlowTheme.of(context).primaryColor,
                                            //                                         size: 12,
                                            //                                       ),
                                            //                                     ),
                                            //                                   ],
                                            //                                 ),
                                            //                                 Text(
                                            //                                   '@${controller.profileModel.value!.username}',
                                            //                                   style: FlutterFlowTheme.of(context).bodyText1.override(
                                            //                                         fontFamily: 'Poppins',
                                            //                                         color: Color(0xFF787878),
                                            //                                         fontSize: 10,
                                            //                                         fontWeight: FontWeight.normal,
                                            //                                       ),
                                            //                                 ),
                                            //                               ],
                                            //                             ),
                                            //                           ),
                                            //                         ],
                                            //                       ),
                                            //                       FaIcon(
                                            //                         FontAwesomeIcons
                                            //                             .ellipsisV,
                                            //                         color: Color(
                                            //                             0xFF787878),
                                            //                         size: 16,
                                            //                       ),
                                            //                     ],
                                            //                   ),
                                            //                 ),
                                            //                 Padding(
                                            //                   padding:
                                            //                       EdgeInsetsDirectional
                                            //                           .fromSTEB(
                                            //                               0,
                                            //                               5,
                                            //                               0,
                                            //                               0),
                                            //                   child: Container(
                                            //                     width: double
                                            //                         .infinity,
                                            //                     decoration:
                                            //                         BoxDecoration(),
                                            //                     child: Text(
                                            //                       'I\'m going to improve Flutter Flow for the whole community, implementing features to improve the user experience.',
                                            //                       style: FlutterFlowTheme.of(
                                            //                               context)
                                            //                           .bodyText1
                                            //                           .override(
                                            //                             fontFamily:
                                            //                                 'Poppins',
                                            //                             fontSize:
                                            //                                 10,
                                            //                             fontWeight:
                                            //                                 FontWeight.normal,
                                            //                           ),
                                            //                     ),
                                            //                   ),
                                            //                 ),
                                            //                 Padding(
                                            //                   padding:
                                            //                       EdgeInsetsDirectional
                                            //                           .fromSTEB(
                                            //                               0,
                                            //                               5,
                                            //                               0,
                                            //                               0),
                                            //                   child: Row(
                                            //                     mainAxisSize:
                                            //                         MainAxisSize
                                            //                             .max,
                                            //                     mainAxisAlignment:
                                            //                         MainAxisAlignment
                                            //                             .spaceBetween,
                                            //                     children: [
                                            //                       Row(
                                            //                         mainAxisSize:
                                            //                             MainAxisSize
                                            //                                 .max,
                                            //                         children: [
                                            //                           Container(
                                            //                             width:
                                            //                                 40,
                                            //                             child:
                                            //                                 Stack(
                                            //                               children: [
                                            //                                 Container(
                                            //                                   width: 20,
                                            //                                   height: 20,
                                            //                                   decoration: BoxDecoration(
                                            //                                     color: Colors.white,
                                            //                                     shape: BoxShape.circle,
                                            //                                     border: Border.all(
                                            //                                       color: Colors.white,
                                            //                                       width: 1,
                                            //                                     ),
                                            //                                   ),
                                            //                                   child: Container(
                                            //                                     width: 20,
                                            //                                     height: 20,
                                            //                                     clipBehavior: Clip.antiAlias,
                                            //                                     decoration: BoxDecoration(
                                            //                                       shape: BoxShape.circle,
                                            //                                     ),
                                            //                                     child: Image.network(
                                            //                                       'https://picsum.photos/seed/711/600',
                                            //                                     ),
                                            //                                   ),
                                            //                                 ),
                                            //                                 Align(
                                            //                                   alignment: AlignmentDirectional(0.1, 0),
                                            //                                   child: Container(
                                            //                                     width: 20,
                                            //                                     height: 20,
                                            //                                     decoration: BoxDecoration(
                                            //                                       color: FlutterFlowTheme.of(context).secondaryBackground,
                                            //                                       shape: BoxShape.circle,
                                            //                                       border: Border.all(
                                            //                                         color: Colors.white,
                                            //                                         width: 1,
                                            //                                       ),
                                            //                                     ),
                                            //                                     child: Container(
                                            //                                       width: 20,
                                            //                                       height: 20,
                                            //                                       clipBehavior: Clip.antiAlias,
                                            //                                       decoration: BoxDecoration(
                                            //                                         shape: BoxShape.circle,
                                            //                                       ),
                                            //                                       child: Image.network(
                                            //                                         'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                            //                                         fit: BoxFit.cover,
                                            //                                       ),
                                            //                                     ),
                                            //                                   ),
                                            //                                 ),
                                            //                               ],
                                            //                             ),
                                            //                           ),
                                            //                           Padding(
                                            //                             padding: EdgeInsetsDirectional.fromSTEB(
                                            //                                 0,
                                            //                                 0,
                                            //                                 10,
                                            //                                 0),
                                            //                             child:
                                            //                                 Row(
                                            //                               mainAxisSize:
                                            //                                   MainAxisSize.max,
                                            //                               crossAxisAlignment:
                                            //                                   CrossAxisAlignment.center,
                                            //                               children: [
                                            //                                 Padding(
                                            //                                   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                            //                                   child: Row(
                                            //                                     mainAxisSize: MainAxisSize.max,
                                            //                                     crossAxisAlignment: CrossAxisAlignment.end,
                                            //                                     children: [
                                            //                                       FaIcon(
                                            //                                         FontAwesomeIcons.commentAlt,
                                            //                                         color: Color(0xFF787878),
                                            //                                         size: 12,
                                            //                                       ),
                                            //                                       Padding(
                                            //                                         padding: EdgeInsetsDirectional.fromSTEB(3, 0, 2, 0),
                                            //                                         child: Text(
                                            //                                           '4',
                                            //                                           style: FlutterFlowTheme.of(context).bodyText1.override(
                                            //                                                 fontFamily: 'Poppins',
                                            //                                                 fontSize: 10,
                                            //                                                 fontWeight: FontWeight.w500,
                                            //                                               ),
                                            //                                         ),
                                            //                                       ),
                                            //                                     ],
                                            //                                   ),
                                            //                                 ),
                                            //                                 Icon(
                                            //                                   Icons.favorite,
                                            //                                   color: FlutterFlowTheme.of(context).alternate,
                                            //                                   size: 16,
                                            //                                 ),
                                            //                                 Padding(
                                            //                                   padding: EdgeInsetsDirectional.fromSTEB(3, 0, 2, 0),
                                            //                                   child: Text(
                                            //                                     '12',
                                            //                                     style: FlutterFlowTheme.of(context).bodyText1.override(
                                            //                                           fontFamily: 'Poppins',
                                            //                                           fontSize: 10,
                                            //                                           fontWeight: FontWeight.w500,
                                            //                                         ),
                                            //                                   ),
                                            //                                 ),
                                            //                               ],
                                            //                             ),
                                            //                           ),
                                            //                         ],
                                            //                       ),
                                            //                       Icon(
                                            //                         Icons
                                            //                             .bookmark_border_outlined,
                                            //                         color: Color(
                                            //                             0xFF333333),
                                            //                         size: 16,
                                            //                       ),
                                            //                     ],
                                            //                   ),
                                            //                 ),
                                            //               ],
                                            //             ),
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       Padding(
                                            //         padding:
                                            //             EdgeInsetsDirectional
                                            //                 .fromSTEB(
                                            //                     0, 0, 0, 10),
                                            //         child: Container(
                                            //           width: double.infinity,
                                            //           decoration: BoxDecoration(
                                            //             color: Colors.white,
                                            //             borderRadius:
                                            //                 BorderRadius
                                            //                     .circular(20),
                                            //           ),
                                            //           child: Padding(
                                            //             padding:
                                            //                 EdgeInsetsDirectional
                                            //                     .fromSTEB(10,
                                            //                         10, 10, 10),
                                            //             child: Column(
                                            //               mainAxisSize:
                                            //                   MainAxisSize.max,
                                            //               children: [
                                            //                 Padding(
                                            //                   padding:
                                            //                       EdgeInsetsDirectional
                                            //                           .fromSTEB(
                                            //                               10,
                                            //                               0,
                                            //                               10,
                                            //                               0),
                                            //                   child: Row(
                                            //                     mainAxisSize:
                                            //                         MainAxisSize
                                            //                             .max,
                                            //                     mainAxisAlignment:
                                            //                         MainAxisAlignment
                                            //                             .spaceBetween,
                                            //                     children: [
                                            //                       Row(
                                            //                         mainAxisSize:
                                            //                             MainAxisSize
                                            //                                 .max,
                                            //                         children: [
                                            //                           Container(
                                            //                             width:
                                            //                                 40,
                                            //                             height:
                                            //                                 40,
                                            //                             clipBehavior:
                                            //                                 Clip.antiAlias,
                                            //                             decoration:
                                            //                                 BoxDecoration(
                                            //                               shape:
                                            //                                   BoxShape.circle,
                                            //                             ),
                                            //                             child:
                                            //                                 CircleAvatar(
                                            //                               radius:
                                            //                                   50,
                                            //                               backgroundImage: HttpService().getImage(controller
                                            //                                   .profileModel
                                            //                                   .value!
                                            //                                   .username),
                                            //                             ),
                                            //                             // child: Image
                                            //                             //     .asset(
                                            //                             //   'assets/images/fguzhtnvdm6r42bl8dte0c5i8x6a.jfif',
                                            //                             // ),
                                            //                           ),
                                            //                           Padding(
                                            //                             padding: EdgeInsetsDirectional.fromSTEB(
                                            //                                 5,
                                            //                                 0,
                                            //                                 0,
                                            //                                 0),
                                            //                             child:
                                            //                                 Column(
                                            //                               mainAxisSize:
                                            //                                   MainAxisSize.max,
                                            //                               mainAxisAlignment:
                                            //                                   MainAxisAlignment.start,
                                            //                               crossAxisAlignment:
                                            //                                   CrossAxisAlignment.start,
                                            //                               children: [
                                            //                                 Row(
                                            //                                   mainAxisSize: MainAxisSize.max,
                                            //                                   children: [
                                            //                                     Text(
                                            //                                       controller.profileModel.value!.name,
                                            //                                       style: FlutterFlowTheme.of(context).bodyText1.override(
                                            //                                             fontFamily: 'Poppins',
                                            //                                             fontSize: 12,
                                            //                                           ),
                                            //                                     ),
                                            //                                     Padding(
                                            //                                       padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                            //                                       child: Icon(
                                            //                                         Icons.verified_rounded,
                                            //                                         color: FlutterFlowTheme.of(context).primaryColor,
                                            //                                         size: 12,
                                            //                                       ),
                                            //                                     ),
                                            //                                   ],
                                            //                                 ),
                                            //                                 Text(
                                            //                                   '@${controller.profileModel.value!.username}',
                                            //                                   style: FlutterFlowTheme.of(context).bodyText1.override(
                                            //                                         fontFamily: 'Poppins',
                                            //                                         color: Color(0xFF787878),
                                            //                                         fontSize: 10,
                                            //                                         fontWeight: FontWeight.normal,
                                            //                                       ),
                                            //                                 ),
                                            //                               ],
                                            //                             ),
                                            //                           ),
                                            //                         ],
                                            //                       ),
                                            //                       FaIcon(
                                            //                         FontAwesomeIcons
                                            //                             .ellipsisV,
                                            //                         color: Color(
                                            //                             0xFF787878),
                                            //                         size: 16,
                                            //                       ),
                                            //                     ],
                                            //                   ),
                                            //                 ),
                                            //                 Padding(
                                            //                   padding:
                                            //                       EdgeInsetsDirectional
                                            //                           .fromSTEB(
                                            //                               0,
                                            //                               5,
                                            //                               0,
                                            //                               0),
                                            //                   child: Container(
                                            //                     width: double
                                            //                         .infinity,
                                            //                     decoration:
                                            //                         BoxDecoration(),
                                            //                     child: Text(
                                            //                       'I\'m going to improve Flutter Flow for the whole community, implementing features to improve the user experience.',
                                            //                       style: FlutterFlowTheme.of(
                                            //                               context)
                                            //                           .bodyText1
                                            //                           .override(
                                            //                             fontFamily:
                                            //                                 'Poppins',
                                            //                             fontSize:
                                            //                                 10,
                                            //                             fontWeight:
                                            //                                 FontWeight.normal,
                                            //                           ),
                                            //                     ),
                                            //                   ),
                                            //                 ),
                                            //                 Padding(
                                            //                   padding:
                                            //                       EdgeInsetsDirectional
                                            //                           .fromSTEB(
                                            //                               0,
                                            //                               5,
                                            //                               0,
                                            //                               0),
                                            //                   child: Row(
                                            //                     mainAxisSize:
                                            //                         MainAxisSize
                                            //                             .max,
                                            //                     mainAxisAlignment:
                                            //                         MainAxisAlignment
                                            //                             .spaceBetween,
                                            //                     children: [
                                            //                       Row(
                                            //                         mainAxisSize:
                                            //                             MainAxisSize
                                            //                                 .max,
                                            //                         children: [
                                            //                           Container(
                                            //                             width:
                                            //                                 40,
                                            //                             child:
                                            //                                 Stack(
                                            //                               children: [
                                            //                                 Container(
                                            //                                   width: 20,
                                            //                                   height: 20,
                                            //                                   decoration: BoxDecoration(
                                            //                                     color: Colors.white,
                                            //                                     shape: BoxShape.circle,
                                            //                                     border: Border.all(
                                            //                                       color: Colors.white,
                                            //                                       width: 1,
                                            //                                     ),
                                            //                                   ),
                                            //                                   child: Container(
                                            //                                     width: 20,
                                            //                                     height: 20,
                                            //                                     clipBehavior: Clip.antiAlias,
                                            //                                     decoration: BoxDecoration(
                                            //                                       shape: BoxShape.circle,
                                            //                                     ),
                                            //                                     child: Image.network(
                                            //                                       'https://picsum.photos/seed/711/600',
                                            //                                     ),
                                            //                                   ),
                                            //                                 ),
                                            //                                 Align(
                                            //                                   alignment: AlignmentDirectional(0.1, 0),
                                            //                                   child: Container(
                                            //                                     width: 20,
                                            //                                     height: 20,
                                            //                                     decoration: BoxDecoration(
                                            //                                       color: FlutterFlowTheme.of(context).secondaryBackground,
                                            //                                       shape: BoxShape.circle,
                                            //                                       border: Border.all(
                                            //                                         color: Colors.white,
                                            //                                         width: 1,
                                            //                                       ),
                                            //                                     ),
                                            //                                     child: Container(
                                            //                                       width: 20,
                                            //                                       height: 20,
                                            //                                       clipBehavior: Clip.antiAlias,
                                            //                                       decoration: BoxDecoration(
                                            //                                         shape: BoxShape.circle,
                                            //                                       ),
                                            //                                       child: Image.network(
                                            //                                         'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                            //                                         fit: BoxFit.cover,
                                            //                                       ),
                                            //                                     ),
                                            //                                   ),
                                            //                                 ),
                                            //                               ],
                                            //                             ),
                                            //                           ),
                                            //                           Padding(
                                            //                             padding: EdgeInsetsDirectional.fromSTEB(
                                            //                                 0,
                                            //                                 0,
                                            //                                 10,
                                            //                                 0),
                                            //                             child:
                                            //                                 Row(
                                            //                               mainAxisSize:
                                            //                                   MainAxisSize.max,
                                            //                               crossAxisAlignment:
                                            //                                   CrossAxisAlignment.center,
                                            //                               children: [
                                            //                                 Padding(
                                            //                                   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                            //                                   child: Row(
                                            //                                     mainAxisSize: MainAxisSize.max,
                                            //                                     crossAxisAlignment: CrossAxisAlignment.end,
                                            //                                     children: [
                                            //                                       FaIcon(
                                            //                                         FontAwesomeIcons.commentAlt,
                                            //                                         color: Color(0xFF787878),
                                            //                                         size: 12,
                                            //                                       ),
                                            //                                       Padding(
                                            //                                         padding: EdgeInsetsDirectional.fromSTEB(3, 0, 2, 0),
                                            //                                         child: Text(
                                            //                                           '4',
                                            //                                           style: FlutterFlowTheme.of(context).bodyText1.override(
                                            //                                                 fontFamily: 'Poppins',
                                            //                                                 fontSize: 10,
                                            //                                                 fontWeight: FontWeight.w500,
                                            //                                               ),
                                            //                                         ),
                                            //                                       ),
                                            //                                     ],
                                            //                                   ),
                                            //                                 ),
                                            //                                 Icon(
                                            //                                   Icons.favorite,
                                            //                                   color: FlutterFlowTheme.of(context).alternate,
                                            //                                   size: 16,
                                            //                                 ),
                                            //                                 Padding(
                                            //                                   padding: EdgeInsetsDirectional.fromSTEB(3, 0, 2, 0),
                                            //                                   child: Text(
                                            //                                     '12',
                                            //                                     style: FlutterFlowTheme.of(context).bodyText1.override(
                                            //                                           fontFamily: 'Poppins',
                                            //                                           fontSize: 10,
                                            //                                           fontWeight: FontWeight.w500,
                                            //                                         ),
                                            //                                   ),
                                            //                                 ),
                                            //                               ],
                                            //                             ),
                                            //                           ),
                                            //                         ],
                                            //                       ),
                                            //                       Icon(
                                            //                         Icons
                                            //                             .bookmark_border_outlined,
                                            //                         color: Color(
                                            //                             0xFF333333),
                                            //                         size: 16,
                                            //                       ),
                                            //                     ],
                                            //                   ),
                                            //                 ),
                                            //               ],
                                            //             ),
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       Padding(
                                            //         padding:
                                            //             EdgeInsetsDirectional
                                            //                 .fromSTEB(
                                            //                     0, 0, 0, 10),
                                            //         child: Container(
                                            //           width: double.infinity,
                                            //           decoration: BoxDecoration(
                                            //             color: Colors.white,
                                            //             borderRadius:
                                            //                 BorderRadius
                                            //                     .circular(20),
                                            //           ),
                                            //           child: Padding(
                                            //             padding:
                                            //                 EdgeInsetsDirectional
                                            //                     .fromSTEB(10,
                                            //                         10, 10, 10),
                                            //             child: Column(
                                            //               mainAxisSize:
                                            //                   MainAxisSize.max,
                                            //               children: [
                                            //                 Padding(
                                            //                   padding:
                                            //                       EdgeInsetsDirectional
                                            //                           .fromSTEB(
                                            //                               10,
                                            //                               0,
                                            //                               10,
                                            //                               0),
                                            //                   child: Row(
                                            //                     mainAxisSize:
                                            //                         MainAxisSize
                                            //                             .max,
                                            //                     mainAxisAlignment:
                                            //                         MainAxisAlignment
                                            //                             .spaceBetween,
                                            //                     children: [
                                            //                       Row(
                                            //                         mainAxisSize:
                                            //                             MainAxisSize
                                            //                                 .max,
                                            //                         children: [
                                            //                           Container(
                                            //                             width:
                                            //                                 40,
                                            //                             height:
                                            //                                 40,
                                            //                             clipBehavior:
                                            //                                 Clip.antiAlias,
                                            //                             decoration:
                                            //                                 BoxDecoration(
                                            //                               shape:
                                            //                                   BoxShape.circle,
                                            //                             ),
                                            //                             child:
                                            //                                 CircleAvatar(
                                            //                               radius:
                                            //                                   50,
                                            //                               backgroundImage: HttpService().getImage(controller
                                            //                                   .profileModel
                                            //                                   .value!
                                            //                                   .username),
                                            //                             ),
                                            //                             // child: Image
                                            //                             //     .asset(
                                            //                             //   'assets/images/fguzhtnvdm6r42bl8dte0c5i8x6a.jfif',
                                            //                             // ),
                                            //                           ),
                                            //                           Padding(
                                            //                             padding: EdgeInsetsDirectional.fromSTEB(
                                            //                                 5,
                                            //                                 0,
                                            //                                 0,
                                            //                                 0),
                                            //                             child:
                                            //                                 Column(
                                            //                               mainAxisSize:
                                            //                                   MainAxisSize.max,
                                            //                               mainAxisAlignment:
                                            //                                   MainAxisAlignment.start,
                                            //                               crossAxisAlignment:
                                            //                                   CrossAxisAlignment.start,
                                            //                               children: [
                                            //                                 Row(
                                            //                                   mainAxisSize: MainAxisSize.max,
                                            //                                   children: [
                                            //                                     Text(
                                            //                                       controller.profileModel.value!.name,
                                            //                                       style: FlutterFlowTheme.of(context).bodyText1.override(
                                            //                                             fontFamily: 'Poppins',
                                            //                                             fontSize: 12,
                                            //                                           ),
                                            //                                     ),
                                            //                                     Padding(
                                            //                                       padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                            //                                       child: Icon(
                                            //                                         Icons.verified_rounded,
                                            //                                         color: FlutterFlowTheme.of(context).primaryColor,
                                            //                                         size: 12,
                                            //                                       ),
                                            //                                     ),
                                            //                                   ],
                                            //                                 ),
                                            //                                 Text(
                                            //                                   '@${controller.profileModel.value!.username}',
                                            //                                   style: FlutterFlowTheme.of(context).bodyText1.override(
                                            //                                         fontFamily: 'Poppins',
                                            //                                         color: Color(0xFF787878),
                                            //                                         fontSize: 10,
                                            //                                         fontWeight: FontWeight.normal,
                                            //                                       ),
                                            //                                 ),
                                            //                               ],
                                            //                             ),
                                            //                           ),
                                            //                         ],
                                            //                       ),
                                            //                       FaIcon(
                                            //                         FontAwesomeIcons
                                            //                             .ellipsisV,
                                            //                         color: Color(
                                            //                             0xFF787878),
                                            //                         size: 16,
                                            //                       ),
                                            //                     ],
                                            //                   ),
                                            //                 ),
                                            //                 Padding(
                                            //                   padding:
                                            //                       EdgeInsetsDirectional
                                            //                           .fromSTEB(
                                            //                               0,
                                            //                               5,
                                            //                               0,
                                            //                               0),
                                            //                   child: Container(
                                            //                     width: double
                                            //                         .infinity,
                                            //                     decoration:
                                            //                         BoxDecoration(),
                                            //                     child: Text(
                                            //                       'I\'m going to improve Flutter Flow for the whole community, implementing features to improve the user experience.',
                                            //                       style: FlutterFlowTheme.of(
                                            //                               context)
                                            //                           .bodyText1
                                            //                           .override(
                                            //                             fontFamily:
                                            //                                 'Poppins',
                                            //                             fontSize:
                                            //                                 10,
                                            //                             fontWeight:
                                            //                                 FontWeight.normal,
                                            //                           ),
                                            //                     ),
                                            //                   ),
                                            //                 ),
                                            //                 Padding(
                                            //                   padding:
                                            //                       EdgeInsetsDirectional
                                            //                           .fromSTEB(
                                            //                               0,
                                            //                               5,
                                            //                               0,
                                            //                               0),
                                            //                   child: Row(
                                            //                     mainAxisSize:
                                            //                         MainAxisSize
                                            //                             .max,
                                            //                     mainAxisAlignment:
                                            //                         MainAxisAlignment
                                            //                             .spaceBetween,
                                            //                     children: [
                                            //                       Row(
                                            //                         mainAxisSize:
                                            //                             MainAxisSize
                                            //                                 .max,
                                            //                         children: [
                                            //                           Container(
                                            //                             width:
                                            //                                 40,
                                            //                             child:
                                            //                                 Stack(
                                            //                               children: [
                                            //                                 Container(
                                            //                                   width: 20,
                                            //                                   height: 20,
                                            //                                   decoration: BoxDecoration(
                                            //                                     color: Colors.white,
                                            //                                     shape: BoxShape.circle,
                                            //                                     border: Border.all(
                                            //                                       color: Colors.white,
                                            //                                       width: 1,
                                            //                                     ),
                                            //                                   ),
                                            //                                   child: Container(
                                            //                                     width: 20,
                                            //                                     height: 20,
                                            //                                     clipBehavior: Clip.antiAlias,
                                            //                                     decoration: BoxDecoration(
                                            //                                       shape: BoxShape.circle,
                                            //                                     ),
                                            //                                     child: Image.network(
                                            //                                       'https://picsum.photos/seed/711/600',
                                            //                                     ),
                                            //                                   ),
                                            //                                 ),
                                            //                                 Align(
                                            //                                   alignment: AlignmentDirectional(0.1, 0),
                                            //                                   child: Container(
                                            //                                     width: 20,
                                            //                                     height: 20,
                                            //                                     decoration: BoxDecoration(
                                            //                                       color: FlutterFlowTheme.of(context).secondaryBackground,
                                            //                                       shape: BoxShape.circle,
                                            //                                       border: Border.all(
                                            //                                         color: Colors.white,
                                            //                                         width: 1,
                                            //                                       ),
                                            //                                     ),
                                            //                                     child: Container(
                                            //                                       width: 20,
                                            //                                       height: 20,
                                            //                                       clipBehavior: Clip.antiAlias,
                                            //                                       decoration: BoxDecoration(
                                            //                                         shape: BoxShape.circle,
                                            //                                       ),
                                            //                                       child: Image.network(
                                            //                                         'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                            //                                         fit: BoxFit.cover,
                                            //                                       ),
                                            //                                       // child: CircleAvatar(
                                            //                                       //   radius: 50,
                                            //                                       //   backgroundImage: HttpService().getImage(controller.profileModel.value!.username),
                                            //                                       // ),
                                            //                                     ),
                                            //                                   ),
                                            //                                 ),
                                            //                               ],
                                            //                             ),
                                            //                           ),
                                            //                           Padding(
                                            //                             padding: EdgeInsetsDirectional.fromSTEB(
                                            //                                 0,
                                            //                                 0,
                                            //                                 10,
                                            //                                 0),
                                            //                             child:
                                            //                                 Row(
                                            //                               mainAxisSize:
                                            //                                   MainAxisSize.max,
                                            //                               crossAxisAlignment:
                                            //                                   CrossAxisAlignment.center,
                                            //                               children: [
                                            //                                 Padding(
                                            //                                   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                            //                                   child: Row(
                                            //                                     mainAxisSize: MainAxisSize.max,
                                            //                                     crossAxisAlignment: CrossAxisAlignment.end,
                                            //                                     children: [
                                            //                                       FaIcon(
                                            //                                         FontAwesomeIcons.commentAlt,
                                            //                                         color: Color(0xFF787878),
                                            //                                         size: 12,
                                            //                                       ),
                                            //                                       Padding(
                                            //                                         padding: EdgeInsetsDirectional.fromSTEB(3, 0, 2, 0),
                                            //                                         child: Text(
                                            //                                           '4',
                                            //                                           style: FlutterFlowTheme.of(context).bodyText1.override(
                                            //                                                 fontFamily: 'Poppins',
                                            //                                                 fontSize: 10,
                                            //                                                 fontWeight: FontWeight.w500,
                                            //                                               ),
                                            //                                         ),
                                            //                                       ),
                                            //                                     ],
                                            //                                   ),
                                            //                                 ),
                                            //                                 Icon(
                                            //                                   Icons.favorite,
                                            //                                   color: FlutterFlowTheme.of(context).alternate,
                                            //                                   size: 16,
                                            //                                 ),
                                            //                                 Padding(
                                            //                                   padding: EdgeInsetsDirectional.fromSTEB(3, 0, 2, 0),
                                            //                                   child: Text(
                                            //                                     '12',
                                            //                                     style: FlutterFlowTheme.of(context).bodyText1.override(
                                            //                                           fontFamily: 'Poppins',
                                            //                                           fontSize: 10,
                                            //                                           fontWeight: FontWeight.w500,
                                            //                                         ),
                                            //                                   ),
                                            //                                 ),
                                            //                               ],
                                            //                             ),
                                            //                           ),
                                            //                         ],
                                            //                       ),
                                            //                       Icon(
                                            //                         Icons
                                            //                             .bookmark_border_outlined,
                                            //                         color: Color(
                                            //                             0xFF333333),
                                            //                         size: 16,
                                            //                       ),
                                            //                     ],
                                            //                   ),
                                            //                 ),
                                            //               ],
                                            //             ),
                                            //           ),
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const BlogsList(
                                        url: '/blogpost/getOwnBlogs')
                                  ],
                                ),
                              ),
                              // Align(
                              //   alignment: AlignmentDirectional(0, 1),
                              //   child: wrapWithModel(
                              //     model: _model.navBarWithMiddleButtonModel,
                              //     updateCallback: () => setState(() {}),
                              //     child: NavBarWithMiddleButtonWidget(),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        //const BlogsList(url: '/blogpost/getOwnBlogs')
                      ],
                    ),
                  )));

    //----------------------------------------------
    // return Scaffold(
    //   backgroundColor: const Color(0xffEEEEFF),
    //   appBar: AppBar(
    //     elevation: 0,
    //     backgroundColor: Colors.white10,
    //     actions: <Widget>[
    //       IconButton(
    //         icon: const Icon(Icons.edit),
    //         onPressed: () {},
    //         color: Colors.black,
    //       ),
    //     ],
    //   ),

    // body: Obx(
    //   () => controller.profileModel.value == null
    //       ? Center(child: circularProgress())
    //       : ListView(
    //           children: [
    //             head(),
    //             const Divider(thickness: 0.8),
    //             otherDetails('About', controller.profileModel.value!.about),
    //             otherDetails('Name', controller.profileModel.value!.name),
    //             otherDetails(
    //                 'Profession', controller.profileModel.value!.profession),
    //             otherDetails('DOB', controller.profileModel.value!.dob),
    //             const Divider(thickness: 0.8),
    //             const SizedBox(height: 20),
    //             const BlogsList(url: '/blogpost/getOwnBlogs'),
    //           ],
    //         ),
    // ),
    // );
  }

  Widget head() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: HttpService()
                  .getImage(controller.profileModel.value!.username),
            ),
          ),
          Text(
            '@${controller.profileModel.value!.username}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(controller.profileModel.value!.titleline),
        ],
      ),
    );
  }

  Widget otherDetails(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
