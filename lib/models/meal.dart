// step 6 
// make this file for structure of MealsScreen file 


enum Complexity{
  simple,
  challenging,
  hard,
}
enum Affordability{
  affordable,
  pricey,
  luxurious,
}

class Meal{

  const Meal(
    {
      required this.id,
      required this.categories,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.ingredients,
      required this.steps,
      required this.complexity,
      required this.affordability,
      required this.isGluentFree,
      required this.isLactoseFree,
      required this.isVegan,
      required this.isVegetarian,



    }
  );
    

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final int duration;
  final  List<String> ingredients;
  final List<String> steps;
  final Complexity complexity;
  final Affordability affordability;
  final bool  isGluentFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

}