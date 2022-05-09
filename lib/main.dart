import 'package:control_personal_municipal/database.dart';
import 'package:control_personal_municipal/empleadoDTO.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'empleado_page.dart';

void main() => runApp(MyApp());

List<Empleado> empleados =
    empleadosEjemplo.map((dynamic item) => Empleado.fromJson(item)).toList();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control de Personal',
      home: HomePage(),
      theme: new ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(76, 192, 139, 0.8)),
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
    'Santiago Croppi',
    'Jorge Canteros',
    'Segovia',
    'Mehaudy, Iván',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /* Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  EmpleadoPage()),
          );
       */
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
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
      hint: 'ej. Gorria, Maira // 15896',
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
                  return Container(
                    height: 20,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'CONTROL DE PERSONAL MCSF',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  );
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
        margin: EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/SantaFeCapitallogo.png',
                scale: 0.4,
              ),
              Text(
                'CONTROL DE PERSONAL MCSF',
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
            element.apellido!.toLowerCase() == searchTerm!.toLowerCase() ||
            element.nombre!.toLowerCase() == searchTerm!.toLowerCase() ||
            element.codigo?.toString() == searchTerm)
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
        child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EmpleadoPage(empleados.first)),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(5, 25, 5, 0),
        alignment: Alignment.centerLeft,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green.shade600, width: 3),
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment(0.4, 0.9),
            colors: <Color>[
              Color(0xFFEEEEEE),
              Colors.greenAccent,
            ],
            stops: <double>[0.1, 1],
          ),
        ),
        padding: EdgeInsets.all(28.0),
        child: Text(
          empleados[index].codigo.toString() +
              ' - ' +
              empleados[index].apellido! +
              ', ' +
              empleados[index].nombre!,
          style: TextStyle(
              fontSize: 25, fontStyle: FontStyle.normal, color: Colors.white),
          maxLines: 1,
        ),
      ),
    ));
  }
}
