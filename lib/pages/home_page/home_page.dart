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
