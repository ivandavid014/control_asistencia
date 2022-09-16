// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'DTOs/DTOart24.dart';
import 'DTOs/DTOart25.dart';
import 'DTOs/DTOart50.dart';
import 'DTOs/DTOempleado.dart';
import 'DTOs/DTOvacaciones.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 7409586550531196336),
      name: 'DtoArt24',
      lastPropertyId: const IdUid(4, 190098572063748073),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 291528617356071565),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8448941196005034871),
            name: 'datePedido',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6660204847831528884),
            name: 'pedidosAnual',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 190098572063748073),
            name: 'art24Id',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 3988384419019231781),
            relationTarget: 'Empleado')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 5905831014825989780),
      name: 'DtoArt25',
      lastPropertyId: const IdUid(4, 9044687409446002634),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5051635522149896460),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5427724976576806596),
            name: 'datePedido',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 4454710680965458981),
            name: 'pedidosAnual',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 9044687409446002634),
            name: 'art25Id',
            type: 11,
            flags: 520,
            indexId: const IdUid(2, 2092414867378435026),
            relationTarget: 'Empleado')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 5310620555191751749),
      name: 'DtoArt50',
      lastPropertyId: const IdUid(6, 3079668957617561492),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1080918534366021081),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5033419069675840297),
            name: 'datePedido',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 608195435077738018),
            name: 'art50Id',
            type: 11,
            flags: 520,
            indexId: const IdUid(3, 2344920011930617438),
            relationTarget: 'Empleado'),
        ModelProperty(
            id: const IdUid(6, 3079668957617561492),
            name: 'horas50',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 5255806543983993481),
      name: 'Empleado',
      lastPropertyId: const IdUid(15, 9050274280345654293),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6833092422330422861),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7268434895266903369),
            name: 'nombre',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1536806622511957041),
            name: 'apellido',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2553731159810463403),
            name: 'dni',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 3599495352500943890),
            name: 'condicion',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 1464455796962854332),
            name: 'codigo',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 2008628257988118664),
            name: 'movilidad',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 7512843336198774203),
            name: 'distancia',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 1886005921101587519),
            name: 'telefono',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 1928585954115601149),
            name: 'diasCorrespondientes',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 7620135591948955279),
            name: 'urlFoto',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 7306621081547300149),
            name: 'estacion',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 2580103049699837126),
            name: 'horas50',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(14, 3266025509130822677),
            name: 'dias24',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(15, 9050274280345654293),
            name: 'dias25',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(
            name: 'vacacionesList', srcEntity: 'Vacaciones', srcField: ''),
        ModelBacklink(name: 'art50List', srcEntity: 'DtoArt50', srcField: ''),
        ModelBacklink(name: 'art24List', srcEntity: 'DtoArt24', srcField: ''),
        ModelBacklink(name: 'art25List', srcEntity: 'DtoArt25', srcField: '')
      ]),
  ModelEntity(
      id: const IdUid(5, 7935692074736514441),
      name: 'Vacaciones',
      lastPropertyId: const IdUid(7, 4713456069834255061),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1350040931850665935),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 9195139973289739700),
            name: 'datesalida',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8058991771724834425),
            name: 'datevuelta',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2462916152175904749),
            name: 'diaspedidos',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8376137248209570920),
            name: 'diasrestantes',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 6264019965122768940),
            name: 'diascorrespondientes',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 4713456069834255061),
            name: 'vacacionesId',
            type: 11,
            flags: 520,
            indexId: const IdUid(4, 6650590447970007021),
            relationTarget: 'Empleado')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(5, 7935692074736514441),
      lastIndexId: const IdUid(4, 6650590447970007021),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [8765740292350075951, 5387774830009579386],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    DtoArt24: EntityDefinition<DtoArt24>(
        model: _entities[0],
        toOneRelations: (DtoArt24 object) => [object.art24],
        toManyRelations: (DtoArt24 object) => {},
        getId: (DtoArt24 object) => object.id,
        setId: (DtoArt24 object, int id) {
          object.id = id;
        },
        objectToFB: (DtoArt24 object, fb.Builder fbb) {
          final datePedidoOffset = object.datePedido == null
              ? null
              : fbb.writeString(object.datePedido!);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, datePedidoOffset);
          fbb.addInt64(2, object.pedidosAnual);
          fbb.addInt64(3, object.art24.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = DtoArt24(
              datePedido: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              pedidosAnual: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 8))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.art24.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          object.art24.attach(store);
          return object;
        }),
    DtoArt25: EntityDefinition<DtoArt25>(
        model: _entities[1],
        toOneRelations: (DtoArt25 object) => [object.art25],
        toManyRelations: (DtoArt25 object) => {},
        getId: (DtoArt25 object) => object.id,
        setId: (DtoArt25 object, int id) {
          object.id = id;
        },
        objectToFB: (DtoArt25 object, fb.Builder fbb) {
          final datePedidoOffset = object.datePedido == null
              ? null
              : fbb.writeString(object.datePedido!);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, datePedidoOffset);
          fbb.addInt64(2, object.pedidosAnual);
          fbb.addInt64(3, object.art25.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = DtoArt25(
              datePedido: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              pedidosAnual: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 8))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.art25.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          object.art25.attach(store);
          return object;
        }),
    DtoArt50: EntityDefinition<DtoArt50>(
        model: _entities[2],
        toOneRelations: (DtoArt50 object) => [object.art50],
        toManyRelations: (DtoArt50 object) => {},
        getId: (DtoArt50 object) => object.id,
        setId: (DtoArt50 object, int id) {
          object.id = id;
        },
        objectToFB: (DtoArt50 object, fb.Builder fbb) {
          final datePedidoOffset = object.datePedido == null
              ? null
              : fbb.writeString(object.datePedido!);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, datePedidoOffset);
          fbb.addInt64(3, object.art50.targetId);
          fbb.addInt64(5, object.horas50);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = DtoArt50(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              datePedido: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              horas50: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 14));
          object.art50.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          object.art50.attach(store);
          return object;
        }),
    Empleado: EntityDefinition<Empleado>(
        model: _entities[3],
        toOneRelations: (Empleado object) => [],
        toManyRelations: (Empleado object) => {
              RelInfo<Vacaciones>.toOneBacklink(7, object.id,
                      (Vacaciones srcObject) => srcObject.vacaciones):
                  object.vacacionesList,
              RelInfo<DtoArt50>.toOneBacklink(
                      4, object.id, (DtoArt50 srcObject) => srcObject.art50):
                  object.art50List,
              RelInfo<DtoArt24>.toOneBacklink(
                      4, object.id, (DtoArt24 srcObject) => srcObject.art24):
                  object.art24List,
              RelInfo<DtoArt25>.toOneBacklink(
                      4, object.id, (DtoArt25 srcObject) => srcObject.art25):
                  object.art25List
            },
        getId: (Empleado object) => object.id,
        setId: (Empleado object, int id) {
          object.id = id;
        },
        objectToFB: (Empleado object, fb.Builder fbb) {
          final nombreOffset =
              object.nombre == null ? null : fbb.writeString(object.nombre!);
          final apellidoOffset = object.apellido == null
              ? null
              : fbb.writeString(object.apellido!);
          final condicionOffset = object.condicion == null
              ? null
              : fbb.writeString(object.condicion!);
          final urlFotoOffset =
              object.urlFoto == null ? null : fbb.writeString(object.urlFoto!);
          final estacionOffset = object.estacion == null
              ? null
              : fbb.writeString(object.estacion!);
          fbb.startTable(16);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nombreOffset);
          fbb.addOffset(2, apellidoOffset);
          fbb.addInt64(3, object.dni);
          fbb.addOffset(4, condicionOffset);
          fbb.addInt64(5, object.codigo);
          fbb.addBool(6, object.movilidad);
          fbb.addBool(7, object.distancia);
          fbb.addInt64(8, object.telefono);
          fbb.addInt64(9, object.diasCorrespondientes);
          fbb.addOffset(10, urlFotoOffset);
          fbb.addOffset(11, estacionOffset);
          fbb.addInt64(12, object.horas50);
          fbb.addInt64(13, object.dias24);
          fbb.addInt64(14, object.dias25);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Empleado(
              nombre: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              apellido: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8),
              dni: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 10),
              condicion: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12),
              codigo: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 14),
              movilidad: const fb.BoolReader()
                  .vTableGetNullable(buffer, rootOffset, 16),
              distancia: const fb.BoolReader()
                  .vTableGetNullable(buffer, rootOffset, 18),
              diasCorrespondientes: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 22),
              telefono: const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 20),
              vacacionesList: ToMany(),
              art50List: ToMany(),
              art24List: ToMany(),
              art25List: ToMany(),
              urlFoto: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 24),
              estacion: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 26),
              horas50: const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 28),
              dias24: const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 30),
              dias25: const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 32))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          InternalToManyAccess.setRelInfo(
              object.vacacionesList,
              store,
              RelInfo<Vacaciones>.toOneBacklink(
                  7, object.id, (Vacaciones srcObject) => srcObject.vacaciones),
              store.box<Empleado>());
          InternalToManyAccess.setRelInfo(
              object.art50List,
              store,
              RelInfo<DtoArt50>.toOneBacklink(
                  4, object.id, (DtoArt50 srcObject) => srcObject.art50),
              store.box<Empleado>());
          InternalToManyAccess.setRelInfo(
              object.art24List,
              store,
              RelInfo<DtoArt24>.toOneBacklink(
                  4, object.id, (DtoArt24 srcObject) => srcObject.art24),
              store.box<Empleado>());
          InternalToManyAccess.setRelInfo(
              object.art25List,
              store,
              RelInfo<DtoArt25>.toOneBacklink(
                  4, object.id, (DtoArt25 srcObject) => srcObject.art25),
              store.box<Empleado>());
          return object;
        }),
    Vacaciones: EntityDefinition<Vacaciones>(
        model: _entities[4],
        toOneRelations: (Vacaciones object) => [object.vacaciones],
        toManyRelations: (Vacaciones object) => {},
        getId: (Vacaciones object) => object.id,
        setId: (Vacaciones object, int id) {
          object.id = id;
        },
        objectToFB: (Vacaciones object, fb.Builder fbb) {
          final datesalidaOffset = object.datesalida == null
              ? null
              : fbb.writeString(object.datesalida!);
          final datevueltaOffset = object.datevuelta == null
              ? null
              : fbb.writeString(object.datevuelta!);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, datesalidaOffset);
          fbb.addOffset(2, datevueltaOffset);
          fbb.addInt64(3, object.diaspedidos);
          fbb.addInt64(4, object.diasrestantes);
          fbb.addInt64(5, object.diascorrespondientes);
          fbb.addInt64(6, object.vacaciones.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Vacaciones(
              datesalida: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              datevuelta: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8),
              diaspedidos: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 10),
              diasrestantes: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 12),
              diascorrespondientes: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 14))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.vacaciones.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0);
          object.vacaciones.attach(store);
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [DtoArt24] entity fields to define ObjectBox queries.
class DtoArt24_ {
  /// see [DtoArt24.id]
  static final id = QueryIntegerProperty<DtoArt24>(_entities[0].properties[0]);

