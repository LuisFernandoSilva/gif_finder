import 'package:get/get_connect/connect.dart';

class Services extends GetConnect {
  Future<Map> getData({String search, int offSet}) async {
    var response;
    if (search == null) {
      response = await get(
          "https://api.giphy.com/v1/gifs/trending?api_key=CntW9lCMCUOSPTfPw5MzMxoK3JN6srLr&limit=20&rating=G");
    } else {
      response = await get(
          "https://api.giphy.com/v1/gifs/search?api_key=CntW9lCMCUOSPTfPw5MzMxoK3JN6srLr&q=$search&limit=19&offset=$offSet&rating=G&lang=en");
    }

    if (response.hasError) {
      throw Exception(response.statusText);
    }

    return response.body;
  }
}
