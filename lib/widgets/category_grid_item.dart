// step 4 

import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryGridItems extends StatelessWidget {
  const CategoryGridItems({super.key,required this.category,required this.onselectCategory});

  final Category category;
  final void Function() onselectCategory;                    // step 9
  @override
  Widget build(BuildContext context) {
    return InkWell(            // it is a widget used for tap on grid item (altenaete i can use gesturedetector widget but in Inkwell we can get feedback)
    // onTap: (){},
    onTap: onselectCategory,                       // step 11
    splashColor: Theme.of(context).secondaryHeaderColor,   // effect on tappiing
    borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsetsDirectional.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [ 
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
             ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}