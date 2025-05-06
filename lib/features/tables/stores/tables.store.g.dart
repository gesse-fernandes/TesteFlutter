// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TablesStore on _TablesStoreBase, Store {
  Computed<List<TableEntity>>? _$filteredTablesComputed;

  @override
  List<TableEntity> get filteredTables => (_$filteredTablesComputed ??=
          Computed<List<TableEntity>>(() => super.filteredTables,
              name: '_TablesStoreBase.filteredTables'))
      .value;
  Computed<int>? _$totalCustomersComputed;

  @override
  int get totalCustomers =>
      (_$totalCustomersComputed ??= Computed<int>(() => super.totalCustomers,
              name: '_TablesStoreBase.totalCustomers'))
          .value;

  late final _$tablesAtom =
      Atom(name: '_TablesStoreBase.tables', context: context);

  @override
  ObservableList<TableEntity> get tables {
    _$tablesAtom.reportRead();
    return super.tables;
  }

  @override
  set tables(ObservableList<TableEntity> value) {
    _$tablesAtom.reportWrite(value, super.tables, () {
      super.tables = value;
    });
  }

  late final _$searchTermAtom =
      Atom(name: '_TablesStoreBase.searchTerm', context: context);

  @override
  String get searchTerm {
    _$searchTermAtom.reportRead();
    return super.searchTerm;
  }

  @override
  set searchTerm(String value) {
    _$searchTermAtom.reportWrite(value, super.searchTerm, () {
      super.searchTerm = value;
    });
  }

  late final _$_TablesStoreBaseActionController =
      ActionController(name: '_TablesStoreBase', context: context);

  @override
  void addTable(TableEntity table) {
    final _$actionInfo = _$_TablesStoreBaseActionController.startAction(
        name: '_TablesStoreBase.addTable');
    try {
      return super.addTable(table);
    } finally {
      _$_TablesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTable(int index, TableEntity table) {
    final _$actionInfo = _$_TablesStoreBaseActionController.startAction(
        name: '_TablesStoreBase.updateTable');
    try {
      return super.updateTable(index, table);
    } finally {
      _$_TablesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tables: ${tables},
searchTerm: ${searchTerm},
filteredTables: ${filteredTables},
totalCustomers: ${totalCustomers}
    ''';
  }
}
