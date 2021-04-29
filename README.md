# FavFood App

App de receitas favoritas.

## Vamos começar

### Step 0 - Novo Projeto
Como de costume, crie um novo projeto em sua IDE favorira ou no (DartPad)[https://dartpad.dev/flutter?null_safety=true]

### Step 01 - Alterar a página principal
Criar o método principal do App, desacoplando-o do Widget da página inicial.

1. Acesse a pasta `lib` e remova todo o código existente.
2. Inclua a chamada ao método `main`;
```java
import 'package:flutter/material.dart';

void main() => runApp(HomePage());
``` 

### Step 02 - Criar a página(Widget) principal
1. Na raiz do projeto, crie o diretório `pages`.
2. No diretorio `pages`, o diretório `home_page`.
3. No diretório `home_page`, crie o arquivo `home_page.dart`.
4. Crie a página principal no arquivo `home_page.dart`.
```dart
import 'dart:ui';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.black,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My FavFood'),
        ),
        body: SafeArea(
          child: Container(
            child: Center(
              child: Text('Minha Receitas favoritas'),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.favorite),
        ),
      ),
    );
  }
}
```
5. Vamos criar um método que crie um Card para que possamos criar uma lista de Receitas na nossa HomePage. Este método fica dentro da classe `HomePage`.
```dart
Widget builRecipeCard(Recipe recipe) {
    return Card(
      elevation: 2,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image(
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              image: AssetImage('path da imagem'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Título da Receita',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
```
6. Criar Widgets customizados e estruturas melhor os diretórios.

