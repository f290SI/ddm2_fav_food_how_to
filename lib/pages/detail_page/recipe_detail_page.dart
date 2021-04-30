import 'package:ddm2_my_favorite_recipes/model/recipe.dart';
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
