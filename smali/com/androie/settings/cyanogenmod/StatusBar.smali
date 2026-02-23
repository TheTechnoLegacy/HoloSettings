.class public Lcom/androie/settings/cyanogenmod/StatusBar;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "StatusBar.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field private mStatusBarAmPm:Landroid/preference/ListPreference;

.field private mStatusBarBattery:Landroid/preference/ListPreference;

.field private mStatusBarCmSignal:Landroid/preference/ListPreference;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v9, 0x0

    .line 50
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 52
    const v7, 0x7f05004a

    invoke-virtual {p0, v7}, Lcom/androie/settings/cyanogenmod/StatusBar;->addPreferencesFromResource(I)V

    .line 54
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/StatusBar;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    .line 55
    .local v1, "prefSet":Landroid/preference/PreferenceScreen;
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/StatusBar;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 57
    .local v2, "resolver":Landroid/content/ContentResolver;
    const-string v7, "status_bar_am_pm"

    invoke-virtual {v1, v7}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    check-cast v7, Landroid/preference/ListPreference;

    iput-object v7, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarAmPm:Landroid/preference/ListPreference;

    .line 58
    const-string v7, "status_bar_battery"

    invoke-virtual {v1, v7}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    check-cast v7, Landroid/preference/ListPreference;

    iput-object v7, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarBattery:Landroid/preference/ListPreference;

    .line 59
    const-string v7, "status_bar_signal"

    invoke-virtual {v1, v7}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    check-cast v7, Landroid/preference/ListPreference;

    iput-object v7, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarCmSignal:Landroid/preference/ListPreference;

    .line 61
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/StatusBar;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-static {v7}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 62
    const-string v7, "category_status_bar_clock"

    invoke-virtual {v1, v7}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    check-cast v7, Landroid/preference/PreferenceCategory;

    const-string v8, "status_bar_am_pm"

    invoke-virtual {v1, v8}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 74
    :goto_0
    const-string v7, "status_bar_brightness_control"

    invoke-virtual {v1, v7}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    check-cast v6, Landroid/preference/CheckBoxPreference;

    .line 78
    .local v6, "statusBarBrightnessControl":Landroid/preference/CheckBoxPreference;
    :try_start_0
    const-string v7, "screen_brightness_mode"

    invoke-static {v2, v7}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_0

    .line 80
    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 81
    const v7, 0x7f0801f1

    invoke-virtual {v6, v7}, Landroid/preference/CheckBoxPreference;->setSummary(I)V
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    :cond_0
    :goto_1
    const-string v7, "status_bar_battery"

    invoke-static {v2, v7, v9}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v5

    .line 87
    .local v5, "statusBarBattery":I
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarBattery:Landroid/preference/ListPreference;

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 88
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarBattery:Landroid/preference/ListPreference;

    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarBattery:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 89
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarBattery:Landroid/preference/ListPreference;

    invoke-virtual {v7, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 91
    const-string v7, "status_bar_signal"

    invoke-static {v2, v7, v9}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    .line 92
    .local v3, "signalStyle":I
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarCmSignal:Landroid/preference/ListPreference;

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 93
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarCmSignal:Landroid/preference/ListPreference;

    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarCmSignal:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 94
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarCmSignal:Landroid/preference/ListPreference;

    invoke-virtual {v7, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 96
    const-string v7, "status_bar_general"

    invoke-virtual {p0, v7}, Lcom/androie/settings/cyanogenmod/StatusBar;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceCategory;

    .line 99
    .local v0, "generalCategory":Landroid/preference/PreferenceCategory;
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/StatusBar;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-static {v7}, Lcom/androie/settings/Utils;->isWifiOnly(Landroid/content/Context;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 100
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarCmSignal:Landroid/preference/ListPreference;

    invoke-virtual {v0, v7}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 103
    :cond_1
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/StatusBar;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-static {v7}, Lcom/androie/settings/Utils;->isTablet(Landroid/content/Context;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 104
    invoke-virtual {v0, v6}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 106
    :cond_2
    return-void

    .line 65
    .end local v0    # "generalCategory":Landroid/preference/PreferenceCategory;
    .end local v3    # "signalStyle":I
    .end local v5    # "statusBarBattery":I
    .end local v6    # "statusBarBrightnessControl":Landroid/preference/CheckBoxPreference;
    :cond_3
    const-string v7, "status_bar_am_pm"

    invoke-virtual {v1, v7}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    check-cast v7, Landroid/preference/ListPreference;

    iput-object v7, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarAmPm:Landroid/preference/ListPreference;

    .line 66
    const-string v7, "status_bar_am_pm"

    const/4 v8, 0x2

    invoke-static {v2, v7, v8}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    .line 69
    .local v4, "statusBarAmPm":I
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarAmPm:Landroid/preference/ListPreference;

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 70
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarAmPm:Landroid/preference/ListPreference;

    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarAmPm:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 71
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarAmPm:Landroid/preference/ListPreference;

    invoke-virtual {v7, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    goto/16 :goto_0

    .line 83
    .end local v4    # "statusBarAmPm":I
    .restart local v6    # "statusBarBrightnessControl":Landroid/preference/CheckBoxPreference;
    :catch_0
    move-exception v7

    goto/16 :goto_1
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 8
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x1

    .line 110
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/StatusBar;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 111
    .local v1, "resolver":Landroid/content/ContentResolver;
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarAmPm:Landroid/preference/ListPreference;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarAmPm:Landroid/preference/ListPreference;

    if-ne p1, v5, :cond_0

    move-object v5, p2

    .line 112
    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 113
    .local v3, "statusBarAmPm":I
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarAmPm:Landroid/preference/ListPreference;

    check-cast p2, Ljava/lang/String;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {v5, p2}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v0

    .line 114
    .local v0, "index":I
    const-string v5, "status_bar_am_pm"

    invoke-static {v1, v5, v3}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 115
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarAmPm:Landroid/preference/ListPreference;

    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarAmPm:Landroid/preference/ListPreference;

    invoke-virtual {v7}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v7

    aget-object v7, v7, v0

    invoke-virtual {v5, v7}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    move v5, v6

    .line 131
    .end local v0    # "index":I
    .end local v3    # "statusBarAmPm":I
    :goto_0
    return v5

    .line 117
    .restart local p2    # "newValue":Ljava/lang/Object;
    :cond_0
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarBattery:Landroid/preference/ListPreference;

    if-ne p1, v5, :cond_1

    move-object v5, p2

    .line 118
    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 119
    .local v4, "statusBarBattery":I
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarBattery:Landroid/preference/ListPreference;

    check-cast p2, Ljava/lang/String;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {v5, p2}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v0

    .line 120
    .restart local v0    # "index":I
    const-string v5, "status_bar_battery"

    invoke-static {v1, v5, v4}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 121
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarBattery:Landroid/preference/ListPreference;

    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarBattery:Landroid/preference/ListPreference;

    invoke-virtual {v7}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v7

    aget-object v7, v7, v0

    invoke-virtual {v5, v7}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    move v5, v6

    .line 122
    goto :goto_0

    .line 123
    .end local v0    # "index":I
    .end local v4    # "statusBarBattery":I
    .restart local p2    # "newValue":Ljava/lang/Object;
    :cond_1
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarCmSignal:Landroid/preference/ListPreference;

    if-ne p1, v5, :cond_2

    move-object v5, p2

    .line 124
    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 125
    .local v2, "signalStyle":I
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarCmSignal:Landroid/preference/ListPreference;

    check-cast p2, Ljava/lang/String;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {v5, p2}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v0

    .line 126
    .restart local v0    # "index":I
    const-string v5, "status_bar_signal"

    invoke-static {v1, v5, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 127
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarCmSignal:Landroid/preference/ListPreference;

    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/StatusBar;->mStatusBarCmSignal:Landroid/preference/ListPreference;

    invoke-virtual {v7}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v7

    aget-object v7, v7, v0

    invoke-virtual {v5, v7}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    move v5, v6

    .line 128
    goto :goto_0

    .line 131
    .end local v0    # "index":I
    .end local v2    # "signalStyle":I
    .restart local p2    # "newValue":Ljava/lang/Object;
    :cond_2
    const/4 v5, 0x0

    goto :goto_0
.end method
