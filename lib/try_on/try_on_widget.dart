// Import necessary packages and files
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// Import the TryOnModel class from try_on_model.dart
import 'try_on_model.dart';
export 'try_on_model.dart';

// Define a StatefulWidget for the TryOnWidget
class TryOnWidget extends StatefulWidget {
  const TryOnWidget({Key? key}) : super(key: key);

  @override
  _TryOnWidgetState createState() => _TryOnWidgetState();
}

class _TryOnWidgetState extends State<TryOnWidget> {
   // Create an instance of the TryOnModel class
  late TryOnModel _model;
// Define a global key to access the scaffold's state
  final scaffoldKey = GlobalKey<ScaffoldState>();

 // Perform actions on page load
  @override
  void initState() {
    super.initState();
    // Create an instance of TryOnModel and set it to _model
    _model = createModel(context, () => TryOnModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Launch a URL to open a Snapchat AR filter
      await launchURL(
          'https://www.snapchat.com/unlock/?type=SNAPCODE&uuid=6116c6b82d274f0c9556db70784edd53&metadata=01');
    });
  }
// Dispose of the TryOnModel instance when the widget is removed from the tree
  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }
// Build the widget tree
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
                   // Launch a URL to open a Snapchat AR filter
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
