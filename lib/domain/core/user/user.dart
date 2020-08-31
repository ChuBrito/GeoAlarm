class AppUser {
  final String _name;
  final String _type;
  final String _token;

  AppUser(this._name, this._type, this._token);

  String get getName => _name;

  String get getType => _type;

  String get getToken => _token;
}
