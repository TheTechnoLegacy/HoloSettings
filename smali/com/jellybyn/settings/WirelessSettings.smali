.class public Lcom/jellybyn/settings/WirelessSettings;
.super Lcom/jellybyn/settings/SettingsPreferenceFragment;
.source "WirelessSettings.java"


# instance fields
.field private mAirplaneModeEnabler:Lcom/jellybyn/settings/AirplaneModeEnabler;

.field private mAirplaneModePreference:Landroid/preference/CheckBoxPreference;

.field private mCm:Landroid/net/ConnectivityManager;

.field private mManageMobilePlanMessage:Ljava/lang/String;

.field private mNfcAdapter:Landroid/nfc/NfcAdapter;

.field private mNfcEnabler:Lcom/jellybyn/settings/nfc/NfcEnabler;

.field private mNsdEnabler:Lcom/jellybyn/settings/NsdEnabler;

.field private mTm:Landroid/telephony/TelephonyManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/jellybyn/settings/WirelessSettings;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/WirelessSettings;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/jellybyn/settings/WirelessSettings;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$102(Lcom/jellybyn/settings/WirelessSettings;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/WirelessSettings;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/jellybyn/settings/WirelessSettings;->mManageMobilePlanMessage:Ljava/lang/String;

    return-object p1
.end method

.method public static isRadioAllowed(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 174
    invoke-static {p0}, Lcom/jellybyn/settings/AirplaneModeEnabler;->isAirplaneModeOn(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 180
    :cond_0
    :goto_0
    return v1

    .line 178
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "airplane_mode_toggleable_radios"

    invoke-static {v2, v3}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 180
    .local v0, "toggleable":Ljava/lang/String;
    if-eqz v0, :cond_2

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 170
    const-string v0, "WirelessSettings"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    return-void
.end method


# virtual methods
.method protected getHelpResource()I
    .locals 1

    .prologue
    .line 347
    const v0, 0x7f0b06fd

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 337
    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    .line 338
    const-string v1, "exit_ecm_result"

    const/4 v2, 0x0

    invoke-virtual {p3, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 340
    .local v0, "isChoiceYes":Ljava/lang/Boolean;
    iget-object v1, p0, Lcom/jellybyn/settings/WirelessSettings;->mAirplaneModeEnabler:Lcom/jellybyn/settings/AirplaneModeEnabler;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iget-object v3, p0, Lcom/jellybyn/settings/WirelessSettings;->mAirplaneModePreference:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/jellybyn/settings/AirplaneModeEnabler;->setAirplaneModeInECM(ZZ)V

    .line 343
    .end local v0    # "isChoiceYes":Ljava/lang/Boolean;
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 20
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 185
    invoke-super/range {p0 .. p1}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 186
    if-eqz p1, :cond_0

    .line 187
    const-string v18, "mManageMobilePlanMessage"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/WirelessSettings;->mManageMobilePlanMessage:Ljava/lang/String;

    .line 189
    :cond_0
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "onCreate: mManageMobilePlanMessage="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/WirelessSettings;->mManageMobilePlanMessage:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->log(Ljava/lang/String;)V

    .line 191
    const-string v18, "connectivity"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Landroid/net/ConnectivityManager;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/WirelessSettings;->mCm:Landroid/net/ConnectivityManager;

    .line 192
    const-string v18, "phone"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Landroid/telephony/TelephonyManager;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/WirelessSettings;->mTm:Landroid/telephony/TelephonyManager;

    .line 194
    const v18, 0x7f050039

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->addPreferencesFromResource(I)V

    .line 196
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v18

    if-eqz v18, :cond_f

    const/4 v7, 0x1

    .line 198
    .local v7, "isSecondaryUser":Z
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/WirelessSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    .line 199
    .local v2, "activity":Landroid/app/Activity;
    const-string v18, "toggle_airplane"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v18

    check-cast v18, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/WirelessSettings;->mAirplaneModePreference:Landroid/preference/CheckBoxPreference;

    .line 200
    const-string v18, "toggle_nfc"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v11

    check-cast v11, Landroid/preference/CheckBoxPreference;

    .line 201
    .local v11, "nfc":Landroid/preference/CheckBoxPreference;
    const-string v18, "android_beam_settings"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/PreferenceScreen;

    .line 202
    .local v3, "androidBeam":Landroid/preference/PreferenceScreen;
    const-string v18, "toggle_nsd"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v12

    check-cast v12, Landroid/preference/CheckBoxPreference;

    .line 204
    .local v12, "nsd":Landroid/preference/CheckBoxPreference;
    new-instance v18, Lcom/jellybyn/settings/AirplaneModeEnabler;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/WirelessSettings;->mAirplaneModePreference:Landroid/preference/CheckBoxPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v2, v1}, Lcom/jellybyn/settings/AirplaneModeEnabler;-><init>(Landroid/content/Context;Landroid/preference/CheckBoxPreference;)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/WirelessSettings;->mAirplaneModeEnabler:Lcom/jellybyn/settings/AirplaneModeEnabler;

    .line 205
    new-instance v18, Lcom/jellybyn/settings/nfc/NfcEnabler;

    move-object/from16 v0, v18

    invoke-direct {v0, v2, v11, v3}, Lcom/jellybyn/settings/nfc/NfcEnabler;-><init>(Landroid/content/Context;Landroid/preference/CheckBoxPreference;Landroid/preference/PreferenceScreen;)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/WirelessSettings;->mNfcEnabler:Lcom/jellybyn/settings/nfc/NfcEnabler;

    .line 208
    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/WirelessSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 211
    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v18

    const-string v19, "airplane_mode_toggleable_radios"

    invoke-static/range {v18 .. v19}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 215
    .local v17, "toggleable":Ljava/lang/String;
    if-nez v7, :cond_10

    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/WirelessSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    const v19, 0x1110041

    invoke-virtual/range {v18 .. v19}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v18

    if-eqz v18, :cond_10

    const/4 v8, 0x1

    .line 217
    .local v8, "isWimaxEnabled":Z
    :goto_1
    if-nez v8, :cond_11

    .line 218
    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/WirelessSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v16

    .line 219
    .local v16, "root":Landroid/preference/PreferenceScreen;
    const-string v18, "wimax_settings"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v15

    .line 220
    .local v15, "ps":Landroid/preference/Preference;
    if-eqz v15, :cond_1

    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 229
    .end local v15    # "ps":Landroid/preference/Preference;
    .end local v16    # "root":Landroid/preference/PreferenceScreen;
    :cond_1
    :goto_2
    if-eqz v17, :cond_2

    const-string v18, "wifi"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v18

    if-nez v18, :cond_3

    .line 230
    :cond_2
    const-string v18, "vpn_settings"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v18

    const-string v19, "toggle_airplane"

    invoke-virtual/range {v18 .. v19}, Landroid/preference/Preference;->setDependency(Ljava/lang/String;)V

    .line 232
    :cond_3
    if-eqz v7, :cond_4

    .line 233
    const-string v18, "vpn_settings"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->removePreference(Ljava/lang/String;)V

    .line 237
    :cond_4
    if-eqz v17, :cond_5

    const-string v18, "bluetooth"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v18

    if-nez v18, :cond_5

    .line 242
    :cond_5
    if-eqz v17, :cond_6

    const-string v18, "nfc"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v18

    if-nez v18, :cond_7

    .line 243
    :cond_6
    const-string v18, "toggle_nfc"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v18

    const-string v19, "toggle_airplane"

    invoke-virtual/range {v18 .. v19}, Landroid/preference/Preference;->setDependency(Ljava/lang/String;)V

    .line 244
    const-string v18, "android_beam_settings"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v18

    const-string v19, "toggle_airplane"

    invoke-virtual/range {v18 .. v19}, Landroid/preference/Preference;->setDependency(Ljava/lang/String;)V

    .line 248
    :cond_7
    invoke-static {v2}, Landroid/nfc/NfcAdapter;->getDefaultAdapter(Landroid/content/Context;)Landroid/nfc/NfcAdapter;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/WirelessSettings;->mNfcAdapter:Landroid/nfc/NfcAdapter;

    .line 249
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/WirelessSettings;->mNfcAdapter:Landroid/nfc/NfcAdapter;

    move-object/from16 v18, v0

    if-nez v18, :cond_8

    .line 250
    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/WirelessSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 251
    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/WirelessSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 252
    const/16 v18, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/WirelessSettings;->mNfcEnabler:Lcom/jellybyn/settings/nfc/NfcEnabler;

    .line 256
    :cond_8
    if-nez v7, :cond_9

    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/WirelessSettings;->getActivity()Landroid/app/Activity;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/jellybyn/settings/Utils;->isWifiOnly(Landroid/content/Context;)Z

    move-result v18

    if-eqz v18, :cond_a

    .line 257
    :cond_9
    const-string v18, "mobile_network_settings"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->removePreference(Ljava/lang/String;)V

    .line 258
    const-string v18, "manage_mobile_plan"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->removePreference(Ljava/lang/String;)V

    .line 262
    :cond_a
    const-string v18, "proxy_settings"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v10

    .line 263
    .local v10, "mGlobalProxy":Landroid/preference/Preference;
    const-string v18, "device_policy"

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/app/admin/DevicePolicyManager;

    .line 266
    .local v9, "mDPM":Landroid/app/admin/DevicePolicyManager;
    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/WirelessSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 267
    invoke-virtual {v9}, Landroid/app/admin/DevicePolicyManager;->getGlobalProxyAdmin()Landroid/content/ComponentName;

    move-result-object v18

    if-nez v18, :cond_13

    const/16 v18, 0x1

    :goto_3
    move/from16 v0, v18

    invoke-virtual {v10, v0}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 270
    const-string v18, "connectivity"

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/ConnectivityManager;

    .line 272
    .local v4, "cm":Landroid/net/ConnectivityManager;
    if-nez v7, :cond_b

    invoke-virtual {v4}, Landroid/net/ConnectivityManager;->isTetheringSupported()Z

    move-result v18

    if-nez v18, :cond_14

    .line 273
    :cond_b
    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/WirelessSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v18

    const-string v19, "tether_settings"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 280
    :goto_4
    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/WirelessSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    const v19, 0x1110046

    invoke-virtual/range {v18 .. v19}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v6

    .line 283
    .local v6, "isCellBroadcastAppLinkEnabled":Z
    if-eqz v6, :cond_c

    .line 284
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/WirelessSettings;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v14

    .line 285
    .local v14, "pm":Landroid/content/pm/PackageManager;
    const-string v18, "com.android.cellbroadcastreceiver"

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Landroid/content/pm/PackageManager;->getApplicationEnabledSetting(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v18

    const/16 v19, 0x2

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_c

    .line 287
    const/4 v6, 0x0

    .line 293
    .end local v14    # "pm":Landroid/content/pm/PackageManager;
    :cond_c
    :goto_5
    if-nez v7, :cond_d

    if-nez v6, :cond_e

    .line 294
    :cond_d
    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/WirelessSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v16

    .line 295
    .restart local v16    # "root":Landroid/preference/PreferenceScreen;
    const-string v18, "cell_broadcast_settings"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v15

    .line 296
    .restart local v15    # "ps":Landroid/preference/Preference;
    if-eqz v15, :cond_e

    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 298
    .end local v15    # "ps":Landroid/preference/Preference;
    .end local v16    # "root":Landroid/preference/PreferenceScreen;
    :cond_e
    return-void

    .line 196
    .end local v2    # "activity":Landroid/app/Activity;
    .end local v3    # "androidBeam":Landroid/preference/PreferenceScreen;
    .end local v4    # "cm":Landroid/net/ConnectivityManager;
    .end local v6    # "isCellBroadcastAppLinkEnabled":Z
    .end local v7    # "isSecondaryUser":Z
    .end local v8    # "isWimaxEnabled":Z
    .end local v9    # "mDPM":Landroid/app/admin/DevicePolicyManager;
    .end local v10    # "mGlobalProxy":Landroid/preference/Preference;
    .end local v11    # "nfc":Landroid/preference/CheckBoxPreference;
    .end local v12    # "nsd":Landroid/preference/CheckBoxPreference;
    .end local v17    # "toggleable":Ljava/lang/String;
    :cond_f
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 215
    .restart local v2    # "activity":Landroid/app/Activity;
    .restart local v3    # "androidBeam":Landroid/preference/PreferenceScreen;
    .restart local v7    # "isSecondaryUser":Z
    .restart local v11    # "nfc":Landroid/preference/CheckBoxPreference;
    .restart local v12    # "nsd":Landroid/preference/CheckBoxPreference;
    .restart local v17    # "toggleable":Ljava/lang/String;
    :cond_10
    const/4 v8, 0x0

    goto/16 :goto_1

    .line 222
    .restart local v8    # "isWimaxEnabled":Z
    :cond_11
    if-eqz v17, :cond_12

    const-string v18, "wimax"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v18

    if-nez v18, :cond_1

    if-eqz v8, :cond_1

    .line 224
    :cond_12
    const-string v18, "wimax_settings"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v15

    .line 225
    .restart local v15    # "ps":Landroid/preference/Preference;
    const-string v18, "toggle_airplane"

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/preference/Preference;->setDependency(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 267
    .end local v15    # "ps":Landroid/preference/Preference;
    .restart local v9    # "mDPM":Landroid/app/admin/DevicePolicyManager;
    .restart local v10    # "mGlobalProxy":Landroid/preference/Preference;
    :cond_13
    const/16 v18, 0x0

    goto/16 :goto_3

    .line 275
    .restart local v4    # "cm":Landroid/net/ConnectivityManager;
    :cond_14
    const-string v18, "tether_settings"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v13

    .line 276
    .local v13, "p":Landroid/preference/Preference;
    invoke-static {v4}, Lcom/jellybyn/settings/Utils;->getTetheringLabel(Landroid/net/ConnectivityManager;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v13, v0}, Landroid/preference/Preference;->setTitle(I)V

    goto :goto_4

    .line 290
    .end local v13    # "p":Landroid/preference/Preference;
    .restart local v6    # "isCellBroadcastAppLinkEnabled":Z
    :catch_0
    move-exception v5

    .line 291
    .local v5, "ignored":Ljava/lang/IllegalArgumentException;
    const/4 v6, 0x0

    goto :goto_5
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 3
    .param p1, "dialogId"    # I

    .prologue
    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onCreateDialog: dialogId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/jellybyn/settings/WirelessSettings;->log(Ljava/lang/String;)V

    .line 151
    packed-switch p1, :pswitch_data_0

    .line 166
    invoke-super {p0, p1}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v0

    :goto_0
    return-object v0

    .line 153
    :pswitch_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/jellybyn/settings/WirelessSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/jellybyn/settings/WirelessSettings;->mManageMobilePlanMessage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x104000a

    new-instance v2, Lcom/jellybyn/settings/WirelessSettings$1;

    invoke-direct {v2, p0}, Lcom/jellybyn/settings/WirelessSettings$1;-><init>(Lcom/jellybyn/settings/WirelessSettings;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto :goto_0

    .line 151
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onManageMobilePlanClick()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    const v9, 0x7f0b0398

    const/4 v7, 0x0

    const/4 v8, 0x1

    .line 102
    const-string v6, "onManageMobilePlanClick:"

    invoke-direct {p0, v6}, Lcom/jellybyn/settings/WirelessSettings;->log(Ljava/lang/String;)V

    .line 103
    iput-object v10, p0, Lcom/jellybyn/settings/WirelessSettings;->mManageMobilePlanMessage:Ljava/lang/String;

    .line 104
    invoke-virtual {p0}, Lcom/jellybyn/settings/WirelessSettings;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 106
    .local v4, "resources":Landroid/content/res/Resources;
    iget-object v6, p0, Lcom/jellybyn/settings/WirelessSettings;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {v6}, Landroid/net/ConnectivityManager;->getProvisioningOrActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v2

    .line 107
    .local v2, "ni":Landroid/net/NetworkInfo;
    iget-object v6, p0, Lcom/jellybyn/settings/WirelessSettings;->mTm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v6}, Landroid/telephony/TelephonyManager;->hasIccCard()Z

    move-result v6

    if-eqz v6, :cond_4

    if-eqz v2, :cond_4

    .line 109
    iget-object v6, p0, Lcom/jellybyn/settings/WirelessSettings;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {v6}, Landroid/net/ConnectivityManager;->getMobileProvisioningUrl()Ljava/lang/String;

    move-result-object v5

    .line 110
    .local v5, "url":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 111
    new-instance v1, Landroid/content/Intent;

    const-string v6, "com.android.server.connectivityservice.CONNECTED_TO_PROVISIONING_NETWORK_ACTION"

    invoke-direct {v1, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 112
    .local v1, "intent":Landroid/content/Intent;
    const-string v6, "EXTRA_URL"

    invoke-virtual {v1, v6, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 113
    invoke-virtual {p0}, Lcom/jellybyn/settings/WirelessSettings;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    .line 114
    .local v0, "context":Landroid/content/Context;
    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 115
    iput-object v10, p0, Lcom/jellybyn/settings/WirelessSettings;->mManageMobilePlanMessage:Ljava/lang/String;

    .line 142
    .end local v0    # "context":Landroid/content/Context;
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v5    # "url":Ljava/lang/String;
    :goto_0
    iget-object v6, p0, Lcom/jellybyn/settings/WirelessSettings;->mManageMobilePlanMessage:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 143
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onManageMobilePlanClick: message="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/jellybyn/settings/WirelessSettings;->mManageMobilePlanMessage:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/jellybyn/settings/WirelessSettings;->log(Ljava/lang/String;)V

    .line 144
    invoke-virtual {p0, v8}, Lcom/jellybyn/settings/WirelessSettings;->showDialog(I)V

    .line 146
    :cond_0
    return-void

    .line 118
    .restart local v5    # "url":Ljava/lang/String;
    :cond_1
    iget-object v6, p0, Lcom/jellybyn/settings/WirelessSettings;->mTm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v6}, Landroid/telephony/TelephonyManager;->getSimOperatorName()Ljava/lang/String;

    move-result-object v3

    .line 119
    .local v3, "operatorName":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 122
    iget-object v6, p0, Lcom/jellybyn/settings/WirelessSettings;->mTm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v6}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v3

    .line 123
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 124
    const v6, 0x7f0b0397

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/jellybyn/settings/WirelessSettings;->mManageMobilePlanMessage:Ljava/lang/String;

    goto :goto_0

    .line 127
    :cond_2
    new-array v6, v8, [Ljava/lang/Object;

    aput-object v3, v6, v7

    invoke-virtual {v4, v9, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/jellybyn/settings/WirelessSettings;->mManageMobilePlanMessage:Ljava/lang/String;

    goto :goto_0

    .line 131
    :cond_3
    new-array v6, v8, [Ljava/lang/Object;

    aput-object v3, v6, v7

    invoke-virtual {v4, v9, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/jellybyn/settings/WirelessSettings;->mManageMobilePlanMessage:Ljava/lang/String;

    goto :goto_0

    .line 135
    .end local v3    # "operatorName":Ljava/lang/String;
    .end local v5    # "url":Ljava/lang/String;
    :cond_4
    iget-object v6, p0, Lcom/jellybyn/settings/WirelessSettings;->mTm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v6}, Landroid/telephony/TelephonyManager;->hasIccCard()Z

    move-result v6

    if-nez v6, :cond_5

    .line 137
    const v6, 0x7f0b0399

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/jellybyn/settings/WirelessSettings;->mManageMobilePlanMessage:Ljava/lang/String;

    goto :goto_0

    .line 140
    :cond_5
    const v6, 0x7f0b039a

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/jellybyn/settings/WirelessSettings;->mManageMobilePlanMessage:Ljava/lang/String;

    goto :goto_0
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 324
    invoke-super {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onPause()V

    .line 326
    iget-object v0, p0, Lcom/jellybyn/settings/WirelessSettings;->mAirplaneModeEnabler:Lcom/jellybyn/settings/AirplaneModeEnabler;

    invoke-virtual {v0}, Lcom/jellybyn/settings/AirplaneModeEnabler;->pause()V

    .line 327
    iget-object v0, p0, Lcom/jellybyn/settings/WirelessSettings;->mNfcEnabler:Lcom/jellybyn/settings/nfc/NfcEnabler;

    if-eqz v0, :cond_0

    .line 328
    iget-object v0, p0, Lcom/jellybyn/settings/WirelessSettings;->mNfcEnabler:Lcom/jellybyn/settings/nfc/NfcEnabler;

    invoke-virtual {v0}, Lcom/jellybyn/settings/nfc/NfcEnabler;->pause()V

    .line 330
    :cond_0
    iget-object v0, p0, Lcom/jellybyn/settings/WirelessSettings;->mNsdEnabler:Lcom/jellybyn/settings/NsdEnabler;

    if-eqz v0, :cond_1

    .line 331
    iget-object v0, p0, Lcom/jellybyn/settings/WirelessSettings;->mNsdEnabler:Lcom/jellybyn/settings/NsdEnabler;

    invoke-virtual {v0}, Lcom/jellybyn/settings/NsdEnabler;->pause()V

    .line 333
    :cond_1
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 4
    .param p1, "preferenceScreen"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    const/4 v0, 0x1

    .line 83
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPreferenceTreeClick: preference="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/jellybyn/settings/WirelessSettings;->log(Ljava/lang/String;)V

    .line 84
    iget-object v1, p0, Lcom/jellybyn/settings/WirelessSettings;->mAirplaneModePreference:Landroid/preference/CheckBoxPreference;

    if-ne p2, v1, :cond_0

    const-string v1, "ril.cdma.inecmmode"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 87
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.ACTION_SHOW_NOTICE_ECM_BLOCK_OTHERS"

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v1, v0}, Lcom/jellybyn/settings/WirelessSettings;->startActivityForResult(Landroid/content/Intent;I)V

    .line 95
    :goto_0
    return v0

    .line 91
    :cond_0
    const-string v0, "manage_mobile_plan"

    invoke-virtual {p0, v0}, Lcom/jellybyn/settings/WirelessSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-ne p2, v0, :cond_1

    .line 92
    invoke-virtual {p0}, Lcom/jellybyn/settings/WirelessSettings;->onManageMobilePlanClick()V

    .line 95
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v0

    goto :goto_0
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 302
    invoke-super {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onResume()V

    .line 304
    iget-object v0, p0, Lcom/jellybyn/settings/WirelessSettings;->mAirplaneModeEnabler:Lcom/jellybyn/settings/AirplaneModeEnabler;

    invoke-virtual {v0}, Lcom/jellybyn/settings/AirplaneModeEnabler;->resume()V

    .line 305
    iget-object v0, p0, Lcom/jellybyn/settings/WirelessSettings;->mNfcEnabler:Lcom/jellybyn/settings/nfc/NfcEnabler;

    if-eqz v0, :cond_0

    .line 306
    iget-object v0, p0, Lcom/jellybyn/settings/WirelessSettings;->mNfcEnabler:Lcom/jellybyn/settings/nfc/NfcEnabler;

    invoke-virtual {v0}, Lcom/jellybyn/settings/nfc/NfcEnabler;->resume()V

    .line 308
    :cond_0
    iget-object v0, p0, Lcom/jellybyn/settings/WirelessSettings;->mNsdEnabler:Lcom/jellybyn/settings/NsdEnabler;

    if-eqz v0, :cond_1

    .line 309
    iget-object v0, p0, Lcom/jellybyn/settings/WirelessSettings;->mNsdEnabler:Lcom/jellybyn/settings/NsdEnabler;

    invoke-virtual {v0}, Lcom/jellybyn/settings/NsdEnabler;->resume()V

    .line 311
    :cond_1
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 315
    invoke-super {p0, p1}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 317
    iget-object v0, p0, Lcom/jellybyn/settings/WirelessSettings;->mManageMobilePlanMessage:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 318
    const-string v0, "mManageMobilePlanMessage"

    iget-object v1, p0, Lcom/jellybyn/settings/WirelessSettings;->mManageMobilePlanMessage:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    :cond_0
    return-void
.end method
