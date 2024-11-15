class User {
  final String id;
  final String username;
  final List<String>
      following; // Lista de IDs de usuarios que este usuario sigue
  final String avatar; // URL o identificador del avatar del usuario

  User({
    required this.id,
    required this.username,
    required this.following,
    required this.avatar,
  });
}
