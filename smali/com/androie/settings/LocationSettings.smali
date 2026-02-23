.class public Lcom/androie/settings/LocationSettings;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "LocationSettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field private mAssistedGps:Landroid/preference/CheckBoxPreference;

.field private mContentQueryMap:Landroid/content/ContentQueryMap;

.field private mGps:Landroid/preference/CheckBoxPreference;

.field private mGpsDownloadDataWifiOnly:Landroid/preference/CheckBoxPreference;

.field private mLocationAccess:Landroid/preference/SwitchPreference;

.field private mNetwork:Landroid/preference/CheckBoxPreference;

.field private mSettingsObserver:Ljava/util/Observer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/LocationSettings;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/LocationSettings;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/androie/settings/LocationSettings;->updateLocationToggles()V

    return-void
.end method

.method private createPreferenceHierarchy()Landroid/preference/PreferenceScreen;
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 95
    invoke-virtual {p0}, Lcom/androie/settings/LocationSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    .line 96
    .local v1, "root":Landroid/preference/PreferenceScreen;
    if-eqz v1, :cond_0

    .line 97
    invoke-virtual {v1}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 99
    :cond_0
    const v3, 0x7f05001f

    invoke-virtual {p0, v3}, Lcom/androie/settings/LocationSettings;->addPreferencesFromResource(I)V

    .line 100
    invoke-virtual {p0}, Lcom/androie/settings/LocationSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    .line 102
    const-string v3, "location_toggle"

    invoke-virtual {v1, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/SwitchPreference;

    iput-object v3, p0, Lcom/androie/settings/LocationSettings;->mLocationAccess:Landroid/preference/SwitchPreference;

    .line 103
    const-string v3, "location_network"

    invoke-virtual {v1, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/CheckBoxPreference;

    iput-object v3, p0, Lcom/androie/settings/LocationSettings;->mNetwork:Landroid/preference/CheckBoxPreference;

    .line 104
    const-string v3, "location_gps"

    invoke-virtual {v1, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/CheckBoxPreference;

    iput-object v3, p0, Lcom/androie/settings/LocationSettings;->mGps:Landroid/preference/CheckBoxPreference;

    .line 105
    const-string v3, "assisted_gps"

    invoke-virtual {v1, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/CheckBoxPreference;

    iput-object v3, p0, Lcom/androie/settings/LocationSettings;->mAssistedGps:Landroid/preference/CheckBoxPreference;

    .line 106
    const-string v3, "gps_download_data_wifi_only"

    invoke-virtual {v1, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/CheckBoxPreference;

    iput-object v3, p0, Lcom/androie/settings/LocationSettings;->mGpsDownloadDataWifiOnly:Landroid/preference/CheckBoxPreference;

    .line 111
    invoke-virtual {p0}, Lcom/androie/settings/LocationSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-string v4, "user"

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/UserManager;

    .line 112
    .local v2, "um":Landroid/os/UserManager;
    const-string v3, "no_share_location"

    invoke-virtual {v2, v3}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_7

    const/4 v0, 0x1

    .line 113
    .local v0, "isToggleAllowed":Z
    :goto_0
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mLocationAccess:Landroid/preference/SwitchPreference;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mLocationAccess:Landroid/preference/SwitchPreference;

    invoke-virtual {v3, v0}, Landroid/preference/SwitchPreference;->setEnabled(Z)V

    .line 114
    :cond_1
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mNetwork:Landroid/preference/CheckBoxPreference;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mNetwork:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v0}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 115
    :cond_2
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mGps:Landroid/preference/CheckBoxPreference;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mGps:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v0}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 116
    :cond_3
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mAssistedGps:Landroid/preference/CheckBoxPreference;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mAssistedGps:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v0}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 117
    :cond_4
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mGpsDownloadDataWifiOnly:Landroid/preference/CheckBoxPreference;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mGpsDownloadDataWifiOnly:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v0}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 119
    :cond_5
    invoke-static {}, Lorg/cyanogenmod/hardware/LongTermOrbits;->isSupported()Z

    move-result v3

    if-nez v3, :cond_8

    .line 120
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mGpsDownloadDataWifiOnly:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, v3}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 121
    iput-object v5, p0, Lcom/androie/settings/LocationSettings;->mGpsDownloadDataWifiOnly:Landroid/preference/CheckBoxPreference;

    .line 129
    :cond_6
    :goto_1
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mLocationAccess:Landroid/preference/SwitchPreference;

    invoke-virtual {v3, p0}, Landroid/preference/SwitchPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 130
    return-object v1

    .line 112
    .end local v0    # "isToggleAllowed":Z
    :cond_7
    const/4 v0, 0x0

    goto :goto_0

    .line 123
    .restart local v0    # "isToggleAllowed":Z
    :cond_8
    invoke-virtual {p0}, Lcom/androie/settings/LocationSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3}, Lcom/androie/settings/LocationSettings;->saveDownloadDataWifiOnlyPref(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 124
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mGpsDownloadDataWifiOnly:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, v3}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 125
    iput-object v5, p0, Lcom/androie/settings/LocationSettings;->mGpsDownloadDataWifiOnly:Landroid/preference/CheckBoxPreference;

    goto :goto_1
