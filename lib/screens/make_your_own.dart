import 'package:flutter/material.dart';
import 'package:nostalicious_web/constants/imageConstants.dart';
import 'package:nostalicious_web/routes/routeName.dart';
import 'package:nostalicious_web/screens/payment_method_selection.dart';

class MakeYourOwnScreen extends StatefulWidget {
  MakeYourOwnScreen({super.key});

  @override
  State<MakeYourOwnScreen> createState() => _MakeYourOwnScreenState();
  TextEditingController recipeController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
}

class _MakeYourOwnScreenState extends State<MakeYourOwnScreen> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(146, 243, 208, 118),
        leading: Image.asset(ImageConstants.logo),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.message_rounded,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                'Create Your Own Dish!!',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.02),
              ),
            ),
            Container(
              height: screenHeight / 3,
              width: screenWidth * 0.9,
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: widget.ingredientsController,
                decoration: InputDecoration(
                  hintText: 'Enter comma separated ingredients',
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3, color: Colors.orangeAccent),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3,
                        color: const Color.fromARGB(255, 250, 181, 90)),
                  ),
                ),
                maxLines: 100,
              ),
            ),
            Container(
              height: screenHeight / 3,
              width: screenWidth * 0.9,
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: widget.recipeController,
                decoration: InputDecoration(
                  hintText: 'Enter the nostalgic recipe',
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3, color: Colors.orangeAccent),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3,
                        color: const Color.fromARGB(255, 250, 181, 90)),
                  ),
                ),
                maxLines: 100,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () async {
                  final DateTime? selected = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2025),
                  );
                  if (selected != null && selected != selectedDate)
                    setState(() {
                      selectedDate = selected;
                    });
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => PaymentScreen(
                        orderRecipe: widget.recipeController.text,
                        orderIngredients: widget.ingredientsController.text,
                        date: selectedDate,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Select delivery date',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}
