// step 2 2nd file
// this is a blue Print file (that consist  my app structured)

import 'package:flutter/material.dart';


class Category{

const Category({
  required this.id,
  required this.title,
 this.color=Colors.orange,   // default color
});


final String id;
final String title;
final  Color color;
}