import 'dart:convert';
import 'package:hoivalani/core/utils/architecture/data/common_models/punishment.dart';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';

class MockPunishmentList implements MockData {
  String jsonData =
      "[{\"name\":\"pellentesqueeget\",\"description\":\"Morbiutodio.Crasmipede,malesuadain,imperdietet,commodovulputate,justo.Inblanditultricesenim.\"},{\"name\":\"nonvelit\",\"description\":\"Crasnonvelitnecnisivulputatenonummy.Maecenastinciduntlacusatvelit.Vivamusvelnullaegeteroselementumpellentesque.Quisqueportavolutpaterat.\"},{\"name\":\"odiodonec\",\"description\":\"Phasellusidsapieninsapieniaculiscongue.Vivamusmetusarcu,adipiscingmolestie,hendreritat,vulputatevitae,nisl.Aeneanlectus.Pellentesqueegetnunc.\"},{\"name\":\"congue\",\"description\":\"Crasnonvelitnecnisivulputatenonummy.Maecenastinciduntlacusatvelit.Vivamusvelnullaegeteroselementumpellentesque.\"}]";

  @override
  dynamic getMockJson() {
    return jsonDecode(jsonData);
  }

  @override
  List<PunishmentModel> getMockObject() {
    List<PunishmentModel> credits = List<PunishmentModel>.from(
        getMockJson().map((model) => PunishmentModel.fromJson(model)));
    return credits;
  }
}
