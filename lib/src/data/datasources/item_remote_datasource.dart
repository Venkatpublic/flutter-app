import 'package:flutter_basic/src/data/models/item_model.dart';

abstract class ItemRemoteDataSource {
  Future<List<ItemModel>> getItems();
}

class ItemRemoteDataSourceImpl implements ItemRemoteDataSource {
  // TODO: Implement actual API calls using http or dio
  @override
  Future<List<ItemModel>> getItems() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    return [
      const ItemModel(
        id: '1',
        name: 'Item 1',
        description: 'Description for item 1',
        price: 10.99,
      ),
      const ItemModel(
        id: '2',
        name: 'Item 2',
        description: 'Description for item 2',
        price: 20.50,
      ),
      const ItemModel(
        id: '3',
        name: 'Item 3',
        description: 'Description for item 3',
        price: 5.00,
      ),
    ];
  }
}
