abstract class DatabaseService {
  Future<void> getdata({required String path, required Map<String, dynamic> data});
  Future<Map<String, dynamic>?> getDataByIndex({
    required String path,
    required String documentId,
    required String index,
  });
}
