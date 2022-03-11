import 'package:dictionary/model/dictionary_response.dart';
import 'package:dictionary/service/http_services.dart';

class DictionaryRepository {
  Future<List<DictionaryResponse>>? getWordsFromDictionary(String query) async {
    final response = await HttpServices.fetchRequest("en/$query");
    final result = dictionaryResponseFromJson(response.body);
    return result;

    // try {
    //   final response = await HttpServices.fetchRequest("en/$query");
    //   if (response.statusCode == 200) {
    //     final result = dictionaryResponseFromJson(response.body);
    //     return result;
    //   } else {
    //     return null;
    //   }
    // } on SocketException catch (socketError) {
    //   throw Exception(socketError);
    // } on HttpException catch (httpError) {
    //   throw Exception(httpError);
    // } on FormatException catch (formateException) {
    //   throw Exception(formateException);
    // }
  }
}
