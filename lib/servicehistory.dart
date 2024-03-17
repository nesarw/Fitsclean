import 'package:flutter/material.dart';
import 'bookservice.dart';
import 'servicetracking.dart';
import 'Homepage.dart';
import 'userprofle.dart';

void main() => runApp(const MaterialApp(
  home: serivcehistory(),
));

class serivcehistory extends StatelessWidget {
  const serivcehistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: const Text(
          "FitsClean",
          style: TextStyle(
            fontSize: 35.0,
            fontFamily: 'Roboto',
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        leading: null,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 8),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start, // Add this line to align the children to the start of the cross axis
                  children: [
                    const SizedBox(
                      height: 20, // Add this line to add space between the text fields
                    ),
                    const Text(
                      "Service History",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5, // Add this line to add space between the text fields
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 635,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  child: Card(
                                    clipBehavior: Clip.hardEdge,
                                    child: InkWell(
                                      splashColor: Colors.redAccent.withAlpha(30),
                                      onTap: () {
                                        debugPrint('Card tapped.');
                                      },
                                      child: SizedBox(
                                        width: 230,
                                        height: 100,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: RichText(
                                                      text: const TextSpan(
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                        children: [
                                                          TextSpan(text: 'Order Id:\n'),
                                                          TextSpan(text: '#101'),
                                                        ],
                                                      ),
                                                    )
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: RichText(
                                                      text: const TextSpan(
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                        children: [
                                                          TextSpan(text: 'Order Status:\n'),
                                                          TextSpan(text: 'Delivered'),
                                                        ],
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      // Add your on pressed event here
                                                      Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => const Servicetracking()),
                                                      );
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(30),
                                                      ),
                                                      fixedSize: const Size(00, 30), // Set the width and height of the button here
                                                    ),
                                                    child: const Text(
                                                      'Track Service',
                                                      style: TextStyle(
                                                        fontSize: 12.0, // Increase the font size here
                                                        fontFamily: 'Roboto',
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  )

                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Card(
                                    clipBehavior: Clip.hardEdge,
                                    child: InkWell(
                                      splashColor: Colors.redAccent.withAlpha(30),
                                      onTap: () {
                                        debugPrint('Card tapped.');
                                      },
                                      child: SizedBox(
                                        width: 230,
                                        height: 100,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                      child: RichText(
                                                        text: const TextSpan(
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                          children: [
                                                            TextSpan(text: 'Order Id:\n'),
                                                            TextSpan(text: '#102'),
                                                          ],
                                                        ),
                                                      )
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: RichText(
                                                      text: const TextSpan(
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                        children: [
                                                          TextSpan(text: 'Order Status:\n'),
                                                          TextSpan(text: 'Delivered'),
                                                        ],
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    // Add your on pressed event here
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => const Servicetracking()),
                                                    );
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(30),
                                                    ),
                                                    fixedSize: const Size(00, 30), // Set the width and height of the button here
                                                  ),
                                                  child: const Text(
                                                    'Track Service',
                                                    style: TextStyle(
                                                      fontSize: 12.0, // Increase the font size here
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                )

                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Card(
                                    clipBehavior: Clip.hardEdge,
                                    child: InkWell(
                                      splashColor: Colors.redAccent.withAlpha(30),
                                      onTap: () {
                                        debugPrint('Card tapped.');
                                      },
                                      child: SizedBox(
                                        width: 230,
                                        height: 100,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                      child: RichText(
                                                        text: const TextSpan(
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                          children: [
                                                            TextSpan(text: 'Order Id:\n'),
                                                            TextSpan(text: '#103'),
                                                          ],
                                                        ),
                                                      )
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: RichText(
                                                      text: const TextSpan(
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                        children: [
                                                          TextSpan(text: 'Order Status:\n'),
                                                          TextSpan(text: 'Delivered'),
                                                        ],
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    // Add your on pressed event here
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => const Servicetracking()),
                                                    );
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(30),
                                                    ),
                                                    fixedSize: const Size(00, 30), // Set the width and height of the button here
                                                  ),
                                                  child: const Text(
                                                    'Track Service',
                                                    style: TextStyle(
                                                      fontSize: 12.0, // Increase the font size here
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                )

                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Card(
                                    clipBehavior: Clip.hardEdge,
                                    child: InkWell(
                                      splashColor: Colors.redAccent.withAlpha(30),
                                      onTap: () {
                                        debugPrint('Card tapped.');
                                      },
                                      child: SizedBox(
                                        width: 230,
                                        height: 100,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                      child: RichText(
                                                        text: const TextSpan(
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                          children: [
                                                            TextSpan(text: 'Order Id:\n'),
                                                            TextSpan(text: '#104'),
                                                          ],
                                                        ),
                                                      )
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: RichText(
                                                      text: const TextSpan(
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                        children: [
                                                          TextSpan(text: 'Order Status:\n'),
                                                          TextSpan(text: 'Delivered'),
                                                        ],
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    // Add your on pressed event here
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => const Servicetracking()),
                                                    );
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(30),
                                                    ),
                                                    fixedSize: const Size(00, 30), // Set the width and height of the button here
                                                  ),
                                                  child: const Text(
                                                    'Track Service',
                                                    style: TextStyle(
                                                      fontSize: 12.0, // Increase the font size here
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                )

                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Card(
                                    clipBehavior: Clip.hardEdge,
                                    child: InkWell(
                                      splashColor: Colors.redAccent.withAlpha(30),
                                      onTap: () {
                                        debugPrint('Card tapped.');
                                      },
                                      child: SizedBox(
                                        width: 230,
                                        height: 100,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                      child: RichText(
                                                        text: const TextSpan(
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                          children: [
                                                            TextSpan(text: 'Order Id:\n'),
                                                            TextSpan(text: '#105'),
                                                          ],
                                                        ),
                                                      )
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: RichText(
                                                      text: const TextSpan(
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                        children: [
                                                          TextSpan(text: 'Order Status:\n'),
                                                          TextSpan(text: 'Delivered'),
                                                        ],
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    // Add your on pressed event here
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => const Servicetracking()),
                                                    );
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(30),
                                                    ),
                                                    fixedSize: const Size(00, 30), // Set the width and height of the button here
                                                  ),
                                                  child: const Text(
                                                    'Track Service',
                                                    style: TextStyle(
                                                      fontSize: 12.0, // Increase the font size here
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                )

                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Card(
                                    clipBehavior: Clip.hardEdge,
                                    child: InkWell(
                                      splashColor: Colors.redAccent.withAlpha(30),
                                      onTap: () {
                                        debugPrint('Card tapped.');
                                      },
                                      child: SizedBox(
                                        width: 230,
                                        height: 100,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                      child: RichText(
                                                        text: const TextSpan(
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                          children: [
                                                            TextSpan(text: 'Order Id:\n'),
                                                            TextSpan(text: '#106'),
                                                          ],
                                                        ),
                                                      )
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: RichText(
                                                      text: const TextSpan(
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                        children: [
                                                          TextSpan(text: 'Order Status:\n'),
                                                          TextSpan(text: 'Delivered'),
                                                        ],
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    // Add your on pressed event here
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => const Servicetracking()),
                                                    );
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(30),
                                                    ),
                                                    fixedSize: const Size(00, 30), // Set the width and height of the button here
                                                  ),
                                                  child: const Text(
                                                    'Track Service',
                                                    style: TextStyle(
                                                      fontSize: 12.0, // Increase the font size here
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                )

                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),


                        ], //childern
                      ),
                    ),
                   const SizedBox(
                      height: 20, // Add this line to add space between the date picker and time picker
                    ),
                  ],
                ),

              ),
            ),
          ),
          Container(
            color: Colors.red[400],
            alignment: Alignment.center,
            height: 55.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add your on pressed event here
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Homepage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(98, 50), // Set the width and height of the button here
                  ),
                  child: const Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your on pressed event here
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const bookservice()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(98, 50), // Set the width and height of the button here
                  ),
                  child: const Text(
                    'Book',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your on pressed event here
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const serivcehistory()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(98, 50), // Set the width and height of the button here
                  ),
                  child: const Text(
                    'History',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your on pressed event here
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const userprofile()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(98, 50), // Set the width and height of the button here
                  ),
                  child: const Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}