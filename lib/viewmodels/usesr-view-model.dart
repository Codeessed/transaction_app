import 'package:cashir_app/common/base-view-model.dart';
import 'package:cashir_app/helper/locator.dart';
import 'package:cashir_app/model/data/user-details.model.dart';
import 'package:cashir_app/model/data/user-response.model.dart';
import 'package:cashir_app/services/user-service.dart';

class UserViewModel extends BaseViewModel {

  AuthService authService = locator<AuthService>();

  UserResponseModel? _details = null;
  UserResponseModel? get details => _details;

  bool _loading = false;
  bool get loading => _loading;

  Future<bool> getDetailsFromServer() async {
    _details = null;
    _loading = true;
    notifyListeners();
    try{
      UserResponseModel userResponse = await authService.signUp();
      _details = userResponse;
      // print(UserDetailsModel.fromJson(userResponse));
      // _details = userResponse;
      // var booksData = BookResponseModel.fromJson(booksResponse.data as Map<dynamic, dynamic>);
      // CachedData.saveBooksToCache({
      //   'books': booksData.data.map((e) => e.toJson()).toList(),
      //   'lastUpdated': DateTime.now().toString(),
      // });
      _loading = false;
      notifyListeners();
      return true;
    }catch(e){
      print(e.toString());
      _loading = false;
      notifyListeners();
      return false;
    }
  }


}
