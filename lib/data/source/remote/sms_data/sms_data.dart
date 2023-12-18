import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';

class SMSData {
  CRUD crud;

  SMSData(this.crud);

  getBalance() async {
    var response = await crud.postData(AppLink.getSMSBalance, {});
    return response.fold((l) => l, (r) => r);
  }

  getAllSMS() async {
    var response = await crud.postData(AppLink.getAllSMS, {});
    return response.fold((l) => l, (r) => r);
  }

  sendUserSMS({
    required String title,
    required String mobile,
  }) async {
    var response = await crud.postData(AppLink.sendUserSMS, {
      "to": mobile,
      "message": title,
    });
    return response.fold((l) => l, (r) => r);
  }
}
