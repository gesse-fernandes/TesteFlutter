import 'package:mobx/mobx.dart';
import 'package:teste_flutter/features/customers/entities/customer.entity.dart';

part 'table.store.g.dart';

class TableStore = _TableStoreBase with _$TableStore;

abstract class _TableStoreBase with Store {
  _TableStoreBase({required this.id});

  final int id;

  @observable
  String identification = '';

  @observable
  ObservableList<CustomerEntity> customers = ObservableList<CustomerEntity>();

  @computed
  int get customerCount => customers.length;

  @action
  void setIdentification(String value) {
    identification = value;
  }

  @action
  void setCustomerCount(int count) {
    if (count < 0) return;
    while (customers.length < count) {
      customers.add(const CustomerEntity.empty('Cliente'));
    }
    while (customers.length > count) {
      customers.removeLast();
    }
  }

  @action
  void setCustomerAt(int index, CustomerEntity customer) {
    if (index < customers.length) {
      customers[index] = customer;
    }
  }
}
