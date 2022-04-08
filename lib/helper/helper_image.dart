import 'package:assignment_5/model/model_image.dart';
import 'package:http/http.dart' as http;

class ImageHelper{
  Future<List<KImage>?> getImage() async{
   var imResponse =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

   if(imResponse.statusCode==200){
     var json=imResponse.body;
     return welcomeFromJson(json);
   }
  }
}