import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyShared extends StatefulWidget {
  const MyShared({super.key});

  @override
  State<MyShared> createState() => _MySharedState();
}

class _MySharedState extends State<MyShared> {
  late SharedPreferences prefs;
  final _teksController = TextEditingController();
  String? teks = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
        Icon(Icons.storage),
        SizedBox(width: 8),
        Text('Shared Preferences'),
          ],
        ),
      ),

      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [

            TextField(
              controller: _teksController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 6),
            ElevatedButton(
              onPressed: () {
                saveValue();
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.save),
                  SizedBox(width: 8),
                  Text('Save'),
                ],
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: teks,
              ),
            ),

            const SizedBox(height: 6),
            ElevatedButton(
              onPressed: () {
                getValue().then((value) {
                  setState(() {
                    teks = value ?? 'Value is empty';
                  });
                });
              },
              child: const Text('Get Value'),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                deleteValue();
              },
              child: const Text('Delete Value'),
            ),
          ],

        ),
      ),
    );
  }

  // saveValue method to save the value to shared preferences
  saveValue() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('teks', _teksController.text);
    _teksController.clear();
    setState(() {
      teks = prefs.getString('teks');
    });
  }

  // getValue method to get the value from shared preferences
  getValue() async {
    prefs = await SharedPreferences.getInstance();
    String? teks = prefs.getString('teks');
    return teks;
  }

  // deleteValue method to delete the value from shared preferences
  deleteValue() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('teks');
    teks = '';
    setState(() {
      _teksController.clear();
    });
  }
  
  
  // dispose method
  @override
  void dispose() {
    _teksController.dispose();
    super.dispose();
  }
}