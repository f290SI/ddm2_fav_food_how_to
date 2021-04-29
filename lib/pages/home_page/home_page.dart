import 'dart:ui';

import 'package:ddm2_my_favorite_recipes/model/recipe.dart';
import 'package:ddm2_my_favorite_recipes/pages/detail_recipe.dart';
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
            child: ListView.builder(
              itemCount: Recipe.samples.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: builRecipeCard(Recipe.samples[index]),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RecipeDetail(
                        recipe: Recipe.samples[index],
                      );
                    }));
                  },
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.favorite),
        ),
      ),
    );
  }

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
              image: AssetImage(recipe.imageUrl),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              recipe.label,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
