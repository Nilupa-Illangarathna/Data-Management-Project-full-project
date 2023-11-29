// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';

class CompletionScreen extends StatefulWidget {
  const CompletionScreen({super.key});

  @override
  State<CompletionScreen> createState() => _CompletionScreenState();
}

class _CompletionScreenState extends State<CompletionScreen> {

  //TODO order number here
  int orderNumber = 335; // you can use Strings as well

  void atCompletion(){
    // Navigator.of(context).pop();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 273 * HR,),
          Center(
            child: Image.asset(
              'assets/images/homeScreen/homeScreen/paymentRelated/complete.png',
              width: 92 * WR,
              height: 92 * HR,
            ),
          ),
          SizedBox(height: 24 * HR,),
          Center(
            child: Text(
                "Order Successful",
                style: TextStyle(
                  fontSize: 20 * HR,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: "SF Pro",
                )
            ),
          ),
          SizedBox(height: 48 * HR,),
          Center(
            child: Text(
                "Your Order Number",
                style: TextStyle(
                  fontSize: 17 * HR,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: "SF Pro",
                )
            ),
          ),
          SizedBox(height: 16 * HR,),
          Center(
            child: Text(
                orderNumber.toString(),
                style: TextStyle(
                  fontSize: 50 * HR,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontFamily: "SF Pro",
                )
            ),
          ),
          Expanded(
            child: Align(alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 16 * WR, right: 16 * WR),
                child: Container(
                  height: 56 * HR,
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double?>(0),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFF007AFF),
                        ),
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                      onPressed: () {
                        atCompletion();
                      },
                      child: Text(
                          "Done",
                          style: TextStyle(
                            fontSize: 17 * HR,
                            fontWeight: FontWeight.w600,
                            fontFamily: "SF Pro",
                          )
                      )
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24 * HR,),
        ],
      ),
    );
  }
}
