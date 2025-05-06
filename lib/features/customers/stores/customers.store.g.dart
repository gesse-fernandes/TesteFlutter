// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomersStore on _CustomersStoreBase, Store {
  late final _$customersAtom =
      Atom(name: '_CustomersStoreBase.customers', context: context);

  @override
  ObservableList<CustomerEntity> get customers {
    _$customersAtom.reportRead();
    return super.customers;
  }

  @override
  set customers(ObservableList<CustomerEntity> value) {
    _$customersAtom.reportWrite(value, super.customers, () {
      super.customers = value;
    });
  }

  late final _$_CustomersStoreBaseActionController =
      ActionController(name: '_CustomersStoreBase', context: context);

  @override
  void addCustomer(CustomerEntity customer) {
    final _$actionInfo = _$_CustomersStoreBaseActionController.startAction(
        name: '_CustomersStoreBase.addCustomer');
    try {
      return super.addCustomer(customer);
    } finally {
      _$_CustomersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCustomer(CustomerEntity customer) {
    final _$actionInfo = _$_CustomersStoreBaseActionController.startAction(
        name: '_CustomersStoreBase.removeCustomer');
    try {
      return super.removeCustomer(customer);
    } finally {
      _$_CustomersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCustomer(CustomerEntity customer) {
    final _$actionInfo = _$_CustomersStoreBaseActionController.startAction(
        name: '_CustomersStoreBase.updateCustomer');
    try {
      return super.updateCustomer(customer);
    } finally {
      _$_CustomersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
customers: ${customers}
    ''';
  }
}
