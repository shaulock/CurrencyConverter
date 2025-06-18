//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <connectivity_plus/connectivity_plus_windows_plugin.h>
#include <currency_converter_pro/currency_converter_pro_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  ConnectivityPlusWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ConnectivityPlusWindowsPlugin"));
  CurrencyConverterProPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("CurrencyConverterProPluginCApi"));
}
