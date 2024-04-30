import 'package:jala/core/const/app_const.dart';
import 'package:jala/core/helpers/api_helper.dart';
import 'package:jala/data/models/shrimp_price_model.dart';

abstract class ShrimpPriceDataSource {
  Future<List<ShrimpPriceModel>> getListShrimpPrice({
    int perPage = 20,
    int page = 1,
    String regionId = '',
  });

  Future<ShrimpPriceModel> getDetailShrimpPrice({
    required int id,
  });
}

class ShrimpPriceDataSourceImpl implements ShrimpPriceDataSource {
  final ApiHelper apiHelper;

  ShrimpPriceDataSourceImpl(this.apiHelper);

  @override
  Future<ShrimpPriceModel> getDetailShrimpPrice({required int id}) async {
    try {
      String path = AppConst.shrimpPrices;
      path += '/$id';

      Map<String, dynamic> query = {
        'with': ['region', 'creator'].join(','),
        'region_id': '',
      };

      final response = await apiHelper.get(
        path: path,
        query: query,
      );

      final result = ShrimpPriceModel.fromJson((response['data'] as Map<String, dynamic>?) ?? {});

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<ShrimpPriceModel>> getListShrimpPrice({int perPage = 20, int page = 1, String regionId = ''}) async {
    try {
      String path = AppConst.shrimpPrices;

      Map<String, dynamic> query = {
        'per_page': perPage,
        'page': page,
        'with': ['region', 'creator'].join(','),
        'region_id': regionId,
      };

      final response = await apiHelper.get(
        path: path,
        query: query,
      );

      final result = (response['data'] as List?)?.map((e) => ShrimpPriceModel.fromJson(e)).toList() ?? [];

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
