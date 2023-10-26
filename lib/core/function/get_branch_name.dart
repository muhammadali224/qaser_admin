import 'package:get/get.dart';

import '../../data/source/shared/branch_list.dart';

String? getBranchName(int branchId) {
  return branchList
      .firstWhereOrNull((element) => branchId == element.branchId)
      ?.branchNameAr!;
}
