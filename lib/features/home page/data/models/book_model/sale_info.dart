import 'package:bookly/features/home%20page/data/models/book_model/retail_price.dart';
import 'package:equatable/equatable.dart';

class SaleInfo extends Equatable {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final RetailPrice? retailPrice;

  const SaleInfo({this.country, this.saleability, this.isEbook,this.retailPrice});

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json['country'] as String?,
        saleability: json['saleability'] as String?,
        isEbook: json['isEbook'] as bool?,
    retailPrice: json['retailPrice'] == null
        ? null
        : RetailPrice.fromJson(json['retailPrice'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'country': country,
        'saleability': saleability,
        'isEbook': isEbook,
    'retailPrice':retailPrice,
      };

  @override
  List<Object?> get props => [country, saleability, isEbook,retailPrice];
}
