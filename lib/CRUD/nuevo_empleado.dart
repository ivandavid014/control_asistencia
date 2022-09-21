import 'package:control_personal_municipal/widget/mytextform.dart';
import 'package:flutter/material.dart';

class NuevoEmpleado extends StatefulWidget {
  const NuevoEmpleado({Key? key}) : super(key: key);

  @override
  State<NuevoEmpleado> createState() => _NuevoEmpleadoState();
}

class _NuevoEmpleadoState extends State<NuevoEmpleado> {
  int currentStep = 0;
  bool isCompleted = false;

  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final dniController = TextEditingController();
  final condicionController = TextEditingController();
  final codigoController = TextEditingController();
  final movilidadController = TextEditingController();
  final distanciaController = TextEditingController();
  final telefonoController = TextEditingController();
  final diasCorrespondientesController = TextEditingController();

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
                  primary: Color.fromARGB(255, 31, 179, 122),
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
                              child: Text('VOLVER'),
                              onPressed: onStepCancel,
                            ),
                          ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            child: Text(isLastStep ? 'FINALIZAR' : 'SIGUIENTE'),
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
          content: Column(
            children: [
              MyTextForm(
                controller: nombreController,
                hint: 'NOMBRE',
                label: 'NOMBRE',
              ),
              MyTextForm(
                controller: apellidoController,
                hint: 'APELLIDO',
                label: 'APELLIDO',
              ),
              MyTextForm(
                controller: dniController,
                hint: 'DNI',
                label: 'DOCUMENTO',
              ),
              MyTextForm(
                controller: condicionController,
                hint: 'SITUACIÓN',
                label: 'SITUACIÓN DE REVISTA',
              ),
              MyTextForm(
                controller: codigoController,
                hint: 'CÓDIGO',
                label: 'CÓDIGO DE EMPLEADO',
              ),
              MyTextForm(
                controller: movilidadController,
                hint: '¿TIENE MOVILIDAD PROPIA?',
                label: 'MOVILIDAD',
              ),
              MyTextForm(
                controller: distanciaController,
                hint: '¿VIVE A MÁS DE 3 KILÓMETROS?',
                label: 'DISTANCIA',
              ),
              MyTextForm(
                controller: telefonoController,
                hint: 'NÚMERO DE TELÉFONO',
                label: 'TELÉFONO',
              ),
              MyTextForm(
                controller: diasCorrespondientesController,
                hint: 'CANTIDAD DE DÍAS',
                label: 'DÍAS DE LICENCIA CORRESPONDIENTES',
              ),
            ],
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
      // aca hay que insertar el nuevo empleado en la DB
    } else {
      setState(() => currentStep += 1);
    }
  }

  onStepCancel() {
    currentStep == 0
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
          )),
    );
  }
}
