class Fact {
  List<Facts>? facts;

  Fact({this.facts});

  Fact.fromJson(Map<String, dynamic> json) {
    if (json['facts'] != null) {
      facts = <Facts>[];
      json['facts'].forEach((v) {
        facts!.add(Facts.fromJson(v));
      });
    }
  }
}

class Facts {
  String? fact;

  Facts({this.fact});

  Facts.fromJson(String? json) {
    fact = json;
  }
}
