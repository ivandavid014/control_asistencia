import 'package:flutter/material.dart';
import '../dto/DTOempleado.dart';

class Add50 extends StatefulWidget {
  Empleado empleado;
  Add50(this.empleado);

  @override
  State<Add50> createState() => _Add50State(empleado);
}

class _Add50State extends State<Add50> {
  int _counter = 0;
  Empleado empleado;
  _Add50State(this.empleado);
  @override
  void initState() {
    _counter = empleado.horas24 ?? 0;
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      if (_counter >= 5) {
        return;
      }
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter <= 0) {
        return;
      }
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
      appBar: AppBar(
        title: Text('Artículo 50'),
        backgroundColor: Colors.grey.shade900,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 31, 179, 122),
              Colors.black26,
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
                  'Devolvió:',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '$_counter horas',
                  style: const TextStyle(
                      fontSize: 120,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  empleado.horas24 = _counter;
                },
                child: Text('GUARDAR'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  fixedSize: Size(MediaQuery.of(context).size.width, 35),
                  primary: Color.fromARGB(255, 31, 179, 122),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      heroTag: "restar",
                      backgroundColor: _counter == 0
                          ? Colors.transparent
                          : Colors.lightGreenAccent,
                      elevation: 15,
                      onPressed: _counter != 0 ? _decrementCounter : null,
                      child: const Icon(
                        Icons.remove,
                        size: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    FloatingActionButton(
                      heroTag: "reiniciar",
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
                      heroTag: "agregar horas",
                      backgroundColor: _counter == 5
                          ? Colors.transparent
                          : Colors.lightGreenAccent,
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
