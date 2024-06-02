import 'scope_storage.dart';

class ShareStore extends ScopeStorage {
  //Singleton Class
  static final ShareStore _default = new ShareStore._internal();

  factory ShareStore() {
    return _default;
  }

  ShareStore._internal();
}
