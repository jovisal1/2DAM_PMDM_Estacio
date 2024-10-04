class RegisteredUser {
  final String nombre;
  final String correo;

  RegisteredUser({required this.nombre, required this.correo});

  @override
  String toString() {
    return "Usuario con nombre $nombre y correo electrónico: $correo";
  }
}
