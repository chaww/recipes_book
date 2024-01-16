// ignore_for_file: prefer_const_constructors
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:recipes_api/recipes_api.dart';
import 'package:recipes_repository/recipes_repository.dart';

class MockRecipesApi extends Mock implements RecipesApi {}

class FakeMenu extends Fake implements Menu {}

void main() {
  group('RecipesRepository', () {
    late RecipesApi api;

    final book = [
      Menu(
        id: '1',
        category: 'coffee',
        image: 'a001.jpg',
        name: 'อเมริกาโน่',
        recipeList: [
          Recipe(
            name: 'อเมริกาโน่',
            coffeeType: 'กาแฟคั่วกลาง',
            type: 'ร้อน',
            image: 'a001.png',
            ingredients: [
              Ingredient(name: 'กาแฟคั่วกลาง', value: '1', unit: 'ML'),
              Ingredient(name: 'น้ำร้อน', value: '2', unit: 'ML'),
            ],
          ),
          Recipe(
            name: 'อเมริกาโน่',
            coffeeType: 'กาแฟคั่วกลาง',
            type: 'เย็น',
            image: 'a002.png',
            ingredients: [
              Ingredient(name: 'กาแฟคั่วกลาง', value: '3', unit: 'ML'),
              Ingredient(name: 'น้ำเย็น', value: '4', unit: 'ML'),
            ],
          ),
          Recipe(
            name: 'อเมริกาโน่',
            coffeeType: 'กาแฟคั่วอ่อน',
            type: 'ร้อน',
            image: 'a003.png',
            ingredients: [
              Ingredient(name: 'กาแฟคั่วอ่อน', value: '5', unit: 'ML'),
              Ingredient(name: 'น้ำร้อน', value: '6', unit: 'ML'),
            ],
          ),
          Recipe(
            name: 'อเมริกาโน่',
            coffeeType: 'กาแฟคั่วอ่อน',
            type: 'เย็น',
            image: 'a004.png',
            ingredients: [
              Ingredient(name: 'กาแฟคั่วอ่อน', value: '7', unit: 'ML'),
              Ingredient(name: 'น้ำเย็น', value: '8', unit: 'ML'),
            ],
          ),
        ],
      ),
      Menu(
        id: '2',
        category: 'coffee',
        image: 'b002.jpg',
        name: 'คาปูชิโน่',
        recipeList: [
          Recipe(
            name: 'คาปูชิโน่',
            type: 'ร้อน',
            image: 'b002.jpg',
            ingredients: [
              Ingredient(name: 'กาแฟคั่วกลาง', value: '1', unit: 'ML'),
              Ingredient(name: 'ฟองนมร้อน', value: '2', unit: 'ML'),
            ],
          ),
        ],
      ),
    ];

    setUpAll(() {
      registerFallbackValue(FakeMenu());
    });

    setUp(() {
      api = MockRecipesApi();
      when(() => api.getBook()).thenAnswer((_) => Stream.value(book));
      when(() => api.saveMenu(any())).thenAnswer((_) async {});
      when(() => api.deleteMenu(any())).thenAnswer((_) async {});
    });

    RecipesRepository createSubject() => RecipesRepository(recipesApi: api);

    group('constructor', () {
      test('works properly', () {
        expect(createSubject, returnsNormally);
      });
    });

    group('getBook', () {
      test('makes correct api request', () {
        final subject = createSubject();

        expect(
          subject.getBook(),
          isNot(throwsA(anything)),
        );

        verify(() => api.getBook()).called(1);
      });

      test('returns stream of current list book', () {
        expect(
          createSubject().getBook(),
          emits(book),
        );
      });
    });

    group('saveMenu', () {
      test('makes correct api request', () {
        final newMenu = Menu(
          id: '3',
          category: 'coffee',
          image: 'b003.jpg',
          name: 'คอฟฟี่ลาเต้',
          recipeList: [
            Recipe(
              name: 'คอฟฟี่ลาเต้',
              type: 'ร้อน',
              image: 'b003.jpg',
              ingredients: [
                Ingredient(name: 'กาแฟ', value: '4', unit: 'ML'),
                Ingredient(name: 'ฟองนมร้อน', value: '5', unit: 'ML'),
              ],
            )
          ],
        );

        final subject = createSubject();

        expect(subject.saveMenu(newMenu), completes);

        verify(() => api.saveMenu(newMenu)).called(1);
      });
    });

    group('deleteMenu', () {
      test('makes correct api request', () {
        final subject = createSubject();

        expect(subject.deleteMenu(book[0].id), completes);

        verify(() => api.deleteMenu(book[0].id)).called(1);
      });
    });
  });
}
