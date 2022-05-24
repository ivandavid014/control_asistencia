import 'package:control_personal_municipal/add_license.dart';
import 'package:flutter/material.dart';

class ArtLicencia extends StatelessWidget {
  const ArtLicencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.yellow),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddLicense()));
          },
          child: const Icon(Icons.add_sharp),
        ),
      ),
      body: InkWell(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Licencia tomada el  INSERTAR FECHA' + ' $index'),
            );
          },
        ),
      ),
    );
  }
}
