import 'dart:convert';
import 'package:team_project/core/utils/architecture/data/common_models/license.dart';
import 'package:team_project/core/utils/assets/mocks/mock_factory.dart';

class MockLicenseList implements MockData {
  String jsonData =
      "[{\"name\":\"pellentesqueeget\",\"description\":\"Morbiutodio.Crasmipede,malesuadain,imperdietet,commodovulputate,justo.Inblanditultricesenim.\"},{\"name\":\"nonvelit\",\"description\":\"Crasnonvelitnecnisivulputatenonummy.Maecenastinciduntlacusatvelit.Vivamusvelnullaegeteroselementumpellentesque.Quisqueportavolutpaterat.\"},{\"name\":\"odiodonec\",\"description\":\"Phasellusidsapieninsapieniaculiscongue.Vivamusmetusarcu,adipiscingmolestie,hendreritat,vulputatevitae,nisl.Aeneanlectus.Pellentesqueegetnunc.\"},{\"name\":\"congue\",\"description\":\"Crasnonvelitnecnisivulputatenonummy.Maecenastinciduntlacusatvelit.Vivamusvelnullaegeteroselementumpellentesque.\"}]";

  @override
  dynamic getMockJson() {
    return jsonDecode(jsonData);
  }

  @override
  List<LicenseModel> getMockObject() {
    List<LicenseModel> credits = List<LicenseModel>.from(
        getMockJson().map((model) => LicenseModel.fromJson(model)));
    return credits;
  }
}
