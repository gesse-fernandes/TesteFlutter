import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_flutter/features/tables/stores/tables.store.dart';
import 'package:teste_flutter/features/tables/widgets/table_card.widget.dart';

class TablesList extends StatelessWidget {
  const TablesList({super.key});

  @override
  Widget build(BuildContext context) {
    final tablesStore = GetIt.I<TablesStore>();

    return Container(
      padding: const EdgeInsets.all(12),
      child: Observer(
        builder: (_) => Wrap(
          spacing: 10,
          runSpacing: 10,
          children: tablesStore.filteredTables
              .map((table) => TableCard(table: table))
              .toList(),
        ),
      ),
    );
  }
}
