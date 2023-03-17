class Light {
  String location = 'No location';
  String name = 'No name';
  bool status = false;
  List<double> position = [0.0];
  int tile = 0;

  Light.fromMap(Map data) {
    this.location = data['location'] ?? this.location;
    this.name = data['name'] ?? this.name;
    this.status = data['status'] ?? this.status;
    this.position = data['position'] ?? this.position;
    this.tile = data['tile'] ?? this.tile;
  }
}
