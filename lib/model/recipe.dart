import 'ingredient.dart';

class Recipe {
  String label;
  String imageUrl;
  int servings;
  List<Ingredient> ingredients;
  String directions;

  static final lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sapien urna, feugiat a augue vel, faucibus fermentum elit. Etiam feugiat lobortis metus ut luctus. Maecenas sed suscipit nunc. Morbi ultrices, turpis eget accumsan porta, mauris arcu molestie urna, ut eleifend eros ante a justo. Sed convallis quam vel nisi pellentesque, ut cursus nisl interdum. Vivamus ac condimentum enim. Aliquam feugiat, erat vel cursus lacinia, dolor lorem ullamcorper quam, sed pellentesque nunc sem a arcu. Sed nec bibendum tortor.';

  Recipe(this.label, this.imageUrl, this.ingredients, {this.directions});

  static var samples = [
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
    Recipe(
      'Tomato Soup',
      'assets/images/tomato-soap.jpg',
      [
        Ingredient(1, 'can', 'Tomato Soup'),
      ],
        directions: lorem
    ),
    Recipe(
      'Chocolate Chip Cookies',
      'assets/images/chocolate-chip-cookies.jpg',
      [
        Ingredient(4, 'cups', 'flour'),
        Ingredient(2, 'cups', 'sugar'),
        Ingredient(0.5, 'cups', 'chocolate chips'),
      ],
        directions: lorem
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
        directions: lorem
    ),
    Recipe(
      'Hawaiian Pizza',
      'assets/images/hawaiian-pizza.jpg',
      [
        Ingredient(1, 'item', 'pizza'),
        Ingredient(1, 'cup', 'pineapple'),
        Ingredient(8, 'oz', 'ham'),
      ],
        directions: lorem
    ),
  ];
}
