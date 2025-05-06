import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_flutter/features/tables/stores/tables.store.dart';
import 'package:teste_flutter/features/tables/stores/table.store.dart';
import 'package:teste_flutter/features/tables/widgets/edit_table_modal.widget.dart';
import 'package:teste_flutter/features/tables/widgets/customers_counter.widget.dart';
import 'package:teste_flutter/shared/widgets/search_input.widget.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';
import 'package:teste_flutter/features/tables/entities/table.entity.dart';

class TablesHeader extends StatelessWidget {
  const TablesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final tablesStore = GetIt.I<TablesStore>();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Text(
              'Mesas',
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(width: 20),
            SearchInput(
              placeholder: 'Buscar',
              onChanged: (value) => tablesStore.searchTerm = value ?? '',
            ),
            const SizedBox(width: 20),
            Observer(
              builder: (_) => CustomersCounter(
                label: '${tablesStore.totalCustomers}',
              ),
            ),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: () async {
                final store =
                    TableStore(id: DateTime.now().millisecondsSinceEpoch);

                final result = await showDialog<TableStore>(
                  context: context,
                  builder: (_) => EditTableModal(tableStore: store),
                );

                if (result != null) {
                  tablesStore.addTable(
                    TableEntity(
                      id: result.id,
                      identification: result.identification,
                      customers: result.customers.toList(),
                    ),
                  );
                }
              },
              tooltip: 'Criar nova mesa',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
