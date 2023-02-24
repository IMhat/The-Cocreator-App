import 'package:cocreator/pages/screens/socialmedia/blog/components/image_place_holder.dart';
import 'package:cocreator/pages/screens/socialmedia/blog/controllers/add_blog_controller.dart';

import 'package:cocreator/pages/screens/socialmedia/components/auth_button_black.dart';
import 'package:cocreator/pages/screens/socialmedia/profile/components/profile_field.dart';
import 'package:cocreator/pages/screens/socialmedia/widgets/image_bottom_sheet.dart';
import 'package:cocreator/pages/screens/socialmedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../home/components/flutter_flow/flutter_flow_theme.dart';
import '../home/components/flutter_flow/flutter_flow_util.dart';

class AddBlogScreen extends GetView<AddBlogController> {
  AddBlogScreen({Key? key}) : super(key: key);

  final _unfocusNode = FocusNode();

  //late StreamSubscription<bool> _keyboardVisibilitySubscription;
  //bool _isKeyboardVisible = false;

  // final animationsMap = {
  //   'containerOnPageLoadAnimation': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     effects: [
  //       VisibilityEffect(duration: 1.ms),
  //       FadeEffect(
  //         curve: Curves.easeInOut,
  //         delay: 0.ms,
  //         duration: 200.ms,
  //         begin: 0,
  //         end: 1,
  //       ),
  //     ],
  //   ),
  // };

  @override
  Widget build(BuildContext context) {
    // context.watch<FFAppState>();
    Get.put(AddBlogController());
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white54,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.clear,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'New post',
                style: FlutterFlowTheme.of(context).subtitle1.override(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: Form(
            key: controller.formKey,
            // SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 0.5,
                      decoration: BoxDecoration(
                        color: Color(0xFFDADADA),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Obx(
                        () => controller.imageFile.value == null
                            ? GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: ((builder) {
                                      return ImageBottomSheet(
                                        title: 'Upload Blog Image',
                                        cameraPressed: () => controller
                                            .pickImage(ImageSource.camera),
                                        galleryPressed: () => controller
                                            .pickImage(ImageSource.gallery),
                                      );
                                    }),
                                  );
                                },
                                child: const ImagePlaceHolder(),
                              )
                            : Image.file(
                                controller.imageFile.value!,
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.28,
                              ),
                      ),
                    ),
                    // Container(
                    //   width: double.infinity,
                    //   height: 120,
                    //   decoration: BoxDecoration(
                    //     color: FlutterFlowTheme.of(context).secondaryBackground,
                    //   ),
                    //   child: Align(
                    //     alignment: AlignmentDirectional(0, 0),
                    //     child: Padding(
                    //       padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                    //       child: Row(
                    //         mainAxisSize: MainAxisSize.max,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Obx(
                    //             () => controller.imageFile.value == null
                    //                 ? GestureDetector(
                    //                     onTap: () {
                    //                       showModalBottomSheet(
                    //                         context: context,
                    //                         builder: ((builder) {
                    //                           return ImageBottomSheet(
                    //                             title: 'Upload Blog Image',
                    //                             cameraPressed: () => controller
                    //                                 .pickImage(ImageSource.camera),
                    //                             galleryPressed: () => controller
                    //                                 .pickImage(ImageSource.gallery),
                    //                           );
                    //                         }),
                    //                       );
                    //                     },
                    //                     child: const ImagePlaceHolder(),
                    //                   )
                    //                 : Image.file(
                    //                     controller.imageFile.value!,
                    //                     width: double.infinity,
                    //                     height: MediaQuery.of(context).size.height *
                    //                         0.28,
                    //                   ),
                    //           ),
                    //           // InkWell(
                    //           //   onTap: () async {
                    //           //     // await Navigator.push(
                    //           //     //   context,
                    //           //     //   PageTransition(
                    //           //     //     type: PageTransitionType.fade,
                    //           //     //     child: FlutterFlowExpandedImageView(
                    //           //     //       image: Image.network(
                    //           //     //         FFAppState().uploadPhoto,
                    //           //     //         fit: BoxFit.contain,
                    //           //     //       ),
                    //           //     //       allowRotation: false,
                    //           //     //       tag: FFAppState().uploadPhoto,
                    //           //     //       useHeroAnimation: true,
                    //           //     //     ),
                    //           //     //   ),
                    //           //     // );
                    //           //   },
                    //           //   // child: Hero(
                    //           //   //   tag: FFAppState().uploadPhoto,
                    //           //   //   transitionOnUserGestures: true,
                    //           //   //   child: Image.network(
                    //           //   //     FFAppState().uploadPhoto,
                    //           //   //     width: 80,
                    //           //   //     height: 80,
                    //           //   //     fit: BoxFit.cover,
                    //           //   //   ),
                    //           //   // ),
                    //           // ),

