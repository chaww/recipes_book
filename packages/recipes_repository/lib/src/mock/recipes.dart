import 'package:recipes_api/recipes_api.dart';
import 'package:recipes_repository/recipes_repository.dart';

Future<void> mock_recipes({required RecipesApi recipesApi}) async {
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
    Menu(
      id: '3',
      category: 'coffee',
      image: 'b003.jpg',
      name: 'ชาพีช',
      recipeList: [
        Recipe(
          name: 'ชาพีช',
          type: 'เย็น',
          image: 'b003.jpg',
          ingredients: [
            Ingredient(name: 'ผงชาพีช', value: '4', unit: 'ML'),
            Ingredient(name: 'น้ำร้อน', value: '5', unit: 'ML'),
          ],
        ),
      ],
    ),
  ];

  for (final menu in book) {
    await recipesApi.saveMenu(menu);
  }

  final output = await recipesApi.getMenu('1');
  print('__mock__ mock_recipes');
}
