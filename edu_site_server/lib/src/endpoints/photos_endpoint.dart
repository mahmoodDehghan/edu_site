import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';

///Handles Uploading public photos and downloading them

class PhotosEndpoint extends Endpoint {
  Future<String?> getPhotosUploadDescription(
      Session session, String path) async {
    return await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
    );
  }

  Future<bool> verifyPhotoUploaded(Session session, String path) async {
    return await session.storage.verifyDirectFileUpload(
      storageId: 'public',
      path: path,
    );
  }

  Future<bool> isPublicPhotoExist(Session session, String path) async {
    return await session.storage.fileExists(
      storageId: 'public',
      path: path,
    );
  }

  Future<ByteData?> getPublicPhotoFile(Session session, String path) async {
    return await session.storage.retrieveFile(
      storageId: 'public',
      path: path,
    );
  }

  Future<String> getPublicPhotoUrl(Session session, String path) async {
    var url = await session.storage.getPublicUrl(
      storageId: 'public',
      path: path,
    );
    return url!.toString();
  }
}
