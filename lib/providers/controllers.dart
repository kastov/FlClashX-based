import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flclashx/models/models.dart';
import 'package:flclashx/enum/enum.dart';
import 'package:flclashx/providers/providers.dart';
import 'package:flclashx/state.dart';


final profileLayoutControllerProvider = Provider<void>((ref) {
  ref.listen<Profile?>(currentProfileProvider, (previous, next) {
    if (next != null && next.hideMode) {
      print("Активный профиль с hideMode=true. Удаляется виджет из настроек.");

      final appSettingsNotifier = ref.read(appSettingProvider.notifier);
      final currentWidgets = appSettingsNotifier.state.dashboardWidgets;

      if (currentWidgets.contains(DashboardWidget.outboundModeV2)) {
        final newWidgets = List<DashboardWidget>.from(currentWidgets)
          ..remove(DashboardWidget.outboundModeV2);

        appSettingsNotifier.updateState(
          (state) => state.copyWith(dashboardWidgets: newWidgets),
        );
        globalState.appController?.savePreferencesDebounce();
      }
    }
  });
});