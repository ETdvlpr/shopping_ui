enum ProductStatus { gold, silver, bronze }

//add icon to enum
extension ProductStatusExtension on ProductStatus {
  String get icon {
    switch (this) {
      case ProductStatus.gold:
        return 'crown_gold.svg';
      case ProductStatus.silver:
        return 'crown_silver.svg';
      case ProductStatus.bronze:
        return 'crown_bronze.svg';
      default:
        return 'crown_gold.svg';
    }
  }
}
