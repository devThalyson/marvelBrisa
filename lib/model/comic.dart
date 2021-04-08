import 'package:marvel_brisa/model/image.dart';
import 'package:marvel_brisa/model/thumbnail.dart';

class Comic {
  int id;
  int digitalId;
  String title;
  int issueNumber;
  String variantDescription;
  String description;
  String modified;
  String isbn;
  String upc;
  String diamondCode;
  String ean;
  String issn;
  String format;
  int pageCount;
  Thumbnail thumbnail;
  List<Image> images;

  Comic({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.thumbnail,
    this.images,
  });

  Comic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalId = json['digitalId'];
    title = json['title'];
    issueNumber = json['issueNumber'];
    variantDescription = json['variantDescription'];
    description = json['description'];
    modified = json['modified'];
    isbn = json['isbn'];
    upc = json['upc'];
    diamondCode = json['diamondCode'];
    ean = json['ean'];
    issn = json['issn'];
    format = json['format'];
    pageCount = json['pageCount'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images.add(new Image.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['digitalId'] = this.digitalId;
    data['title'] = this.title;
    data['issueNumber'] = this.issueNumber;
    data['variantDescription'] = this.variantDescription;
    data['description'] = this.description;
    data['modified'] = this.modified;
    data['isbn'] = this.isbn;
    data['upc'] = this.upc;
    data['diamondCode'] = this.diamondCode;
    data['ean'] = this.ean;
    data['issn'] = this.issn;
    data['format'] = this.format;
    data['pageCount'] = this.pageCount;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
