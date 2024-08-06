
import 'package:dio/dio.dart';
import 'package:flutter_workshop_1/src/model/youtube_response.dart';

class WebApiService {
  Future<List<Youtube>> feed() async {
    final dio = Dio();
    final result = await dio.get("https://codemobiles.com/adhoc/youtubes/index_new.php?username=admin&password=password&type=songs");

    // final youtubeRes = youtuberResponseFromJson(jsonEncode(result.data));  // jsonEncode() for string to json
    final youtubeRes = youtubeResponseFromJson(result.data);

    // print(youtubeRes.youtubes[0].title);
    return youtubeRes.youtubes;
  }
}