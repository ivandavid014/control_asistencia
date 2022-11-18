import 'package:control_personal_municipal/DTOs/DTOempleado.dart';
import 'package:control_personal_municipal/widget/myDropdownForm.dart';
import 'package:flutter/material.dart';
import '../DTOs/DTOart24.dart';
import '../DTOs/DTOart25.dart';
import '../DTOs/DTOart50.dart';
import '../DTOs/DTOvacaciones.dart';
import '../global_consts.dart';
import '../main.dart';
import '../objectbox.g.dart';
import '../widget/mytextform.dart';

class NuevoEmpleado extends StatefulWidget {
  @override
  State<NuevoEmpleado> createState() => _NuevoEmpleadoState();
}

class _NuevoEmpleadoState extends State<NuevoEmpleado> {
  int currentStep = 0;
  bool isCompleted = false;
  final GlobalKey<FormState> _validateKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final dniController = TextEditingController();
  final condicionController = TextEditingController();
  final codigoController = TextEditingController();
  final movilidadController = TextEditingController();
  final distanciaController = TextEditingController();
  final telefonoController = TextEditingController();
  final diasCorrespondientesController = TextEditingController();
  final estacionController = TextEditingController();
  final fotoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 31, 179, 122),
        foregroundColor: Colors.grey[890],
        title: Text(
          'AÑADIR NUEVO EMPLEADO',
          style: TextStyle(
              fontSize: 20, fontStyle: FontStyle.normal, color: Colors.white),
        ),
      ),
      body: isCompleted
          ? buildCompleted()
          : Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 31, 179, 122),
                    Colors.black26,
                  ],
                ),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.dark(
                  primary: Color.fromARGB(255, 22, 137, 93),
                )),
                child: Stepper(
                  type: StepperType.horizontal,
                  steps: getSteps(),
                  currentStep: currentStep,
                  onStepContinue: onStepContinue,
                  onStepCancel: onStepCancel,
                  controlsBuilder: (context, onSteps) {
                    final isLastStep = currentStep == getSteps().length - 1;
                    return Row(
                      children: [
                        if (currentStep != 0)
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                primary: Color.fromARGB(255, 31, 179, 122),
                              ),
                              child: Text('VOLVER',
                                  style: TextStyle(
                                      fontSize: 19, color: Colors.white)),
                              onPressed: onStepCancel,
                            ),
                          ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              primary: Color.fromARGB(255, 31, 179, 122),
                            ),
                            child: Text(isLastStep ? 'FINALIZAR' : 'SIGUIENTE',
                                style: TextStyle(
                                    fontSize: 19, color: Colors.white)),
                            onPressed: onStepContinue,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text('DATOS BÁSICOS'),
          content: Form(
            key: _validateKey,
            child: Column(
              children: [
                MyTextForm(
                  keyboard: TextInputType.name,
                  controller: nombreController,
                  hint: 'NOMBRE',
                  label: 'NOMBRE',
                  icon: Icons.person_rounded,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                MyTextForm(
                  keyboard: TextInputType.name,
                  controller: apellidoController,
                  hint: 'APELLIDO',
                  label: 'APELLIDO',
                  icon: Icons.person_rounded,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                MyTextForm(
                  keyboard: TextInputType.phone,
                  controller: dniController,
                  hint: 'DNI',
                  label: 'DOCUMENTO',
                  icon: Icons.app_registration_rounded,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                MyTextForm(
                  keyboard: TextInputType.phone,
                  controller: codigoController,
                  hint: 'EJ: 84559',
                  label: 'CÓDIGO MUNICIPAL',
                  icon: Icons.list_alt_rounded,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                MyTextForm(
                  keyboard: TextInputType.phone,
                  controller: telefonoController,
                  hint: 'NÚMERO DE TELÉFONO',
                  label: 'TELÉFONO',
                  icon: Icons.phone_android_rounded,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                MyTextForm(
                  keyboard: TextInputType.phone,
                  controller: diasCorrespondientesController,
                  hint: 'CANTIDAD DE DÍAS',
                  label: 'DÍAS DE LICENCIA CORRESPONDIENTES',
                  icon: Icons.wallet_travel_rounded,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                MyDropdownForm(
                  listValues: revista,
                  firstValue: revista.first,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                MyDropdownForm(
                  listValues: viveCerca,
                  firstValue: viveCerca.first,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                MyDropdownForm(
                  listValues: tieneMovilidad,
                  firstValue: tieneMovilidad.first,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                MyDropdownForm(
                  listValues: estacion,
                  firstValue: estacion.first,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
              ],
            ),
          ),
        ),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: Text('CARGAR IMAGEN'),
            content: Container()),
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: Text('FINALIZAR'),
            content: Container()),
      ];

  void onStepContinue() {
    final isLastStep = currentStep == getSteps().length - 1;
    if (isLastStep) {
      setState(() => isCompleted = true);
      print('completado wachin');
      //crear empleado
      var nuevoEmpleado = Empleado(
        nombre: nombreController.text,
        apellido: apellidoController.text,
        dni: int.tryParse(dniController.text),
        codigo: int.tryParse(codigoController.text),
        telefono: int.tryParse(telefonoController.text),
        diasCorrespondientes: int.tryParse(diasCorrespondientesController.text),
        condicion: condicionController.text,
        distancia: distanciaController.text.toLowerCase() ==
            'Vive a más de 3 kilómetros',
        movilidad: movilidadController.text.toLowerCase() == 'Tiene movilidad',
        vacacionesList: ToMany<Vacaciones>(),
        art24List: ToMany<DtoArt24>(),
        art25List: ToMany<DtoArt25>(),
        art50List: ToMany<DtoArt50>(),
        estacion: estacionController.text,
        urlFoto: fotoController.text,
      );

      //agregar a  la lista
      empleados.add(nuevoEmpleado);

      guardarDatos(empleados);

      // aca hay que insertar el nuevo empleado en la DB
    } else if (_validateKey.currentState!.validate()) {
      setState(() => currentStep += 1);
    }
  }

  onStepCancel() {
    currentStep == 0
        // ignore: unnecessary_statements
        ? null
        : () {
            currentStep -= 1;
            setState(() {});
          }.call();
  }

  buildCompleted() {
    _showsnackbar();

    return Scaffold();
  }

  void _showsnackbar() async {
    await Future.delayed(Duration(seconds: 1));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Color.fromARGB(255, 107, 107, 107),
        duration: Duration(seconds: 1),
        content: Center(
          child: Icon(
            Icons.check,
            color: Color.fromARGB(255, 31, 179, 122),
            size: 150,
          ),
        ),
      ),
    );
  }
}
