class EvolutionChainObj {
  Null babyTriggerItem;
  Chain chain;
  int id;

  EvolutionChainObj({this.babyTriggerItem, this.chain, this.id});

  EvolutionChainObj.fromJson(Map<String, dynamic> json) {
    babyTriggerItem = json['baby_trigger_item'];
    if(json['chain'] == null){
      print("achei vc");
    }else{
      chain = Chain.fromJson(json['chain']);
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['baby_trigger_item'] = this.babyTriggerItem;
    if (this.chain != null) {
      data['chain'] = this.chain.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Chain {
  List<EvolvesTo> evolvesTo;
  bool isBaby;
  Trigger species;

  Chain({this.evolvesTo, this.isBaby, this.species});

  Chain.fromJson(Map<String, dynamic> json) {
    if (json['evolves_to'] != null) {
      evolvesTo = new List<EvolvesTo>();
      json['evolves_to'].forEach((v) {
        evolvesTo.add(new EvolvesTo.fromJson(v));
      });
    }
    isBaby = json['is_baby'];
    species =
    json['species'] != null ? new Trigger.fromJson(json['species']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.evolvesTo != null) {
      data['evolves_to'] = this.evolvesTo.map((v) => v.toJson()).toList();
    }
    data['is_baby'] = this.isBaby;
    if (this.species != null) {
      data['species'] = this.species.toJson();
    }
    return data;
  }
}

class EvolvesTo {
  List<EvolvesTo> evolvesTo;
  bool isBaby;
  Trigger species;

  EvolvesTo({this.evolvesTo, this.isBaby, this.species});

  EvolvesTo.fromJson(Map<String, dynamic> json) {
    if (json['evolves_to'] != null) {
      evolvesTo = new List<EvolvesTo>();
      json['evolves_to'].forEach((v) {
        evolvesTo.add(new EvolvesTo.fromJson(v));
      });
    }
    isBaby = json['is_baby'];
    species =
    json['species'] != null ? new Trigger.fromJson(json['species']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.evolvesTo != null) {
      data['evolves_to'] = this.evolvesTo.map((v) => v.toJson()).toList();
    }
    data['is_baby'] = this.isBaby;
    if (this.species != null) {
      data['species'] = this.species.toJson();
    }
    return data;
  }
}

class Trigger {
  String name;
  String url;

  Trigger({this.name, this.url});

  Trigger.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}