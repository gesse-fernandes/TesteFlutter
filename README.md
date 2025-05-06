# Teste gestão de mesas (Flutter)

Este projeto é um teste para desenvolvedores Flutter, criado para avaliar habilidades em gerenciamento de estado, implementação de UI e reutilização de componentes. O objetivo é criar um sistema para gerenciar mesas de restaurante, onde cada mesa pode ter múltiplos clientes vinculados.

## Visão Geral do Projeto

A aplicação consiste em uma lista de mesas de um restaurante. Cada mesa (`TableEntity`) possui os seguintes atributos:

- **id**: Um identificador único para a mesa (número inteiro).
- **identification**: Uma string usada para identificar a mesa.
- **customers**: Uma lista de clientes (`CustomerEntity`) associados à mesa.

### Requisitos

O candidato deve implementar as seguintes funcionalidades:

1. **Gerenciamento de Estado com MobX**:
   - Criar uma store do MobX para gerenciar o estado das mesas (criar/editar).
   - Cada mesa deve ter sua própria store MobX independente, com suas propriedades (`identification` e `customers`) sendo observáveis.

2. **Gerenciamento de Mesas**:
   - Renderizar a lista de mesas usando a store do MobX.
   - Permitir que os usuários adicionem novas mesas ou editem mesas existentes através de um modal.

3. **Implementação do Modal**:
   - Implementar um modal para criar e editar mesas, baseado no design fornecido (conforme design Figma, ver Notas).
   - O campo `identification` deve ser editável.
   - O campo `Quantidade de pessoas` deve ser somente leitura e deve ser atualizado utilizando os botões `+/-`, com um valor mínimo de 0.

4. **Gerenciamento de Clientes**:
   - Exibir uma lista de clientes vinculados a cada mesa. Se uma vaga de cliente não estiver preenchida, deve exibir um placeholder no formato `Cliente {index+1}` para o nome e `Não informado` para o número de telefone.
   - Ao clicar em um cliente não atribuído, deve abrir um dropdown permitindo que o usuário selecione um cliente existente da `CustomersStore` ou adicione um novo.
   - O modal para adicionar/editar clientes já está implementado e pode ser reutilizado.

5. **Reutilização de Componentes**:
   - Reutilizar os componentes existentes fornecidos no projeto para implementar as funcionalidades acima.

### Versão do Flutter e Dart

- **Flutter**: versão 3.16.4 no canal stable
- **Dart**: versão 3.2.3
- **DevTools**: versão 2.28.4

### Como Executar o Projeto

1. Clone o repositório.
2. Execute `flutter pub get` para instalar as dependências.
3. Use `flutter run` para iniciar a aplicação.

### Build para Windows

Este projeto está configurado para ser buildado para a plataforma Windows. Certifique-se de que todas as dependências específicas do Windows estejam corretamente instaladas e configuradas antes de realizar o build.

### Entrega do Projeto

Para a entrega, o candidato deve realizar um fork do repositório original, realizar todas as implementações necessárias, e depois enviar o link do repositório público. Não é necessário enviar nenhum build ou outros arquivos além do código-fonte no repositório.

### Notas

- [https://www.figma.com/design/CUAX5R7iffWvB35mCCQ6hl/Teste-flutter---alloy?node-id=0-1&t=tBoKfYXv1RFNR8QM-1](Link para design no Figma)
- Os componentes de UI para o modal e gerenciamento de clientes já estão fornecidos e podem ser reutilizados na implementação.
- O candidato deve focar na implementação do gerenciamento de estado e garantir que todas as mesas e clientes sejam corretamente gerenciados dentro de suas respectivas stores.

### Critérios de Avaliação

- Implementação correta do gerenciamento de estado com MobX.
- Tratamento adequado da lógica de vinculação de clientes e placeholders.
- Adesão da UI ao design fornecido.
- Código limpo, sustentável e reutilizável.
