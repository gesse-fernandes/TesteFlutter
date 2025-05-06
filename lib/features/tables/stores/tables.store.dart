import 'package:mobx/mobx.dart';
import 'package:teste_flutter/features/tables/entities/table.entity.dart';

part 'tables.store.g.dart';

class TablesStore = _TablesStoreBase with _$TablesStore;

abstract class _TablesStoreBase with Store {
  @observable
  ObservableList<TableEntity> tables = ObservableList<TableEntity>();

  @observable
  String searchTerm = '';

  @computed
  List<TableEntity> get filteredTables {
    if (searchTerm.isEmpty) return tables;
    return tables
        .where((t) =>
            t.identification.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();
  }

  @action
  void addTable(TableEntity table) => tables.add(table);

  @action
  void updateTable(int index, TableEntity table) => tables[index] = table;

  @computed
  int get totalCustomers =>
      tables.fold(0, (sum, t) => sum + t.customers.length);
}
