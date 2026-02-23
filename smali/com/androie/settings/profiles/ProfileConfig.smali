.class public Lcom/androie/settings/profiles/ProfileConfig;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "ProfileConfig.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;,
        Lcom/androie/settings/profiles/ProfileConfig$RingModeItem;,
        Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;,
        Lcom/androie/settings/profiles/ProfileConfig$StreamItem;
    }
.end annotation


# instance fields
.field private mAirplaneMode:Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;

.field private mConnections:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;",
            ">;"
        }
    .end annotation
.end field

.field private mNamePreference:Lcom/androie/settings/profiles/NamePreference;

.field private mProfile:Landroid/app/Profile;

.field private mProfileManager:Landroid/app/ProfileManager;

.field private mRingMode:Lcom/androie/settings/profiles/ProfileConfig$RingModeItem;

.field private mScreenLockModePreference:Landroid/preference/ListPreference;

.field private mStreams:[Lcom/androie/settings/profiles/ProfileConfig$StreamItem;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    .line 471
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/profiles/ProfileConfig;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/profiles/ProfileConfig;

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/androie/settings/profiles/ProfileConfig;->doDelete()V

    return-void
.end method

.method private deleteProfile()V
    .locals 3

    .prologue
    .line 401
    iget-object v0, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    invoke-virtual {v0}, Landroid/app/Profile;->getUuid()Ljava/util/UUID;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfileManager:Landroid/app/ProfileManager;

    invoke-virtual {v1}, Landroid/app/ProfileManager;->getActiveProfile()Landroid/app/Profile;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Profile;->getUuid()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 402
    invoke-virtual {p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0800cb

    invoke-virtual {p0, v1}, Lcom/androie/settings/profiles/ProfileConfig;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 404
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 422
    :goto_0
    return-void

    .line 406
    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 407
    const v1, 0x7f0800bb

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 408
    const v1, 0x1010355

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIconAttribute(I)Landroid/app/AlertDialog$Builder;

    .line 409
    const v1, 0x7f0800c9

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 410
    const v1, 0x7f08037a

    new-instance v2, Lcom/androie/settings/profiles/ProfileConfig$1;

    invoke-direct {v2, p0}, Lcom/androie/settings/profiles/ProfileConfig$1;-><init>(Lcom/androie/settings/profiles/ProfileConfig;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 415
    const v1, 0x7f080458

    new-instance v2, Lcom/androie/settings/profiles/ProfileConfig$2;

    invoke-direct {v2, p0}, Lcom/androie/settings/profiles/ProfileConfig$2;-><init>(Lcom/androie/settings/profiles/ProfileConfig;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 420
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method private doDelete()V
    .locals 2

    .prologue
    .line 425
    iget-object v0, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfileManager:Landroid/app/ProfileManager;

    iget-object v1, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    invoke-virtual {v0, v1}, Landroid/app/ProfileManager;->removeProfile(Landroid/app/Profile;)V

    .line 426
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    .line 427
    invoke-virtual {p0}, Lcom/androie/settings/profiles/ProfileConfig;->finish()V

    .line 428
    return-void
.end method

.method private fillList()V
    .locals 27

    .prologue
    .line 203
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/profiles/ProfileConfig;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v15

    .line 206
    .local v15, "prefSet":Landroid/preference/PreferenceScreen;
    const-string v24, "profile_general_section"

    move-object/from16 v0, v24

    invoke-virtual {v15, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v10

    check-cast v10, Landroid/preference/PreferenceGroup;

    .line 207
    .local v10, "generalPrefs":Landroid/preference/PreferenceGroup;
    if-eqz v10, :cond_0

    .line 208
    invoke-virtual {v10}, Landroid/preference/PreferenceGroup;->removeAll()V

    .line 211
    new-instance v24, Lcom/androie/settings/profiles/NamePreference;

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v25

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/app/Profile;->getName()Ljava/lang/String;

    move-result-object v26

    invoke-direct/range {v24 .. v26}, Lcom/androie/settings/profiles/NamePreference;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/profiles/ProfileConfig;->mNamePreference:Lcom/androie/settings/profiles/NamePreference;

    .line 212
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mNamePreference:Lcom/androie/settings/profiles/NamePreference;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/androie/settings/profiles/NamePreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 213
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mNamePreference:Lcom/androie/settings/profiles/NamePreference;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v10, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 217
    :cond_0
    const-string v24, "profile_system_settings"

    move-object/from16 v0, v24

    invoke-virtual {v15, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v22

    check-cast v22, Landroid/preference/PreferenceGroup;

    .line 218
    .local v22, "systemPrefs":Landroid/preference/PreferenceGroup;
    if-eqz v22, :cond_6

    .line 219
    invoke-virtual/range {v22 .. v22}, Landroid/preference/PreferenceGroup;->removeAll()V

    .line 221
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mRingMode:Lcom/androie/settings/profiles/ProfileConfig$RingModeItem;

    move-object/from16 v24, v0

    if-nez v24, :cond_1

    .line 222
    new-instance v24, Lcom/androie/settings/profiles/ProfileConfig$RingModeItem;

    invoke-direct/range {v24 .. v24}, Lcom/androie/settings/profiles/ProfileConfig$RingModeItem;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/profiles/ProfileConfig;->mRingMode:Lcom/androie/settings/profiles/ProfileConfig$RingModeItem;

    .line 224
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/app/Profile;->getRingMode()Landroid/app/RingModeSettings;

    move-result-object v18

    .line 225
    .local v18, "rms":Landroid/app/RingModeSettings;
    if-nez v18, :cond_2

    .line 226
    new-instance v18, Landroid/app/RingModeSettings;

    .end local v18    # "rms":Landroid/app/RingModeSettings;
    invoke-direct/range {v18 .. v18}, Landroid/app/RingModeSettings;-><init>()V

    .line 227
    .restart local v18    # "rms":Landroid/app/RingModeSettings;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/app/Profile;->setRingMode(Landroid/app/RingModeSettings;)V

    .line 229
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mRingMode:Lcom/androie/settings/profiles/ProfileConfig$RingModeItem;

    move-object/from16 v24, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    iput-object v0, v1, Lcom/androie/settings/profiles/ProfileConfig$RingModeItem;->mSettings:Landroid/app/RingModeSettings;

    .line 230
    new-instance v17, Lcom/androie/settings/profiles/ProfileRingModePreference;

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v24

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/androie/settings/profiles/ProfileRingModePreference;-><init>(Landroid/content/Context;)V

    .line 231
    .local v17, "rmp":Lcom/androie/settings/profiles/ProfileRingModePreference;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mRingMode:Lcom/androie/settings/profiles/ProfileConfig$RingModeItem;

    move-object/from16 v24, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/androie/settings/profiles/ProfileRingModePreference;->setRingModeItem(Lcom/androie/settings/profiles/ProfileConfig$RingModeItem;)V

    .line 232
    const v24, 0x7f0801a0

    move-object/from16 v0, v17

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/androie/settings/profiles/ProfileRingModePreference;->setTitle(I)V

    .line 233
    const/16 v24, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/androie/settings/profiles/ProfileRingModePreference;->setPersistent(Z)V

    .line 234
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v24

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/androie/settings/profiles/ProfileRingModePreference;->setSummary(Landroid/content/Context;)V

    .line 235
    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/androie/settings/profiles/ProfileRingModePreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mRingMode:Lcom/androie/settings/profiles/ProfileConfig$RingModeItem;

    move-object/from16 v24, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    iput-object v0, v1, Lcom/androie/settings/profiles/ProfileConfig$RingModeItem;->mCheckbox:Lcom/androie/settings/profiles/ProfileRingModePreference;

    .line 237
    move-object/from16 v0, v22

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 240
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mAirplaneMode:Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;

    move-object/from16 v24, v0

    if-nez v24, :cond_3

    .line 241
    new-instance v24, Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;

    invoke-direct/range {v24 .. v24}, Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/profiles/ProfileConfig;->mAirplaneMode:Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;

    .line 243
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/app/Profile;->getAirplaneMode()Landroid/app/AirplaneModeSettings;

    move-result-object v4

    .line 244
    .local v4, "ams":Landroid/app/AirplaneModeSettings;
    if-nez v4, :cond_4

    .line 245
    new-instance v4, Landroid/app/AirplaneModeSettings;

    .end local v4    # "ams":Landroid/app/AirplaneModeSettings;
    invoke-direct {v4}, Landroid/app/AirplaneModeSettings;-><init>()V

    .line 246
    .restart local v4    # "ams":Landroid/app/AirplaneModeSettings;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Landroid/app/Profile;->setAirplaneMode(Landroid/app/AirplaneModeSettings;)V

    .line 248
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mAirplaneMode:Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iput-object v4, v0, Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;->mSettings:Landroid/app/AirplaneModeSettings;

    .line 249
    new-instance v3, Lcom/androie/settings/profiles/ProfileAirplaneModePreference;

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-direct {v3, v0}, Lcom/androie/settings/profiles/ProfileAirplaneModePreference;-><init>(Landroid/content/Context;)V

    .line 250
    .local v3, "amp":Lcom/androie/settings/profiles/ProfileAirplaneModePreference;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mAirplaneMode:Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v3, v0}, Lcom/androie/settings/profiles/ProfileAirplaneModePreference;->setAirplaneModeItem(Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;)V

    .line 251
    const v24, 0x7f0800f3

    move/from16 v0, v24

    invoke-virtual {v3, v0}, Lcom/androie/settings/profiles/ProfileAirplaneModePreference;->setTitle(I)V

    .line 252
    const/16 v24, 0x0

    move/from16 v0, v24

    invoke-virtual {v3, v0}, Lcom/androie/settings/profiles/ProfileAirplaneModePreference;->setPersistent(Z)V

    .line 253
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v3, v0}, Lcom/androie/settings/profiles/ProfileAirplaneModePreference;->setSummary(Landroid/content/Context;)V

    .line 254
    move-object/from16 v0, p0

    invoke-virtual {v3, v0}, Lcom/androie/settings/profiles/ProfileAirplaneModePreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 255
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mAirplaneMode:Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iput-object v3, v0, Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;->mCheckbox:Lcom/androie/settings/profiles/ProfileAirplaneModePreference;

    .line 256
    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 259
    new-instance v24, Landroid/preference/ListPreference;

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/profiles/ProfileConfig;->mScreenLockModePreference:Landroid/preference/ListPreference;

    .line 260
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mScreenLockModePreference:Landroid/preference/ListPreference;

    move-object/from16 v24, v0

    const v25, 0x7f0800ec

    invoke-virtual/range {v24 .. v25}, Landroid/preference/ListPreference;->setTitle(I)V

    .line 261
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mScreenLockModePreference:Landroid/preference/ListPreference;

    move-object/from16 v24, v0

    const v25, 0x7f0b0067

    invoke-virtual/range {v24 .. v25}, Landroid/preference/ListPreference;->setEntries(I)V

    .line 262
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mScreenLockModePreference:Landroid/preference/ListPreference;

    move-object/from16 v24, v0

    const v25, 0x7f0b0069

    invoke-virtual/range {v24 .. v25}, Landroid/preference/ListPreference;->setEntryValues(I)V

    .line 263
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mScreenLockModePreference:Landroid/preference/ListPreference;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Landroid/preference/ListPreference;->setPersistent(Z)V

    .line 264
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mScreenLockModePreference:Landroid/preference/ListPreference;

    move-object/from16 v24, v0

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/profiles/ProfileConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v25

    const v26, 0x7f0b0068

    invoke-virtual/range {v25 .. v26}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/app/Profile;->getScreenLockMode()I

    move-result v26

    aget-object v25, v25, v26

    invoke-virtual/range {v24 .. v25}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 266
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mScreenLockModePreference:Landroid/preference/ListPreference;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/app/Profile;->getScreenLockMode()I

    move-result v25

    invoke-static/range {v25 .. v25}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 267
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mScreenLockModePreference:Landroid/preference/ListPreference;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 269
    const-string v24, "device_policy"

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/androie/settings/profiles/ProfileConfig;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/app/admin/DevicePolicyManager;

    .line 270
    .local v9, "dpm":Landroid/app/admin/DevicePolicyManager;
    invoke-virtual {v9}, Landroid/app/admin/DevicePolicyManager;->requireSecureKeyguard()Z

    move-result v24

    if-eqz v24, :cond_5

    .line 271
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mScreenLockModePreference:Landroid/preference/ListPreference;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 272
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mScreenLockModePreference:Landroid/preference/ListPreference;

    move-object/from16 v24, v0

    const v25, 0x7f0804b4

    invoke-virtual/range {v24 .. v25}, Landroid/preference/ListPreference;->setSummary(I)V

    .line 275
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mScreenLockModePreference:Landroid/preference/ListPreference;

    move-object/from16 v24, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 279
    .end local v3    # "amp":Lcom/androie/settings/profiles/ProfileAirplaneModePreference;
    .end local v4    # "ams":Landroid/app/AirplaneModeSettings;
    .end local v9    # "dpm":Landroid/app/admin/DevicePolicyManager;
    .end local v17    # "rmp":Lcom/androie/settings/profiles/ProfileRingModePreference;
    .end local v18    # "rms":Landroid/app/RingModeSettings;
    :cond_6
    const-string v24, "audio"

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/androie/settings/profiles/ProfileConfig;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/AudioManager;

    .line 280
    .local v2, "am":Landroid/media/AudioManager;
    const-string v24, "profile_volumeoverrides"

    move-object/from16 v0, v24

    invoke-virtual {v15, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v21

    check-cast v21, Landroid/preference/PreferenceGroup;

    .line 281
    .local v21, "streamList":Landroid/preference/PreferenceGroup;
    if-eqz v21, :cond_8

    .line 282
    invoke-virtual/range {v21 .. v21}, Landroid/preference/PreferenceGroup;->removeAll()V

    .line 283
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/androie/settings/profiles/ProfileConfig;->mStreams:[Lcom/androie/settings/profiles/ProfileConfig$StreamItem;

    .local v5, "arr$":[Lcom/androie/settings/profiles/ProfileConfig$StreamItem;
    array-length v13, v5

    .local v13, "len$":I
    const/4 v12, 0x0

    .local v12, "i$":I
    :goto_0
    if-ge v12, v13, :cond_8

    aget-object v20, v5, v12

    .line 284
    .local v20, "stream":Lcom/androie/settings/profiles/ProfileConfig$StreamItem;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    move-object/from16 v24, v0

    move-object/from16 v0, v20

    iget v0, v0, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;->mStreamId:I

    move/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Landroid/app/Profile;->getSettingsForStream(I)Landroid/app/StreamSettings;

    move-result-object v19

    .line 285
    .local v19, "settings":Landroid/app/StreamSettings;
    if-nez v19, :cond_7

    .line 286
    new-instance v19, Landroid/app/StreamSettings;

    .end local v19    # "settings":Landroid/app/StreamSettings;
    move-object/from16 v0, v20

    iget v0, v0, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;->mStreamId:I

    move/from16 v24, v0

    move-object/from16 v0, v19

    move/from16 v1, v24

    invoke-direct {v0, v1}, Landroid/app/StreamSettings;-><init>(I)V

    .line 287
    .restart local v19    # "settings":Landroid/app/StreamSettings;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/app/Profile;->setStreamSettings(Landroid/app/StreamSettings;)V

    .line 289
    :cond_7
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    iput-object v0, v1, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;->mSettings:Landroid/app/StreamSettings;

    .line 290
    new-instance v14, Lcom/androie/settings/profiles/StreamVolumePreference;

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-direct {v14, v0}, Lcom/androie/settings/profiles/StreamVolumePreference;-><init>(Landroid/content/Context;)V

    .line 291
    .local v14, "pref":Lcom/androie/settings/profiles/StreamVolumePreference;
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "stream_"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v20

    iget v0, v0, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;->mStreamId:I

    move/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v14, v0}, Lcom/androie/settings/profiles/StreamVolumePreference;->setKey(Ljava/lang/String;)V

    .line 292
    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;->mLabel:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v14, v0}, Lcom/androie/settings/profiles/StreamVolumePreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 293
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const v25, 0x7f0800d3

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/androie/settings/profiles/ProfileConfig;->getString(I)Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, " "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v19 .. v19}, Landroid/app/StreamSettings;->getValue()I

    move-result v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v20

    iget v0, v0, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;->mStreamId:I

    move/from16 v25, v0

    move/from16 v0, v25

    invoke-virtual {v2, v0}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v14, v0}, Lcom/androie/settings/profiles/StreamVolumePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 295
    const/16 v24, 0x0

    move/from16 v0, v24

    invoke-virtual {v14, v0}, Lcom/androie/settings/profiles/StreamVolumePreference;->setPersistent(Z)V

    .line 296
    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/androie/settings/profiles/StreamVolumePreference;->setStreamItem(Lcom/androie/settings/profiles/ProfileConfig$StreamItem;)V

    .line 297
    move-object/from16 v0, v20

    iput-object v14, v0, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;->mCheckbox:Lcom/androie/settings/profiles/StreamVolumePreference;

    .line 298
    move-object/from16 v0, v21

    invoke-virtual {v0, v14}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 283
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_0

    .line 303
    .end local v5    # "arr$":[Lcom/androie/settings/profiles/ProfileConfig$StreamItem;
    .end local v12    # "i$":I
    .end local v13    # "len$":I
    .end local v14    # "pref":Lcom/androie/settings/profiles/StreamVolumePreference;
    .end local v19    # "settings":Landroid/app/StreamSettings;
    .end local v20    # "stream":Lcom/androie/settings/profiles/ProfileConfig$StreamItem;
    :cond_8
    const-string v24, "profile_connectionoverrides"

    move-object/from16 v0, v24

    invoke-virtual {v15, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    check-cast v7, Landroid/preference/PreferenceGroup;

    .line 304
    .local v7, "connectionList":Landroid/preference/PreferenceGroup;
    if-eqz v7, :cond_a

    .line 305
    invoke-virtual {v7}, Landroid/preference/PreferenceGroup;->removeAll()V

    .line 306
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mConnections:Ljava/util/ArrayList;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_a

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;

    .line 307
    .local v6, "connection":Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/profiles/ProfileConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v24

    iget v0, v6, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;->mChoices:I

    move/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v8

    .line 308
    .local v8, "connectionstrings":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    move-object/from16 v24, v0

    iget v0, v6, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;->mConnectionId:I

    move/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Landroid/app/Profile;->getSettingsForConnection(I)Landroid/app/ConnectionSettings;

    move-result-object v19

    .line 309
    .local v19, "settings":Landroid/app/ConnectionSettings;
    if-nez v19, :cond_9

    .line 310
    new-instance v19, Landroid/app/ConnectionSettings;

    .end local v19    # "settings":Landroid/app/ConnectionSettings;
    iget v0, v6, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;->mConnectionId:I

    move/from16 v24, v0

    move-object/from16 v0, v19

    move/from16 v1, v24

    invoke-direct {v0, v1}, Landroid/app/ConnectionSettings;-><init>(I)V

    .line 311
    .restart local v19    # "settings":Landroid/app/ConnectionSettings;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/app/Profile;->setConnectionSettings(Landroid/app/ConnectionSettings;)V

    .line 313
    :cond_9
    move-object/from16 v0, v19

    iput-object v0, v6, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;->mSettings:Landroid/app/ConnectionSettings;

    .line 314
    new-instance v14, Lcom/androie/settings/profiles/ProfileConnectionPreference;

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-direct {v14, v0}, Lcom/androie/settings/profiles/ProfileConnectionPreference;-><init>(Landroid/content/Context;)V

    .line 315
    .local v14, "pref":Lcom/androie/settings/profiles/ProfileConnectionPreference;
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "connection_"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    iget v0, v6, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;->mConnectionId:I

    move/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v14, v0}, Lcom/androie/settings/profiles/ProfileConnectionPreference;->setKey(Ljava/lang/String;)V

    .line 316
    iget-object v0, v6, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;->mLabel:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v14, v0}, Lcom/androie/settings/profiles/ProfileConnectionPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 317
    invoke-virtual/range {v19 .. v19}, Landroid/app/ConnectionSettings;->getValue()I

    move-result v24

    aget-object v24, v8, v24

    move-object/from16 v0, v24

    invoke-virtual {v14, v0}, Lcom/androie/settings/profiles/ProfileConnectionPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 318
    const/16 v24, 0x0

    move/from16 v0, v24

    invoke-virtual {v14, v0}, Lcom/androie/settings/profiles/ProfileConnectionPreference;->setPersistent(Z)V

    .line 319
    invoke-virtual {v14, v6}, Lcom/androie/settings/profiles/ProfileConnectionPreference;->setConnectionItem(Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;)V

    .line 320
    iput-object v14, v6, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;->mCheckbox:Lcom/androie/settings/profiles/ProfileConnectionPreference;

    .line 321
    invoke-virtual {v7, v14}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    goto/16 :goto_1

    .line 326
    .end local v6    # "connection":Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;
    .end local v8    # "connectionstrings":[Ljava/lang/String;
    .end local v12    # "i$":Ljava/util/Iterator;
    .end local v14    # "pref":Lcom/androie/settings/profiles/ProfileConnectionPreference;
    .end local v19    # "settings":Landroid/app/ConnectionSettings;
    :cond_a
    const-string v24, "profile_appgroups"

    move-object/from16 v0, v24

    invoke-virtual {v15, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v11

    check-cast v11, Landroid/preference/PreferenceGroup;

    .line 327
    .local v11, "groupList":Landroid/preference/PreferenceGroup;
    if-eqz v11, :cond_b

    .line 328
    invoke-virtual {v11}, Landroid/preference/PreferenceGroup;->removeAll()V

    .line 329
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/app/Profile;->getProfileGroups()[Landroid/app/ProfileGroup;

    move-result-object v5

    .local v5, "arr$":[Landroid/app/ProfileGroup;
    array-length v13, v5

    .restart local v13    # "len$":I
    const/4 v12, 0x0

    .local v12, "i$":I
    :goto_2
    if-ge v12, v13, :cond_b

    aget-object v16, v5, v12

    .line 330
    .local v16, "profileGroup":Landroid/app/ProfileGroup;
    new-instance v14, Landroid/preference/PreferenceScreen;

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v24

    const/16 v25, 0x0

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-direct {v14, v0, v1}, Landroid/preference/PreferenceScreen;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 331
    .local v14, "pref":Landroid/preference/PreferenceScreen;
    invoke-virtual/range {v16 .. v16}, Landroid/app/ProfileGroup;->getUuid()Ljava/util/UUID;

    move-result-object v23

    .line 332
    .local v23, "uuid":Ljava/util/UUID;
    invoke-virtual/range {v23 .. v23}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v14, v0}, Landroid/preference/PreferenceScreen;->setKey(Ljava/lang/String;)V

    .line 333
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/profiles/ProfileConfig;->mProfileManager:Landroid/app/ProfileManager;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/app/ProfileManager;->getNotificationGroup(Ljava/util/UUID;)Landroid/app/NotificationGroup;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Landroid/app/NotificationGroup;->getName()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v14, v0}, Landroid/preference/PreferenceScreen;->setTitle(Ljava/lang/CharSequence;)V

    .line 335
    const/16 v24, 0x0

    move/from16 v0, v24

    invoke-virtual {v14, v0}, Landroid/preference/PreferenceScreen;->setPersistent(Z)V

    .line 336
    const/16 v24, 0x1

    move/from16 v0, v24

    invoke-virtual {v14, v0}, Landroid/preference/PreferenceScreen;->setSelectable(Z)V

    .line 337
    invoke-virtual {v11, v14}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 329
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 340
    .end local v5    # "arr$":[Landroid/app/ProfileGroup;
    .end local v12    # "i$":I
    .end local v13    # "len$":I
    .end local v14    # "pref":Landroid/preference/PreferenceScreen;
    .end local v16    # "profileGroup":Landroid/app/ProfileGroup;
    .end local v23    # "uuid":Ljava/util/UUID;
    :cond_b
    return-void
.end method

.method private startNFCProfileWriter()V
    .locals 4

    .prologue
    .line 187
    invoke-virtual {p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    .line 188
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-class v3, Lcom/androie/settings/profiles/NFCProfileWriter;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 189
    const-string v2, "PROFILE_UUID"

    iget-object v3, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    invoke-virtual {v3}, Landroid/app/Profile;->getUuid()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 190
    const/high16 v2, 0x20000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 191
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceActivity;->startActivity(Landroid/content/Intent;)V

    .line 192
    return-void
.end method

.method private startProfileGroupActivity(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .prologue
    .line 389
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 390
    const-string v0, "ProfileGroup"

    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 391
    const-string v0, "Profile"

    iget-object v1, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    invoke-virtual {v2, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 393
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    invoke-virtual {v1}, Landroid/app/Profile;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 394
    invoke-virtual {p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    .line 395
    const-class v1, Lcom/androie/settings/profiles/ProfileGroupConfig;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    const/4 v6, 0x1

    move-object v5, p0

    invoke-virtual/range {v0 .. v6}, Landroid/preference/PreferenceActivity;->startPreferencePanel(Ljava/lang/String;Landroid/os/Bundle;ILjava/lang/CharSequence;Landroid/app/Fragment;I)V

    .line 397
    return-void
.end method

.method private startTriggerFragment()V
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 195
    invoke-virtual {p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    .line 196
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 197
    const-string v1, "profile"

    iget-object v4, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    invoke-virtual {v2, v1, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 199
    const-class v1, Lcom/androie/settings/profiles/TriggersFragment;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v4, ""

    const/4 v5, 0x0

    move v6, v3

    invoke-virtual/range {v0 .. v6}, Landroid/preference/PreferenceActivity;->startPreferencePanel(Ljava/lang/String;Landroid/os/Bundle;ILjava/lang/CharSequence;Landroid/app/Fragment;I)V

    .line 200
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 11
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v6, 0x2

    const/4 v7, 0x1

    .line 88
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 90
    new-array v2, v9, [Lcom/androie/settings/profiles/ProfileConfig$StreamItem;

    new-instance v3, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;

    const v4, 0x7f08060c

    invoke-virtual {p0, v4}, Lcom/androie/settings/profiles/ProfileConfig;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v9, v4}, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;-><init>(ILjava/lang/String;)V

    aput-object v3, v2, v10

    new-instance v3, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;

    const v4, 0x7f08060a

    invoke-virtual {p0, v4}, Lcom/androie/settings/profiles/ProfileConfig;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v8, v4}, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;-><init>(ILjava/lang/String;)V

    aput-object v3, v2, v7

    new-instance v3, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;

    const v4, 0x7f080606

    invoke-virtual {p0, v4}, Lcom/androie/settings/profiles/ProfileConfig;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v6, v4}, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;-><init>(ILjava/lang/String;)V

    aput-object v3, v2, v6

    new-instance v3, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;

    const/4 v4, 0x5

    const v5, 0x7f080607

    invoke-virtual {p0, v5}, Lcom/androie/settings/profiles/ProfileConfig;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;-><init>(ILjava/lang/String;)V

    aput-object v3, v2, v8

    iput-object v2, p0, Lcom/androie/settings/profiles/ProfileConfig;->mStreams:[Lcom/androie/settings/profiles/ProfileConfig$StreamItem;

    .line 97
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/androie/settings/profiles/ProfileConfig;->mConnections:Ljava/util/ArrayList;

    .line 98
    invoke-static {}, Lcom/android/internal/util/cm/QSUtils;->deviceSupportsBluetooth()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 99
    iget-object v2, p0, Lcom/androie/settings/profiles/ProfileConfig;->mConnections:Ljava/util/ArrayList;

    new-instance v3, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;

    const/4 v4, 0x7

    const v5, 0x7f0800f6

    invoke-virtual {p0, v5}, Lcom/androie/settings/profiles/ProfileConfig;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    :cond_0
    iget-object v2, p0, Lcom/androie/settings/profiles/ProfileConfig;->mConnections:Ljava/util/ArrayList;

    new-instance v3, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;

    const v4, 0x7f0800f7

    invoke-virtual {p0, v4}, Lcom/androie/settings/profiles/ProfileConfig;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v9, v4}, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    iget-object v2, p0, Lcom/androie/settings/profiles/ProfileConfig;->mConnections:Ljava/util/ArrayList;

    new-instance v3, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;

    const v4, 0x7f0800f4

    invoke-virtual {p0, v4}, Lcom/androie/settings/profiles/ProfileConfig;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v7, v4}, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 103
    iget-object v2, p0, Lcom/androie/settings/profiles/ProfileConfig;->mConnections:Ljava/util/ArrayList;

    new-instance v3, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;

    const/4 v4, 0x5

    const v5, 0x7f0800f9

    invoke-virtual {p0, v5}, Lcom/androie/settings/profiles/ProfileConfig;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    invoke-virtual {p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/util/cm/QSUtils;->deviceSupportsMobileData(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 105
    iget-object v2, p0, Lcom/androie/settings/profiles/ProfileConfig;->mConnections:Ljava/util/ArrayList;

    new-instance v3, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;

    const v4, 0x7f0800f8

    invoke-virtual {p0, v4}, Lcom/androie/settings/profiles/ProfileConfig;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v10, v4}, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 106
    iget-object v2, p0, Lcom/androie/settings/profiles/ProfileConfig;->mConnections:Ljava/util/ArrayList;

    new-instance v3, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;

    const v4, 0x7f0800f5

    invoke-virtual {p0, v4}, Lcom/androie/settings/profiles/ProfileConfig;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v6, v4}, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 107
    invoke-virtual {p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-string v3, "phone"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 108
    .local v1, "tm":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    move-result v2

    if-ne v2, v7, :cond_1

    .line 109
    iget-object v2, p0, Lcom/androie/settings/profiles/ProfileConfig;->mConnections:Ljava/util/ArrayList;

    new-instance v3, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;

    const/16 v4, 0x9

    const v5, 0x7f0800fa

    invoke-virtual {p0, v5}, Lcom/androie/settings/profiles/ProfileConfig;->getString(I)Ljava/lang/String;

    move-result-object v5

    const v6, 0x7f0b0063

    invoke-direct {v3, v4, v5, v6}, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;-><init>(ILjava/lang/String;I)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 112
    .end local v1    # "tm":Landroid/telephony/TelephonyManager;
    :cond_1
    invoke-virtual {p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Landroid/net/wimax/WimaxHelper;->isWimaxSupported(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 113
    iget-object v2, p0, Lcom/androie/settings/profiles/ProfileConfig;->mConnections:Ljava/util/ArrayList;

    new-instance v3, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;

    const v4, 0x7f0800fb

    invoke-virtual {p0, v4}, Lcom/androie/settings/profiles/ProfileConfig;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v8, v4}, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 115
    :cond_2
    invoke-virtual {p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/util/cm/QSUtils;->deviceSupportsNfc(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 116
    iget-object v2, p0, Lcom/androie/settings/profiles/ProfileConfig;->mConnections:Ljava/util/ArrayList;

    new-instance v3, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;

    const/16 v4, 0x8

    const v5, 0x7f0800fc

    invoke-virtual {p0, v5}, Lcom/androie/settings/profiles/ProfileConfig;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    :cond_3
    const v2, 0x7f050030

    invoke-virtual {p0, v2}, Lcom/androie/settings/profiles/ProfileConfig;->addPreferencesFromResource(I)V

    .line 121
    invoke-virtual {p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-string v3, "profile"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/ProfileManager;

    iput-object v2, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfileManager:Landroid/app/ProfileManager;

    .line 123
    invoke-virtual {p0}, Lcom/androie/settings/profiles/ProfileConfig;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 124
    .local v0, "args":Landroid/os/Bundle;
    if-eqz v0, :cond_5

    const-string v2, "Profile"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/app/Profile;

    :goto_0
    iput-object v2, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    .line 126
    iget-object v2, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    if-nez v2, :cond_4

    .line 127
    new-instance v2, Landroid/app/Profile;

    const v3, 0x7f0800c2

    invoke-virtual {p0, v3}, Lcom/androie/settings/profiles/ProfileConfig;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/Profile;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    .line 128
    iget-object v2, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfileManager:Landroid/app/ProfileManager;

    iget-object v3, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    invoke-virtual {v2, v3}, Landroid/app/ProfileManager;->addProfile(Landroid/app/Profile;)V

    .line 131
    :cond_4
    invoke-virtual {p0, v7}, Lcom/androie/settings/profiles/ProfileConfig;->setHasOptionsMenu(Z)V

    .line 133
    return-void

    .line 124
    :cond_5
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 8
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x5

    const/4 v5, 0x0

    .line 137
    invoke-virtual {p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/util/cm/QSUtils;->deviceSupportsNfc(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 138
    const v3, 0x7f08016a

    invoke-interface {p1, v5, v7, v5, v3}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v3

    const v4, 0x7f020074

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v1

    .line 140
    .local v1, "nfc":Landroid/view/MenuItem;
    invoke-interface {v1, v6}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 143
    .end local v1    # "nfc":Landroid/view/MenuItem;
    :cond_0
    const/4 v3, 0x3

    const v4, 0x7f080166

    invoke-interface {p1, v5, v3, v5, v4}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v3

    const v4, 0x7f02006b

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v2

    .line 145
    .local v2, "triggers":Landroid/view/MenuItem;
    invoke-interface {v2, v6}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 147
    const/4 v3, 0x2

    const v4, 0x7f0800bb

    invoke-interface {p1, v5, v3, v7, v4}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v3

    const v4, 0x7f02007a

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 149
    .local v0, "delete":Landroid/view/MenuItem;
    invoke-interface {v0, v6}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 151
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v0, 0x1

    .line 155
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 166
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 157
    :pswitch_0
    invoke-direct {p0}, Lcom/androie/settings/profiles/ProfileConfig;->deleteProfile()V

    goto :goto_0

    .line 160
    :pswitch_1
    invoke-direct {p0}, Lcom/androie/settings/profiles/ProfileConfig;->startNFCProfileWriter()V

    goto :goto_0

    .line 163
    :pswitch_2
    invoke-direct {p0}, Lcom/androie/settings/profiles/ProfileConfig;->startTriggerFragment()V

    goto :goto_0

    .line 155
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 179
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onPause()V

    .line 181
    iget-object v0, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfileManager:Landroid/app/ProfileManager;

    iget-object v1, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    invoke-virtual {v0, v1}, Landroid/app/ProfileManager;->updateProfile(Landroid/app/Profile;)V

    .line 184
    :cond_0
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 10
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v9, 0x1

    .line 344
    instance-of v6, p1, Lcom/androie/settings/profiles/StreamVolumePreference;

    if-eqz v6, :cond_1

    .line 345
    iget-object v0, p0, Lcom/androie/settings/profiles/ProfileConfig;->mStreams:[Lcom/androie/settings/profiles/ProfileConfig$StreamItem;

    .local v0, "arr$":[Lcom/androie/settings/profiles/ProfileConfig$StreamItem;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_4

    aget-object v5, v0, v2

    .line 346
    .local v5, "stream":Lcom/androie/settings/profiles/ProfileConfig$StreamItem;
    iget-object v6, v5, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;->mCheckbox:Lcom/androie/settings/profiles/StreamVolumePreference;

    if-ne p1, v6, :cond_0

    .line 347
    iget-object v7, v5, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;->mSettings:Landroid/app/StreamSettings;

    move-object v6, p2

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-virtual {v7, v6}, Landroid/app/StreamSettings;->setOverride(Z)V

    .line 345
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 350
    .end local v0    # "arr$":[Lcom/androie/settings/profiles/ProfileConfig$StreamItem;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v5    # "stream":Lcom/androie/settings/profiles/ProfileConfig$StreamItem;
    :cond_1
    instance-of v6, p1, Lcom/androie/settings/profiles/ProfileConnectionPreference;

    if-eqz v6, :cond_3

    .line 351
    iget-object v6, p0, Lcom/androie/settings/profiles/ProfileConfig;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;

    .line 352
    .local v1, "connection":Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;
    iget-object v6, v1, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;->mCheckbox:Lcom/androie/settings/profiles/ProfileConnectionPreference;

    if-ne p1, v6, :cond_2

    .line 353
    iget-object v7, v1, Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;->mSettings:Landroid/app/ConnectionSettings;

    move-object v6, p2

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-virtual {v7, v6}, Landroid/app/ConnectionSettings;->setOverride(Z)V

    goto :goto_1

    .line 356
    .end local v1    # "connection":Lcom/androie/settings/profiles/ProfileConfig$ConnectionItem;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_3
    iget-object v6, p0, Lcom/androie/settings/profiles/ProfileConfig;->mRingMode:Lcom/androie/settings/profiles/ProfileConfig$RingModeItem;

    iget-object v6, v6, Lcom/androie/settings/profiles/ProfileConfig$RingModeItem;->mCheckbox:Lcom/androie/settings/profiles/ProfileRingModePreference;

    if-ne p1, v6, :cond_5

    .line 357
    iget-object v6, p0, Lcom/androie/settings/profiles/ProfileConfig;->mRingMode:Lcom/androie/settings/profiles/ProfileConfig$RingModeItem;

    iget-object v6, v6, Lcom/androie/settings/profiles/ProfileConfig$RingModeItem;->mSettings:Landroid/app/RingModeSettings;

    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    invoke-virtual {v6, v7}, Landroid/app/RingModeSettings;->setOverride(Z)V

    .line 375
    :cond_4
    :goto_2
    return v9

    .line 358
    .restart local p2    # "newValue":Ljava/lang/Object;
    :cond_5
    iget-object v6, p0, Lcom/androie/settings/profiles/ProfileConfig;->mAirplaneMode:Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;

    iget-object v6, v6, Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;->mCheckbox:Lcom/androie/settings/profiles/ProfileAirplaneModePreference;

    if-ne p1, v6, :cond_6

    .line 359
    iget-object v6, p0, Lcom/androie/settings/profiles/ProfileConfig;->mAirplaneMode:Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;

    iget-object v6, v6, Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;->mSettings:Landroid/app/AirplaneModeSettings;

    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    invoke-virtual {v6, v7}, Landroid/app/AirplaneModeSettings;->setOverride(Z)V

    goto :goto_2

    .line 360
    .restart local p2    # "newValue":Ljava/lang/Object;
    :cond_6
    iget-object v6, p0, Lcom/androie/settings/profiles/ProfileConfig;->mNamePreference:Lcom/androie/settings/profiles/NamePreference;

    if-ne p1, v6, :cond_8

    .line 361
    iget-object v6, p0, Lcom/androie/settings/profiles/ProfileConfig;->mNamePreference:Lcom/androie/settings/profiles/NamePreference;

    invoke-virtual {v6}, Lcom/androie/settings/profiles/NamePreference;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v4

    .line 362
    .local v4, "name":Ljava/lang/String;
    iget-object v6, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    invoke-virtual {v6}, Landroid/app/Profile;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 363
    iget-object v6, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfileManager:Landroid/app/ProfileManager;

    invoke-virtual {v6, v4}, Landroid/app/ProfileManager;->profileExists(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_7

    .line 364
    iget-object v6, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    invoke-virtual {v6, v4}, Landroid/app/Profile;->setName(Ljava/lang/String;)V

    goto :goto_2

    .line 366
    :cond_7
    iget-object v6, p0, Lcom/androie/settings/profiles/ProfileConfig;->mNamePreference:Lcom/androie/settings/profiles/NamePreference;

    iget-object v7, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    invoke-virtual {v7}, Landroid/app/Profile;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/androie/settings/profiles/NamePreference;->setName(Ljava/lang/String;)V

    .line 367
    invoke-virtual {p0}, Lcom/androie/settings/profiles/ProfileConfig;->getActivity()Landroid/app/Activity;

    move-result-object v6

    const v7, 0x7f0800c5

    invoke-static {v6, v7, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    goto :goto_2

    .line 370
    .end local v4    # "name":Ljava/lang/String;
    :cond_8
    iget-object v6, p0, Lcom/androie/settings/profiles/ProfileConfig;->mScreenLockModePreference:Landroid/preference/ListPreference;

    if-ne p1, v6, :cond_4

    .line 371
    iget-object v6, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    check-cast p2, Ljava/lang/String;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/app/Profile;->setScreenLockMode(I)V

    .line 372
    iget-object v6, p0, Lcom/androie/settings/profiles/ProfileConfig;->mScreenLockModePreference:Landroid/preference/ListPreference;

    invoke-virtual {p0}, Lcom/androie/settings/profiles/ProfileConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0b0068

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    invoke-virtual {v8}, Landroid/app/Profile;->getScreenLockMode()I

    move-result v8

    aget-object v7, v7, v8

    invoke-virtual {v6, v7}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto/16 :goto_2
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 3
    .param p1, "preferenceScreen"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 380
    const-string v0, "ProfileConfig"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPreferenceTreeClick(): entered"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/preference/PreferenceScreen;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    instance-of v0, p2, Landroid/preference/PreferenceScreen;

    if-eqz v0, :cond_0

    .line 382
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/androie/settings/profiles/ProfileConfig;->startProfileGroupActivity(Ljava/lang/String;Ljava/lang/String;)V

    .line 383
    const/4 v0, 0x1

    .line 385
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Lcom/androie/settings/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v0

    goto :goto_0
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 172
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onResume()V

    .line 173
    iget-object v0, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfileManager:Landroid/app/ProfileManager;

    iget-object v1, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    invoke-virtual {v1}, Landroid/app/Profile;->getUuid()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProfileManager;->getProfile(Ljava/util/UUID;)Landroid/app/Profile;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/profiles/ProfileConfig;->mProfile:Landroid/app/Profile;

    .line 174
    invoke-direct {p0}, Lcom/androie/settings/profiles/ProfileConfig;->fillList()V

    .line 175
    return-void
.end method