                    // const SizedBox(height: 24),
                    // ProfileField(
                    //   controller: controller.titleController,
                    //   labelText: 'Title',
                    //   hintText: 'Provide title of your blog',
                    //   maxLength: 60,
                    //   iconData: Icons.title,
                    //   textInputAction: TextInputAction.next,
                    //   keyboardType: TextInputType.text,
                    //   maxLines: null,
                    //   validator: (value) {
                    //     if (value == null || value.trim().isEmpty) {
                    //       return 'Title can\'t be empty';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // const SizedBox(height: 24),
                    Divider(),
                    Container(
                      height: 50,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: TextFormField(
                          // controller: _model.textController,
                          controller: controller.titleController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.normal,
                                      lineHeight: 1.5,
                                    ),
                            hintText: 'Write a tile...',
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    lineHeight: 1.5,
                                  ),
                          maxLines: 3,
                          // validator: _model.textControllerValidator
                          //     .asValidator(context),
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 100,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: TextFormField(
                          // controller: _model.textController,
                          controller: controller.bodyController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.normal,
                                      lineHeight: 1.5,
                                    ),
                            hintText: 'Write a caption...',
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    lineHeight: 1.5,
                                  ),
                          maxLines: 3,
                          // validator: _model.textControllerValidator
                          //     .asValidator(context),
                        ),
                      ),
                    ),
                    Divider(),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, -7.07),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 24),
                                  child: InkWell(
                                    onTap: () async {
                                      // context.pushNamed(
                                      //   'TagUsers',
                                      //   extra: <String, dynamic>{
                                      //     kTransitionInfoKey: TransitionInfo(
                                      //       hasTransition: true,
                                      //       transitionType:
                                      //           PageTransitionType.bottomToTop,
                                      //     ),
                                      //   },
                                      // );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 0, 0, 0),
                                          child: Text(
                                            'Tag people',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 15, 0),
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Color(0x80000000),
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding:
                                //       EdgeInsetsDirectional.fromSTEB(0, 0, 0, 26),
                                //   child: Stack(
                                //     children: [
                                //       // if (FFAppState().calltoactionenabled)
                                //       InkWell(
                                //         onTap: () async {
                                //           // context.pushNamed(
                                //           //   'CallToAction',
                                //           //   extra: <String, dynamic>{
                                //           //     kTransitionInfoKey: TransitionInfo(
                                //           //       hasTransition: true,
                                //           //       transitionType:
                                //           //           PageTransitionType.bottomToTop,
                                //           //     ),
                                //           //   },
                                //           // );
                                //         },
                                //         child: Row(
                                //           mainAxisSize: MainAxisSize.max,
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.spaceBetween,
                                //           children: [
                                //             // Padding(
                                //             //   padding:
                                //             //       EdgeInsetsDirectional.fromSTEB(
                                //             //           15, 0, 0, 0),
                                //             //   child: Column(
                                //             //     mainAxisSize: MainAxisSize.max,
                                //             //     crossAxisAlignment:
                                //             //         CrossAxisAlignment.start,
                                //             //     children: [
                                //             //       // Text(
                                //             //       //   // FFAppState().calltoactiontext,
                                //             //       //   style: FlutterFlowTheme.of(
                                //             //       //           context)
                                //             //       //       .bodyText1
                                //             //       //       .override(
                                //             //       //         fontFamily: 'Inter',
                                //             //       //         fontSize: 14,
                                //             //       //         fontWeight:
                                //             //       //             FontWeight.w600,
                                //             //       //       ),
                                //             //       // ),
                                //             //       // Padding(
                                //             //       //   padding: EdgeInsetsDirectional
                                //             //       //       .fromSTEB(0, 2, 0, 0),
                                //             //       //   // child: Text(
                                //             //       //   //   FFAppState()
                                //             //       //   //       .calltoactionurl,
                                //             //       //   //   style: FlutterFlowTheme.of(
                                //             //       //   //           context)
                                //             //       //   //       .bodyText1
                                //             //       //   //       .override(
                                //             //       //   //         fontFamily: 'Inter',
                                //             //       //   //         color: FlutterFlowTheme
                                //             //       //   //                 .of(context)
                                //             //       //   //             .secondaryText,
                                //             //       //   //         fontSize: 13,
                                //             //       //   //         fontWeight:
                                //             //       //   //             FontWeight.normal,
                                //             //       //   //       ),
                                //             //       //   // ),
                                //             //       // ),
                                //             //     ],
                                //             //   ),
                                //             // ),
                                //             Padding(
                                //               padding:
                                //                   EdgeInsetsDirectional.fromSTEB(
                                //                       0, 0, 15, 0),
                                //               child: InkWell(
                                //                 onTap: () async {
                                //                   // FFAppState().update(() {
                                //                   //   FFAppState()
                                //                   //           .calltoactionenabled =
                                //                   //       false;
                                //                   //   FFAppState()
                                //                   //       .calltoactiontext = '';
                                //                   // });
                                //                   // FFAppState().update(() {
                                //                   //   FFAppState().calltoactionurl =
                                //                   //       '';
                                //                   // });
                                //                 },
                                //                 child: Icon(
                                //                   Icons.close_rounded,
                                //                   color: Color(0x80000000),
                                //                   size: 18,
                                //                 ),
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //       // if (!FFAppState().calltoactionenabled)
                                //       // InkWell(
                                //       //   onTap: () async {
                                //       //     // context.pushNamed(
                                //       //     //   'CallToAction',
                                //       //     //   extra: <String, dynamic>{
                                //       //     //     kTransitionInfoKey: TransitionInfo(
                                //       //     //       hasTransition: true,
                                //       //     //       transitionType:
                                //       //     //           PageTransitionType.bottomToTop,
                                //       //     //     ),
                                //       //     //   },
                                //       //     // );
                                //       //   },
                                //       //   child: Row(
                                //       //     mainAxisSize: MainAxisSize.max,
                                //       //     mainAxisAlignment:
                                //       //         MainAxisAlignment.spaceBetween,
                                //       //     children: [
                                //       //       Padding(
                                //       //         padding:
                                //       //             EdgeInsetsDirectional.fromSTEB(
                                //       //                 15, 0, 0, 0),
                                //       //         child: Text(
                                //       //           'Add call to action',
                                //       //           style: FlutterFlowTheme.of(context)
                                //       //               .bodyText1
                                //       //               .override(
                                //       //                 fontFamily: 'Inter',
                                //       //                 fontSize: 14,
                                //       //                 fontWeight: FontWeight.normal,
                                //       //               ),
                                //       //         ),
                                //       //       ),
                                //       //       Padding(
                                //       //         padding:
                                //       //             EdgeInsetsDirectional.fromSTEB(
                                //       //                 0, 0, 15, 0),
                                //       //         child: Icon(
                                //       //           Icons.arrow_forward_ios_rounded,
                                //       //           color: Color(0x80000000),
                                //       //           size: 18,
                                //       //         ),
                                //       //       ),
                                //       //     ],
                                //       //   ),
                                //       // ),
                                //     ],
                                //   ),
                                // ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    // if (FFAppState().location == null ||
                                    //     FFAppState().location == '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 16),
                                      child: InkWell(
                                        onTap: () async {
                                          // context.pushNamed(
                                          //   'Location',
                                          //   extra: <String, dynamic>{
                                          //     kTransitionInfoKey: TransitionInfo(
                                          //       hasTransition: true,
                                          //       transitionType:
                                          //           PageTransitionType.bottomToTop,
                                          //     ),
                                          //   },
                                          // );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 0, 0),
                                              child: Text(
                                                'Add location',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 15, 0),
                                              child: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Color(0x80000000),
                                                size: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // if (FFAppState().location == null ||
                                    //     FFAppState().location == '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 16),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 10, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  // FFAppState().update(() {
                                                  //   FFAppState().location =
                                                  //       'New York, NY';
                                                  // });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEFEFEF),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 6, 8, 6),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'New York, NY',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 10, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  // FFAppState().update(() {
                                                  //   FFAppState().location =
                                                  //       'Silicon Valley, CA';
                                                  // });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF2F2F2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 6, 8, 6),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Silicon Valley, CA',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 10, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  // FFAppState().update(() {
                                                  //   FFAppState().location =
                                                  //       'Miami, FL';
                                                  // });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF2F2F2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 6, 8, 6),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Miami, FL',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 10, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  // FFAppState().update(() {
                                                  //   FFAppState().location =
                                                  //       'Chicago, IL';
                                                  // });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF2F2F2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 6, 8, 6),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Chicago, IL',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // if (FFAppState().location != null &&
                                    //     FFAppState().location != '')
                                    // Padding(
                                    //   padding: EdgeInsetsDirectional.fromSTEB(
                                    //       0, 0, 0, 16),
                                    //   child: InkWell(
                                    //     onTap: () async {
                                    //       // context.pushNamed(
                                    //       //   'CallToAction',
                                    //       //   extra: <String, dynamic>{
                                    //       //     kTransitionInfoKey: TransitionInfo(
                                    //       //       hasTransition: true,
                                    //       //       transitionType:
                                    //       //           PageTransitionType.bottomToTop,
                                    //       //     ),
                                    //       //   },
                                    //       // );
                                    //     },
                                    //     // child: Row(
                                    //     //   mainAxisSize: MainAxisSize.max,
                                    //     //   mainAxisAlignment:
                                    //     //       MainAxisAlignment.spaceBetween,
                                    //     //   children: [
                                    //     //     // Padding(
                                    //     //     //   padding:
                                    //     //     //       EdgeInsetsDirectional.fromSTEB(
                                    //     //     //           15, 0, 0, 0),
                                    //     //     //   child: Column(
                                    //     //     //     mainAxisSize: MainAxisSize.max,
                                    //     //     //     crossAxisAlignment:
                                    //     //     //         CrossAxisAlignment.start,
                                    //     //     //     children: [
                                    //     //     //       // Text(
                                    //     //     //       //   FFAppState().location,
                                    //     //     //       //   style: FlutterFlowTheme.of(
                                    //     //     //       //           context)
                                    //     //     //       //       .bodyText1
                                    //     //     //       //       .override(
                                    //     //     //       //         fontFamily: 'Inter',
                                    //     //     //       //         fontSize: 14,
                                    //     //     //       //         fontWeight:
                                    //     //     //       //             FontWeight.w600,
                                    //     //     //       //       ),
                                    //     //     //       // ),
                                    //     //     //     ],
                                    //     //     //   ),
                                    //     //     // ),
                                    //     //     // Padding(
                                    //     //     //   padding:
                                    //     //     //       EdgeInsetsDirectional.fromSTEB(
                                    //     //     //           0, 0, 15, 0),
                                    //     //     //   child: InkWell(
                                    //     //     //     onTap: () async {
                                    //     //     //       // FFAppState().update(() {
                                    //     //     //       //   FFAppState().location = '';
                                    //     //     //       // });
                                    //     //     //     },
                                    //     //     //     child: Icon(
                                    //     //     //       Icons.close_rounded,
                                    //     //     //       color: Color(0x80000000),
                                    //     //     //       size: 18,
                                    //     //     //     ),
                                    //     //     //   ),
                                    //     //     // ),
                                    //     //   ],
                                    //     // ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                // Padding(
                                //   padding:
                                //       EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                                //   child: Row(
                                //     mainAxisSize: MainAxisSize.max,
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Padding(
                                //         padding: EdgeInsetsDirectional.fromSTEB(
                                //             15, 0, 0, 0),
                                //         child: Text(
                                //           'Hide like and view counts on post',
                                //           style: FlutterFlowTheme.of(context)
                                //               .bodyText1
                                //               .override(
                                //                 fontFamily: 'Inter',
                                //                 fontSize: 14,
                                //                 fontWeight: FontWeight.normal,
                                //               ),
                                //         ),
                                //       ),
                                //       // Padding(
                                //       //   padding: EdgeInsetsDirectional.fromSTEB(
                                //       //       0, 0, 12, 0),
                                //       //   // child: Switch(
                                //       //   //   value: _model.switchValue1 ??= false,
                                //       //   //   onChanged: (newValue) async {
                                //       //   //     setState(() =>
                                //       //   //         _model.switchValue1 = newValue!);
                                //       //   //   },
                                //       //   //   activeColor: Colors.white,
                                //       //   //   activeTrackColor:
                                //       //   //       FlutterFlowTheme.of(context)
                                //       //   //           .secondaryColor,
                                //       //   //   inactiveTrackColor: Color(0xFFDADADA),
                                //       //   //   inactiveThumbColor: Colors.white,
                                //       //   // ),
                                //       // ),
                                //     ],
                                //   ),
                                // ),
                                // Padding(
                                //   padding:
                                //       EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                //   child: Row(
                                //     mainAxisSize: MainAxisSize.max,
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Padding(
                                //         padding: EdgeInsetsDirectional.fromSTEB(
                                //             15, 0, 0, 0),
                                //         child: Text(
                                //           'Hide comments on post',
                                //           style: FlutterFlowTheme.of(context)
                                //               .bodyText1
                                //               .override(
                                //                 fontFamily: 'Inter',
                                //                 fontSize: 14,
                                //                 fontWeight: FontWeight.normal,
                                //               ),
                                //         ),
                                //       ),
                                //       // Padding(
                                //       //   padding: EdgeInsetsDirectional.fromSTEB(
                                //       //       0, 0, 12, 0),
                                //       //   // child: Switch(
                                //       //   //   value: _model.switchValue2 ??= false,
                                //       //   //   onChanged: (newValue) async {
                                //       //   //     setState(() =>
                                //       //   //         _model.switchValue2 = newValue!);
                                //       //   //   },
                                //       //   //   activeColor: Colors.white,
                                //       //   //   activeTrackColor:
                                //       //   //       FlutterFlowTheme.of(context)
                                //       //   //           .secondaryColor,
                                //       //   //   inactiveTrackColor: Color(0xFFDADADA),
                                //       //   //   inactiveThumbColor: Colors.white,
                                //       //   // ),
                                //       // ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        // if (isWeb
                        //     ? MediaQuery.of(context).viewInsets.bottom > 0
                        //     : _isKeyboardVisible)
                        // Container(
                        //     width: double.infinity,
                        //     height: MediaQuery.of(context).size.height * 1,
                        //     decoration: BoxDecoration(
                        //       color: Color(0xC0000000),
                        //     )),
                        // ).animateOnPageLoad(
                        //     animationsMap['containerOnPageLoadAnimation']!),
                      ],
                    ),
                    //       const SizedBox(height: 20),
                    Center(
                      child: Obx(
                        () => controller.loading.value
                            ? circularProgress()
                            : AuthButton(
                                text: 'Add Blog',
                                onPressed: () => controller.addPost(),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // body: Form(
            //   key: controller.formKey,
            //   autovalidateMode: AutovalidateMode.always,
            //   child: ListView(
            //     padding: const EdgeInsets.symmetric(horizontal: 20),
            //     children: [
            //       Obx(
            //         () => controller.imageFile.value == null
            //             ? GestureDetector(
            //                 onTap: () {
            //                   showModalBottomSheet(
            //                     context: context,
            //                     builder: ((builder) {
            //                       return ImageBottomSheet(
            //                         title: 'Upload Blog Image',
            //                         cameraPressed: () =>
            //                             controller.pickImage(ImageSource.camera),
            //                         galleryPressed: () =>
            //                             controller.pickImage(ImageSource.gallery),
            //                       );
            //                     }),
            //                   );
            //                 },
            //                 child: const ImagePlaceHolder(),
            //               )
            //             : Image.file(
            //                 controller.imageFile.value!,
            //                 width: double.infinity,
            //                 height: MediaQuery.of(context).size.height * 0.28,
            //               ),
            //       ),
            //       const SizedBox(height: 24),
            //       ProfileField(
            //         controller: controller.titleController,
            //         labelText: 'Title',
            //         hintText: 'Provide title of your blog',
            //         maxLength: 60,
            //         iconData: Icons.title,
            //         textInputAction: TextInputAction.next,
            //         keyboardType: TextInputType.text,
            //         maxLines: null,
            //         validator: (value) {
            //           if (value == null || value.trim().isEmpty) {
            //             return 'Title can\'t be empty';
            //           }
            //           return null;
            //         },
            //       ),
            //       const SizedBox(height: 10),
            //       ProfileField(
            //         controller: controller.bodyController,
            //         labelText: 'Description',
            //         hintText: 'Provide description of your blog',
            //         iconData: Icons.description,
            //         textInputAction: TextInputAction.done,
            //         keyboardType: TextInputType.text,
            //         maxLines: null,
            //         validator: (value) {
            //           if (value == null || value.trim().isEmpty) {
            //             return 'Description can\'t be empty';
            //           }
            //           return null;
            //         },
            //       ),
            //       const SizedBox(height: 20),
            // Center(
            //   child: Obx(
            //     () => controller.loading.value
            //         ? circularProgress()
            //         : AuthButton(
            //             text: 'Add Blog',
            //             onPressed: () => controller.addPost(),
            //           ),
            //   ),
            // ),
            //     ],
            //   ),
            // ),
          ),
        ));
  }
}
