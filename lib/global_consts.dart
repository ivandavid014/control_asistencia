import 'package:flutter/material.dart';

List<String> appbarTitles = [
  'Artículo 24',
  'Artículo 25',
  'EMPLEADO',
  'Artículo 50',
  'LICENCIA',
];

Future<bool> confirm(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: const Text('Confirmar'),
        content: const Text(
            'Más de 6 días pedidos. ¿Estás seguro de querer agregar esta entrada?'),
        actions: [
          ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.green.shade600),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('SI')),
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Colors.red.shade600),
                ),
              ),
            ),
            autofocus: true,
            child: const Text('NO'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        ],
      );
    },
  );
}

Widget buildDivider() =>
    Container(height: 40, child: VerticalDivider(color: Colors.grey));