.end method

.method private onToggleLocationAccess(Z)V
    .locals 4
    .param p1, "checked"    # Z

    .prologue
    .line 216
    invoke-virtual {p0}, Lcom/androie/settings/LocationSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-string v3, "user"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/UserManager;

    .line 217
    .local v1, "um":Landroid/os/UserManager;
    const-string v2, "no_share_location"

    invoke-virtual {v1, v2}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 227
    :goto_0
    return-void

    .line 220
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/LocationSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 221
    .local v0, "cr":Landroid/content/ContentResolver;
    const-string v2, "gps"

    invoke-static {v0, v2, p1}, Landroid/provider/Settings$Secure;->setLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;Z)V

    .line 223
    const-string v2, "network"

    invoke-static {v0, v2, p1}, Landroid/provider/Settings$Secure;->setLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;Z)V

    .line 225
    invoke-direct {p0}, Lcom/androie/settings/LocationSettings;->updateLocationToggles()V

    .line 226
    invoke-virtual {p0}, Lcom/androie/settings/LocationSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/androie/settings/LocationSettings;->updateLtoServiceStatus(Landroid/content/Context;Z)V

    goto :goto_0
.end method

.method public static restore(Landroid/content/Context;)V
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 256
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 258
    invoke-static {}, Lorg/cyanogenmod/hardware/LongTermOrbits;->isSupported()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "location_toggle"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 259
    invoke-static {p0}, Lcom/androie/settings/LocationSettings;->saveDownloadDataWifiOnlyPref(Landroid/content/Context;)Z

    .line 263
    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 264
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/androie/settings/cyanogenmod/LtoService;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 265
    const/high16 v2, 0x48000000    # 131072.0f

    invoke-static {p0, v3, v1, v2}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 267
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/32 v4, 0x1d4c0

    add-long/2addr v2, v4

    .line 268
    const/4 v4, 0x1

    invoke-virtual {v0, v4, v2, v3, v1}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 270
    :cond_0
    return-void
.end method

