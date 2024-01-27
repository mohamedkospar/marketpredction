class StockModel {
  double? open;
  double? high;
  double? low;
  double? close;
  double? volume;
  double? adjHigh;
  double? adjLow;
  double? adjClose;
  double? adjOpen;
  double? adjVolume;
  double? splitFactor;
  double? dividend;
  String? symbol;
  String? exchange;
  String? date;

  StockModel(
      {this.open,
      this.high,
      this.low,
      this.close,
      this.volume,
      this.adjHigh,
      this.adjLow,
      this.adjClose,
      this.adjOpen,
      this.adjVolume,
      this.splitFactor,
      this.dividend,
      this.symbol,
      this.exchange,
      this.date});

  StockModel.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    high = json['high'];
    low = json['low'];
    close = json['close'];
    volume = json['volume'];
    adjHigh = json['adj_high'];
    adjLow = json['adj_low'];
    adjClose = json['adj_close'];
    adjOpen = json['adj_open'];
    adjVolume = json['adj_volume'];
    splitFactor = json['split_factor'];
    dividend = json['dividend'];
    symbol = json['symbol'];
    exchange = json['exchange'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['open'] = open;
    data['high'] = high;
    data['low'] = low;
    data['close'] = close;
    data['volume'] = volume;
    data['adj_high'] = adjHigh;
    data['adj_low'] = adjLow;
    data['adj_close'] = adjClose;
    data['adj_open'] = adjOpen;
    data['adj_volume'] = adjVolume;
    data['split_factor'] = splitFactor;
    data['dividend'] = dividend;
    data['symbol'] = symbol;
    data['exchange'] = exchange;
    data['date'] = date;
    return data;
  }
}
