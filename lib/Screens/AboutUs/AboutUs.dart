import 'package:dwaweenx/core/constants.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  var formKey = GlobalKey<FormState>();
  String text =
      ' منصة تعلمك من الصفر إلى الإحتراف أو تعدل أغلاطك بأيسر الطرق من غير لف و دوران ، فجمعنا لكم ثلاثة طُرق تعلم وهي طريقة التعلم البصرية و السمعية و الكتابية و كده راح يسهل عليك التطبيق العملي وتختصر مشـوار طويل في التعلم فالتطبيق تم تجربته على ';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white, //change your color here
            ),
            title: Row(
              children: <Widget>[
                Container(
                    child: Text(
                  'حول التطبيق',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 22,
                    fontFamily: 'Cairo',
                  ),
                )),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
            backgroundColor: Constants.primary,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width,
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Text(
                          text,
                          style: const TextStyle(fontFamily: 'Cairo', fontSize: 20),
                        ),
                      )
                    ])),
          )),
    );
  }
}
