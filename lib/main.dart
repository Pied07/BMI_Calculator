import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'B M I',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
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
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var col = const Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Your BMI Calculator',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 65, 0, 77),
        ),
        body: Center(
            child: Container(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'BMI',
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 115, 24, 131)),
                    ),
                    TextField(
                      controller: wtController,
                      decoration: InputDecoration(
                          label: Text('Enter your Weight in Kgs'),
                          prefixIcon: Icon(Icons.line_weight)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: ftController,
                      decoration: InputDecoration(
                          label: Text('Enter your Height in feet'),
                          prefixIcon: Icon(Icons.height)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: inController,
                      decoration: InputDecoration(
                          label: Text('Enter your Height in inches'),
                          prefixIcon: Icon(Icons.height)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          var wt = wtController.text.toString();
                          var ft = ftController.text.toString();
                          var inch = inController.text.toString();

                          if (wt != '' && ft != '' && inch != '') {
                            var iwt = int.parse(wt);
                            var ift = int.parse(ft);
                            var iinch = int.parse(inch);

                            var total_inch = (ift * 12) + iinch;
                            var total_cm = total_inch * 2.54;
                            var total_m = total_cm / 100;
                            var bmi = iwt / (total_m * total_m);
                            var msg = "";

                            if (bmi > 25) {
                              msg = 'You are OverWeight!...';
                              col = Colors.red;
                            } else if (bmi < 18) {
                              msg = 'You are UnderWeight!...';
                              col = Colors.orange;
                            } else {
                              msg = 'Congrats!! You are Perfectly fine...';
                              col = Colors.green;
                            }

                            setState(() {
                              result =
                                  '$msg \n Your bmi is: ${bmi.toStringAsFixed(4)}';
                            });
                          } else {
                            setState(() {
                              result = 'Please fill All the Required Blanks';
                            });
                          }
                        },
                        child: Text('Calculate BMI')),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      result,
                      style: TextStyle(fontSize: 20, color: col),
                    ),
                  ],
                ))));
  }
}
