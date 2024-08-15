import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:totalx_machine_task/src/feature/user_management/data/data_source/remote/manage_user_data_source.dart';
import 'package:totalx_machine_task/src/feature/user_management/data/mappers/user_mapper.dart';
import 'package:totalx_machine_task/src/feature/user_management/data/models/user_model.dart';
import 'package:totalx_machine_task/src/feature/user_management/domain/entities/user_entity.dart';

class ManageUserDataSourceImpl implements ManageUserDataSource {
  final fireStorage = FirebaseStorage.instance;
  final fireStore = FirebaseFirestore.instance;

  @override
  Future<void> addUser(UserEntity user) async {
    String? profileUrl;

    if (user.profile != null) {
      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference refDir = fireStorage.ref().child('Profiles');
      Reference refDirToUpload = refDir.child(uniqueFileName);

      try {
        await refDirToUpload.putFile(File(user.profile!));
        profileUrl = await refDirToUpload.getDownloadURL();
      } catch (e) {
        log('Error uploading image: $e');
      }
    }

    DocumentReference docRef = fireStore.collection('users').doc();
    user.id = docRef.id;
    user.profile = profileUrl;

    UserModel userModel = UserMapper.mapToModel(user);
    await docRef.set(userModel.toMap());
    log('New user added!!');
  }

  @override
  Stream<List<UserEntity>> getAllUsers() {
    final data = fireStore.collection('users').snapshots().map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            final data = doc.data();
            final userModel = UserModel.fromJson(data);
            return UserMapper.mapToEntity(userModel);
          },
        ).toList();
      },
    );
    return data;
  }
}
