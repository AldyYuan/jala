import 'package:jala/core/const/app_const.dart';
import 'package:jala/core/helpers/api_helper.dart';
import 'package:jala/data/models/disease_model.dart';

abstract class DiseaseDataSource {
  Future<List<DiseaseModel>> getListDisease({int perPage = 20, int page = 1});
}

class DiseaseDataSourceImpl implements DiseaseDataSource {
  final ApiHelper apiHelper;

  DiseaseDataSourceImpl(this.apiHelper);

  @override
  Future<List<DiseaseModel>> getListDisease({int perPage = 20, int page = 1}) async {
    try {
      String path = AppConst.diseases;

      Map<String, dynamic> query = {
        'per_page': perPage,
        'page': page,
      };

      final response = await apiHelper.get(
        path: path,
        query: query,
      );

      final result = (response['data'] as List?)?.map((e) => DiseaseModel.fromJson(e)).toList() ?? [];

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
