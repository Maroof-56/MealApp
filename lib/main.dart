import 'package:flutter/material.dart';
import 'package:meals/screens/tabs.dart';
// import 'package:meals/data/dummy_data.dart';
// import 'package:meals/screens/meals.dart';
// import 'package:google_fonts/google_fonts.dart';  
// import 'package:meals/widgets/categories.dart';
 

final theme  = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const  Color.fromARGB(255, 131, 57, 0),
    brightness: Brightness.dark,
    ),
    // textTheme: GoogleFonts.latoTextTheme(), 
   //                                                      // ERROR
    //// by using this i got an  erorr that assement package has installed from both i.e from gogle_font vackage or from assemsnt package : so solution is that i tell to use google font on where u want to use directly instead of from  one define place
);

void main(){
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      // home:const  CategoriesScreen(),
      home:const  TabsScreen(),
      // home: const  MealsScreen(title: 'some categry',
      // meals: dummyMeals,
      // ),
    );
  }
}