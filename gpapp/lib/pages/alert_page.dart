import 'package:flutter/material.dart';

class AlertWithTwoInputs extends StatelessWidget {
  final TextEditingController maxNumberController = TextEditingController();
  final TextEditingController lesserNumberController = TextEditingController();

  AlertWithTwoInputs({super.key});

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Numbers'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: maxNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Maximum Number'),
              ),
              TextField(
                controller: lesserNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Lesser Number'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                int? maxNumber = int.tryParse(maxNumberController.text);
                int? lesserNumber = int.tryParse(lesserNumberController.text);

                print('Maximum Number: $maxNumber');
                print('Lesser Number: $lesserNumber');

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showAlertDialog(context);
          },
          child: const Text('Start Alert'),
        ),
      ),
    );
  }
}
