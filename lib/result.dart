import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    double? result = ModalRoute.of(context)!.settings.arguments as double;

    /// استقبال ال result من الصفحه السابقه
    return Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "GOLD",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                " PRICES",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[700]),
              ),
            ],
          ),
        ),
        body: Center(
          child: Container(
              color: Colors.black26,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.only(top: 22),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/gold2.png",
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        "Price in USD",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 10,
                            color: Colors.orange[800],
                            fontWeight: FontWeight.bold,
                            shadows: [
                              BoxShadow(
                                  color: Colors.yellow[300]!,
                                  offset: const Offset(2, 2))
                            ]),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center, //x
                        mainAxisAlignment: MainAxisAlignment.center, //y
                        children: [
                          Text(
                            "$result",
                            style: TextStyle(
                                fontSize: 32, color: Colors.cyanAccent),
                          ),
                        ])
                  ])),
        ));
  }

  // double? goldD;
  // double? gold21;
  // double? gold24;
  //
  // getGoldPrice() {
  //   DioHelper.getData('/XAU/USD/').then((value) {
  //     log(value.toString());
  //     setState(() {
  //       goldD = value.data['price'];
  //       gold21 = value.data['price_gram_21k'];
  //       gold24 = value.data['price_gram_24k'];
  //     });
  //   }).catchError((error) {
  //     debugPrint(error.toString());
  //   });
  // }
}
