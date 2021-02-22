import 'package:no5_flutter_tests/model/conpass_api_model.dart';
import 'package:no5_flutter_tests/model/conpass_api_model_events.dart';
class ConpassAPIModelRepository {
  var instance_lists = [];
    ConpassAPIModelRepository(conpass_decode) {
     var _ConpassAPIModel = new ConpassAPIModel.fromJson(conpass_decode);
      for (int i = 0; i <=50; i++){
        var _ConpassAPIModelEvents = new ConpassAPIModelEvents.fromJson(
            _ConpassAPIModel.events[i]);
        this.instance_lists.add(_ConpassAPIModelEvents);
        // print(this.instance_lists);
      }
  }
}