  /// see [DtoArt24.datePedido]
  static final datePedido =
      QueryStringProperty<DtoArt24>(_entities[0].properties[1]);

  /// see [DtoArt24.pedidosAnual]
  static final pedidosAnual =
      QueryIntegerProperty<DtoArt24>(_entities[0].properties[2]);

  /// see [DtoArt24.art24]
  static final art24 =
      QueryRelationToOne<DtoArt24, Empleado>(_entities[0].properties[3]);
}

/// [DtoArt25] entity fields to define ObjectBox queries.
class DtoArt25_ {
  /// see [DtoArt25.id]
  static final id = QueryIntegerProperty<DtoArt25>(_entities[1].properties[0]);

  /// see [DtoArt25.datePedido]
  static final datePedido =
      QueryStringProperty<DtoArt25>(_entities[1].properties[1]);

  /// see [DtoArt25.pedidosAnual]
  static final pedidosAnual =
      QueryIntegerProperty<DtoArt25>(_entities[1].properties[2]);

  /// see [DtoArt25.art25]
  static final art25 =
      QueryRelationToOne<DtoArt25, Empleado>(_entities[1].properties[3]);
}

/// [DtoArt50] entity fields to define ObjectBox queries.
class DtoArt50_ {
  /// see [DtoArt50.id]
  static final id = QueryIntegerProperty<DtoArt50>(_entities[2].properties[0]);

