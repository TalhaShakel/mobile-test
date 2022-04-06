import 'package:diagnostic/Combine%20Widgets/text_widget.dart';
import 'package:diagnostic/Screens/wifitest_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:headset_connection_event/headset_event.dart';

class HeadPhoneTestScreen extends StatefulWidget {
  const HeadPhoneTestScreen({Key? key}) : super(key: key);

  @override
  _HeadPhoneTestScreenState createState() => _HeadPhoneTestScreenState();
}
final _headsetPlugin = HeadsetEvent();
HeadsetState? _headsetState;

class _HeadPhoneTestScreenState extends State<HeadPhoneTestScreen> {

  //_________________________________________INIT STATE
  @override
  void initState() {
    /// if headset is plugged
    _headsetPlugin.getCurrentState.then((_val) {
      setState(() {
        _headsetState = _val;
      });
    });

    /// Detect the moment headset is plugged or unplugged
    _headsetPlugin.setListener((_val) {
      setState(() {
        _headsetState = _val;
      });
    });
  }

  //_______________________________________MAIN BUILDER
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: size.height,
        width: size.width,
        decoration:  const BoxDecoration(
            gradient:  LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.greenAccent,
                Colors.lightBlue,
              ],
            )),
        child: Column(
          children: [
            headerImage(),
            textHeading(),
            subTextHeading(),
            buttonNext(),
          ],
        ),
      ),
    );
  }

  //_______________________________________FUNCTIONS

  //_____________________Heading image
   headerImage()
   {
     if(_headsetState == HeadsetState.DISCONNECT)
       {
         return Container(
           margin: EdgeInsets.only(top: 100),
           height: 300,
           width: 300,
           child: Image.asset('images/Error.gif'),
         );
       }
     else
       {
         return Container(
           margin: EdgeInsets.only(top: 100),
           height: 300,
           width: 300,

           child: Image.asset('images/okay.gif'),
         );
       }


   }
  //_____________________Heading text
  textHeading()
  {
   return _headsetState == HeadsetState.DISCONNECT ?
     TextWidgets.heading1("Oh, No !", Colors.white):
   TextWidgets.heading1("Connected !", Colors.white);
  }

  //_____________________SUB text

  subTextHeading()
  {
    return _headsetState == HeadsetState.DISCONNECT ?
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child:
      Text(
        "Your Head phone Not Connected ",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    ):
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child:
      Text(
        "Now Your Head Phone Connected ",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  //__________________NEXT BUTTON
  buttonNext()
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {
          Get.to(WifiTestScreen());
        },
        textColor: Colors.white,
        child: const Center(
          child: Text('Next',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }

}
