import 'package:flutter/material.dart';
import 'package:gpapp/app.dart';
import 'package:gpapp/pages/predictionpagetest.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  final TextEditingController maxNumberController = TextEditingController();
  final TextEditingController lesserNumberController = TextEditingController();
  String? _selectedCompany;

  final List<String> _stockCompanies = [
    'Google',
    'Alibaba',
    'Amazon',
    'Tesla',
    'Microsoft',
    'Apple',
    'Facebook',
    'Netflix',
    'Visa',
    'Mastercard',
    'JPMorgan Chase',
    'Bank of America',
    'Walmart',
    'Johnson & Johnson',
    'Procter & Gamble',
    'Coca-Cola',
    'Pfizer',
    'Intel',
    'Adobe',
    'Verizon',
    // Add more stock company names here
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return AlertDialog(
                title: const Text('Alert'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButton<String>(
                      value: _selectedCompany,
                      hint: const Text('Choose The Stock Company'),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCompany = newValue!;
                        });
                      },
                      items: _stockCompanies.map((String company) {
                        return DropdownMenuItem<String>(
                          value: company,
                          child: Text(company),
                        );
                      }).toList(),
                    ),
                    TextField(
                      controller: maxNumberController,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(labelText: 'Maximum price'),
                    ),
                    TextField(
                      controller: lesserNumberController,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(labelText: 'Lowest price'),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  ElevatedButton(
                    onPressed: _handleAlertOK,
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        },
      );
    } else {
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Stockpage()),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PredictionPage()),
          );
          break;
      }
    }
  }

  void _handleAlertOK() {
    int? maxNumber = int.tryParse(maxNumberController.text);
    int? lesserNumber = int.tryParse(lesserNumberController.text);

    print('Maximum Number: $maxNumber');
    print('Lesser Number: $lesserNumber');
    print('Selected Company: $_selectedCompany');

    // Show the message with the selected company and prices
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert Message'),
          content: Text(
            'Selected Company: $_selectedCompany\n'
            'Maximum Price: $maxNumber\n'
            'Lesser Price: $lesserNumber\n'
            'Wait for a notification',
          ),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.blue,
      currentIndex: _selectedIndex,
      showUnselectedLabels: true,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.price_change),
          label: 'Prediction Page',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.align_vertical_bottom),
          label: 'Alert',
        ),
      ],
    );
  }
}
