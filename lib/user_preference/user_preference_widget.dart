import 'package:aera_a_r/main.dart';
import 'package:http/http.dart' as http;
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_preference_model.dart';
export 'user_preference_model.dart';


class UserPreferenceWidget extends StatefulWidget {
  const UserPreferenceWidget({Key? key}) : super(key: key);

  @override
  _UserPreferenceWidgetState createState() => _UserPreferenceWidgetState();
}

class _UserPreferenceWidgetState extends State<UserPreferenceWidget> {
  late UserPreferenceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserPreferenceModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF27272A),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Align(
            alignment: AlignmentDirectional(0.0, -0.05),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.7),
                    child: Text(
                      'Select your interests',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 20.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 0.0),
                          child: Container(
                            width: 350.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF202020),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: InkWell(
                              onTap: () async {
                                String _url = 'http://127.0.0.1:5000/edit/Short-Sleeve Shirt';
                                _model.apiResultikd = await LongSlSHCall.call();
                                if ((_model.apiResultikd?.succeeded ?? true)) {
                                      var response = await http.get(Uri.parse(_url));
                                      var imageList = jsonDecode(response.body)['img_name_list'];
                                      if (imageList.length > 0) {
                                        setState(() {
                                          GlobalData.imagePath1 = 'http://127.0.0.1:5000/tshirt/' + imageList[0];
                                          GlobalData.imagePath2 = 'http://127.0.0.1:5000/tshirt/' + imageList[1];
                                          GlobalData.imagePath3 = 'http://127.0.0.1:5000/tshirt/' + imageList[2];
                    
                                          });
                                        }
                             

                                  context.pushNamed(
                                    'Home_Page',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                }

                                setState(() {});
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/DUL03708_900x-removebg-preview.png',
                                      width: 100.0,
                                      height: 95.0,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          50.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Casual Tees',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Generated code for this Container Widget...


                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: Container(
                            width: 350,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFF202020),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: InkWell(
                                  onTap: () async {
                                String _url = 'http://127.0.0.1:5000/edit/Long-Sleeve Shirt';
                                _model.apiResultikd = await LongSlSHCall.call();
                                if ((_model.apiResultikd?.succeeded ?? true)) {
                                      var response = await http.get(Uri.parse(_url));
                                      var imageList = jsonDecode(response.body)['img_name_list'];
                                      if (imageList.length > 0) {
                                        setState(() {
                                          GlobalData.imagePath1 = 'http://127.0.0.1:5000/tshirt/' + imageList[0];
                                          GlobalData.imagePath2 = 'http://127.0.0.1:5000/tshirt/' + imageList[1];
                                          GlobalData.imagePath3 = 'http://127.0.0.1:5000/tshirt/' + imageList[2];
                    
                                          });
                                        }
                             
                                    context.pushNamed(
                                    'Home_Page',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                }

                                setState(() {});
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/WhatsAppImage2023-03-04at15.31.57_900x-removebg-preview.png',
                                      width: 100,
                                      height: 95,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                                      child: Text(
                                        'Long Sleeves',
                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                              fontFamily: 'Poppins',
                                              color: FlutterFlowTheme.of(context).primaryBtnText,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                                  FlutterFlowTheme.of(context).titleMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 0.0),
                          child: Container(
                            width: 350.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF202020),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/A7304349_900x-removebg-preview.png',
                                    width: 100.0,
                                    height: 95.0,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        50.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Skinnies',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.25),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'Home_Page',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                            ),
                          },
                        );
                      },
                      text: 'Continue',
                      options: FFButtonOptions(
                        width: 290.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFFAEFA24),
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF0F1113),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
