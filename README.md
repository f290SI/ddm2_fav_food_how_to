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
Widget builRecipeCard() {
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
            child: Text('Título da Receita'),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
```
### Step 03 - Criar Widgets customizados e estruturas melhor os diretórios.
1. Dentro do diretório `home_page`, crie o diretório `widgets`.
2. Dentro do diretório `widgtes`, crie o arquivo `recipe_card_widget.dart`.
3. No arquivo arquivo `recipe_card_widget.dart` inclua o código abaixo. Este código irá substituir o método que estavamos utilizando que criava um card; a partir de agora ele será um *componente* de nossa aplicação, podendo ser reutilizável e agora está desacoplado e organizado em uma árvore de diretórios.
```dart
import 'package:flutter/material.dart';

class RecipeCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              image: AssetImage('imageUrl'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'text',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
```
### Step 04 - Models
Agora iremos criar as classes responsáveis por manter os dados das receitas de nosso App. Para tal, vamos criar a classe Recipe para gerir as receitas.
A classe criada irá representar uma fonte de dados `DataSource` para preencher os dados das receitas na nossa interface gráfica. Voce pode colocar os dados da sua receita favorita!

1. Crie a pasta `model`;
2. na pasta `model`, crie os arquivos `recipe.dart` e `ingredient.dart`;
3. No arquivo `recipe.dart`, adicione o trecho abaixo:
```dart
class Recipe {
  String label;
  String imageUrl;
  int servings;
  List<Ingredient> ingredients;

  Recipe(this.label, this.imageUrl, this.ingredients);

  static var samples = [
    Recipe(
      'Spaghetti and Meatballs',
      'assets/images/spageutti-meatballs.jpg',
      [
        Ingredient(1, 'box', 'Spaghetti'),
        Ingredient(4, '', 'Frozen Meatballs'),
        Ingredient(0.5, 'jar', 'sauce'),
      ],
    ),
    Recipe(
      'Tomato Soup',
      'assets/images/tomato-soap.jpg',
      [
        Ingredient(1, 'can', 'Tomato Soup'),
      ],
    ),
    // Recipe('Grilled Cheese', 'assets/grilled-cheese.jpg'),
    Recipe(
      'Chocolate Chip Cookies',
      'assets/images/chocolate-chip-cookies.jpg',
      [
        Ingredient(4, 'cups', 'flour'),
        Ingredient(2, 'cups', 'sugar'),
        Ingredient(0.5, 'cups', 'chocolate chips'),
      ],
    ),
    Recipe(
      'Taco Salad',
      'assets/images/taco-salad.jpg',
      [
        Ingredient(4, 'oz', 'nachos'),
        Ingredient(3, 'oz', 'taco meat'),
        Ingredient(0.5, 'cup', 'cheese'),
        Ingredient(0.25, 'cup', 'chopped tomatoes'),
      ],
    ),
    Recipe(
      'Hawaiian Pizza',
      'assets/images/hawaiian-pizza.jpg',
      [
        Ingredient(1, 'item', 'pizza'),
        Ingredient(1, 'cup', 'pineapple'),
        Ingredient(8, 'oz', 'ham'),
      ],
    ),
  ];
}
```
4. 3. No arquivo `ingredient.dart`, adicione o trecho abaixo:
```dart
class Ingredient {
  double quantity;
  String measure;
  String name;

  Ingredient(this.quantity, this.measure, this.name);
}
```


