// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage_recipes_api/local_storage_recipes_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipes_api/recipes_api.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('LocalStorageRecipesApi', () {
    late SharedPreferences plugin;

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

    setUp(() {
      plugin = MockSharedPreferences();
      when(() => plugin.getString(any())).thenReturn(json.encode(book));
      when(() => plugin.setString(any(), any())).thenAnswer((_) async => true);
    });

    LocalStorageRecipesApi createSubject() {
      return LocalStorageRecipesApi(
        plugin: plugin,
      );
    }

    group('constructor', () {
      test('works properly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });

      group('initializes the book stream', () {
        test('with existing book if present', () {
          final subject = createSubject();

          expect(subject.getBook(), emits(book));
          verify(
            () => plugin.getString(
              LocalStorageRecipesApi.kRecipesCollectionKey,
            ),
          ).called(1);
        });

        test('with empty list if no Menu present', () {
          when(() => plugin.getString(any())).thenReturn(null);

          final subject = createSubject();

          expect(subject.getBook(), emits(const <Menu>[]));
          verify(
            () => plugin.getString(
              LocalStorageRecipesApi.kRecipesCollectionKey,
            ),
          ).called(1);
        });
      });
    });

    test('getBook returns stream of current list menu', () {
      expect(
        createSubject().getBook(),
        emits(book),
      );
    });

    group('saveMenu', () {
      test('saves new Menu', () {
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

        final newBook = [...book, newMenu];

        final subject = createSubject();

        expect(subject.saveMenu(newMenu), completes);
        expect(subject.getBook(), emits(newBook));

        verify(
          () => plugin.setString(
            LocalStorageRecipesApi.kRecipesCollectionKey,
            json.encode(newBook),
          ),
        ).called(1);
      });

      test('updates existing Menu', () {
        final updatedMenu = Menu(
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
                Ingredient(name: 'กาแฟคั่วกลาง', value: '10', unit: 'ML'),
                Ingredient(name: 'ฟองนมร้อน', value: '20', unit: 'ML'),
              ],
            ),
          ],
        );
        final newBook = [...book.sublist(0, 1), updatedMenu];

        final subject = createSubject();

        expect(subject.saveMenu(updatedMenu), completes);
        expect(subject.getBook(), emits(newBook));

        verify(
          () => plugin.setString(
            LocalStorageRecipesApi.kRecipesCollectionKey,
            json.encode(newBook),
          ),
        ).called(1);
      });

      group('deleteMenu', () {
        test('deletes existing Menu', () {
          final newBook = book.sublist(1);

          final subject = createSubject();

          expect(subject.deleteMenu(book[0].id), completes);
          expect(subject.getBook(), emits(newBook));

          verify(
            () => plugin.setString(
              LocalStorageRecipesApi.kRecipesCollectionKey,
              json.encode(newBook),
            ),
          ).called(1);
        });

        test(
          'throws MenuNotFoundException if menu '
          'with provided id is not found',
          () {
            final subject = createSubject();
            expect(
              () => subject.deleteMenu('non-existing-id'),
              throwsA(isA<MenuNotFoundException>()),
            );
          },
        );
      });
    });
  });
}