  /// see [DtoArt50.datePedido]
  static final datePedido =
      QueryStringProperty<DtoArt50>(_entities[2].properties[1]);

  /// see [DtoArt50.art50]
  static final art50 =
      QueryRelationToOne<DtoArt50, Empleado>(_entities[2].properties[2]);

  /// see [DtoArt50.horas50]
  static final horas50 =
      QueryIntegerProperty<DtoArt50>(_entities[2].properties[3]);
}

/// [Empleado] entity fields to define ObjectBox queries.
class Empleado_ {
  /// see [Empleado.id]
  static final id = QueryIntegerProperty<Empleado>(_entities[3].properties[0]);

  /// see [Empleado.nombre]
  static final nombre =
      QueryStringProperty<Empleado>(_entities[3].properties[1]);

  /// see [Empleado.apellido]
  static final apellido =
      QueryStringProperty<Empleado>(_entities[3].properties[2]);

  /// see [Empleado.dni]
  static final dni = QueryIntegerProperty<Empleado>(_entities[3].properties[3]);

  /// see [Empleado.condicion]
  static final condicion =
      QueryStringProperty<Empleado>(_entities[3].properties[4]);

  /// see [Empleado.codigo]
  static final codigo =
      QueryIntegerProperty<Empleado>(_entities[3].properties[5]);

