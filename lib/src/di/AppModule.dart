import 'package:corvi_app/src/data/dataSource/remote/services/RepuestosService.dart';
import 'package:corvi_app/src/data/repository/RepuestosRepositoryImpl.dart';
import 'package:corvi_app/src/domain/repository/RepuestosRepository.dart';
import 'package:corvi_app/src/domain/useCases/repuestos/RepuestosUseCase.dart';
import 'package:corvi_app/src/domain/useCases/repuestos/RepuestosUseCases.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  RepuestosService get repuestosServices => RepuestosService();

  @injectable
  RepuestosRepository get authRepository => RepuestosRepositoryImpl(repuestosServices);

  @injectable
  RepuestosUseCases get repuestosUseCases => RepuestosUseCases(
    repuestos: RepuestosUseCase(authRepository)
  );
}
