# FavFood App

App de receitas favoritas.

## Vamos começar

### Step 0 - Novo Projeto
Como de costume, crie um novo projeto em sua IDE favorira ou no [DartPad](https://dartpad.dev/flutter?null_safety=true)

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
4. No arquivo `ingredient.dart`, adicione o trecho abaixo:
```dart
class Ingredient {
  double quantity;
  String measure;
  String name;

  Ingredient(this.quantity, this.measure, this.name);
}
```

### Step 05 - Ajustar o Widget com os dados dos Models
1. No arquivo `recipe_card_widget.dart`, adicione o atributo `recipe` e o construtor de classe que o receba como argumento nomeado.
```dart
  final Recipe recipe;

  const RecipeCardWidget({this.recipe});
``` 
2. Altere o conteúdo dos Widgets relativos à imagem da receita e o título com base no objeto recebido pelo construtor.
```
...
image: AssetImage(recipe.imageUrl),

...
Text(recipe.label, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
```
3. A classe deverá estar assim:
```dart
import 'package:ddm2_my_favorite_recipes/model/recipe.dart';
import 'package:flutter/material.dart';

class RecipeCardWidget extends StatelessWidget {

  final Recipe recipe;

  const RecipeCardWidget({this.recipe});

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
              image: AssetImage(recipe.imageUrl),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(recipe.label,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
```
### Step 06 - Assets de Imagem
Agora iremos adicionar as imagens ao projeto; podemos utilizar imagens locais ou imagens da web.
1. Abra o arquivo `pubspec.yaml` e adicione o trecho relativo aos `assets`.
```yaml
flutter:
  uses-material-design: true

  assets:
    - assets/images/
```
2. Este é o o arquivo na integra.
```yaml
name: ddm2_my_favorite_recipes
description: A new Flutter application.

version: 1.0.0+1

environment:
  sdk: ">=2.7.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter

flutter:
  uses-material-design: true

  assets:
    - assets/images/

```
3. Crie o diretório `assets/images` na raiz do progeto.
4. Salve o projeto e execute o comando `flutter pub get` no *terminal*.
5. Adicione as fotografias de suas receitas no projeto, dentro da pasta `assets/images`.
6. Modifique os nomes das imagens no arquivo `model/recipe.dart`, conforme as imagens escolhidas.
```dart
Recipe(
      'Spaghetti and Meatballs',
      'assets/images/nome_da_imagem.jpg',
      [
        Ingredient(1, 'pacote', 'Spaghetti'),
        Ingredient(4, '', 'Almondegas'),
        Ingredient(0.5, 'lata', 'molho de tomate ao sugo'),
      ],
    ),
```

### Step 07 - Atualizar a Home
Atualize a `HomePage` para que seja utilizado o nosso `RecipecardWidget`, com o código já desacoplado e mais bem estruturado.

```dart
import 'package:ddm2_my_favorite_recipes/model/recipe.dart';
import 'package:ddm2_my_favorite_recipes/pages/home_page/widgets/recipe_card_widget.dart';
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
          child: ListView.builder(
            itemCount: Recipe.samples.length,
            itemBuilder: (context, int index) {
              var recipe = Recipe.samples[index];
              return RecipeCardWidget(recipe: recipe,);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.favorite),
        ),
      ),
    );
  }
}
```
### Step 08 - Navegação
O Flutter permite a navegação entre telas de forma simples utilizando o conceito de pilha, ou seja as telas são empilhadas umas sobre as outras e este processo é bem simples no Flutter.

1. Crie a página `RecipeDetailPage`, esta irá exibir os demais dados do model `Recipe`, primeiro crie a pasta `page/detail_page` depois o arquivo `recipe_detail_page.dart`.
2. Adicione o trecho abaixo:
```dart
import 'package:flutter/material.dart';

class RecipeDetailPage extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailPage({Key key, this.recipe}) : super(key: key);

  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.recipe.label,
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: widget.recipe.ingredients.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ingredient = widget.recipe.ingredients[index];
                    return Text('${ingredient.quantity} ${ingredient.measure}');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

```
#### Realize a navegação
1. Envolva o `RecipeCardWidget`, na `HomePage`com um `GestureDetector`, este Widget irá fornecer a capacidade de reagir à eventos de toque, o nosso Card. O `MaterialPageRoute` se encarrega do trabalho entre as transições de telas.
```
...
  return GestureDetector(
    child: RecipeCardWidget(
      recipe: recipe,
    ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeDetailPage(
            recipe: recipe,
          ),
        ),
      );
    },
  );
...
```
#### Adicionando o modo de preparo

Vamos adicionar o modo de preparo das receitas.

1. Atualizar a model class `Recipe`; adicione o atributo directions e a variavel estatica lorem, o lorem ira apenas mockar o odo de preparo em nosso model.
```dart
String directions;

static final lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sapien urna, feugiat a augue vel, faucibus fermentum elit. Etiam feugiat lobortis metus ut luctus. Maecenas sed suscipit nunc. Morbi ultrices, turpis eget accumsan porta, mauris arcu molestie urna, ut eleifend eros ante a justo. Sed convallis quam vel nisi pellentesque, ut cursus nisl interdum. Vivamus ac condimentum enim. Aliquam feugiat, erat vel cursus lacinia, dolor lorem ullamcorper quam, sed pellentesque nunc sem a arcu. Sed nec bibendum tortor.';
```
2. Atualize o contrutor de classe com um atributo opcional, o directions:
```dart
Recipe(this.label, this.imageUrl, this.ingredients, {this.directions});
```
3. Em cada objeto da lista de receitas, `samples`, adicione o atributo directions conforme o exemplo abaixo:
```dart
Recipe(
  'Spaghetti and Meatballs',
  'assets/images/spageutti-meatballs.jpg',
  [
    Ingredient(1, 'box', 'Spaghetti'),
    Ingredient(4, '', 'Frozen Meatballs'),
    Ingredient(0.5, 'jar', 'sauce'),
  ],
  directions: lorem
),
```

#### Atualizando a HomePage

```dart
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.lightGreenAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My FavFood'),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              itemCount: Recipe.samples.length,
              itemBuilder: (context, int index) {
                var recipe = Recipe.samples[index];
                return GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: RecipeCardWidget(
                      recipe: recipe,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailPage(
                          recipe: recipe,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: Icon(Icons.favorite),
        ),
      ),
    );
  }
}
```

#### Atualizando a DetailPage
1. Adicione a dependencia do GoogleFonts; inclua-a no `pubspec.yaml`, apenas a linha do google..
```dart
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2
  google_fonts: ^2.0.0
```
```dart
class RecipeDetailPage extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailPage({Key key, this.recipe}) : super(key: key);

  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.recipe.label,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Modo de Preparo',
                style: GoogleFonts.oswald(
                  color: Colors.indigo,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                widget.recipe.directions,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Text(
              'Ingredients',
              style: GoogleFonts.oswald(
                color: Colors.indigo,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  return Text(
                    '${ingredient.quantity} ${ingredient.measure}',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

# To be continue...
Na continuação, irei detalhar os passos até aqui, mas voce podem conferir as explicações no video da aula até eu detalhar os passos netes tutorial.
Até a próxima aula!




