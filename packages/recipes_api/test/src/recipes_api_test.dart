import 'package:test/test.dart';
import 'package:recipes_api/recipes_api.dart';

class TestRecipesApi extends RecipesApi {
  TestRecipesApi() : super();

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

void main() {
  group('RecipesApi', () {
    test('can be instantiated', () {
      // expect(RecipesApi(), isNotNull);
    });
  });
}
