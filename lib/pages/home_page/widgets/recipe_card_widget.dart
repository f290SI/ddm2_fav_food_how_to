import 'package:ddm2_my_favorite_recipes/model/recipe.dart';
import 'package:flutter/material.dart';

class RecipeCardWidget extends StatelessWidget {

  final Recipe recipe;

  const RecipeCardWidget({this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Image(
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
            image: AssetImage(recipe.imageUrl),
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
