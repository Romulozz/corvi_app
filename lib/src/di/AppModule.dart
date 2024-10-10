import 'package:corvi_app/src/data/dataSource/remote/services/AuthServices.dart';
import 'package:corvi_app/src/data/repository/AuthRepositoryImpl.dart';
import 'package:corvi_app/src/domain/repository/AuthRepository.dart';
import 'package:corvi_app/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:corvi_app/src/domain/useCases/auth/RepuestosUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  AuthServices get authServices => AuthServices();

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authServices);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    repuestos: RepuestosUseCase(authRepository)
  );
}
