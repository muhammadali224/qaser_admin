import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

// logo
// Widget logo() {
//   return Image.asset(
//     Assets.imagesLogo,
//     color: Colors.black,
//     scale: 0.6,
//   );
// }

// company name
// Widget companyName() {
//   return const Text('القصر الشرقي',
//       style: TextStyle(
//           color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold));
// }

// branch name
Widget branchName({required String branchName}) {
  return Text(branchName,
      style: const TextStyle(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold));
}

// vat no
Widget phoneNo({required String phoneNumber}) {
  return Text('Phone No.: $phoneNumber',
      style: const TextStyle(color: Colors.black, fontSize: 18));
}

// order no
Widget orderNo({required String orderNumber}) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: 200,
    height: 50,
    padding: const EdgeInsets.all(6),
    decoration:
        BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
    child: Text("#$orderNumber",
        style: const TextStyle(
            color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold)),
  );
}

// cashier name & posting date
Widget cashierNameAndPostingDate(
    {required String orderTime, required String cashName}) {
  return Container(
    padding: const EdgeInsets.all(6),
    child: Text('$cashName| $orderTime',
        style: const TextStyle(color: Colors.black, fontSize: 18)),
  );
}

// invoice status & order type
// Widget invoiceStatusAndOrderType() {
//   return Container(
//     padding: const EdgeInsets.all(6),
//     child: const Text('Paid | Takeaway',
//         style: TextStyle(color: Colors.black, fontSize: 18)),
//   );
// }

// table header
Widget tableHeader() {
  return const SizedBox(
    width: 420,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            flex: 2,
            child: Text('الكمية',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
        Flexible(
            flex: 2,
            child: Text('الوحدة',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
        Flexible(
          flex: 5,
          fit: FlexFit.tight,
          child: Text(
            'الصنف',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            maxLines: 10,
            textAlign: TextAlign.start,
          ),
        ),
        Flexible(
            flex: 2,
            child: Text(
              'السعر',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
      ],
    ),
  );
}

// table item row
Widget tableItemRow({
  required String quantity,
  required String unit,
  required String itemsName,
  required String itemPrice,
  required String itemNote,
}) {
  return SizedBox(
    // padding: EdgeInsets.symmetric(vertical: 6),
    width: 420,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                flex: 2,
                child: Text(quantity,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
            Flexible(
                flex: 3,
                child: Text(unit,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Text(itemsName,
                  maxLines: 10,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
            ),
            Flexible(
                flex: 2,
                child: Text('jd $itemPrice',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
          ],
        ),
        if (itemNote != "  ") const SizedBox(height: 5),
        if (itemNote != "  ")
          Text("ملاحظات: $itemNote",
              textAlign: TextAlign.start,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        divider(300),
      ],
    ),
  );
}

// table footer
Widget tableFooter({
  required String deliveryCharge,
  required String? discountPrice,
  required String discountValue,
  required String totalPrice,
  required int orderType,
}) {
  return SizedBox(
    width: 420,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (orderType == 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                  flex: 2,
                  child: Text('التوصيل ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))),
              const Flexible(
                flex: 6,
                fit: FlexFit.tight,
                child: Text(
                  '',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  maxLines: 10,
                  textAlign: TextAlign.start,
                ),
              ),
              Flexible(
                  flex: 2,
                  child: Text(
                    "jd $deliveryCharge",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        if (discountPrice != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                  flex: 2,
                  child: Text('الخصم',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))),
               Flexible(
                flex: 6,
                fit: FlexFit.tight,
                child: Text(
                  discountValue,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  maxLines: 10,
                  textAlign: TextAlign.start,
                ),
              ),
              Flexible(
                  flex: 2,
                  child: Text(
                    "jd $discountPrice",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(
                flex: 2,
                child: Text('الاجمالي',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
            const Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Text(
                '',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                maxLines: 10,
                textAlign: TextAlign.start,
              ),
            ),
            Flexible(
                flex: 3,
                child: Text(
                  "jd $totalPrice",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ],
    ),
  );
}

// invoice reference no
Widget referenceNoAndPrintTime() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      // const Text('POS354635403 | 334345434',
      //     style: TextStyle(color: Colors.black, fontSize: 18)),
      Text(Jiffy.now().format(pattern: "dd/MM/yyyy hh:mm a").toString(),
          style: const TextStyle(color: Colors.black, fontSize: 20)),
    ],
  );
}

Widget deliverTo({
  required int orderType,
  required String userName,
  required String userPhone,
  required String userLocation,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(orderType == 0 ? "إستلام" : 'توصيل',
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
      Text(userName,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
      Text('رقم الهاتف : $userPhone',
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
      if (orderType == 1)
        Text(userLocation,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
    ],
  );
}

// divider
Widget divider([double? width]) {
  return SizedBox(
    width: width ?? 420,
    height: 10,
    child: const Divider(
      thickness: 1.5,
      color: Colors.black,
    ),
  );
}
