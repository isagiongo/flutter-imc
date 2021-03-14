import 'package:calculator_imc/imc_calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _calculeImc = ImcCalculator();
  String _resultImc = "Enter your weight(kg) and height(cm)";

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  void _resetFields() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _resultImc = "Enter your weight(kg) and height(cm)";
      _formKey = GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Imc Calculator"),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh_rounded), onPressed: _resetFields)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_rounded, size: 80.0, color: Colors.purple),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Weight (kg)",
                    labelStyle: TextStyle(color: Colors.purple)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purple, fontSize: 18.0),
                controller: weightController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Enter your weight!";
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Height (cm)",
                    labelStyle: TextStyle(color: Colors.purple)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purple, fontSize: 18.0),
                controller: heightController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Enter your height!";
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          try {
                            _resultImc = _calculeImc.calculate(
                                weightController.text, heightController.text);
                          } catch (e) {
                            _resultImc =
                                '$e is invalid. Enter valid values (numbers) in Weight and Height';
                          }
                        });
                      }
                    },
                    child: Text(
                      'Calculate',
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    color: Colors.purple,
                  ),
                ),
              ),
              Text(
                _resultImc,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purple, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
