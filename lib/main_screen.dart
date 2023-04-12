import 'package:flutter/material.dart';
import 'dart:io';

import 'package:selver_apitest1/dio_helper.dart';

class ManiScreen extends StatefulWidget {
  const ManiScreen({Key? key}) : super(key: key);

  @override
  State<ManiScreen> createState() => _ManiScreenState();
}

class _ManiScreenState extends State<ManiScreen> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getGoldPrice();
  //   // getGold21Gram();
  //   // getGold24Gram();
  //   // getLowPrice();
  //   // getHighPrice();
  // }

  String selectedGoldPrice = "Dollar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
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
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.only(top: 22),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              "assets/gold2.png",
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Gold",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 8,
                    color: Colors.orange[800],
                    fontWeight: FontWeight.bold,
                    shadows: [
                      BoxShadow(
                          color: Colors.yellow[300]!, offset: Offset(2, 2))
                    ]),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, //x
                mainAxisAlignment: MainAxisAlignment.center, //y
                children: [
                  Icon(
                    Icons.currency_exchange,
                    size: 32,
                    color: Colors.cyanAccent,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Gold Price : $goldD USD",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                elevation: 30,
              ),
              onPressed: () async {
                getGoldPrice();
                // getGoldPrice() {
                //   DioHelper.getData('/XAG/USD/').then((value) {
                //     setState(() {
                //       goldD = value.data['price'];
                //       // print(goldD);
                //     });
                //   }).catchError((error) {
                //     print(error.toString());
                //   });
                // }
              },
              child: Container(
                alignment: Alignment.center,
                height: 70,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.orange[500],
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: const Text(
                  "UpToDate Price ",
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(.0, 1.0),
                        blurRadius: 20,
                        color: Colors.white54,
                      ),
                      Shadow(
                        offset: Offset(5, 1),
                        blurRadius: 15.0,
                        color: Color.fromARGB(125, 0, 0, 255),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       "Price: $goldD USD",
            //       style: TextStyle(
            //           fontSize: MediaQuery.of(context).size.width / 15,
            //           color: Colors.orange[200],
            //           fontWeight: FontWeight.bold,
            //           shadows: [
            //             BoxShadow(
            //                 color: Colors.yellow[300]!, offset: Offset(2, 2))
            //           ]),
            //     )
            //   ],
            // ),
          ]),
        ),
      ),
    );
  }

  double? goldD;
  int? goldI;
  double? gold21;
  double? gold24;
  double? lowPrice;
  double? highPrice;

  getGoldPrice() {
    DioHelper.getData('/XAG/USD/').then((value) {
      setState(() {
        goldD = value.data['price'];
        // print(goldD);
      });
    }).catchError((error) {
      print(error.toString());
    });
  }

  // getHighPrice() {
  //   DioHelper.getData('/XAG/USD/').then((value) {
  //     setState(() {
  //       highPrice = value.data['high_price'];
  //
  //       // print(highPrice);
  //     });
  //   }).catchError((error) {
  //     print(error.toString());
  //   });
  // }
//
//   getGold21Gram() {
//     DioHelper.getData('/XAG/USD/').then((value) {
//       gold21 = value.data['price_gram_21k'];
//
//       print(gold21);
//     }).catchError((error) {
//       print(error.toString());
//     });
//   }
//
//   getGold24Gram() {
//     DioHelper.getData('/XAG/USD/').then((value) {
//       gold24 = value.data['price_gram_24k'];
//       goldI = gold24!.round();
//       print(goldI);
//
//       print(gold24);
//     }).catchError((error) {
//       print(error.toString());
//     });
//   }
}
