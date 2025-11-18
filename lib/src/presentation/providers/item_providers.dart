import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_basic/src/core/usecase.dart';
import 'package:flutter_basic/src/data/datasources/item_remote_datasource.dart';
import 'package:flutter_basic/src/data/repositories/item_repository_impl.dart';
import 'package:flutter_basic/src/domain/entities/item_entity.dart';
import 'package:flutter_basic/src/domain/repositories/item_repository.dart';
import 'package:flutter_basic/src/domain/usecases/fetch_items_usecase.dart';

// Data Source Provider
final itemRemoteDataSourceProvider = Provider<ItemRemoteDataSource>(
  (ref) => ItemRemoteDataSourceImpl(),
);

// Repository Provider
final itemRepositoryProvider = Provider<ItemRepository>(
  (ref) => ItemRepositoryImpl(
    remoteDataSource: ref.watch(itemRemoteDataSourceProvider),
  ),
);

// Use Case Providers
final fetchItemsUseCaseProvider = Provider<FetchItemsUseCase>(
  (ref) => FetchItemsUseCase(ref.watch(itemRepositoryProvider)),
);

// Item State Notifier
class ItemNotifier extends StateNotifier<AsyncValue<List<ItemEntity>>> {
  final FetchItemsUseCase _fetchItemsUseCase;

  ItemNotifier(this._fetchItemsUseCase) : super(const AsyncValue.loading()) {
    fetchItems();
  }

  Future<void> fetchItems() async {
    state = const AsyncValue.loading();
    final result = await _fetchItemsUseCase(NoParams());
    state = result.fold(
      (failure) => AsyncValue.error(failure, StackTrace.current),
      (items) => AsyncValue.data(items),
    );
  }
}

// Item Notifier Provider
final itemNotifierProvider =
    StateNotifierProvider<ItemNotifier, AsyncValue<List<ItemEntity>>>(
      (ref) => ItemNotifier(ref.watch(fetchItemsUseCaseProvider)),
    );
