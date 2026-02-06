//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <charset_converter/charset_converter_plugin.h>
#include <flutter_blue_plus_winrt/flutter_blue_plus_plugin.h>
#include <print_bluetooth_thermal/print_bluetooth_thermal_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  CharsetConverterPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("CharsetConverterPlugin"));
  FlutterBluePlusPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterBluePlusPlugin"));
  PrintBluetoothThermalPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PrintBluetoothThermalPluginCApi"));
}
