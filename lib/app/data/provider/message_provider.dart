import 'package:dio/dio.dart';
import 'package:flutter_get_cli_demo/app/data/models/message_model.dart';

class MessageProvider {
  static Future<List<MessageModel>> fetchMessages() async {
    Dio dio = Dio();
    Response response = await dio.get(
      "https://api.jsonbin.io/v3/b/6300c2abe13e6063dc83f305",
      options: Options(
        headers: {
          "X-Access-Key":
              "\$2b\$10\$wQGwoUjJsbQt3a9A8LUCCuhG.lgH1CanFBCtGaZbgPCw5/QFP9WNS"
        },
      ),
    );
    List<dynamic> record = response.data['record'];
    List<MessageModel> messages =
        record.map((e) => MessageModel.fromJSON(e)).toList();
    return messages;
  }
}
