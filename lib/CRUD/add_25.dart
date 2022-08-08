import 'package:flutter/material.dart';
import '../dto/DTOempleado.dart';

// ignore: must_be_immutable
class Add25 extends StatefulWidget {
  Empleado empleado;

  Add25(this.empleado);
  @override
  _HomeState createState() => _HomeState(empleado);
}

class _HomeState extends State<Add25> {
  Empleado empleado;
  _HomeState(this.empleado);
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(DateTime.now().year - 3),
    end: DateTime(DateTime.now().year + 3),
  );

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _restart() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple,
              Colors.indigo,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(60.0),
                child: Text(
                  'Flutter Counter',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '$_counter',
                  style: const TextStyle(
                      fontSize: 120,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.transparent,
                      elevation: 15,
                      onPressed: _decrementCounter,
                      child: const Icon(
                        Icons.remove,
                        size: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    FloatingActionButton(
                      mini: true,
                      backgroundColor: Colors.transparent,
                      elevation: 15,
                      onPressed: _restart,
                      child: const Icon(
                        Icons.restart_alt,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.transparent,
                      elevation: 15,
                      onPressed: _incrementCounter,
                      child: const Icon(
                        Icons.add,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
