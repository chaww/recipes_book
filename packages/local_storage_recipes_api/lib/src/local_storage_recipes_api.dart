import 'dart:async';
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recipes_api/recipes_api.dart';

/// {@template local_storage_recipes_api}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class LocalStorageRecipesApi extends RecipesApi{
  /// {@macro local_storage_recipes_api}
  LocalStorageRecipesApi({
    required SharedPreferences plugin,
  }):_plugin=plugin{
    _init();
  }

  final SharedPreferences _plugin;

  final _menuStreamController = BehaviorSubject<List<Menu>>.seeded(const []);

  @visibleForTesting
  static const kRecipesCollectionKey = '__recipes_collection_key__';

String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);


  void _init(){
    final menuJson = _getValue(kRecipesCollectionKey);
    if (menuJson != null) {
      final menu = List<Map<dynamic, dynamic>>.from(
        json.decode(menuJson) as List,
      )
          .map((jsonMap) => Menu.fromJson(Map<String, dynamic>.from(jsonMap)))
          .toList();
      _menuStreamController.add(menu);
    } else {
      _menuStreamController.add(const []);
    }
  }

  @override
  Stream<List<Menu>> getMenuList=>_menuStreamController.asBroadcastStream();
}
