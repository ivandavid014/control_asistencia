import 'package:flutter/material.dart';

class NuevoEmpleado extends StatefulWidget {
  const NuevoEmpleado({Key? key}) : super(key: key);

  @override
  State<NuevoEmpleado> createState() => _NuevoEmpleadoState();
}

class _NuevoEmpleadoState extends State<NuevoEmpleado> {
  int currentStep = 0;

  final nombre = TextEditingController();
  final apellido = TextEditingController();
  final dni = TextEditingController();
  final condicion = TextEditingController();
  final codigo = TextEditingController();
  final movilidad = TextEditingController();
  final distancia = TextEditingController();
  final telefono = TextEditingController();
  final diasCorrespondientes = TextEditingController();

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
      body: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
          primary: Color.fromARGB(255, 31, 179, 122),
        )),
        child: Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;
            if (isLastStep) {
              print('completado wachin');
            } else {
              setState(() => currentStep += 1);
            }
          },
          onStepCancel:
              currentStep == 0 
              ? null 
              : () => setState(() => currentStep -= 1),
            controlsBuilder: (context, {onStepContinue, onStepCancel}) {
              return Container(
                margin: EdgeInsets.only(top:50),
                child: Row(children: [
                  Expanded(
                    child: ElevatedButton(child: Text('SIGUIENTE')
                    onPressed: onStepContinue,
                    ),
                    ),
                    const SizedBox(width:12),
                    Expanded(child: ElevatedButton(child: Text('VOLVER'),
                    onPressed: onStepCancel,
                    ),
                    ),
                  ],
                ),
              );
            },

        
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text('Datos básicos'),
          content: Column(
            children: [
              TextFormField(
                controller: nombre,
                decoration: InputDecoration(labelText: 'Nombre'),
              )
            ],
          ),
        ),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: Text('Cargar imagen'),
            content: Container()),
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: Text('Finalizar'),
            content: Container()),
      ];
}
