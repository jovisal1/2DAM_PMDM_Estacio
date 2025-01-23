import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_cloud_messaging/config/routes.dart';
import 'package:flutter_firebase_cloud_messaging/main.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  Future<void> initialize() async {
    await requestPermissions();
    await getToken();
    _configureForegroundNotifications();
    _configureOpenedAppNotifications();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> requestPermissions() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('Permisos concedidos');
    } else {
      debugPrint('Permisos denegados');
    }
  }

  Future<void> getToken() async {
    try {
      String? token = await _firebaseMessaging.getToken();
      if (token != null) {
        debugPrint("Token de FCM: $token");
      } else {
        debugPrint("No se pudo obtener el token.");
      }
    } catch (e) {
      debugPrint("Error al obtener el token: $e");
    }
  }

  void _configureForegroundNotifications() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint(
          "Mensaje recibido en primer plano: ${message.notification?.title}");
      _showNotificationBanner(message);
    });
  }

  void _configureOpenedAppNotifications() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint(
          "La app se abrió desde la notificación: ${message.notification?.title}");

      // Verifica si la notificación contiene datos y realiza acciones
      if (message.data.containsKey('ruta')) {
        String ruta = message.data['ruta'];
        router.go(ruta);
      }
    });
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    debugPrint(
        "Mensaje recibido en segundo plano: ${message.notification?.title}");
  }

  void _showNotificationBanner(RemoteMessage message) {
    final context = navigatorKey.currentState?.overlay?.context;
    if (context != null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message.notification?.title ?? "Notificación"),
            content: Text(message.notification?.body ?? "Sin contenido"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cerrar"),
              ),
            ],
          );
        },
      );
    }
  }
}
