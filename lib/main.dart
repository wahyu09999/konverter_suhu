import 'dart:html';

import 'package:flutter/material.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  double celcius = 0;
  double kelvin = 0;
  double reamur = 0;
  
  TextEditingController inputCon = TextEditingController();

  rumusKonversi() {
    setState(() {
      celcius = double.parse(inputCon.text);
      reamur = (4/5) * celcius;
      kelvin = 273.15 + celcius;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
      appBar: AppBar(
        title: const Text('Konverter Suhu'),
      ),
      body: Container(
        
        margin: const EdgeInsets.all(100),
        child: Column(
          children: [
            input(),
            spasi(),
            output(),
            spasi(),
            button(),
          ],
        ),
      )
      )
    );
  }

  input(){
    return TextFormField(
      controller: inputCon,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Masukan Suhu Dalam Celcius',
      ),
    );
  }

 spasi() {
   return const SizedBox(
      height: 100,
    );
  }
  
  output(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(            
          children: [
            const Text('Suhu dalam Reamur'),
            const SizedBox(height :20),
            Text("$reamur")
          ],
        ),

        Column(
          children: [
            const Text('Suhu dalam Kelvin'),
            const SizedBox(height :20),
            Text("$kelvin"),
          ],
        ),
      ],
    );
  }

  button(){
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        child: const Text('Hitung'),
        onPressed: () => rumusKonversi(),
      )
    );
  }
  
 
}