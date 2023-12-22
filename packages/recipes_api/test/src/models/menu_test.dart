import 'package:test/test.dart';
import 'package:recipes_api/recipes_api.dart';

void main() {
  group('Ingredient', () {
    Ingredient createSubject({
      String name = 'ลาเต้',
    }) {
      return Ingredient(
        name: name,
      );
    }

    group('constructor', () {
      test('works correctly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });
    });
  });
}
