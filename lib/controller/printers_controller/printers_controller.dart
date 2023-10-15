// import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
import 'dart:async';
import 'dart:developer';
import 'dart:io' show Platform;

import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/cupertino.dart' hide Image;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image/image.dart';
import 'package:smart_bluetooth_pos_printer/smart_bluetooth_pos_printer.dart';

import '../../core/services/priter_services.dart';
import '../../core/services/services.dart';
import '../../data/model/order_details_model.dart';
import '../../data/model/orders_model.dart';
import '../../generated/assets.dart';
import '../../view/screen/printers/printers.dart';
import '../../view/widget/printer_widgets.dart';

class PrintersController extends GetxController {
  var isBle = false;
  var reconnect = false;
  var isConnected = false;
  var printerManager = PrinterManager.instance;
  var devices = <BluetoothPrinter>[];
  StreamSubscription<List<PrinterDevice>>? subscription;
  StreamSubscription<BTStatus>? subscriptionBtStatus;
  BTStatus currentStatus = BTStatus.none;

  MyServices myServices = Get.find();
  List<int>? pendingTask;
  BluetoothPrinter? selectedPrinter;

  final ipController = TextEditingController();

  void scan() {
    printerManager.startScan(timeout: const Duration(seconds: 4), isBle: true);
    subscription = printerManager.scanResults().listen((results) {
      devices.clear();
      for (PrinterDevice r in results) {
        devices.add(BluetoothPrinter(
          deviceName: r.name,
          address: r.address,
          isBle: isBle,
        ));
      }
      print(devices.length);
      update();
    });
  }

  void selectDevice(BluetoothPrinter device) async {
    if (selectedPrinter != null) {
      if (device.address != selectedPrinter!.address) {
        await PrinterManager.instance.disconnect();
      }
    }

    selectedPrinter = device;
    update();
  }

  Future printReceiveTest() async {
    List<int> bytes = [];

    // Xprinter XP-N160I
    final profile = await CapabilityProfile.load(name: 'XP-N160I');
    // PaperSize.mm80 or PaperSize.mm58

    final generator = Generator(PaperSize.mm80, profile);

    bytes += generator.setGlobalCodeTable('CP1252');

    try {
      log('connected');
      final ByteData data = await rootBundle.load(Assets.imagesQaser);
      final Uint8List imageLogo8 = data.buffer.asUint8List();
      final Image? imageLogo = decodeImage(imageLogo8);

      // table header
      Uint8List? tableHeaderAs8List = await createImageFromWidget(
        tableHeader(),
        logicalSize: const Size(500, 500),
        imageSize: const Size(680, 680),
      );
      final Image tableHeaderImage = decodeImage(tableHeaderAs8List!)!;

      // divider
      Uint8List? dividerAs8List = await createImageFromWidget(
        divider(),
        logicalSize: const Size(500, 500),
        imageSize: const Size(680, 680),
      );
      final Image dividerImage = decodeImage(dividerAs8List!)!;

      // table item row

      // invoice ref & print time
      Uint8List? invoiceRefAndPrintTimeAs8List = await createImageFromWidget(
        referenceNoAndPrintTime(),
        logicalSize: const Size(500, 500),
        imageSize: const Size(680, 680),
      );
      final Image invoiceRefAndPrintTimerImage =
          decodeImage(invoiceRefAndPrintTimeAs8List!)!;
      bytes += generator.image(imageLogo!);
      bytes += generator.image(tableHeaderImage);
      bytes += generator.image(dividerImage);

      bytes += generator.image(dividerImage);
      bytes += generator.image(invoiceRefAndPrintTimerImage);
      bytes += generator.cut();
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
    }
    printEscPos(bytes, generator);
  }

  Future printReceive(OrdersModel ordersModel,
      List<OrderDetailsModel> orderDetailsModel, String phoneNumber) async {
    List<int> bytes = [];

    // Xprinter XP-N160I
    final profile = await CapabilityProfile.load(name: 'XP-N160I');
    // PaperSize.mm80 or PaperSize.mm58

    final generator = Generator(PaperSize.mm80, profile);

    bytes += generator.setGlobalCodeTable('CP1252');

    try {
      log('connected');
      final ByteData data = await rootBundle.load(Assets.imagesQaser);
      final Uint8List imageLogo8 = data.buffer.asUint8List();
      final Image? imageLogo = decodeImage(imageLogo8);

      Uint8List? companyNameAs8List = await createImageFromWidget(
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // companyName(),
            branchName(branchName: ordersModel.branchNameAr!),
            phoneNo(phoneNumber: phoneNumber),
            cashierNameAndPostingDate(
                orderTime: ordersModel.ordersTime!,
                cashName: myServices.sharedPref.getString('userName')!),
            // invoiceStatusAndOrderType(),
            orderNo(orderNumber: ordersModel.ordersId.toString()),
          ],
        ),
        logicalSize: const Size(500, 500),
        imageSize: const Size(680, 680),
      );
      final Image companyNameImage = decodeImage(companyNameAs8List!)!;

      // table header
      Uint8List? tableHeaderAs8List = await createImageFromWidget(
        tableHeader(),
        logicalSize: const Size(500, 500),
        imageSize: const Size(680, 680),
      );
      final Image tableHeaderImage = decodeImage(tableHeaderAs8List!)!;

