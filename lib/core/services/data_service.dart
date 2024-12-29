abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<bool> checkIfDataExists({
    required String path,
    required String docuementId,
  });



  // إضافة دالة لحذف البيانات
  Future<void> deleteData({
    required String path,
    required String docuementId,
  });
}
