import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Firebase_Auth/session_manager.dart';
import 'bookservice.dart';
import 'servicehistory.dart';
import 'userprofle.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();// initialize Flutter binding
  runApp(const MaterialApp(
    home: Homepage(),
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final ref = FirebaseFirestore.instance.collection('User').doc(SessionController().userId);

  String? userId = SessionController().userId;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Container(
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Discover nearby    ",
                style: TextStyle(
                  fontSize: 32.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set the text color here
                ),
                textAlign: TextAlign.left, // Left-align the text
              ),
              Text(
                "laundry services...",
                style: TextStyle(
                  fontSize: 32.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set the text color here
                ),
                textAlign: TextAlign.left, // Left-align the text
              ),
            ],
          ),
        ),
        centerTitle: false, // Center the title horizontally
        leading: null,
        toolbarHeight: 150.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 8),
                alignment: Alignment.centerLeft,
                child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: ref.snapshots(),
                  builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      final userData = snapshot.data!.data();
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start, // Add this line to align the children to the start of the cross axis
                        children: [
                          const SizedBox(
                            height: 20, // Add this line to add space between the text fields
                          ),
                          Text(
                            "Welcome to Fitsclean ${userData?['Name'] ?? ''},",
                            style: const TextStyle(
                              fontSize: 22.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Set the text color here
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.left, // Left-align the text
                          ),
                          const SizedBox(
                            height: 15, // Add this line to add space between the text fields
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 0),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Laundry services near you",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 150,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
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
                                        width: 200,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                'Assets/bandra.png',
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Bandra',
                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(height: 2),
                                                ],
                                              ),
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
                                        width: 200,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                'Assets/andheri.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Andheri',
                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(height: 2),
                                                ],
                                              ),
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
                                        width: 200,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                'Assets/churchgate.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Churchgate',
                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(height: 2),
                                                ],
                                              ),
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
                                        width: 200,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                'Assets/thane.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Thane',
                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(height: 2),
                                                ],
                                              ),
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
                                        width: 200,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                'Assets/mulund.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Mulund',
                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(height: 2),
                                                ],
                                              ),
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

                          const SizedBox(
                            height: 28, // Add this line to add space between the text fields
                          ),

                          Container(
                            padding: const EdgeInsets.only(left: 0),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Categories",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10, // Add this line to add space between the text fields
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 150,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Container(
                                  child: Card(
                                    clipBehavior: Clip.hardEdge,
                                    child: InkWell(
                                      splashColor: Colors.redAccent.withAlpha(30),
                                      onTap: () {
                                        debugPrint('Card tapped.');
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const bookservice()),
                                        );
                                      },
                                      child: SizedBox(
                                        width: 200,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                'Assets/washing.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Washing',
                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(height: 2),
                                                ],
                                              ),
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const bookservice()),
                                        );
                                      },
                                      child: SizedBox(
                                        width: 200,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                'Assets/drying.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Drying',
                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(height: 2),
                                                ],
                                              ),
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const bookservice()),
                                        );
                                      },
                                      child: SizedBox(
                                        width: 200,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                'Assets/ironing.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Ironing',
                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(height: 2),
                                                ],
                                              ),
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const bookservice()),
                                        );
                                      },
                                      child: SizedBox(
                                        width: 200,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                'Assets/washdry.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Washing + Ironing',
                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(height: 2),
                                                ],
                                              ),
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const bookservice()),
                                        );
                                      },
                                      child: SizedBox(
                                        width: 200,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                'Assets/fullservice.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Full Service',
                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(height: 2),
                                                ],
                                              ),
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
                          const SizedBox(
                            height: 20, // Add this line to add space between the text fields
                          ),


                          const SizedBox(
                            height: 5, // Add this line to add space between the text fields
                          ),

                        ],
                      );
                    } else {
                      return const Center(child: Text('No data'));
                    }
                  },
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

