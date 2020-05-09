import 'dart:convert';
import 'package:http/http.dart';
import 'package:Amuzic/apiKeyYT.dart';
class ValidatorYT{
  final String _apiKey= apiKeyYT;
  Future<Map> validateChannel(String channelId) async{
    Response response = await get('https://www.googleapis.com/youtube/v3/channels?part=snippet&id='+channelId+'&key='+_apiKey);
    Map jsonRes=jsonDecode(response.body);
    //print(jsonRes['items'][0]['snippet']['thumbnails']);
    if(jsonRes['pageInfo']['totalResults']!=0){
      print('exists');
      return {
        'exists':true,
        'img': jsonRes['items'][0]['snippet']['thumbnails']['medium']['url'],
        'title':jsonRes['items'][0]['snippet']['title'],
        'id':channelId
      };
    }else{
      return {'exists':false};
    }    
  }
}