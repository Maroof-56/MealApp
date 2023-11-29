// step 5 
// this file is for when click on each category then it update in to new screen thats y this folder put inside of screen

import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_detail.dart';
import 'package:meals/widgets/meal_item.dart';

//  i start Step from here after put meals data in meal.dart file

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title,required this.meals,required this.onTogglefavorites});

  final String? title;           //2        // step 26 add ? using scaffold conditionaly(remoce required)
  final List<Meal> meals;       //2
   final void Function(Meal meal) onTogglefavorites;   // step 32 make here to Passed inside selectMeal as a Paramter ohterwise throe an error
  
  void selectMeal(BuildContext context,Meal meal){               // step 24
     //Navigator.pop(context); // manually POP screen back (from metadata screen to main screen) (one toggle is from mealdeati.dart)
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealDetailScreen(meal: meal,onTogglefavorites: onTogglefavorites,),),);
  }
  @override
  Widget build(BuildContext context) {

    Widget content =   Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,    // iski wajah se center me ayega top se 
            children: [
              Text('Uh oh .... Nothing here!',
             style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
                ) ,
             ),
             const SizedBox(height: 15,),
             Text(
              'Try adding category!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground)
                ,),
            ],
          ),
        );
       

        if(meals.isNotEmpty){
          content =  ListView.builder(  
            itemCount: meals.length,           //  step 5 -> copied from step 4 and Paste here 
        itemBuilder: (ctx,index) => MealItem(
          meal:meals[index],
        //   onSelectMeal: (BuildContext context,Meal meal){   // step 25 onselect add here
        //     selectMeal(context, meal);   // it is also work as below
        // }, 
        onSelectMeal: selectMeal, // onselectMeal callback in mealitem is define to take Buildcontext and meal but in listview.builder i m Passing only meal as a Parameter and therefore i got error(fro this error i leaar that check functn what define as a Parameter & what Parameter u r Passing )
        ),  
        );
        }

       // if(meals.isNotEmpty){                // 7 chamge from is to not empty
        // content = ListView.builder(             //  step 5 -> copied from step 4 and Paste here 
        // itemCount: meals.length,          // if this is absemce error could be Invalid range
        // // itemBuilder: (ctx,index) => Text(
        // //   meals[index].title,
        // itemBuilder: (ctx,index) => MealItem(meal:meals[index] ),     // step 16 Passed here for check by remove dummy text tht i comment above 
        
        // );
        // }
     if(title == null){      // step 27 
      return content;
     }

    return Scaffold(             // ste 1
      appBar: AppBar(
        title: Text(title!),            // step 3
      ),
      body: content ,       // 6
      // ListView.builder(             // 4
      //   itemBuilder: (ctx,index) => Text(
      //     meals[index].title,
      //   )
      //   ),
    );
  }
}