import 'package:flutter/material.dart';

import 'dto/DTOempleado.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  Empleado? empl;

  Profile(this.empl);

  @override
  Widget build(BuildContext context) {
    var empleado = empl!;
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
              onClicked: () async {}, urlFoto: empleado.urlFoto.toString()),
          const SizedBox(height: 24),
          buildDatos(empleado),
          DatosFrontales(empleado),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final String urlFoto;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.urlFoto,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Colors.yellow;

    return Center(
      child: Stack(
        children: [
          traerImagen(),
          Positioned(
            bottom: 0,
            right: 6,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget traerImagen() {
    final fotoPerfil = NetworkImage(urlFoto);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: fotoPerfil,
          fit: BoxFit.cover,
          width: 196,
          height: 196,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildEditCircle(
        all: 3,
        color: Colors.green,
        child: buildEditCircle(
          color: Colors.green.shade300,
          all: 4,
          child: Icon(Icons.edit, color: Colors.white, size: 20),
        ),
      );
}

Widget buildEditCircle({
  required Widget child,
  required double all,
  required Color color,
}) =>
    ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ),
    );

class DatosFrontales extends StatelessWidget {
  Empleado? empl;

  DatosFrontales(this.empl);
  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDivider(),
            buildButton(context, '${empl!.condicion}', 'Situación'),
            buildDivider(),
            buildButton(context, '${empl!.movilidad}', 'Movilidad propia'),
            buildDivider(),
            buildButton(context, '${empl!.telefono}', 'Teléfono'),
            buildDivider(),
          ],
        ),
      );

  Widget buildDivider() =>
      Container(height: 24, child: VerticalDivider(color: Colors.grey));

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 23),
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ),
            SizedBox(height: 2),
            Text(text,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey))
          ],
        ),
      );
}

Widget buildDatos(Empleado empleado) => Column(
      children: [
        Text(empleado.apellido! + ', ' + empleado.nombre!,
            maxLines: 2,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white)),
        Text(
            'ESTACIÓN: ' +
                empleado.estacion! +
                ' - ' +
                empleado.codigo.toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17, color: Colors.grey))
      ],
    );
