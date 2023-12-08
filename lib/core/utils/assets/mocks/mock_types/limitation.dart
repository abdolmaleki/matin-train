import 'dart:convert';
import 'package:hoivalani/core/utils/architecture/data/common_models/limitation.dart';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';

class MockLimitationList implements MockData {
  String jsonData =
      "[{\"name\":\"pellentesqueeget\",\"description\":\"Morbiutodio.Crasmipede,malesuadain,imperdietet,commodovulputate,justo.Inblanditultricesenim.\"},{\"name\":\"nonvelit\",\"description\":\"Crasnonvelitnecnisivulputatenonummy.Maecenastinciduntlacusatvelit.Vivamusvelnullaegeteroselementumpellentesque.Quisqueportavolutpaterat.\"},{\"name\":\"odiodonec\",\"description\":\"Phasellusidsapieninsapieniaculiscongue.Vivamusmetusarcu,adipiscingmolestie,hendreritat,vulputatevitae,nisl.Aeneanlectus.Pellentesqueegetnunc.\"},{\"name\":\"congue\",\"description\":\"Crasnonvelitnecnisivulputatenonummy.Maecenastinciduntlacusatvelit.Vivamusvelnullaegeteroselementumpellentesque.\"}]";

  @override
  dynamic getMockJson() {
    return jsonDecode(jsonData);
  }

  @override
  List<LimitationModel> getMockObject() {
    List<LimitationModel> credits = List<LimitationModel>.from(
        getMockJson().map((model) => LimitationModel.fromJson(model)));
    return credits;
  }
}
