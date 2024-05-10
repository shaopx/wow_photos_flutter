import 'package:flutter/material.dart';

extension RouteSettingsX on RouteSettings {
  RouteSettings copyWith({
    String? name,
    Object? arguments,
  }) {
    return RouteSettings(
      name: name ?? this.name,
      arguments: arguments ?? this.arguments,
    );
  }
}
