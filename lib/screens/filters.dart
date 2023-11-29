// step 45

import 'package:flutter/material.dart';
// import 'package:meals/widgets/main_drawer.dart';
// import 'package:meals/screens/tabs.dart';

enum Filter {         // step 52 used in map
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key,required this.currentFilters});

   final Map<Filter,bool> currentFilters;       // step 63 (this logic for when we reenter in filter section if button set to false again even after button was Pressed so to abvoid this this could be the solution )

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

    var _glutenFreeFilterSet = false;
    var _lactoseFreeFilterSet = false;          // step 50
    var _vegetarianFilterSet = false;          
    var _veganFilterSet = false;         

    @override               // 64 our widget is not avaiable above so this is the way
  void initState() {
    super.initState();  // no need to write setstate 
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Your Filters'),
      ) ,
                  // id dont want back butoon instead of drawer icon use this
    //  drawer:MainDrawer(onselectScreen: (identifier){   // step 47(by adding this when we enter on filters then there is no back button present there bcoz of thid logic instead drawer icon presne t there)
    //   Navigator.of(context).pop;                              // can check by comenting this part
    //      if(identifier == 'meals'){
    //       Navigator.of(context).pushReplacement(MaterialPageRoute(builder : (ctx) => const TabsScreen()));   // step 48 reason also stck here
    //      }
    //  },),

      body: WillPopScope(       // step 51(warp in column (is a utility widget)) (here is leave screen logic)
          onWillPop: () async {          // function that return future(eventually an object)
           Navigator.of(context).pop({
            Filter.glutenFree:_glutenFreeFilterSet,
            Filter.lactoseFree:_lactoseFreeFilterSet,
            Filter.vegetarian:_vegetarianFilterSet,
            Filter.vegan:_veganFilterSet,
           });
           return false;  // not poping twice
          },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
               onChanged: (isChecked){
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
               },
               title: Text('Gluten-free',
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground, ),
               ),
               subtitle:  Text('Only include gluten-free meals.',
               style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground, ), 
               ),
               activeColor: Theme.of(context).colorScheme.tertiary,
               contentPadding: const EdgeInsets.only(left: 30,right: 20),
             ),
      
            SwitchListTile(                       // step 49 adding more filters
              value: _lactoseFreeFilterSet,
               onChanged: (isChecked){
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
               },
               title: Text('Lactose-free',
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground, ),
               ),
               subtitle:  Text('Only include lactose-free meals.',
               style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground, ), 
               ),
               activeColor: Theme.of(context).colorScheme.tertiary,
               contentPadding: const EdgeInsets.only(left: 30,right: 20),
             ),
            SwitchListTile(                       // step 49 adding more filters
              value: _vegetarianFilterSet,
               onChanged: (isChecked){
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
               },
               title: Text('vegetarian',
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground, ),
               ),
               subtitle:  Text('Only include vegetarian meals.',
               style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground, ), 
               ),
               activeColor: Theme.of(context).colorScheme.tertiary,
               contentPadding: const EdgeInsets.only(left: 30,right: 20),
             ),
            SwitchListTile(                       // step 49 adding more filters
              value: _veganFilterSet,
               onChanged: (isChecked){
                setState(() {
                  _veganFilterSet = isChecked;
                });
               },
               title: Text('vegan',
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground, ),
               ),
               subtitle:  Text('Only include vegan meals.',
               style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground, ), 
               ),
               activeColor: Theme.of(context).colorScheme.tertiary,
               contentPadding: const EdgeInsets.only(left: 30,right: 20),
             ),
          ],
        ),
      ),
    );
  }
}