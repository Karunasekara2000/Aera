import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'try_on_model.dart';
export 'try_on_model.dart';

class TryOnWidget extends StatefulWidget {
  const TryOnWidget({Key? key}) : super(key: key);

  @override
  _TryOnWidgetState createState() => _TryOnWidgetState();
}

class _TryOnWidgetState extends State<TryOnWidget> {
  late TryOnModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TryOnModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await launchURL(
          'https://www.snapchat.com/unlock/?type=SNAPCODE&uuid=6116c6b82d274f0c9556db70784edd53&metadata=01');
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: Color(0xFF27272A),
              ),
              child: InkWell(
                onTap: () async {
                  await launchURL(
                      'https://www.snapchat.com/unlock/?type=SNAPCODE&uuid=6116c6b82d274f0c9556db70784edd53&metadata=01');
                },
                child: Icon(
                  Icons.view_in_ar,
                  color: Color(0xFFAEFA24),
                  size: 125,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
