import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Please select a car maker',
  'Audi',
  'BMW',
  'Honda',
  'Mercedes',
  'Skoda',
  'Toyota',
];

var _carImages = {
  "Please select a car maker":
      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png",
  "Audi":
      "https://www.seekpng.com/png/full/857-8572785_audi-car-logo-scalable-vector-graphics-audi-logo.png",
  "BMW":
      "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/BMW_logo_%28gray%29.svg/2048px-BMW_logo_%28gray%29.svg.png",
  "Honda":
      "https://www.freeiconspng.com/thumbs/honda-logo-png/honda-icon-13.png",
  "Mercedes":
      "https://www.pngitem.com/pimgs/m/519-5191333_mercedes-logo-png-logo-de-mercedes-benz-vector.png",
  "Skoda":
      "https://www.nicepng.com/png/detail/37-379850_skoda-logo-log-skoda-logo-transparent.png",
  "Toyota":
      "https://p.kindpng.com/picc/s/65-650458_toyota-land-cruiser-prado-car-toyota-camry-solara.png",
};

var _carDescription = {
  "Please select a car maker": "No Description",
  "Audi":
      "Audi AG is a German automotive manufacturer of luxury vehicles headquartered in Ingolstadt, Bavaria, Germany. As a subsidiary of its parent company, the Volkswagen Group, Audi produces vehicles in nine production facilities worldwide.",
  "BMW":
      "Bayerische Motoren Werke AG, commonly referred to as BMW, is a German multinational corporate manufacturer of luxury vehicles and motorcycles headquartered in Munich, Bavaria,Germany.",
  "Honda":
      "Honda Motor Company, Ltd. is a Japanese public multinational conglomerate manufacturer of automobiles, motorcycles, and power equipment, headquartered in Minato, Tokyo, Japan.",
  "Mercedes":
      "Mercedes-Benz, commonly referred to as Mercedes, is a German luxury automotive brand. Mercedes-Benz and subsidiary Mercedes-Benz AG –of Daimler AG –are headquartered in Stuttgart, Baden-Württemberg, Germany. Mercedes-Benz produces consumer luxury vehicles and commercial vehicles.",
  "Skoda":
      "Škoda Auto a.s. (Czech pronunciation: [ˈʃkoda] (About this soundlisten)), often shortened to Škoda, is a Czech automobile manufacturer founded in 1895 as Laurin & Klement and headquartered in Mladá Boleslav, Czech Republic.",
  "Toyota":
      "Toyota Motor Corporation is a Japanese multinational automotive manufacturer headquartered in Toyota City, Aichi, Japan. It was founded by Kiichiro Toyoda and incorporated on August 28, 1937. Toyota is one of the largest automobile manufacturers in the world, producing about 10 million vehicles per year.",
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Cars',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = list.first;
  double width = 250;
  double height = 250;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Flexible(
                    child: Divider(
                      thickness: 5,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 22.0, bottom: 8.0),
                    child: Text("Car Maker",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  //                Padding(padding: EdgeInsetsDirectional.all(50)),
                  Expanded(
                      child: DropdownButton<String>(
                          hint: const Text("Please select a car maker"),
                          isExpanded: true,
                          value: dropdownValue,
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          })),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Flexible(
                    child: Divider(
                      thickness: 5,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 22.0, bottom: 8.0),
                    child: Text("Logo",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //                Padding(padding: EdgeInsetsDirectional.all(50)),
                  Flexible(
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Image.network(
                        _carImages[dropdownValue].toString(),
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                              fit: BoxFit.fitWidth,
                              width: width,
                              height: height,
                              _carImages["Please select a car maker"]
                                  .toString());
                        },
                        fit: BoxFit.fitWidth,
                        width: width,
                        height: height,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Flexible(
                    child: Divider(
                      thickness: 5,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 22.0, bottom: 8.0),
                    child: Text("Description",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                      child: Text(_carDescription[dropdownValue].toString()))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