.method private static saveDownloadDataWifiOnlyPref(Landroid/content/Context;)Z
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 273
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 274
    .local v1, "pm":Landroid/content/pm/PackageManager;
    const-string v4, "android.hardware.telephony"

    invoke-virtual {v1, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    .line 275
    .local v2, "supportsTelephony":Z
    const-string v4, "android.hardware.wifi"

    invoke-virtual {v1, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v3

    .line 276
    .local v3, "supportsWifi":Z
    if-eqz v3, :cond_0

    if-nez v2, :cond_1

    .line 277
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 279
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v4, "gps_download_data_wifi_only"

    invoke-interface {v0, v4, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 280
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 281
    const/4 v4, 0x1

    .line 283
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :goto_0
    return v4

    :cond_1
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private updateLocationToggles()V
    .locals 8

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 187
    invoke-virtual {p0}, Lcom/androie/settings/LocationSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 188
    .local v2, "res":Landroid/content/ContentResolver;
    const-string v3, "gps"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->isLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;)Z

    move-result v0

    .line 190
    .local v0, "gpsEnabled":Z
    const-string v3, "network"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->isLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;)Z

    move-result v1

    .line 192
    .local v1, "networkEnabled":Z
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mGps:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v0}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 193
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mNetwork:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 194
    iget-object v6, p0, Lcom/androie/settings/LocationSettings;->mLocationAccess:Landroid/preference/SwitchPreference;

    if-nez v0, :cond_0

    if-eqz v1, :cond_3

    :cond_0
    move v3, v5

    :goto_0
    invoke-virtual {v6, v3}, Landroid/preference/SwitchPreference;->setChecked(Z)V

    .line 195
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mAssistedGps:Landroid/preference/CheckBoxPreference;

    if-eqz v3, :cond_1

    .line 196
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mAssistedGps:Landroid/preference/CheckBoxPreference;

    const-string v6, "assisted_gps_enabled"

    const/4 v7, 0x2

    invoke-static {v2, v6, v7}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v6

    if-ne v6, v5, :cond_4

    :goto_1
    invoke-virtual {v3, v5}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 198
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mAssistedGps:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v0}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 200
    :cond_1
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mGpsDownloadDataWifiOnly:Landroid/preference/CheckBoxPreference;

    if-eqz v3, :cond_2

    .line 201
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mGpsDownloadDataWifiOnly:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v0}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 203
    :cond_2
    return-void

    :cond_3
    move v3, v4

    .line 194
    goto :goto_0

    :cond_4
    move v5, v4

    .line 196
    goto :goto_1
.end method

.method private static updateLtoServiceStatus(Landroid/content/Context;Z)V
    .locals 2

    .prologue
    .line 243
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/androie/settings/cyanogenmod/LtoService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 244
    if-eqz p1, :cond_0

    .line 245
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 249
    :goto_0
    return-void

    .line 247
    :cond_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    goto :goto_0
.end method


