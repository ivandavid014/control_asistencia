import 'package:control_personal_municipal/database.dart';
import 'package:control_personal_municipal/empleadoDTO.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'empleado_page.dart';

/*Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}*/
void main() => runApp(MyApp());

List<Empleado> empleados =
    empleadosEjemplo.map((dynamic item) => Empleado.fromJson(item)).toList();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [const Locale('es')],
      title: 'Control de Personal',
      home: HomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(34, 140, 255, 0.7),
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[600],
        fontFamily: 'Hind',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const historyLength = 5;

  List<String> _searchHistory = [
    'Croppi Santiago',
    'Canteros Jorge',
    'Segovia',
    'Mehaudy Iván',
  ];

  List<String> filteredSearchHistory = [];

  String selectedTerm = '';

  List<String> filterSearchTerms({
    String filter = 'ej. Gorria, Maira',
  }) {
    if (filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }

    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filterSearchTerms(filter: '');
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: '');
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  late FloatingSearchBarController controller;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: '');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.yellow),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp()));
          },
          child: const Icon(Icons.navigation),
        ),
      ),
      body: homelist(context),
    );
  }

  FloatingSearchBar homelist(BuildContext context) {
    return FloatingSearchBar(
      controller: controller,
      body: FloatingSearchBarScrollNotifier(
        child: SearchResultsListView(
          searchTerm: selectedTerm,
        ),
      ),
      transition: CircularFloatingSearchBarTransition(),
      physics: BouncingScrollPhysics(),
      title: Text(
        "Ingrese nombre o código del personal",
        style: Theme.of(context).textTheme.headline6,
      ),
      hint: 'ej. Gorria Maira // 15896',
      actions: [
        FloatingSearchBarAction.searchToClear(),
      ],
      onQueryChanged: (query) {
        //  setState(() {
        //   filteredSearchHistory = filterSearchTerms(filter: query);
        // });
      },
      onSubmitted: (query) {
        setState(() {
          addSearchTerm(query);
          selectedTerm = query;
        });
        controller.close();
      },
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Material(
            color: Colors.white,
            elevation: 10,
            child: Builder(
              builder: (context) {
                if (filteredSearchHistory.isEmpty && controller.query.isEmpty) {
                  return Container();
                } else if (filteredSearchHistory.isEmpty) {
                  return ListTile(
                    title: Text(controller.query),
                    leading: const Icon(Icons.search),
                    onTap: () {
                      setState(() {
                        addSearchTerm(controller.query);
                        selectedTerm = controller.query;
                      });
                      controller.close();
                    },
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: filteredSearchHistory
                        .map(
                          (term) => ListTile(
                            title: Text(
                              term,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            leading: const Icon(Icons.history),
                            trailing: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  deleteSearchTerm(term);
                                });
                              },
                            ),
                            onTap: () {
                              setState(() {
                                putSearchTermFirst(term);
                                selectedTerm = term;
                              });
                              controller.close();
                            },
                          ),
                        )
                        .toList(),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}

class SearchResultsListView extends StatelessWidget {
  final String? searchTerm;

  const SearchResultsListView({
    Key? key,
    @required this.searchTerm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (searchTerm == "") {
      return Container(
        color: Theme.of(context).colorScheme.secondary,
        margin: EdgeInsets.all(5),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/SantaFeCapitallogo.png',
                scale: 0.4,
              ),
              Text(
                'CONTROL DE PERSONAL ',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      );
    }

    // se utilizará más adelante para darle lógica a la búsqueda
    // final fsb = FloatingSearchBar.of(context);
    List<Empleado> aux = empleados
        .where((element) =>
            (element.apellido! + ' ' + element.nombre!)
                .toLowerCase()
                .contains(searchTerm!.toLowerCase()) ||
            element.codigo
                .toString()
                .toLowerCase()
                .contains(searchTerm!.toLowerCase()))
        .toList();
    return Container(
      margin: EdgeInsets.fromLTRB(5, 80, 5, 0),
      child: ListView.builder(
        itemCount: aux.length,
        itemBuilder: (context, index) {
          return armarLista(index, aux, context);
        },
      ),
    );
  }

  Widget armarLista(int index, List<Empleado> empleados, BuildContext context) {
    return Container(
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue.shade600, width: 1),
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment(0.4, 0.9),
            colors: <Color>[
              Color(0x9dc1fa),
              Colors.blueAccent,
            ],
            stops: <double>[0.1, 1],
          ),
        ),
        child: InkWell(
            //highlightColor: Colors.red.shade200,
            splashColor: Colors.yellow,
            borderRadius: BorderRadius.circular(25),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EmpleadoPage(empleados.first)),
              );
            },
            child: Container(
              padding: EdgeInsets.all(28.0),
              child: Text(
                empleados[index].codigo.toString() +
                    ' - ' +
                    empleados[index].apellido! +
                    ', ' +
                    empleados[index].nombre!,
                style: TextStyle(
                    fontSize: 23,
                    fontStyle: FontStyle.normal,
                    color: Colors.black),
                maxLines: 1,
              ),
            )),
      ),
    );
  }
}
