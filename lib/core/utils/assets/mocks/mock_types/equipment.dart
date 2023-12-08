import 'dart:convert';
import 'package:hoivalani/core/utils/architecture/data/common_models/equipment.dart';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';

class MockEquipmentList implements MockData {
  String jsonData =
      "[{\"name\":\"pellentesqueeget\",\"description\":\"Morbiutodio.Crasmipede,malesuadain,imperdietet,commodovulputate,justo.Inblanditultricesenim.\"},{\"name\":\"nonvelit\",\"description\":\"Crasnonvelitnecnisivulputatenonummy.Maecenastinciduntlacusatvelit.Vivamusvelnullaegeteroselementumpellentesque.Quisqueportavolutpaterat.\"},{\"name\":\"odiodonec\",\"description\":\"Phasellusidsapieninsapieniaculiscongue.Vivamusmetusarcu,adipiscingmolestie,hendreritat,vulputatevitae,nisl.Aeneanlectus.Pellentesqueegetnunc.\"},{\"name\":\"congue\",\"description\":\"Crasnonvelitnecnisivulputatenonummy.Maecenastinciduntlacusatvelit.Vivamusvelnullaegeteroselementumpellentesque.\"}]";

  @override
  dynamic getMockJson() {
    return jsonDecode(jsonData);
  }

  @override
  List<EquipmentModel> getMockObject() {
    List<EquipmentModel> credits = List<EquipmentModel>.from(
        getMockJson().map((model) => EquipmentModel.fromJson(model)));
    return credits;
  }
}