# virtual methods
.method public getHelpResource()I
    .locals 1

    .prologue
    .line 239
    const v0, 0x7f080a6c

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 210
    invoke-super {p0, p1, p2, p3}, Lcom/androie/settings/SettingsPreferenceFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 211
    invoke-direct {p0}, Lcom/androie/settings/LocationSettings;->createPreferenceHierarchy()Landroid/preference/PreferenceScreen;

    .line 212
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 2
    .param p1, "pref"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 231
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v1, "location_toggle"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 232
    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/androie/settings/LocationSettings;->onToggleLocationAccess(Z)V

    .line 234
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 6
    .param p1, "preferenceScreen"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    const/4 v4, 0x1

    .line 156
    invoke-virtual {p0}, Lcom/androie/settings/LocationSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 157
    .local v0, "cr":Landroid/content/ContentResolver;
    invoke-virtual {p0}, Lcom/androie/settings/LocationSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-string v5, "user"

    invoke-virtual {v3, v5}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/UserManager;

    .line 158
    .local v2, "um":Landroid/os/UserManager;
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mNetwork:Landroid/preference/CheckBoxPreference;

    if-ne p2, v3, :cond_1

    .line 159
    const-string v3, "no_share_location"

    invoke-virtual {v2, v3}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 160
    const-string v3, "network"

    iget-object v5, p0, Lcom/androie/settings/LocationSettings;->mNetwork:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v5}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v5

    invoke-static {v0, v3, v5}, Landroid/provider/Settings$Secure;->setLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;Z)V

    .line 180
    :cond_0
    :goto_0
    return v4

    .line 163
    :cond_1
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mGps:Landroid/preference/CheckBoxPreference;

    if-ne p2, v3, :cond_2

    .line 164
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mGps:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v1

    .line 165
    .local v1, "enabled":Z
    const-string v3, "no_share_location"

    invoke-virtual {v2, v3}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 166
    const-string v3, "gps"

    invoke-static {v0, v3, v1}, Landroid/provider/Settings$Secure;->setLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;Z)V

    .line 168
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mAssistedGps:Landroid/preference/CheckBoxPreference;

    if-eqz v3, :cond_0

    .line 169
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mAssistedGps:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v1}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    goto :goto_0

    .line 172
    .end local v1    # "enabled":Z
    :cond_2
    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mAssistedGps:Landroid/preference/CheckBoxPreference;

    if-ne p2, v3, :cond_4

    .line 173
    const-string v5, "assisted_gps_enabled"

    iget-object v3, p0, Lcom/androie/settings/LocationSettings;->mAssistedGps:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_3

    move v3, v4

    :goto_1
    invoke-static {v0, v5, v3}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_0

    :cond_3
    const/4 v3, 0x0

    goto :goto_1

    .line 177
    :cond_4
    invoke-super {p0, p1, p2}, Lcom/androie/settings/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v4

    goto :goto_0
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 135
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onResume()V

    .line 139
    invoke-direct {p0}, Lcom/androie/settings/LocationSettings;->createPreferenceHierarchy()Landroid/preference/PreferenceScreen;

    .line 140
    invoke-direct {p0}, Lcom/androie/settings/LocationSettings;->updateLocationToggles()V

    .line 142
    iget-object v0, p0, Lcom/androie/settings/LocationSettings;->mSettingsObserver:Ljava/util/Observer;

    if-nez v0, :cond_0

    .line 143
    new-instance v0, Lcom/androie/settings/LocationSettings$1;

    invoke-direct {v0, p0}, Lcom/androie/settings/LocationSettings$1;-><init>(Lcom/androie/settings/LocationSettings;)V

    iput-object v0, p0, Lcom/androie/settings/LocationSettings;->mSettingsObserver:Ljava/util/Observer;

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/LocationSettings;->mContentQueryMap:Landroid/content/ContentQueryMap;

    iget-object v1, p0, Lcom/androie/settings/LocationSettings;->mSettingsObserver:Ljava/util/Observer;

    invoke-virtual {v0, v1}, Landroid/content/ContentQueryMap;->addObserver(Ljava/util/Observer;)V

    .line 152
    return-void
.end method

.method public onStart()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v2, 0x0

    .line 76
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onStart()V

    .line 78
    invoke-virtual {p0}, Lcom/androie/settings/LocationSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/Settings$Secure;->CONTENT_URI:Landroid/net/Uri;

    const-string v3, "(name=?)"

    new-array v4, v8, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v7, "location_providers_allowed"

    aput-object v7, v4, v5

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 82
    .local v6, "settingsCursor":Landroid/database/Cursor;
    new-instance v0, Landroid/content/ContentQueryMap;

    const-string v1, "name"

    invoke-direct {v0, v6, v1, v8, v2}, Landroid/content/ContentQueryMap;-><init>(Landroid/database/Cursor;Ljava/lang/String;ZLandroid/os/Handler;)V

    iput-object v0, p0, Lcom/androie/settings/LocationSettings;->mContentQueryMap:Landroid/content/ContentQueryMap;

    .line 83
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 87
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onStop()V

    .line 88
    iget-object v0, p0, Lcom/androie/settings/LocationSettings;->mSettingsObserver:Ljava/util/Observer;

    if-eqz v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/androie/settings/LocationSettings;->mContentQueryMap:Landroid/content/ContentQueryMap;

    iget-object v1, p0, Lcom/androie/settings/LocationSettings;->mSettingsObserver:Ljava/util/Observer;

    invoke-virtual {v0, v1}, Landroid/content/ContentQueryMap;->deleteObserver(Ljava/util/Observer;)V

    .line 91
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/LocationSettings;->mContentQueryMap:Landroid/content/ContentQueryMap;

    invoke-virtual {v0}, Landroid/content/ContentQueryMap;->close()V

    .line 92
    return-void
.end method
