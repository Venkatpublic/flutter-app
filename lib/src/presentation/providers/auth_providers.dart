import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_basic/src/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_basic/src/data/repositories/auth_repository_impl.dart';
import 'package:flutter_basic/src/domain/entities/user_entity.dart';
import 'package:flutter_basic/src/domain/repositories/auth_repository.dart';
import 'package:flutter_basic/src/domain/usecases/login_usecase.dart';
import 'package:flutter_basic/src/domain/usecases/register_usecase.dart';

// Data Source Provider
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
  (ref) => AuthRemoteDataSourceImpl(),
);

// Repository Provider
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
  ),
);

// Use Case Providers
final loginUseCaseProvider = Provider<LoginUseCase>(
  (ref) => LoginUseCase(ref.watch(authRepositoryProvider)),
);

final registerUseCaseProvider = Provider<RegisterUseCase>(
  (ref) => RegisterUseCase(ref.watch(authRepositoryProvider)),
);

// Auth State Notifier
class AuthNotifier extends StateNotifier<AsyncValue<UserEntity?>> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;

  AuthNotifier(this._loginUseCase, this._registerUseCase)
    : super(const AsyncValue.data(null));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    final result = await _loginUseCase(
      LoginParams(email: email, password: password),
    );
    state = result.fold(
      (failure) => AsyncValue.error(failure, StackTrace.current),
      (user) => AsyncValue.data(user),
    );
  }

  Future<void> register(String email, String password) async {
    state = const AsyncValue.loading();
    final result = await _registerUseCase(
      RegisterParams(email: email, password: password),
    );
    state = result.fold(
      (failure) => AsyncValue.error(failure, StackTrace.current),
      (user) => AsyncValue.data(user),
    );
  }

  void logout() {
    state = const AsyncValue.data(null);
  }
}

// Auth Notifier Provider
final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<UserEntity?>>(
      (ref) => AuthNotifier(
        ref.watch(loginUseCaseProvider),
        ref.watch(registerUseCaseProvider),
      ),
    );
