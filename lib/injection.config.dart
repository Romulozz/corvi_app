// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:corvi_app/src/data/dataSource/remote/services/AuthServices.dart'
    as _i594;
import 'package:corvi_app/src/di/AppModule.dart' as _i532;
import 'package:corvi_app/src/domain/repository/AuthRepository.dart' as _i252;
import 'package:corvi_app/src/domain/useCases/auth/AuthUseCases.dart' as _i248;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i594.AuthServices>(() => appModule.authServices);
    gh.factory<_i252.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i248.AuthUseCases>(() => appModule.authUseCases);
    return this;
  }
}

class _$AppModule extends _i532.AppModule {}
