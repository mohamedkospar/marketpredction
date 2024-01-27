import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:gpapp/utils/extension.dart';
import '../theme.dart';

class StockPredictionScreen extends StatefulWidget {
  const StockPredictionScreen({super.key});

  @override
  State<StockPredictionScreen> createState() => _StockPredictionScreenState();
}

class _StockPredictionScreenState extends State<StockPredictionScreen> {
  List<double>? predictions;
  late Interpreter _interpreter; // Predicted values

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  final List<String> _options = [
    'Tesla',
  ];
  String? _selectedValue;

  void loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset('predmodel.tflite');
      print('Model loaded successfully');

      makePredictions();
    } catch (e) {
      print('Failed to load model: $e');
    }
  }

  void makePredictions() {
    try {
      //creates a list of length 4 filled with zeros and reshapes it into a 2D list with dimensions [1, 4]
      var outputs = List<double>.filled(4, 0).reshape([1, 4]);
// the predicted values are stored in outputs[0].
      _interpreter.run([], outputs);

      setState(() {
        predictions = outputs[0];
      });
    } catch (e) {
      print('Prediction error: $e');
    }
  }

  @override
  void dispose() {
    _interpreter.close();
    super.dispose();
  }

  Widget containerWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      width: double.infinity,
      child: Card(
          child: Column(
        children: [
          const Text(
            "Your prediction",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Text(
                      'Open',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    label: Text(
                      '${predictions![0]}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Text(
                      'High',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    label: Text(
                      '${predictions![1]}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  height: 70.0,
                  width: 3.0,
                  child: VerticalDivider(
                    thickness: 2.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Text(
                      'low',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    label: Text(
                      '${predictions![2]}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Text(
                      'Close',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    label: Text(
                      '${predictions![3]}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.refresh),
                label: const Text("Start New Predict"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // background (button) color
                  foregroundColor: Colors.white, // foreground (text) color
                ),
                onPressed: () {
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Prediction'),
      ),
      body: Center(
        child: predictions == null
            ? Column(
                children: [
                  ListTile(
                    leading: const Text(
                      'Start prediction',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ).fadeInList(1, true),
                  ),
                  DropdownButton<String>(
                    value: _selectedValue,
                    hint: const Text("chosse your company interested"),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedValue = newValue;
                      });
                    },
                    items:
                        _options.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ).fadeInList(1, true),
                  Container(
                    margin: const EdgeInsets.only(top: 50.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: CustomTheme.loginGradientStart,
                          offset: Offset(1.0, 6.0),
                          blurRadius: 20.0,
                        ),
                        BoxShadow(
                          color: CustomTheme.loginGradientEnd,
                          offset: Offset(1.0, 6.0),
                          blurRadius: 20.0,
                        ),
                      ],
                      gradient: LinearGradient(
                          colors: <Color>[
                            CustomTheme.loginGradientEnd,
                            CustomTheme.loginGradientStart
                          ],
                          begin: FractionalOffset(0.2, 0.2),
                          end: FractionalOffset(1.0, 1.0),
                          stops: <double>[0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: CustomTheme.loginGradientEnd,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 42.0),
                        child: Text(
                          'Predict Now',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontFamily: 'WorkSansBold'),
                        ),
                      ),
                      onPressed: () => loadModel(),
                    ),
                  ).fadeInList(1, true),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
