.class public Lcom/androie/settings/cyanogenmod/MoreDeviceSettings;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "MoreDeviceSettings.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 42
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 44
    const v3, 0x7f050024

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/MoreDeviceSettings;->addPreferencesFromResource(I)V

    .line 45
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/MoreDeviceSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 47
    .local v1, "resolver":Landroid/content/ContentResolver;
    const-string v3, "vibrator"

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/MoreDeviceSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Vibrator;

    .line 48
    .local v2, "vibrator":Landroid/os/Vibrator;
    invoke-static {}, Lcom/androie/settings/cyanogenmod/VibratorIntensity;->isSupported()Z

    move-result v3

    if-eqz v3, :cond_0

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/os/Vibrator;->hasVibrator()Z

    move-result v3

    if-nez v3, :cond_1

    .line 49
    :cond_0
    const-string v3, "sensors_motors_category"

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/MoreDeviceSettings;->removePreference(Ljava/lang/String;)V

    .line 51
    :cond_1
    const-string v3, "display_calibration_category"

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/MoreDeviceSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceGroup;

    .line 54
    .local v0, "calibrationCategory":Landroid/preference/PreferenceGroup;
    invoke-static {}, Lcom/androie/settings/cyanogenmod/DisplayColor;->isSupported()Z

    move-result v3

    if-nez v3, :cond_3

    invoke-static {}, Lcom/androie/settings/cyanogenmod/DisplayGamma;->isSupported()Z

    move-result v3

    if-nez v3, :cond_3

    .line 55
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/MoreDeviceSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 65
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/MoreDeviceSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/MoreDeviceSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    const-string v5, "advanced_settings"

    invoke-static {v3, v4, v5}, Lcom/androie/settings/Utils;->updatePreferenceToSpecificActivityFromMetaDataOrRemove(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 67
    return-void

    .line 57
    :cond_3
    invoke-static {}, Lcom/androie/settings/cyanogenmod/DisplayColor;->isSupported()Z

    move-result v3

    if-nez v3, :cond_4

    .line 58
    const-string v3, "color_calibration"

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/MoreDeviceSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 60
    :cond_4
    invoke-static {}, Lcom/androie/settings/cyanogenmod/DisplayGamma;->isSupported()Z

    move-result v3

    if-nez v3, :cond_2

    .line 61
    const-string v3, "gamma_tuning"

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/MoreDeviceSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_0
.end method
