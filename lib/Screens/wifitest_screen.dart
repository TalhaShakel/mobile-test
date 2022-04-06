import 'package:diagnostic/Screens/speachnumber_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../Combine Widgets/text_widget.dart';

class WifiTestScreen extends StatefulWidget {
  const WifiTestScreen({Key? key}) : super(key: key);

  @override
  _WifiTestScreenState createState() => _WifiTestScreenState();
}

class _WifiTestScreenState extends State<WifiTestScreen> {

  @override
  void initState() {
    super.initState();
    checker();
  }
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
      return Container(
        margin: EdgeInsets.only(top: 100),
        height: 300,
        width: 300,

        child: Image.asset('images/wifi.gif'),
      );



  }
  //_____________________Heading text
  textHeading()
  {
    return TextWidgets.heading1("Disconnected !", Colors.white);
  }

  //_____________________SUB text

  subTextHeading()
  {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child:
      Text(
        "Your Wifi Not Connected",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  checker() async
  {
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    print(isConnected);
  }

  //__________________NEXT BUTTON
  buttonNext()
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {
          Get.to(SpeachTextNumberScreen());
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
