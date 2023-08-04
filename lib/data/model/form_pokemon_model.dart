/// form_name : ""
/// form_names : []
/// form_order : 1
/// id : 1
/// is_battle_only : false
/// is_default : true
/// is_mega : false
/// name : "bulbasaur"
/// names : []
/// order : 1
/// pokemon : {"name":"bulbasaur","url":"https://pokeapi.co/api/v2/pokemon/1/"}
/// sprites : {"back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png","back_female":null,"back_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png","back_shiny_female":null,"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png","front_female":null,"front_shiny":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png","front_shiny_female":null}
/// types : [{"slot":1,"type":{"name":"grass","url":"https://pokeapi.co/api/v2/type/12/"}},{"slot":2,"type":{"name":"poison","url":"https://pokeapi.co/api/v2/type/4/"}}]
/// version_group : {"name":"red-blue","url":"https://pokeapi.co/api/v2/version-group/1/"}

class FormPokemonModel {
  FormPokemonModel({
      String? formName, 
      List<Object>? formNames,
      num? formOrder, 
      num? id, 
      bool? isBattleOnly, 
      bool? isDefault, 
      bool? isMega, 
      String? name, 
      List<Object>? names,
      num? order, 
      Pokemon? pokemon, 
      Sprites? sprites, 
      List<Types>? types, 
      VersionGroup? versionGroup,}){
    _formName = formName;
    _formNames = formNames;
    _formOrder = formOrder;
    _id = id;
    _isBattleOnly = isBattleOnly;
    _isDefault = isDefault;
    _isMega = isMega;
    _name = name;
    _names = names;
    _order = order;
    _pokemon = pokemon;
    _sprites = sprites;
    _types = types;
    _versionGroup = versionGroup;
}

  FormPokemonModel.fromJson(dynamic json) {
    _formName = json['form_name'];
    if (json['form_names'] != null) {
      _formNames = [];
      json['form_names'].forEach((v) {
        _formNames?.add(v);
      });
    }
    _formOrder = json['form_order'];
    _id = json['id'];
    _isBattleOnly = json['is_battle_only'];
    _isDefault = json['is_default'];
    _isMega = json['is_mega'];
    _name = json['name'];
    if (json['names'] != null) {
      _names = [];
      json['names'].forEach((v) {
        _names?.add(v);
      });
    }
    _order = json['order'];
    _pokemon = json['pokemon'] != null ? Pokemon.fromJson(json['pokemon']) : null;
    _sprites = json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
    if (json['types'] != null) {
      _types = [];
      json['types'].forEach((v) {
        _types?.add(Types.fromJson(v));
      });
    }
    _versionGroup = json['version_group'] != null ? VersionGroup.fromJson(json['version_group']) : null;
  }
  String? _formName;
  List<Object>? _formNames;
  num? _formOrder;
  num? _id;
  bool? _isBattleOnly;
  bool? _isDefault;
  bool? _isMega;
  String? _name;
  List<Object>? _names;
  num? _order;
  Pokemon? _pokemon;
  Sprites? _sprites;
  List<Types>? _types;
  VersionGroup? _versionGroup;
FormPokemonModel copyWith({  String? formName,
  List<Object>? formNames,
  num? formOrder,
  num? id,
  bool? isBattleOnly,
  bool? isDefault,
  bool? isMega,
  String? name,
  List<Object>? names,
  num? order,
  Pokemon? pokemon,
  Sprites? sprites,
  List<Types>? types,
  VersionGroup? versionGroup,
}) => FormPokemonModel(  formName: formName ?? _formName,
  formNames: formNames ?? _formNames,
  formOrder: formOrder ?? _formOrder,
  id: id ?? _id,
  isBattleOnly: isBattleOnly ?? _isBattleOnly,
  isDefault: isDefault ?? _isDefault,
  isMega: isMega ?? _isMega,
  name: name ?? _name,
  names: names ?? _names,
  order: order ?? _order,
  pokemon: pokemon ?? _pokemon,
  sprites: sprites ?? _sprites,
  types: types ?? _types,
  versionGroup: versionGroup ?? _versionGroup,
);
  String? get formName => _formName;
  List<dynamic>? get formNames => _formNames;
  num? get formOrder => _formOrder;
  num? get id => _id;
  bool? get isBattleOnly => _isBattleOnly;
  bool? get isDefault => _isDefault;
  bool? get isMega => _isMega;
  String? get name => _name;
  List<dynamic>? get names => _names;
  num? get order => _order;
  Pokemon? get pokemon => _pokemon;
  Sprites? get sprites => _sprites;
  List<Types>? get types => _types;
  VersionGroup? get versionGroup => _versionGroup;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['form_name'] = _formName;
    if (_formNames != null) {
      map['form_names'] = _formNames?.map((v) => v).toList();
    }
    map['form_order'] = _formOrder;
    map['id'] = _id;
    map['is_battle_only'] = _isBattleOnly;
    map['is_default'] = _isDefault;
    map['is_mega'] = _isMega;
    map['name'] = _name;
    if (_names != null) {
      map['names'] = _names?.map((v) => v).toList();
    }
    map['order'] = _order;
    if (_pokemon != null) {
      map['pokemon'] = _pokemon?.toJson();
    }
    if (_sprites != null) {
      map['sprites'] = _sprites?.toJson();
    }
    if (_types != null) {
      map['types'] = _types?.map((v) => v.toJson()).toList();
    }
    if (_versionGroup != null) {
      map['version_group'] = _versionGroup?.toJson();
    }
    return map;
  }

}

