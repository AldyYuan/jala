// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jala/core/helpers/api_helper.dart' as _i4;
import 'package:jala/data/datasource/disease_datasource.dart' as _i5;
import 'package:jala/data/datasource/post_datasource.dart' as _i3;
import 'package:jala/data/datasource/region_datasource.dart' as _i7;
import 'package:jala/data/datasource/shrimp_price_datasource.dart' as _i6;
import 'package:jala/data/repositories/disease_repository_impl.dart' as _i11;
import 'package:jala/data/repositories/post_repository_impl.dart' as _i13;
import 'package:jala/data/repositories/region_repository_impl.dart' as _i9;
import 'package:jala/data/repositories/shrimp_price_repository_impl.dart'
    as _i16;
import 'package:jala/domain/repositories/disease_repository.dart' as _i10;
import 'package:jala/domain/repositories/post_repository.dart' as _i12;
import 'package:jala/domain/repositories/region_repository.dart' as _i8;
import 'package:jala/domain/repositories/shrimp_price_repository.dart' as _i15;
import 'package:jala/domain/usecases/get_detail_shrimp_price.dart' as _i19;
import 'package:jala/domain/usecases/get_list_disease.dart' as _i18;
import 'package:jala/domain/usecases/get_list_post.dart' as _i14;
import 'package:jala/domain/usecases/get_list_region.dart' as _i17;
import 'package:jala/domain/usecases/get_list_shrimp_price.dart' as _i20;

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
    gh.factory<_i3.PostDataSource>(
        () => _i3.PostDataSourceImpl(gh<_i4.ApiHelper>()));
    gh.factory<_i5.DiseaseDataSource>(
        () => _i5.DiseaseDataSourceImpl(gh<_i4.ApiHelper>()));
    gh.factory<_i6.ShrimpPriceDataSource>(
        () => _i6.ShrimpPriceDataSourceImpl(gh<_i4.ApiHelper>()));
    gh.factory<_i7.RegionDataSource>(
        () => _i7.RegionDataSourceImpl(gh<_i4.ApiHelper>()));
    gh.factory<_i8.RegionRepository>(
        () => _i9.RegionRepositoryImpl(gh<_i7.RegionDataSource>()));
    gh.factory<_i10.DiseaseRepository>(
        () => _i11.DiseaseRepositoryImpl(gh<_i5.DiseaseDataSource>()));
    gh.factory<_i12.PostRepository>(
        () => _i13.PostRepositoryImpl(gh<_i3.PostDataSource>()));
    gh.factory<_i14.GetListPost>(
        () => _i14.GetListPost(gh<_i12.PostRepository>()));
    gh.factory<_i15.ShrimpPriceRepository>(
        () => _i16.ShrimpPriceRepositoryImpl(gh<_i6.ShrimpPriceDataSource>()));
    gh.factory<_i17.GetListRegion>(
        () => _i17.GetListRegion(gh<_i8.RegionRepository>()));
    gh.factory<_i18.GetListDisease>(
        () => _i18.GetListDisease(gh<_i10.DiseaseRepository>()));
    gh.factory<_i19.GetDetailShrimpPrice>(
        () => _i19.GetDetailShrimpPrice(gh<_i15.ShrimpPriceRepository>()));
    gh.factory<_i20.GetListShrimpPrice>(
        () => _i20.GetListShrimpPrice(gh<_i15.ShrimpPriceRepository>()));
    return this;
  }
}
