import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:friut_hub/features/e_commerce/products/data/models/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class FavoritesLocalDataSource {
  Future<void> initDb();
  Future<List<ProductModel>> fetchAllFavoritesFromLocal();
  Future<Unit> insertToFavorites(ProductModel favoriteProduct);
  Future<Unit> deleteFromFavorites(int productId);
  Future<Unit> clearAndInsertAll(List<ProductModel> products);
  Future<bool> isFavorite(int productId);
}

class FavoritesWithSqfLite implements FavoritesLocalDataSource {
  static Database? _db;

  //! Initialize Database , Create Table
  @override
  Future<void> initDb() async {
      // initialize FFI for desktop platforms
  if (defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.macOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

    _db = await openDatabase(
      join(await getDatabasesPath(), "favorites.db"),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE favorites(
            id INTEGER PRIMARY KEY,
            name TEXT,
            price REAL,
            imageUrl TEXT
          )
''');
      },
      version: 1,
    );
  }

  @override
  Future<List<ProductModel>> fetchAllFavoritesFromLocal() async {
    final maps = await _db!.query('favorites');
    return maps.map((map) => ProductModel.fromMap(map)).toList();
  }

  @override
  Future<Unit> insertToFavorites(ProductModel favoriteProduct) async {
    await _db!.insert('favorites', favoriteProduct.toMap());
    return unit;
  }

  @override
  Future<Unit> deleteFromFavorites(int productId) async {
    await _db!.delete(
      'favorites',
      where: "id = ?",
      whereArgs: [productId],
    );
    return unit;
  }

  @override
  Future<Unit> clearAndInsertAll(List<ProductModel> products) async {
    final batch = _db!.batch();
    batch.delete('favorites');
    for (final product in products) {
      batch.insert(
        'favorites',
        product.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
    return unit;
  }

  @override
  Future<bool> isFavorite(int productId) async{
    final result = await _db!.query(
      'favorites',
      where: 'id = ?',
      whereArgs: [productId],
    );
    return result.isNotEmpty;
  
  }
}
