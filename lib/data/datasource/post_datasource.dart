import 'package:injectable/injectable.dart';
import 'package:jala/core/const/app_const.dart';
import 'package:jala/core/helpers/api_helper.dart';
import 'package:jala/data/models/post_model.dart';

abstract class PostDataSource {
  Future<List<PostModel>> getListPost({int perPage = 20, int page = 1});
}

@Injectable(as: PostDataSource)
class PostDataSourceImpl implements PostDataSource {
  final ApiHelper apiHelper;

  PostDataSourceImpl(this.apiHelper);

  @override
  Future<List<PostModel>> getListPost({int perPage = 20, int page = 1}) async {
    try {
      String path = AppConst.posts;

      Map<String, dynamic> query = {
        'per_page': perPage,
        'page': page,
        'with': 'creator',
      };

      final response = await apiHelper.get(
        path: path,
        query: query,
      );

      final result = (response['data'] as List?)?.map((e) => PostModel.fromJson(e)).toList() ?? [];

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
