import 'package:bmi/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
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
  var weightController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result = '';
  var bgColor = Colors.blue.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                ),
                SizedBox(height: 20),

                TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight (in Kgs)'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your height(in Feet)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                    label: Text('Enter your height(in Inches)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    var wt = weightController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inchController.text.toString();

                    if (wt != '' && ft != '' && inch != '') {
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (ift * 12) + iInch;
                      var tCm = tInch * 2.54;
                      var tM = tCm / 100;

                      var bmi = iwt / (tM * tM);

                      var msg = '';

                      if (bmi > 25) {
                        msg = "You're fat !!";
                        bgColor = Colors.orange;
                      } else if (bmi < 18) {
                        msg = "You're underweight !!";
                        bgColor = Colors.red;
                      } else {
                        msg = "You're healthy !!";
                        bgColor = Colors.green;
                      }

                      setState(() {
                        result =
                            '$msg \n Your BMI is ${bmi.toStringAsFixed(2)}';
                      });
                    } else {
                      setState(() {
                        result = 'Please enter all the required fields !!';
                      });
                      // Text('Please enter all the required fields !!',  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),);
                    }
                  },
                  child: Text('Calculate'),
                ),
                SizedBox(height: 20),
                Text(
                  result,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
