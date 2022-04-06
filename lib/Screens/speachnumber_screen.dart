import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Combine Widgets/text_widget.dart';

class SpeachTextNumberScreen extends StatefulWidget {
  const SpeachTextNumberScreen({Key? key}) : super(key: key);

  @override
  _SpeachTextNumberScreenState createState() => _SpeachTextNumberScreenState();
}

class _SpeachTextNumberScreenState extends State<SpeachTextNumberScreen> {
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
            numberRow(),
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
      margin: const EdgeInsets.only(top: 100),
      height: 300,
      width: 300,

      child: Image.asset('images/earphone.gif'),
    );



  }
  //_____________________Heading text
  textHeading()
  {
    return TextWidgets.heading1("Listen to the numbers ", Colors.white);
  }

  //_____________________SUB text

  subTextHeading()
  {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child:
      Text(
        "Please Speak any 4 numbers",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  numberRow()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 25,
          color: Colors.white,
        ),
        const SizedBox(width: 5,),
        Container(
          height: 30,
          width: 25,
          color: Colors.white,
        ),
        const SizedBox(width: 5,),
        Container(
          height: 30,
          width: 25,
          color: Colors.white,
        ),
        const SizedBox(width: 5,),
        Container(
          height: 30,
          width: 25,
          color: Colors.white,
        ),


      ],
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
          Get.to(const SpeachTextNumberScreen());
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
