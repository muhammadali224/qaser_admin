import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class BranchData {
  CRUD crud;

  BranchData(this.crud);

  changeBranchState(int branchId, int branchState) async {
    var response = await crud.postData(AppLink.changeBranchState, {
      'branchId': branchId.toString(),
      'branchState': branchState.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  getBranchData(int branchId) async {
    var response = await crud.postData(AppLink.getBranchData, {
      'branchId': branchId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
