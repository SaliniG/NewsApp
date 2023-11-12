import 'package:http/http.dart';
import 'package:newyorktimes/resource/api_base_helper.dart';
import 'package:newyorktimes/utils/app_api_constants.dart';
import 'package:newyorktimes/utils/common_methods.dart';
import 'package:newyorktimes/utils/constants.dart';
import 'package:newyorktimes/utils/custom_exception.dart';

class Service {
  static Future<Response> fetchArticleDetailsData() async {
    try {
      Response response = await ApiBaseHelper.httpGetRequest(AppApiConstants.fetchArticleDetails);
      return response;
    } on CustomException catch (error) {
      CommonMethods.showToastMessage(error.toString());
      rethrow;
    } catch (e) {
      rethrow;
    }
  }static Future<Response> searchArticleData({required String searchString, required String filter}) async {
    try {
      Response response = await ApiBaseHelper.httpGetRequest('${AppApiConstants.searchArticleDetails}fq=${filter.trim()}&q=$searchString&api-key=${AppConstants.apiKey}');
      return response;
    } on CustomException catch (error) {
      CommonMethods.showToastMessage(error.toString());
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
