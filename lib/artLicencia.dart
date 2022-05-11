import 'package:flutter/material.dart';

class ArtLicencia extends StatelessWidget {
  const ArtLicencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Licencia tomada el  INSERTAR FECHA' + ' $index'),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
