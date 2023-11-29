// step 22

import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key,required this.meal,required this.onTogglefavorites});

  final Meal meal;
  final void Function(Meal meal) onTogglefavorites; // step 31 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [           // step 29 for adding vavorite meal its logic in tabscreen
          IconButton(
            onPressed: (){
              onTogglefavorites(meal);  // step 32 Passed here
            },
             icon:const  Icon(Icons.star),),       
        ],
      ),
      body: SingleChildScrollView(   // listview has not inbuilt center Property thats y replace with this widget
        child: Column(           // replace column with listview for scrollable 
          children: [
            Image(
              image:  AssetImage(meal.imageUrl,),),
            // Image.asset('assets/images/flow.png',height: 200,width: double.infinity,),
            const SizedBox(height: 10,),
            Text('Ingredients',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(  
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            ),
            ), 
            // CachedNetworkImage(
            //           imageUrl: (meal.imageUrl),
            //           placeholder: (context, url) => const CircularProgressIndicator(),
            //           height: 200,
            //           width: double.infinity,
            //           errorWidget: (context, url, error) => const Icon(Icons.error),
            //           ),

            const SizedBox(height: 14,),
            for(final ingredients in meal.ingredients)
            Text(ingredients,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(  
            color: Theme.of(context).colorScheme.onBackground,
            ),
            ), 
            const SizedBox(height: 20,),
            Text('Steps',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(  
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(height: 14,),
            for(final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Text(step,       // warp with padding for beauty 
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(  
              color: Theme.of(context).colorScheme.onBackground,
              ),
              ),
            ), 
          ],
        ),
      ),
       
      // ),
    );
  }
}