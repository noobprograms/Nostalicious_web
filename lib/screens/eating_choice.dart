import 'package:flutter/material.dart';
import 'package:nostalicious_web/constants/imageConstants.dart';
import 'package:nostalicious_web/routes/routeName.dart';

class EatingChoice extends StatefulWidget {
  const EatingChoice({super.key});

  @override
  State<EatingChoice> createState() => _EatingChoiceState();
}

class _EatingChoiceState extends State<EatingChoice> {
  @override
  Widget build(BuildContext context) {
    var containerHovered = false;
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
      // backgroundColor: Color.fromARGB(255, 247, 213, 119),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orange[600]!, Colors.orange[200]!],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.makeYourOwn);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: screenHeight / 3,
                    width: screenWidth / 4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(
                              ImageConstants.makeYourOwn,
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          color: Color.fromARGB(150, 102, 102, 102)),
                      child: Text(
                        'Make Your Own!',
                        style: TextStyle(
                            fontSize: screenWidth * 0.02, color: Colors.orange),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.useExisting);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: screenHeight / 3,
                    width: screenWidth / 4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(
                              ImageConstants.useExisting,
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          color: Color.fromARGB(150, 102, 102, 102)),
                      child: Text(
                        'Use Existing!',
                        style: TextStyle(
                            fontSize: screenWidth * 0.02, color: Colors.orange),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: screenHeight / 3,
                  width: screenWidth / 4,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(
                            ImageConstants.otherOutlets,
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        color: Color.fromARGB(150, 102, 102, 102)),
                    child: Text(
                      'Other Outlets',
                      style: TextStyle(
                          fontSize: screenWidth * 0.02, color: Colors.orange),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
