class UserApp {
  String _uid = "";

  UserApp(String inUID) {
    this._uid = inUID;
  }

  String getUID() {
    return this._uid;
  }

  UserApp.fromJSON(Map<String, dynamic> parsedJSON) {
    _uid = parsedJSON['uid'];
  }
}
