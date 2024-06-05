import '../../../resources/helpers/all_imports.dart';

class RestaurantDetailsController extends GetxController {
  final DeliveryRecordsRepository deliveryRecordsRepository;
  final RestaurantsRepository restaurantsRepository;

  RestaurantDetailsController({
    required this.deliveryRecordsRepository,
    required this.restaurantsRepository,
  });

  late RestaurantModel restaurantModel;

  @override
  void onInit() {
    restaurantModel = Get.arguments['restaurantModel'];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getRestaurantData();
    });
    super.onInit();
  }

  @override
  void onClose() {
    stream?.cancel();
    super.onClose();
  }

  bool isDataLoading = true;
  bool isStatusLoading = true;
  bool hasError = false;
  late RestaurantStatus restaurantStatus;

  Future<void> getRestaurantData() async {
    try {
      _getRestaurantStatus();
      isDataLoading = false;
      update();
    } catch (_) {
      isDataLoading = false;
      hasError = true;
      update();
      ExceptionManager().showException();
    }
  }

  String statusText() {
    switch (restaurantStatus) {
      case RestaurantStatus.idle:
        return localizations.goToRestaurant;
      case RestaurantStatus.goingToRestaurant:
        return localizations.restaurantAccessed;
      case RestaurantStatus.waitingInRestaurant:
        return localizations.orderReceived;
      case RestaurantStatus.goingToClient:
        return localizations.clientAccessed;
      default:
        return '';
    }
  }

  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? stream;
  Future<void> _getRestaurantStatus() async {
    try {
      stream = restaurantsRepository
          .getRestaurantStatus(restaurantId: restaurantModel.id!)
          .listen((value) {
        final Map<String, dynamic>? data = value.data();
        if (data == null) {
          restaurantStatus = RestaurantStatus.idle;
        } else {
          restaurantStatus = RestaurantStatus.values.byName(data['status']);
        }
        if (isStatusLoading) {
          isStatusLoading = false;
        }
        update();
      });
    } catch (_) {
      rethrow;
    }
  }

  Future<void> changeStatus(BuildContext context) async {
    try {
      Components().showLoading();
      final Position? position =
          await LocationService().getCurrentLocation(context);
      if (position == null) {
        Components().dismissLoading();
        return;
      }
      RestaurantStatus status = RestaurantStatus.idle;
      if (restaurantStatus == RestaurantStatus.idle) {
        status = RestaurantStatus.goingToRestaurant;
      } else if (restaurantStatus == RestaurantStatus.goingToRestaurant) {
        status = RestaurantStatus.waitingInRestaurant;
      } else if (restaurantStatus == RestaurantStatus.waitingInRestaurant) {
        status = RestaurantStatus.goingToClient;
      } else if (restaurantStatus == RestaurantStatus.goingToClient) {
        status = RestaurantStatus.idle;
      }
      await _addDeliveryRecord(position);
      await restaurantsRepository.changeRestaurantStatus(
        restaurantId: restaurantModel.id!,
        restaurantStatus: status,
      );
      Components().dismissLoading();
    } catch (_) {
      Components().dismissLoading();
      ExceptionManager().showException();
    }
  }

  Future<void> _addDeliveryRecord(Position position) async {
    try {
      final DeliveryRecordModel deliveryRecordModel = DeliveryRecordModel(
        restaurantId: restaurantModel.id!,
        restaurantName: restaurantModel.name!,
        latitude: position.latitude,
        longitude: position.longitude,
        timestamp: position.timestamp,
        status: restaurantStatus.name,
      );

      await deliveryRecordsRepository.addDeliveryRecord(
        deliveryRecordModel: deliveryRecordModel,
      );
      Components().dismissLoading();
    } catch (_) {
      Components().dismissLoading();
      ExceptionManager().showException();
    }
  }

  Future<void> getDeliveryRecord() async {
    try {
      Components().showLoading();
      final List<DeliveryRecordModel> deliveryRecordsList =
          await deliveryRecordsRepository.getDeliveryRecords(
        restaurantId: restaurantModel.id!,
      );
      if (deliveryRecordsList.isNotEmpty) {
        await _exportToExcel(deliveryRecordsList);
      }

      Components().dismissLoading();
    } catch (_) {
      Components().dismissLoading();
      ExceptionManager().showException();
    }
  }

  Future<void> _exportToExcel(List<DeliveryRecordModel> records) async {
    final Excel excel = Excel.createExcel();
    const String sheetName = 'DeliveryRecords';
    // Remove the default sheet
    excel.delete('Sheet1');
    final Sheet sheet = excel[sheetName];
    excel.setDefaultSheet(sheetName);

    // Define the headers
    final List<CellValue> headers = [
      const TextCellValue('Restaurant ID'),
      const TextCellValue('Restaurant Name'),
      const TextCellValue('Timestamp'),
      const TextCellValue('Status'),
      const TextCellValue('Latitude'),
      const TextCellValue('Longitude'),
    ];
    sheet.appendRow(headers);

    // Add the data rows
    for (DeliveryRecordModel record in records) {
      final List<CellValue> row = [
        TextCellValue('${record.restaurantId}'),
        TextCellValue('${record.restaurantName}'),
        TextCellValue(
            DateFormat('dd/MM/yyyy hh:mm:ss').format(record.timestamp!)),
        TextCellValue('${record.status}'),
        TextCellValue('${record.latitude}'),
        TextCellValue('${record.longitude}'),
      ];
      sheet.appendRow(row);
    }

    // Save the file
    // final Directory? directory = await getExternalStorageDirectory();
    final Directory directory = Directory('/storage/emulated/0/Download');

    final String fileName =
        '${records.first.restaurantName}-DeliveryRecords.xlsx';
    final String filePath = '${directory.path}/$fileName';
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.save()!);

    Components().snackBar(
      message: '${localizations.fileDownloadedAt} Download/$fileName',
      snackBarStatus: SnackBarStatus.success,
    );
  }
}
