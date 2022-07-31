import 'package:floor/floor.dart';



@entity

class Person{

    @PrimaryKey(autoGenerate: true)
    final int id;
    final String fname;
    final String lname;




    Person({this.id,  this.fname,  this.lname});
}


