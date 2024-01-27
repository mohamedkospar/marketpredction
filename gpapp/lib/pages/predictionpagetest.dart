import 'package:flutter/material.dart';
import 'package:gpapp/utils/extension.dart';
import '../theme.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({super.key});

  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  static const _kHeadlineStyle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);

  static const _kTextStyle = TextStyle(
    color: Colors.white,
    height: 1.8,
    fontWeight: FontWeight.w600,
  );

  Widget _buildContent({
    required String title,
    required String text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: _kHeadlineStyle),
        const SizedBox(height: 8),
        Text(text, style: _kTextStyle),
      ],
    );
  }

  final List<String> _options = [
    'Tesla',
  ];
  String? _selectedValue;
  bool whenpress = false;
  bool beforepress = false;
  //var select=Future.delayed(const Duration(seconds: 3));
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  Widget containerWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      width: double.infinity,
      child: Card(
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Your prediction",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
          _isChecked1
              ? TextButton.icon(
                  onPressed: () {},
                  icon: const Text(
                    'Close',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  label: const Text(
                    '195.43733',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              : Row(
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
                            'First Day',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          label: const Text(
                            '196.32808',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Text(
                            'Third Day',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          label: const Text(
                            '196.77724',
                            style: TextStyle(color: Colors.grey),
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
                            'Second Day',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          label: const Text(
                            '196.75195',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Text(
                            'Furth Day',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          label: const Text(
                            '198.26044',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
          _isChecked1
              ? Container()
              : TextButton.icon(
                  onPressed: () {},
                  icon: const Text(
                    'Last Day',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  label: const Text(
                    '200.5395 ',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
          const SizedBox(
            height: 30,
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
                  setState(() {
                    whenpress = false;
                  });
                },
              ),
            ),
          ),
          _buildContent(
              text:
                  'You should follow the stock market and the news and not just rely on prediction. We wish you well ❤️',
              title: 'Note'),
          const SizedBox(
            height: 10,
          )
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prediction page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: const Text(
                'Start prediction ',
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
              items: _options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ).fadeInList(1, true),
            CheckboxListTile(
              title: const Text('Tomorrow Prediction '),
              value: _isChecked1,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked1 = value!;
                  _isChecked2 = false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Next 5 Days Prediction'),
              value: _isChecked2,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked1 = false;
                  _isChecked2 = value!;
                });
              },
            ),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 42.0),
                  child: beforepress
                      ? const CircularProgressIndicator()
                      : const Text(
                          'Predict Now',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontFamily: 'WorkSansBold'),
                        ),
                ),
                onPressed: () async {
                  setState(() {
                    beforepress = true;
                  });

                  Future.delayed(const Duration(seconds: 5)).then((value) {
                    setState(() {
                      whenpress = true;
                      beforepress = false;
                    });
                  });
                  Navigator.pushNamed(context, 'test');
                },
              ),
            ).fadeInList(1, true),
            whenpress ? containerWidget() : const Center(),
          ],
        ),
      ),
    );
  }
}


/**  Row(
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
                      'Opens',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    label: const Text(
                      '197.93',
                      style: TextStyle(color: Colors.grey),
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
                    label: const Text(
                      '201.99',
                      style: TextStyle(color: Colors.grey),
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
                    label: const Text(
                      '191.78',
                      style: TextStyle(color: Colors.grey),
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
                    label: const Text(
                      '204.23',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ), */