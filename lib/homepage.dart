import 'package:flutter/material.dart';
import 'function.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController textcontroller = TextEditingController();
  GlobalKey<FormState> gk = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Url_Launcher"),
        backgroundColor: Colors.redAccent,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: 200,
            child: ClipPath(
              clipper: customcliper(),
              child: Container(
                color: Colors.redAccent,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 180,
              child: ClipPath(
                clipper: customcliper1(),
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView(
              children: [
                SizedBox(
                  height: ht * .25,
                ),
                button("Send SMS", () {
                  showsdialog(
                      context: context,
                      numbercontroller: numbercontroller,
                      textcontroller: textcontroller,
                      input: 2,
                      title: "SMS ",
                      hint1: "number  ",
                      hint2: "message",
                      checks: true,
                      methods: () => sendSms(numbercontroller.text.trim(),
                          textcontroller.text.trim()),
                      fk: gk);
                }),
                SizedBox(
                  height: 15,
                ),
                button("Send Email", () {
                  showsdialog(
                      context: context,
                      numbercontroller: numbercontroller,
                      textcontroller: textcontroller,
                      input: 2,
                      checks: false,
                      title: "Email ",
                      hint1: "email address",
                      hint2: "message",
                      methods: () => emailMsg(numbercontroller.text.trim(),
                          textcontroller.text.trim()),
                      fk: gk);
                }),
                SizedBox(
                  height: 15,
                ),
                button("Phone Call", () {
                  showsdialog(
                      context: context,
                      checks: true,
                      numbercontroller: numbercontroller,
                      textcontroller: textcontroller,
                      input: 1,
                      title: "Phone ",
                      hint1: "number ",
                      hint2: "message",
                      methods: () => phoneCall(numbercontroller.text),
                      fk: gk);
                }),
                SizedBox(
                  height: 15,
                ),
                button("Whats App Message", () {
                  showsdialog(
                      checks: true,
                      context: context,
                      numbercontroller: numbercontroller,
                      textcontroller: textcontroller,
                      input: 2,
                      title: "WhatsApp ",
                      hint1: "Phone Number  ",
                      hint2: "message",
                      methods: () => whatsAppMsg(numbercontroller.text.trim(),
                          textcontroller.text.trim()),
                      fk: gk);
                }),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget button(String title, VoidCallback function) {
    return RawMaterialButton(
      fillColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: TextStyle(color: Colors.white),
      onPressed: function,
      child: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class customcliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 70);
    path.quadraticBezierTo(width / 5, height, width * .5, 110);
    path.quadraticBezierTo(width * .75, 50, width, height - 40);
    path.lineTo(width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

//hello change
//hello change
class customcliper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path()
      ..moveTo(0, height)
      ..lineTo(0, 60)
      ..quadraticBezierTo(width * .25, 160, width * .5, 80)
      ..quadraticBezierTo(width * .78, -0, width, height - 90)
      ..lineTo(width, height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
