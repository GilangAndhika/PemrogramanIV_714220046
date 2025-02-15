// import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:io';

// Model for fetching perfume data
class PerfumeModel {
  final ObjectId id;
  final String name;
  final String brand;
  final String types;
  final String categories;
  final String sizes;
  final String image;
  final double price;
  final String description;
  final int stock;
  final DateTime createdAt;
  final DateTime updatedAt;

  PerfumeModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.types,
    required this.categories,
    required this.sizes,
    required this.image,
    required this.price,
    required this.description,
    required this.stock,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PerfumeModel.fromJson(Map<String, dynamic> json) => PerfumeModel(
        id: ObjectId.parse(json['_id']),
        name: json['name'],
        brand: json['brand'],
        types: json['types'],
        categories: json['categories'],
        sizes: json['sizes'],
        image: json['image'],
        price: (json['price'] as num).toDouble(),
        description: json['description'],
        stock: json['stock'] as int,
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id.toHexString(),
        'name': name,
        'brand': brand,
        'types': types,
        'categories': categories,
        'sizes': sizes,
        'image': image,
        'price': price,
        'description': description,
        'stock': stock,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}

// Model for adding perfume input (excluding image since it's a multipart file)
class CreatePerfumeInput {
  final String name;
  final String brand;
  final String types;
  final String categories;
  final String sizes;
  final double price;
  final String description;
  final int stock;
  final File imageFile;

  CreatePerfumeInput({
    required this.name,
    required this.brand,
    required this.types,
    required this.categories,
    required this.sizes,
    required this.price,
    required this.description,
    required this.stock,
    required this.imageFile,
  });

  Future<http.MultipartRequest> toMultipartRequest(String url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['name'] = name;
    request.fields['brand'] = brand;
    request.fields['types'] = types;
    request.fields['categories'] = categories;
    request.fields['sizes'] = sizes;
    request.fields['price'] = price.toString();
    request.fields['description'] = description;
    request.fields['stock'] = stock.toString();
    request.files.add(await http.MultipartFile.fromPath(
      'image',
      imageFile.path,
      contentType: MediaType('image', 'jpeg'),
    ));
    return request;
  }
}

// Response model for adding perfume
class CreatePerfumeResponse {
  final String message;
  final int status;
  final PerfumeModel? data;

  CreatePerfumeResponse({
    required this.message,
    required this.status,
    this.data,
  });

  factory CreatePerfumeResponse.fromJson(Map<String, dynamic> json) => CreatePerfumeResponse(
        message: json['message'],
        status: json['status'],
        data: json.containsKey('data') ? PerfumeModel.fromJson(json['data']) : null,
      );
}
