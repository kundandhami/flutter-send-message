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
      ),
      body: Padding(
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
                  methods: () => sendSms(
                      numbercontroller.text.trim(), textcontroller.text.trim()),
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
                  methods: () => emailMsg(
                      numbercontroller.text.trim(), textcontroller.text.trim()),
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
                  methods: () => whatsAppMsg(
                      numbercontroller.text.trim(), textcontroller.text.trim()),
                  fk: gk);
            }),
            SizedBox(
              height: 15,
            ),
          ],
        ),
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
