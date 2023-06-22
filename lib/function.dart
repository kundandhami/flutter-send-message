import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

showsdialog(
    {required BuildContext context,
    required TextEditingController numbercontroller,
    required TextEditingController textcontroller,
    required int input,
    required Function methods,
    required GlobalKey<FormState> fk,
    required String title,
    required String hint1,
    required String hint2,
    required bool checks}) {
  showDialog(
    context: context,
    builder: (context) => Form(
      key: fk,
      child: SimpleDialog(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        contentPadding: const EdgeInsets.all(15),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(title),
        children: [
          textfield(
            controller: numbercontroller,
            hinttext: hint1,
            check: checks ? true : false,
            validation: (v) {
              if (v!.isEmpty) {
                return "required";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          input > 1
              ? textfield(
                  check: false,
                  controller: textcontroller,
                  hinttext: hint2,
                  validation: (v) {
                    if (v!.isEmpty) {
                      return "required";
                    }
                    return null;
                  },
                )
              : const SizedBox.shrink(),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              if (fk.currentState?.validate() == true) {
                methods();
                Future.delayed(const Duration(seconds: 3)).whenComplete(() {
                  textcontroller.clear();
                  numbercontroller.clear();
                  Navigator.pop(context);
                });
              }
            },
            child: const Text("Send",
                style: TextStyle(
                    backgroundColor: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.green)),
          ),
        ],
      ),
    ),
  );
}

emailMsg(
  String mail,
  String msg,
) async {
  Uri url = Uri(scheme: 'mailto', path: mail, query: 'subject=${Uri.encodeComponent("test is herer")}&body=${Uri.encodeComponent(msg)}');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    if (kDebugMode) {
      print("error in the email=========");
    }
  }
}

whatsAppMsg(String number, String msg) async {
  Uri uri = Uri.parse("whatsapp://send?phone=+91$number&text=$msg");
  Uri iosuri = Uri.parse("https://wa.me/+919512829152?text=hello");
  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  } else {
    throw ("whats error");
  }
  if (Platform.isIOS) {
    if (await canLaunchUrl(iosuri)) {
      launchUrl(iosuri);
    } else {
      throw ("ios error");
    }
  }
}

sendSms(String number, String msg) async {
  final Uri sms = Uri(scheme: "sms", path: "+91$number", queryParameters: {'body': Uri.encodeComponent(msg)});
  if (await canLaunchUrl(sms)) {
    await launchUrl(sms);
  } else {
    if (kDebugMode) {
      print("sms cannot launch=======");
    }
  }
}

phoneCall(String number) async {
  Uri uri = Uri(scheme: "tel", path: number);
  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  } else {
    if (kDebugMode) {
      print("phone can not launch-----------");
    }
  }
}

Widget textfield(
    {required TextEditingController controller,
    required String hinttext,
    required bool check,
    String? Function(String?)? validation}) {
  return TextFormField(
    controller: controller,
    validator: validation,
    keyboardType: check ? TextInputType.number : TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: hinttext,
    ),
  );
}
 