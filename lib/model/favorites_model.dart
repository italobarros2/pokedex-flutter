class FavoritesModel {
  int id;
  String urlimage;
  String nome;
  String type;
  bool flag;

  FavoritesModel(int id, String urlimage, String nome, String type, bool flag){
    this.id = id;
    this.urlimage = urlimage;
    this.nome = nome;
    this.type = type;
    this.flag = flag;
  }

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urlimage = json['urlimage'];
    nome = json['nome'];
    type = json['type'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['urlimage'] = this.urlimage;
    data['nome'] = this.nome;
    data['type'] = this.type;
    data['flag'] = this.flag;
    return data;
  }
}
