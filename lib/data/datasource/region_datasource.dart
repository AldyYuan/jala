import 'package:jala/core/const/app_const.dart';
import 'package:jala/core/helpers/api_helper.dart';
import 'package:jala/data/models/region_model.dart';

abstract class RegionDataSource {
  Future<List<RegionModel>> getListRegion({String search = ''});
}

class RegionDataSourceImpl implements RegionDataSource {
  final ApiHelper apiHelper;

  RegionDataSourceImpl(this.apiHelper);

  @override
  Future<List<RegionModel>> getListRegion({String search = ''}) async {
    try {
      String path = AppConst.region;

      Map<String, dynamic> query = {
        'search': search,
        'has': 'shrimp_prices',
      };

      final response = await apiHelper.get(
        path: path,
        query: query,
      );

      final result = (response['data'] as List?)?.map((e) => RegionModel.fromJson(e)).toList() ?? [];

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
