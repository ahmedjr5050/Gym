import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitflow/core/services/data_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  Future<bool> checkIfDataExists({
    required String path,
    required String docuementId,
  }) async {
    var data = await firestore.collection(path).doc(docuementId).get();
    return data.exists;
  }

  // تنفيذ دالة حذف البيانات
  Future<void> deleteData({
    required String path,
    required String docuementId,
  }) async {
    await firestore.collection(path).doc(docuementId).delete();
  }
}
