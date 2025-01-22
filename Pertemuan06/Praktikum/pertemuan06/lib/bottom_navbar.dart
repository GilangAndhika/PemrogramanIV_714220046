import 'package:flutter/material.dart';

class DynamicBottomNavbar extends StatefulWidget {
  const DynamicBottomNavbar({super.key});

  @override
  State<DynamicBottomNavbar> createState() => _DynamicBottomNavbarState();
}

class _DynamicBottomNavbarState extends State<DynamicBottomNavbar> {
  int _currentPageIndex = 0;

  final List<Widget> _pages = <Widget>[
    const MyInput(),
    const MyInput(),
  ];

  void onTabTaped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentPageIndex,
        onTap: onTabTaped,
        items: const [
          BottomNavigationBarItem(
            
            icon: Icon(Icons.task_alt_outlined),
            label: 'Latihan',
            
          ),

          BottomNavigationBarItem(

            icon: Icon(Icons.input_outlined),
            label: 'Form Validation',

          ),
        ],

        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,

      ),

    );
  }
}



class MyInput extends StatefulWidget {
  const MyInput({super.key});

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  final TextEditingController _controller = TextEditingController();
  bool lightOn = false;
  bool agree = false;
  String? language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Widget'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            TextField(
              controller: _controller,
              decoration: const InputDecoration(

                hintText: 'Write your name here...',
                labelText: 'Your Name',
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              
              child: const Text('Submit'),
              onPressed: () {
                showDialog(

                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Hello, ${_controller.text}'),
                    );
                });
              

              }
            ),

            Switch(
              value: lightOn,
              onChanged: (bool value) {
                setState(() {
                  lightOn = value;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(

                    content: Text(lightOn ? 'Light On' : 'Light Off'),
                    duration: const Duration(seconds: 1),

                  ),
                );
              },
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Radio<String>(

                    value: 'Dart',
                    groupValue: language,
                    onChanged: (String? value) {
                      setState(() {
                        language = value;
                        showSnackBar();
                      });
                    },

                  ),
                  title: const Text('Dart'),
                ),

                ListTile(
                  leading: Radio<String>(

                    value: 'Kotlin',
                    groupValue: language,
                    onChanged: (String? value) {
                      setState(() {
                        language = value;
                        showSnackBar();
                      });
                    },

                  ),
                  title: const Text('Kotlin'),
                ),

                ListTile(
                  leading: Radio<String>(

                    value: 'Swift',
                    groupValue: language,
                    onChanged: (String? value) {
                      setState(() {
                        language = value;
                        showSnackBar();
                      });
                    },

                  ),
                  title: const Text('Swift'),
                ),

              ],
            ),

            ListTile(
              leading: Checkbox(
                value: agree,
                onChanged: (bool? value) {
                  setState(() {
                    agree = value!;
  
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(

                        content: Text(agree ? 'Agree' : 'Disagree'),
                        duration: const Duration(seconds: 1),

                      ),
                    );
                    
                  });
                },
              ),
              title: const Text('Agree / Disagree'),
            ),

          ],
        ),
      ),
    );
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected Language: $language'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}