import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitflow/core/services/data_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> getdata({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await firestore.collection(path).add(data);
  }

  @override
  Future<Map<String, dynamic>?> getDataByIndex({
    required String path,
    required String documentId,
    required String index,
  }) async {
    try {
      final doc = await firestore.collection(path).doc(documentId).get();
      if (doc.exists) {
        final data = doc.data();
        if (data != null) {
          final details = data['details']?[index];
          final diet = data['diet']?[index];
          if (details != null && diet != null) {
            return {'details': details, 'diet': diet};
          }
        }
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
    return null;
  }
}
