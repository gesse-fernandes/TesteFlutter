// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TableStore on _TableStoreBase, Store {
  Computed<int>? _$customerCountComputed;

  @override
  int get customerCount =>
      (_$customerCountComputed ??= Computed<int>(() => super.customerCount,
              name: '_TableStoreBase.customerCount'))
          .value;

  late final _$identificationAtom =
      Atom(name: '_TableStoreBase.identification', context: context);

  @override
  String get identification {
    _$identificationAtom.reportRead();
    return super.identification;
  }

  @override
  set identification(String value) {
    _$identificationAtom.reportWrite(value, super.identification, () {
      super.identification = value;
    });
  }

  late final _$customersAtom =
      Atom(name: '_TableStoreBase.customers', context: context);

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

  late final _$_TableStoreBaseActionController =
      ActionController(name: '_TableStoreBase', context: context);

  @override
  void setIdentification(String value) {
    final _$actionInfo = _$_TableStoreBaseActionController.startAction(
        name: '_TableStoreBase.setIdentification');
    try {
      return super.setIdentification(value);
    } finally {
      _$_TableStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCustomerCount(int count) {
    final _$actionInfo = _$_TableStoreBaseActionController.startAction(
        name: '_TableStoreBase.setCustomerCount');
    try {
      return super.setCustomerCount(count);
    } finally {
      _$_TableStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCustomerAt(int index, CustomerEntity customer) {
    final _$actionInfo = _$_TableStoreBaseActionController.startAction(
        name: '_TableStoreBase.setCustomerAt');
    try {
      return super.setCustomerAt(index, customer);
    } finally {
      _$_TableStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
identification: ${identification},
customers: ${customers},
customerCount: ${customerCount}
    ''';
  }
}
