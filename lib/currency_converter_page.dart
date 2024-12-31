// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  double usdValue = 0;
  final TextEditingController textFieldValue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const BorderRadius textFieldBorder = BorderRadius.all(Radius.circular(50));
    const OutlineInputBorder focusedAndEnabledBorder = OutlineInputBorder(
      borderRadius: textFieldBorder,
      borderSide: BorderSide(
        width: 1.5,
        // color: Colors.white54
      ),
    );

    double convertCurrency() {
      double convertValueToNumber = double.parse(textFieldValue.text);
      setState(() {
        usdValue = convertValueToNumber * 1700;
      });
      return usdValue;
      // print('Hello $usdValue');
      // return textFieldValue;
    }

    // String answer = usdValue.toString();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            'Currency Converter from USD To Naira',
            style: TextStyle(
                color: Colors.white54,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.blueGrey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              usdValue.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
              child: TextField(
                keyboardType: const TextInputType.numberWithOptions(),
                controller: textFieldValue,
                decoration: const InputDecoration(
                  enabledBorder: focusedAndEnabledBorder,
                  focusedBorder: focusedAndEnabledBorder,
                  // focusColor: Colors.white54,
                  filled: true,
                  fillColor: Colors.white24,
                  prefixIcon: Icon(
                    Icons.monetization_on_rounded,
                  ),
                  prefixIconColor: Colors.white60,
                  hintText: 'Enter amount in USD',
                  hintStyle: TextStyle(
                    color: Colors.white60,
                    fontSize: 20,
                  ),
                ),
                // style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: ElevatedButton(
                onPressed: convertCurrency,
                style: ElevatedButton.styleFrom(
                  elevation: 20,
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 55),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  // padding:
                  // WidgetStatePropertyAll(EdgeInsets.only(left: 50, right: 50)),
                ),
                child: const Text(
                  'Convert',
                  style: TextStyle(color: Colors.white54, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