/// name : "red-blue"
/// url : "https://pokeapi.co/api/v2/version-group/1/"

class VersionGroup {
  VersionGroup({
      String? name, 
      String? url,}){
    _name = name;
    _url = url;
}

  VersionGroup.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }
  String? _name;
  String? _url;
VersionGroup copyWith({  String? name,
  String? url,
}) => VersionGroup(  name: name ?? _name,
  url: url ?? _url,
);
  String? get name => _name;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

}

/// slot : 1
/// type : {"name":"grass","url":"https://pokeapi.co/api/v2/type/12/"}

class Types {
  Types({
      num? slot, 
      Type? type,}){
    _slot = slot;
    _type = type;
}

  Types.fromJson(dynamic json) {
    _slot = json['slot'];
    _type = json['type'] != null ? Type.fromJson(json['type']) : null;
  }
  num? _slot;
  Type? _type;
Types copyWith({  num? slot,
  Type? type,
}) => Types(  slot: slot ?? _slot,
  type: type ?? _type,
);
  num? get slot => _slot;
  Type? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['slot'] = _slot;
    if (_type != null) {
      map['type'] = _type?.toJson();
    }
    return map;
  }

}

/// name : "grass"
/// url : "https://pokeapi.co/api/v2/type/12/"

class Type {
  Type({
      String? name, 
      String? url,}){
    _name = name;
    _url = url;
}

  Type.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }
  String? _name;
  String? _url;
Type copyWith({  String? name,
  String? url,
}) => Type(  name: name ?? _name,
  url: url ?? _url,
);
  String? get name => _name;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

}

/// back_default : "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png"
/// back_female : null
/// back_shiny : "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png"
/// back_shiny_female : null
/// front_default : "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"
/// front_female : null
/// front_shiny : "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png"
/// front_shiny_female : null

class Sprites {
  Sprites({
      String? backDefault, 
      dynamic backFemale, 
      String? backShiny, 
      dynamic backShinyFemale, 
      String? frontDefault, 
      dynamic frontFemale, 
      String? frontShiny, 
      dynamic frontShinyFemale,}){
    _backDefault = backDefault;
    _backFemale = backFemale;
    _backShiny = backShiny;
    _backShinyFemale = backShinyFemale;
    _frontDefault = frontDefault;
    _frontFemale = frontFemale;
    _frontShiny = frontShiny;
    _frontShinyFemale = frontShinyFemale;
}

  Sprites.fromJson(dynamic json) {
    _backDefault = json['back_default'];
    _backFemale = json['back_female'];
    _backShiny = json['back_shiny'];
    _backShinyFemale = json['back_shiny_female'];
    _frontDefault = json['front_default'];
    _frontFemale = json['front_female'];
    _frontShiny = json['front_shiny'];
    _frontShinyFemale = json['front_shiny_female'];
  }
  String? _backDefault;
  dynamic _backFemale;
  String? _backShiny;
  dynamic _backShinyFemale;
  String? _frontDefault;
  dynamic _frontFemale;
  String? _frontShiny;
  dynamic _frontShinyFemale;
Sprites copyWith({  String? backDefault,
  dynamic backFemale,
  String? backShiny,
  dynamic backShinyFemale,
  String? frontDefault,
  dynamic frontFemale,
  String? frontShiny,
  dynamic frontShinyFemale,
}) => Sprites(  backDefault: backDefault ?? _backDefault,
  backFemale: backFemale ?? _backFemale,
  backShiny: backShiny ?? _backShiny,
  backShinyFemale: backShinyFemale ?? _backShinyFemale,
  frontDefault: frontDefault ?? _frontDefault,
  frontFemale: frontFemale ?? _frontFemale,
  frontShiny: frontShiny ?? _frontShiny,
  frontShinyFemale: frontShinyFemale ?? _frontShinyFemale,
);
  String? get backDefault => _backDefault;
  dynamic get backFemale => _backFemale;
  String? get backShiny => _backShiny;
  dynamic get backShinyFemale => _backShinyFemale;
  String? get frontDefault => _frontDefault;
  dynamic get frontFemale => _frontFemale;
  String? get frontShiny => _frontShiny;
  dynamic get frontShinyFemale => _frontShinyFemale;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['back_default'] = _backDefault;
    map['back_female'] = _backFemale;
    map['back_shiny'] = _backShiny;
    map['back_shiny_female'] = _backShinyFemale;
    map['front_default'] = _frontDefault;
    map['front_female'] = _frontFemale;
    map['front_shiny'] = _frontShiny;
    map['front_shiny_female'] = _frontShinyFemale;
    return map;
  }

}

/// name : "bulbasaur"
/// url : "https://pokeapi.co/api/v2/pokemon/1/"

class Pokemon {
  Pokemon({
      String? name, 
      String? url,}){
    _name = name;
    _url = url;
}

  Pokemon.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }
  String? _name;
  String? _url;
Pokemon copyWith({  String? name,
  String? url,
}) => Pokemon(  name: name ?? _name,
  url: url ?? _url,
);
  String? get name => _name;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

}