import 'package:control_personal_municipal/database.dart';
import 'package:control_personal_municipal/empleadoDTO.dart';
import 'package:flutter/material.dart';

const TextStyle _textStyle = TextStyle(
  fontSize: 30,
  fontStyle: FontStyle.italic,
  letterSpacing: 3,
  fontWeight: FontWeight.bold,
);

class EmpleadoPage extends StatefulWidget {
  const EmpleadoPage({Key? key}) : super(key: key);

  @override
  State<EmpleadoPage> createState() => _EmpleadoPageState();
}

class _EmpleadoPageState extends State<EmpleadoPage> {
  int _currentIndex = 0;
  List<Widget> pages = const [
    Text('Licencia', style: _textStyle),
    Text('Art. 24', style: _textStyle),
    Text('Art. 25', style: _textStyle),
    Text('Art. 50', style: _textStyle),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('empleado muni')),
      body: Center(child: pages[_currentIndex]),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.green[400],
        animationDuration: const Duration(seconds: 1),
        height: 60,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: _currentIndex,
        onDestinationSelected: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.eco_outlined),
            label: 'Licencia',
            selectedIcon: Icon(Icons.eco),
          ),
          NavigationDestination(
            icon: Icon(Icons.eco_outlined),
            label: 'Art. 24',
            selectedIcon: Icon(Icons.eco),
          ),
          NavigationDestination(
            icon: Icon(Icons.eco_outlined),
            label: 'Art. 25',
            selectedIcon: Icon(Icons.eco),
          ),
          NavigationDestination(
            icon: Icon(Icons.eco_outlined),
            label: 'Art. 50',
            selectedIcon: Icon(Icons.eco),
          ),
        ],
      ),
    );
  }
}
