// step 1 file
import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

class CategoriesScreen extends StatelessWidget{ 
  const  CategoriesScreen({super.key,required this.onTogglefavorites,required this.availableMeals});  // step 34 also accept here this

       final void Function(Meal meal) onTogglefavorites;
       final List<Meal> availableMeals;                  // step 60
  // step 8 when click on any category then it navigate into its screen that the logic here

  // void _selectCategory(){   // in stateless widget contex Property is not available globally but availabe in ful

  void _selectCategory(BuildContext context,Category category){   // sue to above  raeson i shoud add buildcontext here // step 12 added(accept) Category category for loadinf our actual data here

    //final filteredMeals= dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();         // step 13

    final filteredMeals= availableMeals.where((meal) => meal.categories.contains(category.id)).toList();    // step 61 dummymeal -> avaiabalemeals

     Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>  MealsScreen(      //Navigator.push(context, route);(rhis function is responsible for navigator icon)Push se toP most screen visible rhegi 
      // title: 'some title',                                                                        // next step in categorygriditem
      title: category.title,   //step 14 from this category will show on scrren with  data                                                                   // next step in categorygriditem
      //  meals: [],
       meals: filteredMeals,  //14
       onTogglefavorites: onTogglefavorites,  // step 35 Passed here one is from detail.dart
       ),),); 
                                       
  }

  @override
  Widget build(BuildContext context) {
    return 
    // Scaffold(   // i remove this scffold bcoz on screen appBar showing 2 title at top 
    //     appBar: AppBar( 
    //       title: const Text('Pick your Category'),
    //     ),
    //     body:
         GridView(                                    // basically grid is a box thatcnotains rows & col (here i had to show category inside gris)
        padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,           // that mens only 2 box will Present in row wise 
            childAspectRatio: 3/2,      //The aspect ratio is the ratio of the width to the height of a box.  you can control the dimensions of the grid items
            crossAxisSpacing: 15,       // horizontal spcing
            mainAxisSpacing: 15,        // vertical spacing
            ),
            children:  [
              // Text('1'),e
              // Text('1'),
            // (Alternate of below) availablecagories.map(category) => categoryGridItem(category:category).yoList()
              for(final category in availableCategories)
              CategoryGridItems(category:category,
              onselectCategory: (){                                          // step 10
                _selectCategory(context,category);      // step 15 passed categiry here after context
              },
              )
            ],
           );
    
  }
}