//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import desktop_window
import geolocator_apple
import path_provider_foundation

import shared_preferences_foundation
import wakelock_macos

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  DesktopWindowPlugin.register(with: registry.registrar(forPlugin: "DesktopWindowPlugin"))
  GeolocatorPlugin.register(with: registry.registrar(forPlugin: "GeolocatorPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))

  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))

  WakelockMacosPlugin.register(with: registry.registrar(forPlugin: "WakelockMacosPlugin"))

}
