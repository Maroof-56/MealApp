//step 25  for tabbar at below 

import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/categories.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/main_drawer.dart';

    const kInitialFilter = { Filter.glutenFree:false,   // step 57 when it it null it show fallback message
      Filter.lactoseFree:false,
      Filter.vegetarian:false,
      Filter.vegan:false,
    };

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  
     Map<Filter,bool> _selectedFilter =  kInitialFilter;  // step 55  ,58 Passed 
    
  void _showMessageInfo(String message){        // step 38 message for when favirite add or remove 
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
             Text(
          message,        // message are below      
         style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold
         ),
        ),
        backgroundColor: Colors.red[100] ,
        elevation: 30,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),),
        // shape:const  ContinuousRectangleBorder(
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(12),
        //   topRight: Radius.circular(20),
        //   bottomLeft: Radius.circular(8),
        //   bottomRight: Radius.circular(16),
        // ),
        // ),

        ),
      
    );
  }

  int _selectedPageIndex = 0;   // 1 ye bnaya(1st)
   
    void _toggleMealsFavoriteStatus(Meal meal){        // step 30 ()
      final isExisting = _favoriteMeal.contains(meal);

      if(isExisting){ 
        setState(() {          // step 37 add inside a setstate so that it can remove when on click ontime (when i not usinf setstate i doesnot remove directly )
        _favoriteMeal.remove(meal);
          
        });
        _showMessageInfo('Removed from favorite');      // 39
      }
      else{
        setState(() {
          
          _favoriteMeal.add(meal);
        });
        _showMessageInfo('Marked as favorite !');        // 39
      }
    }
     final List<Meal> _favoriteMeal = [];

  void _selectPage(int index){   //(1st)
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String indentifier) async {       // step 44   , 53 async 
        Navigator.pop(context);  // it will close the filter screen Page to main screen not on drawer Screen
     if(indentifier == 'Filters'){
         //Navigator.of(context).pushReplacement(            // step 46  step 48 replacement : ye nhi hoga->(ye jitna bhi screen navigation ho ra h ye sab ye ek stack of screen h jisse bahar k tool bar se hum back aa skte h aur track kr skte h kiske badd kya navigation hua h)(iske bad se ctx wali screen push nhi hogi stack me active screen hogi )
        final result = await Navigator.of(context).push<Map<Filter,bool>>(    // step 47 comment kiye is liye push , 54 await,<> Map of enum->Filter(in filter.dart) of bool value  
          MaterialPageRoute(builder: (ctx) =>  FiltersScreen(currentFilters: _selectedFilter,),),   // step 64 
         );
        //  print(result);
        setState(() {
        _selectedFilter = result ?? kInitialFilter;    //step 56 ?? -> check that value is null or not(if null then it defined fallback value after ?? mark)
          
        });
     }
    //  else{
    //   Navigator.pop(context);        // i already is in meal area so close drawer by using this
    //  }
  }

  @override
  Widget build(BuildContext context) {
    
    final availableMeals = dummyMeals.where((meal){           // step 59  60 in categories.dart
      if(_selectedFilter[Filter.glutenFree]! && !meal.isGluentFree){
        return false;
      }
      if(_selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(_selectedFilter[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(_selectedFilter[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();

    Widget activePage =  CategoriesScreen(
      onTogglefavorites: _toggleMealsFavoriteStatus,       // 2nd ye  // step 36 Passed inside categories
      availableMeals: availableMeals,         // step 62 Passed here ( by ussing all these logic then we only see selcted filter) 63 in filter.dart
      );   
    var activePageTitle =  'Categories';

     if(_selectedPageIndex == 1){
      // activePage = const MealsScreen(title: 'favorites', meals: []) ;      // this mealsScreen are reusing here
      activePage =  MealsScreen(meals: _favoriteMeal,  // STEp 36 pASSED HERE
      onTogglefavorites: _toggleMealsFavoriteStatus,) ;      // step 28 : step 33remove title from here (in favorites 2 appbar dispaying to handle this )
      activePageTitle = 'Your favorites';
     }
    return Scaffold(
      appBar: AppBar(
        // title: Text('dynamic'),
        title: Text(activePageTitle),    // Passed here 
      ),

         drawer:  MainDrawer(onselectScreen: _setScreen,),  // step 41 ,45(Passed here) here we can add drawer but there was a lots of customaization so built in separate widget
      body: activePage,          // body build dynamically based on which tab was Pressed
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,  // by adding this icon highlight that in which tabs u r currently in 
        onTap: _selectPage,    // Passed here
        items: const [
          BottomNavigationBarItem(icon:Icon(Icons.set_meal_outlined) ,label:'Categories', ),       // one tab for category
          BottomNavigationBarItem(icon:Icon(Icons.favorite_border_sharp) ,label:'Favorites' ),       // one for favourite meal
        ],
      ),
    );
  }
}