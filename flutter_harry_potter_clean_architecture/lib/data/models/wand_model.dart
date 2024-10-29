class WandModel {
  final String wood;
  final String core;
  final double length;

  WandModel({required this.wood, required this.core, required this.length});

  factory WandModel.fromJson(Map<String, dynamic> json) {
    return WandModel(
        wood: json['wood'] ?? "Sin wood",
        core: json['core'] ?? "Sin core",
        length: json['length'] ?? 5);
  }

  Map<String, dynamic> toJson() {
    return {
      'wood': wood,
      'core': core,
      'length': length,
    };
  }
}
