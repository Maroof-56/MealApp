// step 40

import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key,required this.onselectScreen});
   
    final void Function(String indentifier) onselectScreen;   // step 43  44 in tabs.dart
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader( // drawwer header k wajah se upper wala color a rha h dark
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                )
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 40,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 15,),
                Text(
                  'Cooking Up',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            )
          ),
          ListTile(            // step 42 content inside drwaer
            leading: Icon(
              Icons.restaurant,
              size: 22,
              color: Theme.of(context).colorScheme.onBackground,
              ),
            title: Text(
                  'meals',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 24,
                  ),
             
            ),
            onTap: (){
            onselectScreen('meals');
            },
          ),
          ListTile(            // step 42 content inside drwaer
            leading: Icon(
              Icons.settings,
              size: 22,
              color: Theme.of(context).colorScheme.onBackground,
              ),
            title: Text( 
                 'Filters',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 24,
                  ),
             
            ),
            onTap: (){
              onselectScreen('Filters');
            },
          ),
        ],
      ),
    );
  }
}