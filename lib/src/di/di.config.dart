// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gelivery_tracker/src/core/domain/use_case.dart' as _i15;
import 'package:gelivery_tracker/src/data/datasources/local/impl/user_local_data_source_impl.dart'
    as _i4;
import 'package:gelivery_tracker/src/data/datasources/local/user_local_data_source.dart'
    as _i3;
import 'package:gelivery_tracker/src/data/datasources/remote/auth_remote_data_source.dart'
    as _i7;
import 'package:gelivery_tracker/src/data/datasources/remote/impl/auth_remote_data_source_impl.dart'
    as _i8;
import 'package:gelivery_tracker/src/data/datasources/remote/impl/pickup_remote_data_source_impl.dart'
    as _i12;
import 'package:gelivery_tracker/src/data/datasources/remote/pickup_remote_data_source.dart'
    as _i11;
import 'package:gelivery_tracker/src/data/network/api/rest_client.dart' as _i6;
import 'package:gelivery_tracker/src/data/repositories/auth_repo_impl.dart'
    as _i10;
import 'package:gelivery_tracker/src/data/repositories/pickup_repo_impl.dart'
    as _i14;
import 'package:gelivery_tracker/src/di/network_di_module.dart' as _i25;
import 'package:gelivery_tracker/src/domain/entities/pick_up_list_with_count_entity.dart'
    as _i16;
import 'package:gelivery_tracker/src/domain/entities/user_entity.dart' as _i18;
import 'package:gelivery_tracker/src/domain/repositories/auth_repo.dart' as _i9;
import 'package:gelivery_tracker/src/domain/repositories/pickup_repo.dart'
    as _i13;
import 'package:gelivery_tracker/src/domain/usecases/get_pick_up_list.dart'
    as _i17;
import 'package:gelivery_tracker/src/domain/usecases/get_user.dart' as _i20;
import 'package:gelivery_tracker/src/domain/usecases/login.dart' as _i19;
import 'package:gelivery_tracker/src/domain/usecases/logout.dart' as _i21;
import 'package:gelivery_tracker/src/presentation/blocs/auth_bloc/auth_bloc.dart'
    as _i22;
import 'package:gelivery_tracker/src/presentation/blocs/login_bloc/login_cubit.dart'
    as _i23;
import 'package:gelivery_tracker/src/presentation/blocs/pickup_bloc/pickup_bloc.dart'
    as _i24;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkDIModule = _$NetworkDIModule();
    gh.factory<String>(
      () => networkDIModule.provideBaseUrl(),
      instanceName: 'base_url',
    );
    gh.factory<_i3.UserLocalDataSource>(
        () => _i4.UserLocalDataSourceImpl(gh<_i5.SharedPreferences>()));
    gh.lazySingleton<_i6.RestClient>(() => networkDIModule
        .provideRestClient(gh<String>(instanceName: 'base_url')));
    gh.factory<_i7.AuthRemoveDataSource>(
        () => _i8.AuthRemoteDataSourceImpl(gh<_i6.RestClient>()));
    gh.factory<_i9.AuthRepo>(() => _i10.AuthRepoImpl(
          gh<_i7.AuthRemoveDataSource>(),
          gh<_i3.UserLocalDataSource>(),
        ));
    gh.factory<_i11.PickupRemoteDataSource>(
        () => _i12.PickRemoteDataSourceImpl(gh<_i6.RestClient>()));
    gh.factory<_i13.PickupRepo>(() => _i14.PickupRepoImpl(
          gh<_i11.PickupRemoteDataSource>(),
          gh<_i3.UserLocalDataSource>(),
        ));
    gh.factory<
            _i15.UseCase<_i15.Result<_i16.PickupListWithCountEntity>,
                _i17.GetPickupListParams>>(
        () => _i17.GetPickupList(gh<_i13.PickupRepo>()));
    gh.factory<_i15.UseCase<_i15.Result<_i18.UserEntity>, _i19.LoginParam>>(
        () => _i19.Login(gh<_i9.AuthRepo>()));
    gh.factory<_i15.UseCase<_i15.Result<_i18.UserEntity>, _i20.GetUserParam>>(
        () => _i20.GetUser(gh<_i9.AuthRepo>()));
    gh.factory<_i15.UseCase<_i15.Result<void>, _i21.LogoutParam>>(
        () => _i21.Logout(gh<_i9.AuthRepo>()));
    gh.factory<_i22.AuthCubit>(() => _i22.AuthCubit(
          gh<_i15.UseCase<_i15.Result<_i18.UserEntity>, _i20.GetUserParam>>(),
          gh<_i15.UseCase<_i15.Result<void>, _i21.LogoutParam>>(),
        ));
    gh.factory<_i23.LoginCubit>(() => _i23.LoginCubit(
        gh<_i15.UseCase<_i15.Result<_i18.UserEntity>, _i19.LoginParam>>()));
    gh.factory<_i24.PickupCubit>(() => _i24.PickupCubit(gh<
        _i15.UseCase<_i15.Result<_i16.PickupListWithCountEntity>,
            _i17.GetPickupListParams>>()));
    return this;
  }
}

class _$NetworkDIModule extends _i25.NetworkDIModule {}
