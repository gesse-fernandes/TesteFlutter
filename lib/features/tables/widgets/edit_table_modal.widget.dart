import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_flutter/features/customers/entities/customer.entity.dart';
import 'package:teste_flutter/features/customers/stores/customers.store.dart';
import 'package:teste_flutter/features/customers/widgets/edit_customer_modal.widget.dart';
import 'package:teste_flutter/features/tables/stores/table.store.dart';
import 'package:teste_flutter/shared/widgets/modal.widget.dart';
import 'package:teste_flutter/shared/widgets/primary_button.widget.dart';
import 'package:teste_flutter/shared/widgets/secondary_button.widget.dart';
import 'package:teste_flutter/shared/widgets/search_input.widget.dart';

class EditTableModal extends StatefulWidget {
  final TableStore tableStore;

  const EditTableModal({super.key, required this.tableStore});

  @override
  State<EditTableModal> createState() => _EditTableModalState();
}

class _EditTableModalState extends State<EditTableModal> {
  final customersStore = GetIt.I<CustomersStore>();
  String searchQuery = '';

  void openCustomerDropdown(int index) async {
    final selected = await showDialog<CustomerEntity>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Selecionar cliente'),
        content: SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SearchInput(
                placeholder: 'Pesquise por nome ou telefone',
                onChanged: (value) => setState(() => searchQuery = value ?? ''),
              ),
              const SizedBox(height: 10),
              ...customersStore.customers
                  .where((c) =>
                      c.name
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase()) ||
                      c.phone.contains(searchQuery))
                  .map((c) => ListTile(
                        title: Text(c.name),
                        subtitle: Text(c.phone),
                        onTap: () => Navigator.pop(context, c),
                      )),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.person_add),
                title: const Text('Novo cliente'),
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (_) => const EditCustomerModal(),
                  );
                  Navigator.pop(context);
                  openCustomerDropdown(index); // reabre após novo cadastro
                },
              ),
            ],
          ),
        ),
      ),
    );

    if (selected != null) {
      widget.tableStore.setCustomerAt(index, selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Modal(
      width: 360,
      title: 'Editar informações da Mesa',
      content: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  initialValue: widget.tableStore.identification,
                  onChanged: widget.tableStore.setIdentification,
                  decoration: const InputDecoration(
                    labelText: 'Identificação da mesa',
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Informação temporária para ajudar na identificação do cliente.',
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
                const SizedBox(height: 20),

                // Título da seção
                const Text(
                  'Clientes nesta conta',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Associe os clientes aos pedidos para salvar o pedido no histórico\n'
                  'do cliente, pontuar no fidelidade e fazer pagamentos no fiado.',
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                ),
                const SizedBox(height: 10),

                // Contador de pessoas
                Observer(
                  builder: (_) => Row(
                    children: [
                      const Text('Quantidade de pessoas:'),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => widget.tableStore.setCustomerCount(
                            widget.tableStore.customerCount - 1),
                      ),
                      Text('${widget.tableStore.customerCount}'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => widget.tableStore.setCustomerCount(
                            widget.tableStore.customerCount + 1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Lista de clientes
                Observer(
                  builder: (_) => Column(
                    children:
                        List.generate(widget.tableStore.customerCount, (index) {
                      final customer = widget.tableStore.customers[index];
                      return Card(
                        elevation: 1,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: const Icon(Icons.person),
                          title: Text(
                            customer.name.isEmpty
                                ? 'Cliente ${index + 1}'
                                : customer.name,
                          ),
                          subtitle: Text(
                            customer.phone.isEmpty ||
                                    customer.phone == 'Não informado'
                                ? 'Não informado'
                                : customer.phone,
                          ),
                          trailing: const Icon(Icons.search),
                          onTap: () => openCustomerDropdown(index),
                        ),
                      );
                    }),
                  ),
                ),

                const SizedBox(height: 10),

                // Campo de busca (simulado apenas para UX visual aqui)
                SearchInput(
                  placeholder: 'Pesquise por nome ou telefone',
                  onChanged: (value) {
                    setState(() => searchQuery = value ?? '');
                  },
                ),
              ],
            ),
          ),
        ),
      ],
      actions: [
        SecondaryButton(
          onPressed: () => Navigator.pop(context),
          text: 'Voltar',
        ),
        PrimaryButton(
          onPressed: () => Navigator.pop(context, widget.tableStore),
          text: 'Salvar',
        ),
      ],
    );
  }
}
