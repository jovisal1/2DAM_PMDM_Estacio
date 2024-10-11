class Album {
  /// El ID del usuario al que pertenece el álbum.
  final int userId;

  /// El ID único del álbum.
  final int id;

  /// El título del álbum.
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });
}
