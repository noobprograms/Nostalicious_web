import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nostalicious_web/constants/imageConstants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nostalicious_web/routes/routeName.dart';

enum PaymentMethods { EasyPaisa, COD }

class PaymentScreen extends StatefulWidget {
  PaymentScreen(
      {this.orderIngredients, this.date, this.orderRecipe, super.key});
  final orderIngredients;
  final orderRecipe;
  final date;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentMethods selectedMethod = PaymentMethods.COD;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(146, 243, 208, 118),
          leading: Image.asset(ImageConstants.logo),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.message_rounded,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orange[600]!, Colors.orange[200]!],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: screenWidth / 2,
                        child: Text(
                          'Almost there to hit your Nostalgia!',
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 64,
                          ),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.amber[50],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Your Order',
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                style: TextStyle(fontSize: 20),
                                children: [
                                  TextSpan(
                                      text: 'Ingredients: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: widget.orderIngredients,
                                  )
                                ]),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                                style: TextStyle(fontSize: 20),
                                children: [
                                  TextSpan(
                                      text: 'Order Description: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: widget.orderRecipe,
                                  )
                                ]),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                          ),
                          SizedBox(height: 20),
                          Text('Suggested Price',
                              style: TextStyle(fontSize: 30)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text('Suggested Total',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text('Rs. 200', style: TextStyle(fontSize: 30))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text('Select Payment Method',
                          style: TextStyle(fontSize: 40)),
                      ListTile(
                        title: const Text('Easypaisa'),
                        leading: Radio(
                          value: PaymentMethods.EasyPaisa,
                          activeColor: Colors.amber,
                          groupValue: selectedMethod,
                          onChanged: (value) {
                            setState(() {
                              selectedMethod = value!;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Cash on Delivery'),
                        tileColor: Colors.amber,
                        leading: Radio(
                          value: PaymentMethods.COD,
                          activeColor: Colors.amber,
                          groupValue: selectedMethod,
                          onChanged: (value) {
                            setState(() {
                              selectedMethod = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(
                                context, RouteName.eatingChoice);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amberAccent),
                          child: Text(
                            'Place Order',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
