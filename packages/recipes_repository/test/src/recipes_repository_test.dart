// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:recipes_repository/recipes_repository.dart';

void main() {
  group('RecipesRepository', () {
    test('can be instantiated', () {
      expect(RecipesRepository(), isNotNull);
    });
  });
}
