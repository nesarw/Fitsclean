import 'Homepage.dart';
import 'servicetracking.dart';
import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';

void main() => runApp(const MaterialApp(
  home: bookservice(),
));

class bookservice extends StatelessWidget {
  const bookservice({super.key});

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Add your onPressed event here
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
            );
          },
        ),
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
                      "Services To Book For",
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
                          //add the expansion tiles here
                          ExpansionTile(
                            title: const Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 20.0, // Increase the font size here
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                height: 435,
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
                                            width: 200,
                                            height: 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Image.asset(
                                                    'Assets/tshirt.png',
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                          'TShirts',
                                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: InputQty(
                                                      maxVal: double.maxFinite,
                                                      initVal: 0,
                                                      onQtyChanged: (val) {
                                                        // setstate could be called here
                                                      },
                                                    ),
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
                                            height: 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Image.asset(
                                                    'Assets/shirt.png',
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                          'Shirts',
                                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: InputQty(
                                                      maxVal: double.maxFinite,
                                                      initVal: 0,
                                                      onQtyChanged: (val) {
                                                        // setstate could be called here
                                                      },
                                                    ),
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
                                            height: 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Image.asset(
                                                    'Assets/pants.png',
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                          'Pants/Trousers',
                                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: InputQty(
                                                      maxVal: double.maxFinite,
                                                      initVal: 0,
                                                      onQtyChanged: (val) {
                                                        // setstate could be called here
                                                      },
                                                    ),
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
                                            height: 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Image.asset(
                                                    'Assets/suits.png',
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                          'Suits/Blazers',
                                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: InputQty(
                                                      maxVal: double.maxFinite,
                                                      initVal: 0,
                                                      onQtyChanged: (val) {
                                                        // setstate could be called here
                                                      },
                                                    ),
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
                                            height: 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Image.asset(
                                                    'Assets/tkurta.png',
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                          'Traditional',
                                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: InputQty(
                                                      maxVal: double.maxFinite,
                                                      initVal: 0,
                                                      onQtyChanged: (val) {
                                                        // setstate could be called here
                                                      },
                                                    ),
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
                            ],
                          ),

                          ExpansionTile(
                            title: const Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 20.0, // Increase the font size here
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                height: 435,
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
                                            width: 200,
                                            height: 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Image.asset(
                                                    'Assets/shirt.png',
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                          'Tshirts/Shirts',
                                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: InputQty(
                                                      maxVal: double.maxFinite,
                                                      initVal: 0,
                                                      onQtyChanged: (val) {
                                                        // setstate could be called here
                                                      },
                                                    ),
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
                                            height: 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Image.asset(
                                                    'Assets/kurta.png',
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                          'Kurtas',
                                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: InputQty(
                                                      maxVal: double.maxFinite,
                                                      initVal: 0,
                                                      onQtyChanged: (val) {
                                                        // setstate could be called here
                                                      },
                                                    ),
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
                                            height: 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Image.asset(
                                                    'Assets/pants.png',
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                          'Pants/Trousers',
                                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: InputQty(
                                                      maxVal: double.maxFinite,
                                                      initVal: 0,
                                                      onQtyChanged: (val) {
                                                        // setstate could be called here
                                                      },
                                                    ),
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
                                            height: 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Image.asset(
                                                    'Assets/sarees.png',
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                          'Sarees',
                                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: InputQty(
                                                      maxVal: double.maxFinite,
                                                      initVal: 0,
                                                      onQtyChanged: (val) {
                                                        // setstate could be called here
                                                      },
                                                    ),
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
                            ],
                          ),

                          ExpansionTile(
                            title: const Text(
                              'Kids',
                              style: TextStyle(
                                fontSize: 20.0, // Increase the font size here
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                height: 435,
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
                                            width: 200,
                                            height: 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Image.asset(
                                                    'Assets/ktshirt.png',
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                          'TShirts',
                                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: InputQty(
                                                      maxVal: double.maxFinite,
                                                      initVal: 0,
                                                      onQtyChanged: (val) {
                                                        // setstate could be called here
                                                      },
                                                    ),
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
                                            height: 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Image.asset(
                                                    'Assets/shirt.png',
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                          'Shirts',
                                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: InputQty(
                                                      maxVal: double.maxFinite,
                                                      initVal: 0,
                                                      onQtyChanged: (val) {
                                                        // setstate could be called here
                                                      },
                                                    ),
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
                                            height: 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Image.asset(
                                                    'Assets/pants.png',
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                          'Shorts/Jeans',
                                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: InputQty(
                                                      maxVal: double.maxFinite,
                                                      initVal: 0,
                                                      onQtyChanged: (val) {
                                                        // setstate could be called here
                                                      },
                                                    ),
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
                                            height: 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Image.asset(
                                                    'Assets/toddler.png',
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                          'Toddlers',
                                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: InputQty(
                                                      maxVal: double.maxFinite,
                                                      initVal: 0,
                                                      onQtyChanged: (val) {
                                                        // setstate could be called here
                                                      },
                                                    ),
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
                                            height: 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Image.asset(
                                                    'Assets/ktkurta.png',
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                          'Ethinic Wear',
                                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: InputQty(
                                                      maxVal: double.maxFinite,
                                                      initVal: 0,
                                                      onQtyChanged: (val) {
                                                        // setstate could be called here
                                                      },
                                                    ),
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
                            ],
                          ),

                        ], //childern
                      ),
                    ),
                    const SizedBox(
                      height: 20, // Add this line to add space between the text fields
                    ),
                    const Text(
                      "Select Date and Time",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20, // Add this line to add space between the text fields
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2025),
                        );
                        if (pickedDate != null) {
                          print('Selected date: $pickedDate');
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red[400], shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        fixedSize: const Size(150, 48), // Set the width and height of the button here
                      ),
                      child: const Text(
                        'Select date',
                        style: TextStyle(
                           // Change the text color
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20, // Add this line to add space between the date picker and time picker
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (pickedTime != null) {
                          print('Selected time: $pickedTime');
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red[400], shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        fixedSize: const Size(150, 48), // Set the width and height of the button here
                      ),
                      child: Text(
                        'Select time',
                        style: TextStyle(
                          color: Colors.red[400], // Change the text color
                          fontSize: 16,
                        ),
                      ),
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
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: const Size(350, 50), // Set the width and height of the button here
              ),
              child: const Text(
                'Book Now',
                style: TextStyle(
                  fontSize: 22.0, // Increase the font size here
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}