  /// see [Empleado.movilidad]
  static final movilidad =
      QueryBooleanProperty<Empleado>(_entities[3].properties[6]);

  /// see [Empleado.distancia]
  static final distancia =
      QueryBooleanProperty<Empleado>(_entities[3].properties[7]);

  /// see [Empleado.telefono]
  static final telefono =
      QueryIntegerProperty<Empleado>(_entities[3].properties[8]);

  /// see [Empleado.diasCorrespondientes]
  static final diasCorrespondientes =
      QueryIntegerProperty<Empleado>(_entities[3].properties[9]);

  /// see [Empleado.urlFoto]
  static final urlFoto =
      QueryStringProperty<Empleado>(_entities[3].properties[10]);

  /// see [Empleado.estacion]
  static final estacion =
      QueryStringProperty<Empleado>(_entities[3].properties[11]);

  /// see [Empleado.horas50]
  static final horas50 =
      QueryIntegerProperty<Empleado>(_entities[3].properties[12]);

  /// see [Empleado.dias24]
  static final dias24 =
      QueryIntegerProperty<Empleado>(_entities[3].properties[13]);

  /// see [Empleado.dias25]
  static final dias25 =
      QueryIntegerProperty<Empleado>(_entities[3].properties[14]);
}

/// [Vacaciones] entity fields to define ObjectBox queries.
class Vacaciones_ {
  /// see [Vacaciones.id]
  static final id =
      QueryIntegerProperty<Vacaciones>(_entities[4].properties[0]);

  /// see [Vacaciones.datesalida]
  static final datesalida =
      QueryStringProperty<Vacaciones>(_entities[4].properties[1]);

  /// see [Vacaciones.datevuelta]
  static final datevuelta =
      QueryStringProperty<Vacaciones>(_entities[4].properties[2]);

  /// see [Vacaciones.diaspedidos]
  static final diaspedidos =
      QueryIntegerProperty<Vacaciones>(_entities[4].properties[3]);

  /// see [Vacaciones.diasrestantes]
  static final diasrestantes =
      QueryIntegerProperty<Vacaciones>(_entities[4].properties[4]);

  /// see [Vacaciones.diascorrespondientes]
  static final diascorrespondientes =
      QueryIntegerProperty<Vacaciones>(_entities[4].properties[5]);

  /// see [Vacaciones.vacaciones]
  static final vacaciones =
      QueryRelationToOne<Vacaciones, Empleado>(_entities[4].properties[6]);
}