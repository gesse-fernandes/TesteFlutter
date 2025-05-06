import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_flutter/features/tables/entities/table.entity.dart';
import 'package:teste_flutter/features/tables/stores/table.store.dart';
import 'package:teste_flutter/features/tables/stores/tables.store.dart';
import 'package:teste_flutter/features/tables/widgets/customers_counter.widget.dart';
import 'package:teste_flutter/features/tables/widgets/edit_table_modal.widget.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

class TableCard extends StatelessWidget {
  final TableEntity table;

  const TableCard({super.key, required this.table});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.fromLTRB(1, 5, 1, 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.appColors.lightGreen,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              table.identification.toUpperCase(),
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.appColors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 1),
          Card(
            elevation: 1,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () async {
                final store = TableStore(id: table.id)
                  ..setIdentification(table.identification)
                  ..setCustomerCount(table.customers.length);

                for (int i = 0; i < table.customers.length; i++) {
                  store.setCustomerAt(i, table.customers[i]);
                }

                final result = await showDialog<TableStore>(
                  context: context,
                  builder: (_) => EditTableModal(tableStore: store),
                );

                if (result != null) {
                  final tablesStore = GetIt.I<TablesStore>();
                  final index =
                      tablesStore.tables.indexWhere((t) => t.id == table.id);
                  if (index != -1) {
                    tablesStore.updateTable(
                      index,
                      TableEntity(
                        id: result.id,
                        identification: result.identification,
                        customers: result.customers.toList(),
                      ),
                    );
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: CustomersCounter(
                  label: '${table.customers.length}',
                  iconWidth: 16,
                  color: context.appColors.darkGrey,
                  textStyle: context.textTheme.bodySmall
                      ?.copyWith(color: context.appColors.darkGrey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
