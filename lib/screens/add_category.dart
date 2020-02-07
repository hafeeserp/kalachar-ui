import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController sName = TextEditingController();
  bool _buttonEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        backgroundColor: Colors.white,
        elevation: 5,
      ),
      body: Center(
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50.0,
              width: 300.0,
              child: TextFormField(
                key: _formkey,
                controller: sName,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter the quantity';
                  }
                },
                decoration: InputDecoration(
                    labelText: "Supplier Name",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
            ),
          ],
        )),
      ),
      bottomNavigationBar: Container(
          color: _buttonEnabled ? Colors.deepOrange : Colors.grey,
          child: RaisedButton(
              elevation: 0,
              textColor: Colors.white,
              splashColor: Colors.amber,
              disabledColor: Colors.grey,
              child: Text(
                "Add",
                textScaleFactor: 1.6,
              ),
              color: Colors.deepOrange,
              onPressed: _buttonEnabled
                  ? () {
                    }
                  : null)),
    );
  }
}
