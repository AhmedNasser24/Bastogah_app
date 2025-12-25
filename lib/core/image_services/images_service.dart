// import 'dart:developer';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:http_parser/http_parser.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:tok_tok_user/core/api/end_points.dart';
// import 'package:tok_tok_user/core/widgets/custom_toastfication.dart';

// class ImagesService {
//   static final Dio _dio = Dio()
//     ..interceptors.add(
//       PrettyDioLogger(
//         request: true,
//         responseHeader: true,
//         responseBody: true,
//         requestBody: true,
//         requestHeader: true,
//         error: true,
//         compact: true,
//       ),
//     );

//   static Future<String> uploadImage(String path) async {
//     final formData = FormData.fromMap({
//       'image': await MultipartFile.fromFile(
//         path,
//         filename: path.split('/').last,
//         contentType: DioMediaType.parse("image/${path.split('.').last}"),
//       ),
//     });
//     try {
//       final Response response = await _dio.post(
//         EndPoints.baseUrl + EndPoints.uploadOneImage,
//         data: formData,
//       );
//       return response.data['fileName'];
//     } on DioException catch (e) {
//       log(e.response!.data.toString());
//       throw Exception('Failed to upload image');
//     }
//   }

//   static Future<String> uploadImageWeb(XFile image) async {
//     try {
//       final Uint8List result = await image.readAsBytes();

//       final formData = FormData.fromMap({
//         "image": MultipartFile.fromBytes(
//           result,
//           filename: 'image.jpg',
//           contentType: MediaType("image", "jpeg"),
//         ),
//       });

//       // Perform POST request to upload image
//       final Response response = await _dio.post(
//         EndPoints.baseUrl + EndPoints.uploadOneImage,
//         data: formData,
//       );

//       return response.data['fileName'];
//     } on DioException catch (e) {
//       throw Exception('Failed to upload image : ${e.message}');
//     } catch (e) {
//       throw Exception('Failed to upload image');
//     }
//   }

//   static int maxSizeInBytes = 2 * 1024 * 1024; // [2M]

//   static Future<File?> pickImage({
//     required BuildContext context,
//     required ImageSource source,
//   }) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);

//     if (pickedFile == null) return null;

//     int imageSize = await pickedFile.length();

//     if (imageSize > maxSizeInBytes) {
//       final compressedImage = await compressImage(pickedFile, maxSizeInBytes);

//       int compressedSize = await compressedImage.length();
//       if (compressedSize > maxSizeInBytes) {
//         CustomToast(
//           context: context,
//           header: "image_size_message".tr(),
//         ).showBottomToast();
//         return null;
//       }

//       return File(compressedImage.path);
//     }

//     return File(pickedFile.path);
//   }

//   static Future<XFile> compressImage(XFile image, int maxSizeInBytes) async {
//     // Skip compression if running on Web
//     if (Platform.isWindows) {
//       return image;
//     }

//     final imageBytes = await image.readAsBytes();

//     var result = await FlutterImageCompress.compressWithList(
//       imageBytes,
//       minWidth: 1024,
//       minHeight: 1024,
//       quality: 85,
//     );

//     if (result.length > maxSizeInBytes) {
//       result = await FlutterImageCompress.compressWithList(result, quality: 50);
//     }

//     final tempDir = await getTemporaryDirectory();
//     final file = File(
//       '${tempDir.path}/image-${DateTime.now().millisecondsSinceEpoch}.jpg',
//     );
//     await file.writeAsBytes(result);

//     return XFile(file.path);
//   }

//   static Future<List<String>> uploadMultipleImages(List<XFile> images) async {
//     FormData formData = FormData();

//     try {
//       // Add each image to the FormData
//       for (int i = 0; i < images.length; i++) {
//         dynamic image = images[i];

//         if (image is String) {
//           // If the image is a path (mobile), add it to FormData
//           formData.files.add(
//             MapEntry(
//               'images',
//               await MultipartFile.fromFile(
//                 image,
//                 contentType: DioMediaType.parse(
//                   "image/${image.split('.').last}",
//                 ),
//               ),
//             ),
//           );
//         } else if (image is XFile) {
//           // If the image is from web (XFile), add it to FormData
//           final Uint8List bytes = await image.readAsBytes();
//           formData.files.add(
//             MapEntry(
//               'images',
//               MultipartFile.fromBytes(
//                 bytes,
//                 filename: 'image_$i.jpg',
//                 contentType: MediaType("image", "jpeg"),
//               ),
//             ),
//           );
//         } else {
//           throw Exception('Unsupported image type');
//         }
//       }

//       // Perform POST request to upload images
//       final Response response = await _dio.post(
//         EndPoints.baseUrl + EndPoints.uploadImages,
//         data: formData,
//       );

//       // Extract image URLs from the response and return them
//       List<String> uploadedImageUrls = List<String>.from(
//         response.data['images'],
//       );
//       return uploadedImageUrls;
//     } on DioException catch (e) {
//       log('Error uploading images: ${e.response?.data}');
//       throw Exception('Failed to upload images');
//     } catch (e) {
//       log('Error uploading images: $e');
//       throw Exception('Failed to upload images');
//     }
//   }
// }
