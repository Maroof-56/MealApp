// step 15 

import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:transparent_image/transparent_image.dart';

// import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key,required this.meal,required this.onSelectMeal});
  
   final Meal meal;
   final void Function(BuildContext context,Meal meal) onSelectMeal;  // step 22 

   String get complexityText{        // step 18
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);      // name[0] that access first character(also name give access to enum value)
   }
   String get affordibilityText{        // step 20
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);      // name[0] that access first character 
   }

  @override
  Widget build(BuildContext context ) {
     return  Card( 
          margin:const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.hardEdge,  // stack ignore shape & it cant & that simly cutt of content out of shpe(boundries)
          elevation: 2, // for 3 d effect
          child: InkWell(
            onTap: (){                            // step 23 Passed in anonymous function
              onSelectMeal(context,meal);
            },
            child: SizedBox(
              child: Stack( // text over img 
                children: [
                  SizedBox(
                    child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                    // image: const AssetImage('assets/images/flow.png'),
                     image:  AssetImage(meal.imageUrl),
                     fit: BoxFit.cover,  // ensure that img never disocted
                     height: 200,
                     width: double.infinity,
                     ),
                    //child: Image.asset('assets/images/flow.png',height: 400,width: double.infinity,),
                    // child: CachedNetworkImage(
                    //   imageUrl: (meal.imageUrl),
                    //   placeholder: (context, url) => const CircularProgressIndicator(),
                    //   height: 200,
                    //   width: double.infinity,
                    //   errorWidget: (context, url, error) => const Icon(Icons.error),
                    //   ),
                  ),
                   Positioned(              // we can set positioned that where i has to set text/or somethg
                    left: 0,               // with helof this no need of sized box 
                    right: 0,             // all 3 value are resPonsible for transParent text container 
                    bottom: 0 ,
                    child:Container(

                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                      child:  Column(
                        children: [
                             Text(
                              meal.title, 
                              maxLines: 2,  // restriction abt title line
                             textAlign: TextAlign.center,
                             softWrap: true,   // ensure that text is wrap in goog looking way
                             overflow: TextOverflow.ellipsis,     // that control how text title should cutoff if need to cut max to 2 line
                              style:  const 
                              TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                             ),
                           
                          const SizedBox(height: 10,),
                          Row(         // for metadata
                           mainAxisAlignment: MainAxisAlignment.center,
                            children: [                                // step 17
                              MealItemTrait(
                                icon: Icons.schedule, 
                                label: '${meal.duration}min',     //convert label into string can also done by as toasstring()
                                ),
                                const SizedBox(width: 12,),
                              MealItemTrait(
                                icon: Icons.work, 
                                label: complexityText ,     // step 19
                                ),
                                const SizedBox(width: 12,),
                              MealItemTrait(
                                icon: Icons.attach_money, 
                                label: affordibilityText ,        // step 21
                                ),

                            ],
                          )
                        ],
                      ),
                    ),
                     ),
                ],
              ),
            ),
          ),
        );
      
    
  }
}