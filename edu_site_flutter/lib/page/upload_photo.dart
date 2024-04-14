import 'dart:async';
import 'dart:html';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:edu_site_client/edu_site_client.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({super.key});

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  final _textController = TextEditingController();
  String? _fileName;
  int? _fileLength;
  String? _uploaded;
  ByteData? _fileBytes;
  bool _filePicked = false;
  String _message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Upload Photo!"),
        ),
        body: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 400,
                      height: 45,
                      child: TextField(
                        controller: _textController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () async {
                        if (_filePicked) {
                          final path = "publicPhotos/$_fileName";
                          if (await client.photos.isPublicPhotoExist(path)) {
                            final fileUrl =
                                await client.photos.getPublicPhotoUrl(path);
                            print(fileUrl);
                            setState(() {
                              _message = "File is already uploaded!";
                              _uploaded = fileUrl;
                            });
                            return;
                          }

                          var uploadDescription = await client.photos
                              .getPhotosUploadDescription(path);
                          setState(() {
                            _message = "Uploading...";
                          });
                          if (uploadDescription != null) {
                            var uploader = FileUploader(uploadDescription);
                            //final stream =
                            //    http.ByteStream.fromBytes(_fileBytes!);
                            // Stream.value(
                            //   List<int>.from(_fileBytes!),
                            // );
                            // Stream.value(_fileBytes!);
                            // _fileBytes!;
                            //final length = await stream.length;
                            final uploaded =
                                await uploader.uploadByteData(_fileBytes!);
                            if (!uploaded) {
                              setState(() {
                                _message = "Upload Failed!";
                              });
                            }
                            var success =
                                await client.photos.verifyPhotoUploaded(path);
                            if (!success) {
                              setState(() {
                                _message = "Verify Failed!";
                              });
                            } else {
                              setState(() {
                                _message = "Uploaded Successfully!";
                              });
                            }
                          }
                        } else {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            setState(() {
                              _fileBytes =
                                  result.files.first.bytes!.buffer.asByteData();
                              _fileName = result.files.first.name;
                              _fileLength = result.files.first.bytes!.length;
                              _filePicked = true;
                              _textController.text = _fileName!;
                            });
                          } else {
                            // User canceled the picker
                          }
                        }
                      },
                      icon: _filePicked
                          ? const Icon(Icons.upload)
                          : const Icon(Icons.folder),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _fileName = null;
                          _fileBytes = null;
                          _fileLength = null;
                          _filePicked = false;
                          _message = "";
                          _textController.text = "";
                        });
                      },
                      icon: const Icon(Icons.cancel),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(_message),
                if (_uploaded != null)
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.network(
                      _uploaded!,
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
