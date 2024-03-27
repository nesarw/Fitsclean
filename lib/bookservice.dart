import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:uuid/uuid.dart';
import 'Firebase_Auth/session_manager.dart';
import 'Homepage.dart';
import 'common/toast.dart';
import 'servicetracking.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();// initialize Flutter binding
  runApp(const MaterialApp(
    home: bookservice(),
  ));
}

class bookservice extends StatefulWidget {
  const bookservice({super.key});

  @override
  State<bookservice> createState() => _bookserviceState();
}

class _bookserviceState extends State<bookservice> {

  final _firestore = FirebaseFirestore.instance;

  String? userId = SessionController().userId;


  //male
  final TextEditingController _mtshirt = TextEditingController(text: '0');
  final TextEditingController _mshirt = TextEditingController(text: '0');
  final TextEditingController _mpant = TextEditingController(text: '0');
  final TextEditingController _msuits = TextEditingController(text: '0');
  final TextEditingController _mtraditional = TextEditingController(text: '0');

  //female
  final TextEditingController _ftshirt = TextEditingController(text: '0');
  final TextEditingController _fkurta = TextEditingController(text: '0');
  final TextEditingController _fpant = TextEditingController(text: '0');
  final TextEditingController _fsaree = TextEditingController(text: '0');

  //kids
  final TextEditingController _ktshirt = TextEditingController(text: '0');
  final TextEditingController _kshirt = TextEditingController(text: '0');
  final TextEditingController _kpant = TextEditingController(text: '0');
  final TextEditingController _ktoddler = TextEditingController(text: '0');
  final TextEditingController _kethinic = TextEditingController(text: '0');

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
                                              flex: 2,
                                              child: SizedBox(
                                                width: 20,
                                                height: 35,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    IconButton(onPressed: () {
                                                      setState(() {
                                                        _mtshirt.text = (int.parse(_mtshirt.text) + 1).toString();
                                                      });
                                                    },
                                                      icon: Icon(MdiIcons.plus),
                                                      iconSize: 20,),
                                                    Expanded(
                                                      child: TextFormField(
                                                        readOnly: true,
                                                        controller: _mtshirt,
                                                        decoration: InputDecoration(
                                                          border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(5),
                                                          ),
                                                        ),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ),
                                                    IconButton(onPressed: () {
                                                      setState(() {
                                                        int newValue = int.parse(_mtshirt.text) - 1;
                                                        if (newValue >= 0) {
                                                          setState(() {
                                                            _mtshirt.text = newValue.toString();
                                                          });
                                                        }
                                                      });
                                                    }, icon: Icon(MdiIcons.minus),iconSize: 20),
                                                  ],
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
                                                  flex: 2,
                                                  child: SizedBox(
                                                    width: 20,
                                                    height: 35,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            _mshirt.text = (int.parse(_mshirt.text) + 1).toString();
                                                          });
                                                        },
                                                          icon: Icon(MdiIcons.plus),
                                                          iconSize: 20,),
                                                        Expanded(
                                                          child: TextFormField(
                                                            readOnly: true,
                                                            controller: _mshirt,
                                                            decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                            ),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ),
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            int newValue = int.parse(_mshirt.text) - 1;
                                                            if (newValue >= 0) {
                                                              setState(() {
                                                                _mshirt.text = newValue.toString();
                                                              });
                                                            }
                                                          });
                                                        }, icon: Icon(MdiIcons.minus),iconSize: 20),
                                                      ],
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
                                                  flex: 2,
                                                  child: SizedBox(
                                                    width: 20,
                                                    height: 35,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            _mpant.text = (int.parse(_mpant.text) + 1).toString();
                                                          });
                                                        },
                                                          icon: Icon(MdiIcons.plus),
                                                          iconSize: 20,),
                                                        Expanded(
                                                          child: TextFormField(
                                                            readOnly: true,
                                                            controller: _mpant,
                                                            decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                            ),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ),
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            int newValue = int.parse(_mpant.text) - 1;
                                                            if (newValue >= 0) {
                                                              setState(() {
                                                                _mpant.text = newValue.toString();
                                                              });
                                                            }
                                                          });
                                                        }, icon: Icon(MdiIcons.minus),iconSize: 20),
                                                      ],
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
                                                  flex: 2,
                                                  child: SizedBox(
                                                    width: 20,
                                                    height: 35,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            _msuits.text = (int.parse(_msuits.text) + 1).toString();
                                                          });
                                                        },
                                                          icon: Icon(MdiIcons.plus),
                                                          iconSize: 20,),
                                                        Expanded(
                                                          child: TextFormField(
                                                            readOnly: true,
                                                            controller: _msuits,
                                                            decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                            ),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ),
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            int newValue = int.parse(_msuits.text) - 1;
                                                            if (newValue >= 0) {
                                                              setState(() {
                                                                _msuits.text = newValue.toString();
                                                              });
                                                            }
                                                          });
                                                        }, icon: Icon(MdiIcons.minus),iconSize: 20),
                                                      ],
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
                                                  flex: 2,
                                                  child: SizedBox(
                                                    width: 20,
                                                    height: 35,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            _mtraditional.text = (int.parse(_mtraditional.text) + 1).toString();
                                                          });
                                                        },
                                                          icon: Icon(MdiIcons.plus),
                                                          iconSize: 20,),
                                                        Expanded(
                                                          child: TextFormField(
                                                            readOnly: true,
                                                            controller: _mtraditional,
                                                            decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                            ),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ),
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            int newValue = int.parse(_mtraditional.text) - 1;
                                                            if (newValue >= 0) {
                                                              setState(() {
                                                                _mtraditional.text = newValue.toString();
                                                              });
                                                            }
                                                          });
                                                        }, icon: Icon(MdiIcons.minus),iconSize: 20),
                                                      ],
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
                                                  flex: 2,
                                                  child: SizedBox(
                                                    width: 20,
                                                    height: 35,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            _ftshirt.text = (int.parse(_ftshirt.text) + 1).toString();
                                                          });
                                                        },
                                                          icon: Icon(MdiIcons.plus),
                                                          iconSize: 20,),
                                                        Expanded(
                                                          child: TextFormField(
                                                            readOnly: true,
                                                            controller: _ftshirt,
                                                            decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                            ),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ),
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            int newValue = int.parse(_ftshirt.text) - 1;
                                                            if (newValue >= 0) {
                                                              setState(() {
                                                                _ftshirt.text = newValue.toString();
                                                              });
                                                            }
                                                          });
                                                        }, icon: Icon(MdiIcons.minus),iconSize: 20),
                                                      ],
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
                                                  flex: 2,
                                                  child: SizedBox(
                                                    width: 20,
                                                    height: 35,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            _fkurta.text = (int.parse(_fkurta.text) + 1).toString();
                                                          });
                                                        },
                                                          icon: Icon(MdiIcons.plus),
                                                          iconSize: 20,),
                                                        Expanded(
                                                          child: TextFormField(
                                                            controller: _fkurta,
                                                            readOnly: true,
                                                            decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                            ),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ),
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            int newValue = int.parse(_fkurta.text) - 1;
                                                            if (newValue >= 0) {
                                                              setState(() {
                                                                _fkurta.text = newValue.toString();
                                                              });
                                                            }
                                                          });
                                                        }, icon: Icon(MdiIcons.minus),iconSize: 20),
                                                      ],
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
                                                  flex: 2,
                                                  child: SizedBox(
                                                    width: 20,
                                                    height: 35,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            _fpant.text = (int.parse(_fpant.text) + 1).toString();
                                                          });
                                                        },
                                                          icon: Icon(MdiIcons.plus),
                                                          iconSize: 20,),
                                                        Expanded(
                                                          child: TextFormField(
                                                            controller: _fpant,
                                                            readOnly: true,
                                                            decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                            ),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ),
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            int newValue = int.parse(_fpant.text) - 1;
                                                            if (newValue >= 0) {
                                                              setState(() {
                                                                _fpant.text = newValue.toString();
                                                              });
                                                            }
                                                          });
                                                        }, icon: Icon(MdiIcons.minus),iconSize: 20),
                                                      ],
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
                                                  flex: 2,
                                                  child: SizedBox(
                                                    width: 20,
                                                    height: 35,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            _fsaree.text = (int.parse(_fsaree.text) + 1).toString();
                                                          });
                                                        },
                                                          icon: Icon(MdiIcons.plus),
                                                          iconSize: 20,),
                                                        Expanded(
                                                          child: TextFormField(
                                                            controller: _fsaree,
                                                            readOnly: true,
                                                            decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                            ),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ),
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            int newValue = int.parse(_fsaree.text) - 1;
                                                            if (newValue >= 0) {
                                                              setState(() {
                                                                _fsaree.text = newValue.toString();
                                                              });
                                                            }
                                                          });
                                                        }, icon: Icon(MdiIcons.minus),iconSize: 20),
                                                      ],
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
                                                  flex: 2,
                                                  child: SizedBox(
                                                    width: 20,
                                                    height: 35,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            _ktshirt.text = (int.parse(_ktshirt.text) + 1).toString();
                                                          });
                                                        },
                                                          icon: Icon(MdiIcons.plus),
                                                          iconSize: 20,),
                                                        Expanded(
                                                          child: TextFormField(
                                                            controller: _ktshirt,
                                                            readOnly: true,
                                                            decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                            ),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ),
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            int newValue = int.parse(_ktshirt.text) - 1;
                                                            if (newValue >= 0) {
                                                              setState(() {
                                                                _ktshirt.text = newValue.toString();
                                                              });
                                                            }
                                                          });
                                                        }, icon: Icon(MdiIcons.minus),iconSize: 20),
                                                      ],
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
                                                  flex: 2,
                                                  child: SizedBox(
                                                    width: 20,
                                                    height: 35,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            _kshirt.text = (int.parse(_kshirt.text) + 1).toString();
                                                          });
                                                        },
                                                          icon: Icon(MdiIcons.plus),
                                                          iconSize: 20,),
                                                        Expanded(
                                                          child: TextFormField(
                                                            controller: _kshirt,
                                                            readOnly: true,
                                                            decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                            ),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ),
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            int newValue = int.parse(_kshirt.text) - 1;
                                                            if (newValue >= 0) {
                                                              setState(() {
                                                                _kshirt.text = newValue.toString();
                                                              });
                                                            }
                                                          });
                                                        }, icon: Icon(MdiIcons.minus),iconSize: 20),
                                                      ],
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
                                                  flex: 2,
                                                  child: SizedBox(
                                                    width: 20,
                                                    height: 35,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            _kpant.text = (int.parse(_kpant.text) + 1).toString();
                                                          });
                                                        },
                                                          icon: Icon(MdiIcons.plus),
                                                          iconSize: 20,),
                                                        Expanded(
                                                          child: TextFormField(
                                                            controller: _kpant,
                                                            readOnly: true,
                                                            decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                            ),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ),
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            int newValue = int.parse(_kpant.text) - 1;
                                                            if (newValue >= 0) {
                                                              setState(() {
                                                                _kpant.text = newValue.toString();
                                                              });
                                                            }
                                                          });
                                                        }, icon: Icon(MdiIcons.minus),iconSize: 20),
                                                      ],
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
                                                  flex: 2,
                                                  child: SizedBox(
                                                    width: 20,
                                                    height: 35,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            _ktoddler.text = (int.parse(_ktoddler.text) + 1).toString();
                                                          });
                                                        },
                                                          icon: Icon(MdiIcons.plus),
                                                          iconSize: 20,),
                                                        Expanded(
                                                          child: TextFormField(
                                                            controller: _ktoddler,
                                                            readOnly: true,
                                                            decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                            ),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ),
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            int newValue = int.parse(_ktoddler.text) - 1;
                                                            if (newValue >= 0) {
                                                              setState(() {
                                                                _ktoddler.text = newValue.toString();
                                                              });
                                                            }
                                                          });
                                                        }, icon: Icon(MdiIcons.minus),iconSize: 20),
                                                      ],
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
                                                  flex: 2,
                                                  child: SizedBox(
                                                    width: 20,
                                                    height: 35,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            _kethinic.text = (int.parse(_kethinic.text) + 1).toString();
                                                          });
                                                        },
                                                          icon: Icon(MdiIcons.plus),
                                                          iconSize: 20,),
                                                        Expanded(
                                                          child: TextFormField(
                                                            controller: _kethinic,
                                                            readOnly: true,
                                                            decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                            ),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ),
                                                        IconButton(onPressed: () {
                                                          setState(() {
                                                            int newValue = int.parse(_kethinic.text) - 1;
                                                            if (newValue >= 0) {
                                                              setState(() {
                                                                _kethinic.text = newValue.toString();
                                                              });
                                                            }
                                                          });
                                                        }, icon: Icon(MdiIcons.minus),iconSize: 20),
                                                      ],
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
              onPressed: _onBookNow,
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



  void _onBookNow() async {
    // Generate a new random order ID
    final orderId = const Uuid().v4();
    final user = FirebaseAuth.instance.currentUser!;
    final userId = user.uid;

    // Initialize an empty list of items to store the non-zero values
    final items = <String, dynamic>{};

    if (int.parse(_mtshirt.text) > 0) items['mtshirt'] = int.parse(_mtshirt.text);
    if (int.parse(_mshirt.text) > 0) items['mshirt'] = int.parse(_mshirt.text);
    if (int.parse(_mpant.text) > 0) items['mpant'] = int.parse(_mpant.text);
    if (int.parse(_msuits.text) > 0) items['msuits'] = int.parse(_msuits.text);
    if (int.parse(_mtraditional.text) > 0) items['mtraditional'] = int.parse(_mtraditional.text);
    if (int.parse(_ftshirt.text) > 0) items['ftshirt'] = int.parse(_ftshirt.text);
    if (int.parse(_fkurta.text) > 0) items['fkurta'] = int.parse(_fkurta.text);
    if (int.parse(_fpant.text) > 0) items['fpant'] = int.parse(_fpant.text);
    if (int.parse(_fsaree.text) > 0) items['fsaree'] = int.parse(_fsaree.text);
    if (int.parse(_ktshirt.text) > 0) items['ktshirt'] = int.parse(_ktshirt.text);
    if (int.parse(_kshirt.text) > 0) items['kshirt'] = int.parse(_kshirt.text);
    if (int.parse(_kpant.text) > 0) items['kpant'] = int.parse(_kpant.text);
    if (int.parse(_ktoddler.text) > 0) items['ktoddlervalue'] = int.parse(_ktoddler.text);
    if (int.parse(_kethinic.text) > 0) items['kethinic'] = int.parse(_kethinic.text);

    if (items.isEmpty) {
      showToast(message: "Please select at least one item to continue.");
      return;
    }

    // Add the user ID and order ID to the items list
    items['userId'] = userId;
    items['orderId'] = orderId;
    items['orderStatus'] = 'ordered';
    final timestamp = DateTime.now().toUtc().millisecondsSinceEpoch;
    items['timestamp'] = DateFormat('MMM d, y h:mm:ss a').format(DateTime.fromMillisecondsSinceEpoch(timestamp));

    // Get the selected date and time
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );

    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    // If a date and time were selected, add them to the items list
    if (pickedDate != null && pickedTime != null) {
      final DateTime dateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      items['Order Date and Time'] = dateTime;
    }

    // Store the items in the Firestore database
    await _firestore.collection('Order').doc(orderId).set(items);

    // Show a toast message and navigate to the next screen
    showToast(message: "Laundry Booked.");
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => const Servicetracking()),
    // );
  }
}