import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:selver_apitest1/dio_helper.dart';

class ManiScreen extends StatefulWidget {
  const ManiScreen({Key? key}) : super(key: key);

  @override
  State<ManiScreen> createState() => _ManiScreenState();
}

class _ManiScreenState extends State<ManiScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
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
                          color: Colors.yellow[300]!,
                          offset: const Offset(2, 2))
                    ]),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center, //x
              mainAxisAlignment: MainAxisAlignment.center, //y
              children: [
                const Icon(
                  Icons.currency_exchange,
                  size: 32,
                  color: Colors.cyanAccent,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  child: Center(
                    /// Circular indicator progress

                    child: !_isLoading
                        ? const Text("")
                        : const CircularProgressIndicator(
                            strokeWidth: 9,
                            backgroundColor: Colors.orangeAccent,
                            color: Colors.white,
                          ),
                  ),
                ),

                ///   to remove null from the page
                if (goldD != null)
                  Text(
                    "Gold Price :  result = $goldD USD",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 3,
            ),
            const SizedBox(
              height: 2,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                elevation: 30,
              ),
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });

                setState(() {
                  _isLoading = false;
                  double? result = goldD;
                  print(" Up to date price:$result");

                  Navigator.pushReplacementNamed(context, "/result",
                      arguments: result);
                });

//                 Container(
//                   padding: const EdgeInsets.all(50),
//                   margin: const EdgeInsets.all(50),
//                   color: Colors.blue[100],
// //widget shown according to the state
//                   child: Center(
//                     child: !_isLoading
//                         ? const Text("Loading Complete")
//                         : const CircularProgressIndicator(
//                             backgroundColor: Colors.redAccent,
//                             strokeWidth: 10,
//                           ),
//                   ),
//                 );

                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return Center(
                //           child: CircularProgressIndicator(
                //         backgroundColor: Colors.orangeAccent,
                //         valueColor: AlwaysStoppedAnimation(Colors.white),
                //         strokeWidth: 20,
                //       ));
                //     });

                //   Navigator.pop(context); // use this if you hav another page but here we hv one page
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
          ]),
        ),
      ),
    );
  }

  double? goldD;
  double? gold21;
  double? gold24;

  getGoldPrice() {
    DioHelper.getData('/XAU/USD/').then((value) {
      log(value.toString());
      setState(() {
        goldD = value.data['price'];
        gold21 = value.data['price_gram_21k'];
        gold24 = value.data['price_gram_24k'];
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }
}
