import 'package:agenda_contatos/CustomWidgets/CardContact.dart';
import 'package:agenda_contatos/Helpers/Contact_helper.dart';
import 'package:agenda_contatos/Screens/ContactPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();
  List<Contact> listContacts = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper.getAllContacts().then((list) {
      setState(() {
        listContacts = list;
        print(listContacts);
      });
    });
  }

  void _showContactPage({Contact contact}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ContactPage(
                  contact: contact,
                )));
  }

  _orderContacts() {
    listContacts.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    _orderContacts();

    helper.getAllContacts().then((list) {
      setState(() {
        listContacts = list;
      });
    });

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Contatos"),
      ),
      body: SafeArea(
        bottom: true,
        top: true,
        child: ListView.builder(
          padding: EdgeInsets.all(15),
          itemCount: listContacts.length,
          itemBuilder: (context, index) {
            Contact contact = listContacts[index];
            return CardContact(
              contact: contact,
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {
          _showContactPage();
        },
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(17),
              )),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