      // divider
      Uint8List? dividerAs8List = await createImageFromWidget(
        divider(),
        logicalSize: const Size(500, 500),
        imageSize: const Size(680, 680),
      );
      final Image dividerImage = decodeImage(dividerAs8List!)!;

      // table item row
      Uint8List? tableItemRowAs8List = await createImageFromWidget(
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...List.generate(orderDetailsModel.length, (index) {
              var data = orderDetailsModel[index];
              divider();
              return tableItemRow(
                quantity: data.countitems.toString(),
                unit: data.cartSizeWeightId.toString(),
                itemsName: data.itemsNameAr!,
                itemPrice: data.itemsprice.toString(),
                itemNote: data.cartItemNote!,
              );
            }),
          ],
        ),
        logicalSize: const Size(500, 500),
        imageSize: const Size(680, 680),
      );
      final Image tableItemRowImage = decodeImage(tableItemRowAs8List!)!;

      // table item row
      Uint8List? deliverToAs8List = await createImageFromWidget(
        deliverTo(
            orderType: ordersModel.ordersType!,
            userName: ordersModel.usersName!,
            userPhone: ordersModel.usersPhone!,
            userLocation:
                "${ordersModel.addressName} | ${ordersModel.addressCity}\n${ordersModel.addressStreet}"),
        logicalSize: const Size(500, 500),
        imageSize: const Size(680, 680),
      );
      final Image deliverToImage = decodeImage(deliverToAs8List!)!;

      // table footer
      Uint8List? tableFooterRowAs8List = await createImageFromWidget(
        tableFooter(
            deliveryCharge: "${ordersModel.ordersDeliveryFee}",
            discountPrice: ordersModel.couponName,
            discountValue: ordersModel.ordersDiscountAmmount.toString(),
            totalPrice: ordersModel.ordersTotalPrice.toString(),
            orderType: ordersModel.ordersType!),
        logicalSize: const Size(500, 500),
        imageSize: const Size(680, 680),
      );
      final Image tableFooterImage = decodeImage(tableFooterRowAs8List!)!;

      // invoice ref & print time
      Uint8List? invoiceRefAndPrintTimeAs8List = await createImageFromWidget(
        referenceNoAndPrintTime(),
        logicalSize: const Size(500, 500),
        imageSize: const Size(680, 680),
      );
      final Image invoiceRefAndPrintTimerImage =
          decodeImage(invoiceRefAndPrintTimeAs8List!)!;
      bytes += generator.image(imageLogo!);
      bytes += generator.image(companyNameImage);
      bytes += generator.image(tableHeaderImage);
      bytes += generator.image(dividerImage);
      bytes += generator.image(tableItemRowImage);
      bytes += generator.image(dividerImage);
      bytes += generator.image(tableFooterImage);
      bytes += generator.image(deliverToImage);
      if (ordersModel.ordersType == 1) {
        bytes += generator.qrcode(
            "https://www.google.com/maps/search/?api=1&query=${ordersModel.addressLat},${ordersModel.addressLong}",
            size: QRSize.Size8);
      }
      bytes += generator.image(invoiceRefAndPrintTimerImage);
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
    }
    printEscPos(bytes, generator);
  }

  /// print ticket
  void printEscPos(List<int> bytes, Generator generator) async {
    if (selectedPrinter == null) return;
    var bluetoothPrinter = selectedPrinter!;

    bytes += generator.cut();
    bytes += generator.beep(n: 2, duration: PosBeepDuration.beep300ms);
    bytes += generator.reset();

    await printerManager.connect(
        model: BluetoothPrinterInput(
            name: bluetoothPrinter.deviceName,
            address: bluetoothPrinter.address!,
            isBle: bluetoothPrinter.isBle ?? false,
            autoConnect: reconnect));
    pendingTask = null;
    if (Platform.isAndroid) pendingTask = bytes;

    if (Platform.isAndroid) {
      if (currentStatus == BTStatus.connected) {
        printerManager.send(bytes: bytes);
        pendingTask = null;
      }
    } else {
      printerManager.send(bytes: bytes);
    }
  }

  connectDevice() async {
    isConnected = false;
    if (selectedPrinter == null) return;
    await printerManager.connect(
        model: BluetoothPrinterInput(
            name: selectedPrinter!.deviceName,
            address: selectedPrinter!.address!,
            isBle: selectedPrinter!.isBle ?? false,
            autoConnect: reconnect));

    update();
  }

  @override
  void onInit() {
    scan();

    // subscription to listen change status of bluetooth connection
    subscriptionBtStatus =
        PrinterManager.instance.stateBluetooth.listen((status) {
      log(' ----------------- status bt $status ------------------ ');
      currentStatus = status;
      if (status == BTStatus.connected) {
        isConnected = true;
        update();
      }
      if (status == BTStatus.none) {
        isConnected = false;
        update();
      }
      if (status == BTStatus.connected && pendingTask != null) {
        if (Platform.isAndroid) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            PrinterManager.instance.send(bytes: pendingTask!);
            pendingTask = null;
          });
        } else if (Platform.isIOS) {
          PrinterManager.instance.send(bytes: pendingTask!);
          pendingTask = null;
        }
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    subscription?.cancel();
    subscriptionBtStatus?.cancel();

    super.dispose();
  }
}
