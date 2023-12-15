import 'package:flutter/material.dart';
import 'package:nostalicious_web/constants/imageConstants.dart';
import 'package:nostalicious_web/data/dummy_meals.dart';
import 'package:nostalicious_web/screens/payment_method_selection.dart';

class UseExistingScreen extends StatefulWidget {
  UseExistingScreen({super.key});

  @override
  State<UseExistingScreen> createState() => _UseExistingScreenState();

  TextEditingController searchController = TextEditingController();
}

class _UseExistingScreenState extends State<UseExistingScreen> {
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
        body: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.orange[600]!, Colors.orange[200]!],
                    begin: FractionalOffset.bottomCenter,
                    end: Alignment.topCenter)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: screenWidth / 2,
                  child: TextField(
                    controller: widget.searchController,
                    decoration: InputDecoration(
                      hintText: 'Search for dishes',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: const Color.fromARGB(255, 250, 181, 90),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.07),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: screenWidth / screenHeight * 0.7,
                          crossAxisSpacing: screenWidth / 20,
                          mainAxisSpacing: screenHeight / 20),
                      itemCount: dummyMeals.length,
                      itemBuilder: (BuildContext context, index) => InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Container(
                                color: Colors.white,
                                width: screenWidth / 3,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Text(dummyMeals[index]['name']),
                                      Text(
                                        'Ingredients',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        dummyMeals[index]['ingredients'],
                                      ),
                                      Text(
                                        'Recipe',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        dummyMeals[index]['recipe'],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.amber[100]),
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                ElevatedButton(
                                    onPressed: () async {
                                      final DateTime? selected =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: selectedDate,
                                        firstDate: DateTime(2010),
                                        lastDate: DateTime(2025),
                                      );
                                      if (selected != null &&
                                          selected != selectedDate)
                                        setState(() {
                                          selectedDate = selected;
                                        });
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              PaymentScreen(
                                            orderRecipe: dummyMeals[index]
                                                ['recipe'],
                                            orderIngredients: dummyMeals[index]
                                                ['ingredients'],
                                            date: selectedDate,
                                          ),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.amber),
                                    child: Text("Set delivery date",
                                        style: TextStyle(color: Colors.white))),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              )),
                          child: Column(
                            children: [
                              Container(
                                width: screenWidth / 3,
                                height: screenHeight / 4,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          dummyMeals[index]['path'],
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                height: screenHeight / 15,
                              ),
                              Container(
                                child: Text(
                                  dummyMeals[index]['name'],
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  _buildDishList() {}
}
