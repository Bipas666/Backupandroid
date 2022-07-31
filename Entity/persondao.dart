
import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';

import 'person.dart';

@dao
abstract class Persondao {
  @Query('Select * from Person')
  Future<List<Person>> findAllPersons();

  @Query('Select * from Person where id= :id')
  Future<Person> findPersonById(int id);

  @insert
  Future<int> insertPerson(Person person);

  // @Query('Delete * from table where id=:id')
  // Future<Person> deletePersonbyId(int id);
}
