class CompanyData {
  String? name;
  String? symbol;
  bool? hasIntraday;
  bool? hasEod;
  String? country;
  StockExchange? stockExchange;

  CompanyData(
      {this.name,
      this.symbol,
      this.hasIntraday,
      this.hasEod,
      this.country,
      this.stockExchange});

  CompanyData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
    hasIntraday = json['has_intraday'];
    hasEod = json['has_eod'];
    country = json['country'];
    stockExchange = json['stock_exchange'] != null
        ? StockExchange.fromJson(json['stock_exchange'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['symbol'] = symbol;
    data['has_intraday'] = hasIntraday;
    data['has_eod'] = hasEod;
    data['country'] = country;
    if (stockExchange != null) {
      data['stock_exchange'] = stockExchange!.toJson();
    }
    return data;
  }
}

class StockExchange {
  String? name;
  String? acronym;
  String? mic;
  String? country;
  String? countryCode;
  String? city;
  String? website;

  StockExchange(
      {this.name,
      this.acronym,
      this.mic,
      this.country,
      this.countryCode,
      this.city,
      this.website});

  StockExchange.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    acronym = json['acronym'];
    mic = json['mic'];
    country = json['country'];
    countryCode = json['country_code'];
    city = json['city'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['acronym'] = acronym;
    data['mic'] = mic;
    data['country'] = country;
    data['country_code'] = countryCode;
    data['city'] = city;
    data['website'] = website;
    return data;
  }
}
