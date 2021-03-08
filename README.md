# MiloTranslations

### Tecnologias Usadas

Esta aplicação mobile possui as seguintes tecnologias:
* Flutter (1.22.6)
* Arquitetura orientada a pacotes
* Getx Pattern
* Getx (Injeção de Dependência, Gerenciamento de Rotas e Gerenciamento de Estado)
* Get Storage (Persistência de Dados)
* DIO

### Contexto

Um empresário bem sucedido de pseudônimo Remo Milo traduziu seu software para várias línguas ao atender seus inúmeros clientes internacionais. O senhor Milo viaja constantemente e gostaria de verificar se as traduções de porções do seu software estão corretas, usando seu smartphone durante as viagens.
Para ajudar o senhor Milo, 
Aplicações testadas são vistas com bons olhos pelo senhor Milo.
Você vai perceber que esse endpoint não é otimizado para leitura geral e provavelmente vai querer fazer um cache dos dados no estado local da aplicação.

### Tarefas

Crie uma pequena aplicação que exiba uma lista dos recursos de tradução (i18n) já disponíveis em http://portal.greenmilesoftware.com/get_resources_since.

Para cada elemento:

[ X ] Exiba seu resource_id, seu updated_at e seu value. 
[ X ] Opções de filtrar a lista por language_id e também por module_id.
[ X ] Campo de busca um terceiro filtro que se aplicaria ao value dos recursos de tradução, como busca textual do tipo "contém".
[ X ] Belo design da aplicação e a usabilidade. Sabemos que o senhor Milo gosta de verde e se preocupa com o meio ambiente.
[ X ] Scroll contínuo na lista
[ X ] Procure pensar no comportamento offline
[ X ] Feedback ao senhor Milo enquanto o software estiver processando alguma ação ou atualizando seus dados.

### Installation

1. Caso não tenha o flutter instalado, [clique aqui](https://flutter.dev/docs/get-started/install/) e leia sua documentação.
2. Instale o Flutter 1.22.6
3. Faça o clone do projeto e vá para a pasta raiz.
4. Execute o comando ```flutter pub get``` para baixar as dependências.
5. Execute o comando ```flutter run```.
