import 'package:control_personal_municipal/main.dart';
import 'package:flutter/material.dart';
import '../DTOs/DTOempleado.dart';

// ignore: must_be_immutable
class Count25 extends StatefulWidget {
  Empleado empleado;
  Count25(this.empleado);

  @override
  State<Count25> createState() => _Count25State(empleado);
}

class _Count25State extends State<Count25> {
  int _counter = 0;
  Empleado empleado;
  _Count25State(this.empleado);
  @override
  void initState() {
    _counter = empleado.dias25 ?? 0;
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      if (_counter >= 6) {
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
        title: Text('Días pedidos en el año - Artículo 25'),
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
                  'Días pedidos en el año:',
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '$_counter días',
                  style: const TextStyle(
                      fontSize: 100,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 60,
                width: 300,
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      empleado.dias25 = _counter;
                      guardarDatos(empleados);
                      Navigator.of(context).pop();
                    },
                    child: Text('GUARDAR'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      fixedSize: Size(MediaQuery.of(context).size.width, 35),
                      primary: Color.fromARGB(255, 31, 179, 122),
                    ),
                  ),
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
                      heroTag: "agregar",
                      backgroundColor: _counter == 6
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
