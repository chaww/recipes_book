import 'package:recipes_api/recipes_api.dart';
import 'package:recipes_repository/recipes_repository.dart';

Future<void> mock_recipes({
  required RecipesRepository recipesRepository,
}) async {
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
            Ingredient(name: 'กาแฟคั่วกลาง', amount: '1', unit: 'ML'),
            Ingredient(name: 'น้ำร้อน', amount: '2', unit: 'ML'),
          ],
        ),
        Recipe(
          name: 'อเมริกาโน่',
          coffeeType: 'กาแฟคั่วกลาง',
          type: 'เย็น',
          image: 'a002.png',
          ingredients: [
            Ingredient(name: 'กาแฟคั่วกลาง', amount: '3', unit: 'ML'),
            Ingredient(name: 'น้ำเย็น', amount: '4', unit: 'ML'),
          ],
        ),
        Recipe(
          name: 'อเมริกาโน่',
          coffeeType: 'กาแฟคั่วอ่อน',
          type: 'ร้อน',
          image: 'a003.png',
          ingredients: [
            Ingredient(name: 'กาแฟคั่วอ่อน', amount: '5', unit: 'ML'),
            Ingredient(name: 'น้ำร้อน', amount: '6', unit: 'ML'),
          ],
        ),
        Recipe(
          name: 'อเมริกาโน่',
          coffeeType: 'กาแฟคั่วอ่อน',
          type: 'เย็น',
          image: 'a004.png',
          ingredients: [
            Ingredient(name: 'กาแฟคั่วอ่อน', amount: '7', unit: 'ML'),
            Ingredient(name: 'น้ำเย็น', amount: '8', unit: 'ML'),
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
            Ingredient(name: 'กาแฟคั่วกลาง', amount: '1', unit: 'ML'),
            Ingredient(name: 'ฟองนมร้อน', amount: '2', unit: 'ML'),
          ],
        ),
      ],
    ),
  ];

  for (final menu in book) {
    await recipesRepository.saveMenu(menu);
  }

  final output = await recipesRepository.getMenu('1');
  print('__mock__ mock_recipes');
}
