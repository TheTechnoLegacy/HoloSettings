.class public Lcom/androie/settings/cyanogenmod/ButtonSettings;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "ButtonSettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field private mAppSwitchLongPressAction:Landroid/preference/ListPreference;

.field private mAppSwitchPressAction:Landroid/preference/ListPreference;

.field private mAssistLongPressAction:Landroid/preference/ListPreference;

.field private mAssistPressAction:Landroid/preference/ListPreference;

.field private mCameraMusicControls:Landroid/preference/CheckBoxPreference;

.field private mCameraSleepOnRelease:Landroid/preference/CheckBoxPreference;

.field private mCameraWake:Landroid/preference/CheckBoxPreference;

.field private mHomeDoubleTapAction:Landroid/preference/ListPreference;

.field private mHomeLongPressAction:Landroid/preference/ListPreference;

.field private mMenuLongPressAction:Landroid/preference/ListPreference;

.field private mMenuPressAction:Landroid/preference/ListPreference;

.field private mShowActionOverflow:Landroid/preference/CheckBoxPreference;

.field private mSwapVolumeButtons:Landroid/preference/CheckBoxPreference;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    return-void
.end method

.method private handleActionListChange(Landroid/preference/ListPreference;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 4
    .param p1, "pref"    # Landroid/preference/ListPreference;
    .param p2, "newValue"    # Ljava/lang/Object;
    .param p3, "setting"    # Ljava/lang/String;

    .prologue
    .line 257
    move-object v1, p2

    check-cast v1, Ljava/lang/String;

    .line 258
    .local v1, "value":Ljava/lang/String;
    invoke-virtual {p1, v1}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v0

    .line 260
    .local v0, "index":I
    invoke-virtual {p1}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v2

    aget-object v2, v2, v0

    invoke-virtual {p1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 261
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v2, p3, v3}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 262
    return-void
.end method

.method private initActionList(Ljava/lang/String;I)Landroid/preference/ListPreference;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # I

    .prologue
    .line 249
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/ListPreference;

    .line 250
    .local v0, "list":Landroid/preference/ListPreference;
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 251
    invoke-virtual {v0}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 252
    invoke-virtual {v0, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 253
    return-object v0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 30
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 92
    invoke-super/range {p0 .. p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 94
    const v27, 0x7f05000e

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->addPreferencesFromResource(I)V

    .line 96
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v22

    .line 97
    .local v22, "res":Landroid/content/res/Resources;
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->getActivity()Landroid/app/Activity;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v23

    .line 98
    .local v23, "resolver":Landroid/content/ContentResolver;
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v20

    .line 100
    .local v20, "prefScreen":Landroid/preference/PreferenceScreen;
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v27

    const v28, 0x10e0043

    invoke-virtual/range {v27 .. v28}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v9

    .line 102
    .local v9, "deviceKeys":I
    and-int/lit8 v27, v9, 0x1

    if-eqz v27, :cond_8

    const/4 v15, 0x1

    .line 103
    .local v15, "hasHomeKey":Z
    :goto_0
    and-int/lit8 v27, v9, 0x4

    if-eqz v27, :cond_9

    const/16 v16, 0x1

    .line 104
    .local v16, "hasMenuKey":Z
    :goto_1
    and-int/lit8 v27, v9, 0x8

    if-eqz v27, :cond_a

    const/4 v13, 0x1

    .line 105
    .local v13, "hasAssistKey":Z
    :goto_2
    and-int/lit8 v27, v9, 0x10

    if-eqz v27, :cond_b

    const/4 v12, 0x1

    .line 106
    .local v12, "hasAppSwitchKey":Z
    :goto_3
    and-int/lit8 v27, v9, 0x20

    if-eqz v27, :cond_c

    const/4 v14, 0x1

    .line 108
    .local v14, "hasCameraKey":Z
    :goto_4
    const/4 v11, 0x0

    .line 109
    .local v11, "hasAnyBindableKey":Z
    const-string v27, "home_key"

    move-object/from16 v0, v20

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v17

    check-cast v17, Landroid/preference/PreferenceCategory;

    .line 111
    .local v17, "homeCategory":Landroid/preference/PreferenceCategory;
    const-string v27, "menu_key"

    move-object/from16 v0, v20

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v19

    check-cast v19, Landroid/preference/PreferenceCategory;

    .line 113
    .local v19, "menuCategory":Landroid/preference/PreferenceCategory;
    const-string v27, "assist_key"

    move-object/from16 v0, v20

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/PreferenceCategory;

    .line 115
    .local v4, "assistCategory":Landroid/preference/PreferenceCategory;
    const-string v27, "app_switch_key"

    move-object/from16 v0, v20

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/PreferenceCategory;

    .line 117
    .local v3, "appSwitchCategory":Landroid/preference/PreferenceCategory;
    const-string v27, "camera_key"

    move-object/from16 v0, v20

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    check-cast v6, Landroid/preference/PreferenceCategory;

    .line 119
    .local v6, "cameraCategory":Landroid/preference/PreferenceCategory;
    const-string v27, "volume_keys"

    move-object/from16 v0, v20

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v26

    check-cast v26, Landroid/preference/PreferenceCategory;

    .line 122
    .local v26, "volumeCategory":Landroid/preference/PreferenceCategory;
    if-eqz v15, :cond_d

    .line 123
    const v27, 0x7f0d000a

    move-object/from16 v0, v22

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v27

    if-nez v27, :cond_0

    .line 124
    const-string v27, "home_wake_screen"

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v27

    move-object/from16 v0, v17

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 127
    :cond_0
    const v27, 0x10e0024

    move-object/from16 v0, v22

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v8

    .line 129
    .local v8, "defaultLongPressAction":I
    if-ltz v8, :cond_1

    const/16 v27, 0x5

    move/from16 v0, v27

    if-le v8, v0, :cond_2

    .line 131
    :cond_1
    const/4 v8, 0x0

    .line 134
    :cond_2
    const v27, 0x10e0025

    move-object/from16 v0, v22

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v7

    .line 136
    .local v7, "defaultDoubleTapAction":I
    if-ltz v7, :cond_3

    const/16 v27, 0x5

    move/from16 v0, v27

    if-le v7, v0, :cond_4

    .line 138
    :cond_3
    const/4 v7, 0x0

    .line 141
    :cond_4
    const-string v27, "key_home_long_press_action"

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-static {v0, v1, v8}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v18

    .line 144
    .local v18, "longPressAction":I
    const-string v27, "hardware_keys_home_long_press"

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    move/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->initActionList(Ljava/lang/String;I)Landroid/preference/ListPreference;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mHomeLongPressAction:Landroid/preference/ListPreference;

    .line 146
    const-string v27, "key_home_double_tap_action"

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-static {v0, v1, v7}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v10

    .line 149
    .local v10, "doubleTapAction":I
    const-string v27, "hardware_keys_home_double_tap"

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-direct {v0, v1, v10}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->initActionList(Ljava/lang/String;I)Landroid/preference/ListPreference;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mHomeDoubleTapAction:Landroid/preference/ListPreference;

    .line 151
    const/4 v11, 0x1

    .line 156
    .end local v7    # "defaultDoubleTapAction":I
    .end local v8    # "defaultLongPressAction":I
    .end local v10    # "doubleTapAction":I
    .end local v18    # "longPressAction":I
    :goto_5
    if-eqz v16, :cond_f

    .line 157
    const-string v27, "key_menu_action"

    const/16 v28, 0x1

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    move/from16 v2, v28

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v21

    .line 159
    .local v21, "pressAction":I
    const-string v27, "hardware_keys_menu_press"

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    move/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->initActionList(Ljava/lang/String;I)Landroid/preference/ListPreference;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mMenuPressAction:Landroid/preference/ListPreference;

    .line 161
    const-string v28, "key_menu_long_press_action"

    if-eqz v13, :cond_e

    const/16 v27, 0x0

    :goto_6
    move-object/from16 v0, v23

    move-object/from16 v1, v28

    move/from16 v2, v27

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v18

    .line 164
    .restart local v18    # "longPressAction":I
    const-string v27, "hardware_keys_menu_long_press"

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    move/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->initActionList(Ljava/lang/String;I)Landroid/preference/ListPreference;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mMenuLongPressAction:Landroid/preference/ListPreference;

    .line 166
    const/4 v11, 0x1

    .line 172
    .end local v18    # "longPressAction":I
    .end local v21    # "pressAction":I
    :goto_7
    if-eqz v13, :cond_10

    .line 173
    const-string v27, "key_assist_action"

    const/16 v28, 0x3

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    move/from16 v2, v28

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v21

    .line 175
    .restart local v21    # "pressAction":I
    const-string v27, "hardware_keys_assist_press"

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    move/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->initActionList(Ljava/lang/String;I)Landroid/preference/ListPreference;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mAssistPressAction:Landroid/preference/ListPreference;

    .line 177
    const-string v27, "key_assist_long_press_action"

    const/16 v28, 0x4

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    move/from16 v2, v28

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v18

    .line 179
    .restart local v18    # "longPressAction":I
    const-string v27, "hardware_keys_assist_long_press"

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    move/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->initActionList(Ljava/lang/String;I)Landroid/preference/ListPreference;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mAssistLongPressAction:Landroid/preference/ListPreference;

    .line 181
    const/4 v11, 0x1

    .line 186
    .end local v18    # "longPressAction":I
    .end local v21    # "pressAction":I
    :goto_8
    if-eqz v12, :cond_11

    .line 187
    const-string v27, "key_app_switch_action"

    const/16 v28, 0x2

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    move/from16 v2, v28

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v21

    .line 189
    .restart local v21    # "pressAction":I
    const-string v27, "hardware_keys_app_switch_press"

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    move/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->initActionList(Ljava/lang/String;I)Landroid/preference/ListPreference;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mAppSwitchPressAction:Landroid/preference/ListPreference;

    .line 191
    const-string v27, "key_app_switch_long_press_action"

    const/16 v28, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    move/from16 v2, v28

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v18

    .line 193
    .restart local v18    # "longPressAction":I
    const-string v27, "hardware_keys_app_switch_long_press"

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    move/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->initActionList(Ljava/lang/String;I)Landroid/preference/ListPreference;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mAppSwitchLongPressAction:Landroid/preference/ListPreference;

    .line 195
    const/4 v11, 0x1

    .line 200
    .end local v18    # "longPressAction":I
    .end local v21    # "pressAction":I
    :goto_9
    if-eqz v14, :cond_13

    .line 201
    const-string v27, "camera_wake_screen"

    move-object/from16 v0, v20

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v27

    check-cast v27, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mCameraWake:Landroid/preference/CheckBoxPreference;

    .line 203
    const-string v27, "camera_sleep_on_release"

    move-object/from16 v0, v20

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v27

    check-cast v27, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mCameraSleepOnRelease:Landroid/preference/CheckBoxPreference;

    .line 205
    const-string v27, "camera_music_controls"

    move-object/from16 v0, v20

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v27

    check-cast v27, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mCameraMusicControls:Landroid/preference/CheckBoxPreference;

    .line 207
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mCameraWake:Landroid/preference/CheckBoxPreference;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v25

    .line 208
    .local v25, "value":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mCameraMusicControls:Landroid/preference/CheckBoxPreference;

    move-object/from16 v28, v0

    if-nez v25, :cond_12

    const/16 v27, 0x1

    :goto_a
    move-object/from16 v0, v28

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 209
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mCameraSleepOnRelease:Landroid/preference/CheckBoxPreference;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 210
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v27

    const v28, 0x1110060

    invoke-virtual/range {v27 .. v28}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v27

    if-eqz v27, :cond_5

    .line 212
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mCameraSleepOnRelease:Landroid/preference/CheckBoxPreference;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    invoke-virtual {v6, v0}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 218
    .end local v25    # "value":Z
    :cond_5
    :goto_b
    if-eqz v11, :cond_14

    .line 219
    const-string v27, "ui_force_overflow_button"

    move-object/from16 v0, v20

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v27

    check-cast v27, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mShowActionOverflow:Landroid/preference/CheckBoxPreference;

    .line 225
    :goto_c
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->getActivity()Landroid/app/Activity;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/androie/settings/Utils;->hasVolumeRocker(Landroid/content/Context;)Z

    move-result v27

    if-eqz v27, :cond_16

    .line 226
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v27

    const-string v28, "swap_volume_keys_on_rotation"

    const/16 v29, 0x0

    invoke-static/range {v27 .. v29}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v24

    .line 228
    .local v24, "swapVolumeKeys":I
    const-string v27, "swap_volume_buttons"

    move-object/from16 v0, v20

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v27

    check-cast v27, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mSwapVolumeButtons:Landroid/preference/CheckBoxPreference;

    .line 230
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mSwapVolumeButtons:Landroid/preference/CheckBoxPreference;

    move-object/from16 v28, v0

    if-lez v24, :cond_15

    const/16 v27, 0x1

    :goto_d
    move-object/from16 v0, v28

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 231
    const v27, 0x7f0d000b

    move-object/from16 v0, v22

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v27

    if-nez v27, :cond_6

    .line 232
    const-string v27, "volume_wake_screen"

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 238
    .end local v24    # "swapVolumeKeys":I
    :cond_6
    :goto_e
    const-string v27, "button_backlight"

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v5

    check-cast v5, Lcom/androie/settings/cyanogenmod/ButtonBacklightBrightness;

    .line 240
    .local v5, "backlight":Lcom/androie/settings/cyanogenmod/ButtonBacklightBrightness;
    invoke-virtual {v5}, Lcom/androie/settings/cyanogenmod/ButtonBacklightBrightness;->isButtonSupported()Z

    move-result v27

    if-nez v27, :cond_7

    invoke-virtual {v5}, Lcom/androie/settings/cyanogenmod/ButtonBacklightBrightness;->isKeyboardSupported()Z

    move-result v27

    if-nez v27, :cond_7

    .line 241
    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 244
    :cond_7
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->getActivity()Landroid/app/Activity;

    move-result-object v27

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v28

    const-string v29, "bluetooth_input_settings"

    invoke-static/range {v27 .. v29}, Lcom/androie/settings/Utils;->updatePreferenceToSpecificActivityFromMetaDataOrRemove(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 246
    return-void

    .line 102
    .end local v3    # "appSwitchCategory":Landroid/preference/PreferenceCategory;
    .end local v4    # "assistCategory":Landroid/preference/PreferenceCategory;
    .end local v5    # "backlight":Lcom/androie/settings/cyanogenmod/ButtonBacklightBrightness;
    .end local v6    # "cameraCategory":Landroid/preference/PreferenceCategory;
    .end local v11    # "hasAnyBindableKey":Z
    .end local v12    # "hasAppSwitchKey":Z
    .end local v13    # "hasAssistKey":Z
    .end local v14    # "hasCameraKey":Z
    .end local v15    # "hasHomeKey":Z
    .end local v16    # "hasMenuKey":Z
    .end local v17    # "homeCategory":Landroid/preference/PreferenceCategory;
    .end local v19    # "menuCategory":Landroid/preference/PreferenceCategory;
    .end local v26    # "volumeCategory":Landroid/preference/PreferenceCategory;
    :cond_8
    const/4 v15, 0x0

    goto/16 :goto_0

    .line 103
    .restart local v15    # "hasHomeKey":Z
    :cond_9
    const/16 v16, 0x0

    goto/16 :goto_1

    .line 104
    .restart local v16    # "hasMenuKey":Z
    :cond_a
    const/4 v13, 0x0

    goto/16 :goto_2

    .line 105
    .restart local v13    # "hasAssistKey":Z
    :cond_b
    const/4 v12, 0x0

    goto/16 :goto_3

    .line 106
    .restart local v12    # "hasAppSwitchKey":Z
    :cond_c
    const/4 v14, 0x0

    goto/16 :goto_4

    .line 153
    .restart local v3    # "appSwitchCategory":Landroid/preference/PreferenceCategory;
    .restart local v4    # "assistCategory":Landroid/preference/PreferenceCategory;
    .restart local v6    # "cameraCategory":Landroid/preference/PreferenceCategory;
    .restart local v11    # "hasAnyBindableKey":Z
    .restart local v14    # "hasCameraKey":Z
    .restart local v17    # "homeCategory":Landroid/preference/PreferenceCategory;
    .restart local v19    # "menuCategory":Landroid/preference/PreferenceCategory;
    .restart local v26    # "volumeCategory":Landroid/preference/PreferenceCategory;
    :cond_d
    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_5

    .line 161
    .restart local v21    # "pressAction":I
    :cond_e
    const/16 v27, 0x3

    goto/16 :goto_6

    .line 168
    .end local v21    # "pressAction":I
    :cond_f
    const-string v27, "hardware_keys_menu_press"

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v27

    move-object/from16 v0, v19

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 169
    const-string v27, "hardware_keys_menu_long_press"

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v27

    move-object/from16 v0, v19

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_7

    .line 183
    :cond_10
    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_8

    .line 197
    :cond_11
    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_9

    .line 208
    .restart local v25    # "value":Z
    :cond_12
    const/16 v27, 0x0

    goto/16 :goto_a

    .line 215
    .end local v25    # "value":Z
    :cond_13
    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_b

    .line 222
    :cond_14
    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_c

    .line 230
    .restart local v24    # "swapVolumeKeys":I
    :cond_15
    const/16 v27, 0x0

    goto/16 :goto_d

    .line 235
    .end local v24    # "swapVolumeKeys":I
    :cond_16
    move-object/from16 v0, v20

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_e
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 3
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    .line 266
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mHomeLongPressAction:Landroid/preference/ListPreference;

    if-ne p1, v1, :cond_0

    .line 267
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mHomeLongPressAction:Landroid/preference/ListPreference;

    const-string v2, "key_home_long_press_action"

    invoke-direct {p0, v1, p2, v2}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->handleActionListChange(Landroid/preference/ListPreference;Ljava/lang/Object;Ljava/lang/String;)V

    .line 300
    :goto_0
    return v0

    .line 270
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mHomeDoubleTapAction:Landroid/preference/ListPreference;

    if-ne p1, v1, :cond_1

    .line 271
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mHomeDoubleTapAction:Landroid/preference/ListPreference;

    const-string v2, "key_home_double_tap_action"

    invoke-direct {p0, v1, p2, v2}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->handleActionListChange(Landroid/preference/ListPreference;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 274
    :cond_1
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mMenuPressAction:Landroid/preference/ListPreference;

    if-ne p1, v1, :cond_2

    .line 275
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mMenuPressAction:Landroid/preference/ListPreference;

    const-string v2, "key_menu_action"

    invoke-direct {p0, v1, p2, v2}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->handleActionListChange(Landroid/preference/ListPreference;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 278
    :cond_2
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mMenuLongPressAction:Landroid/preference/ListPreference;

    if-ne p1, v1, :cond_3

    .line 279
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mMenuLongPressAction:Landroid/preference/ListPreference;

    const-string v2, "key_menu_long_press_action"

    invoke-direct {p0, v1, p2, v2}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->handleActionListChange(Landroid/preference/ListPreference;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 282
    :cond_3
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mAssistPressAction:Landroid/preference/ListPreference;

    if-ne p1, v1, :cond_4

    .line 283
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mAssistPressAction:Landroid/preference/ListPreference;

    const-string v2, "key_assist_action"

    invoke-direct {p0, v1, p2, v2}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->handleActionListChange(Landroid/preference/ListPreference;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 286
    :cond_4
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mAssistLongPressAction:Landroid/preference/ListPreference;

    if-ne p1, v1, :cond_5

    .line 287
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mAssistLongPressAction:Landroid/preference/ListPreference;

    const-string v2, "key_assist_long_press_action"

    invoke-direct {p0, v1, p2, v2}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->handleActionListChange(Landroid/preference/ListPreference;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 290
    :cond_5
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mAppSwitchPressAction:Landroid/preference/ListPreference;

    if-ne p1, v1, :cond_6

    .line 291
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mAppSwitchPressAction:Landroid/preference/ListPreference;

    const-string v2, "key_app_switch_action"

    invoke-direct {p0, v1, p2, v2}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->handleActionListChange(Landroid/preference/ListPreference;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 294
    :cond_6
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mAppSwitchLongPressAction:Landroid/preference/ListPreference;

    if-ne p1, v1, :cond_7

    .line 295
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mAppSwitchLongPressAction:Landroid/preference/ListPreference;

    const-string v2, "key_app_switch_long_press_action"

    invoke-direct {p0, v1, p2, v2}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->handleActionListChange(Landroid/preference/ListPreference;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 300
    :cond_7
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 5
    .param p1, "preferenceScreen"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 305
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mShowActionOverflow:Landroid/preference/CheckBoxPreference;

    if-ne p2, v4, :cond_1

    .line 306
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mShowActionOverflow:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_0

    const v1, 0x7f0801b1

    .line 310
    .local v1, "toastResId":I
    :goto_0
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 325
    .end local v1    # "toastResId":I
    :goto_1
    return v2

    .line 306
    :cond_0
    const v1, 0x7f0801b2

    goto :goto_0

    .line 312
    :cond_1
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mSwapVolumeButtons:Landroid/preference/CheckBoxPreference;

    if-ne p2, v4, :cond_5

    .line 313
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mSwapVolumeButtons:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3}, Lcom/androie/settings/Utils;->isTablet(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v2, 0x2

    .line 315
    .local v2, "value":I
    :cond_2
    :goto_2
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/ButtonSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "swap_volume_keys_on_rotation"

    invoke-static {v3, v4, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 325
    .end local v2    # "value":I
    :cond_3
    invoke-super {p0, p1, p2}, Lcom/androie/settings/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v2

    goto :goto_1

    :cond_4
    move v2, v3

    .line 313
    goto :goto_2

    .line 317
    :cond_5
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mCameraWake:Landroid/preference/CheckBoxPreference;

    if-ne p2, v4, :cond_3

    .line 319
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mCameraWake:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    .line 320
    .local v0, "isCameraWakeEnabled":Z
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mCameraMusicControls:Landroid/preference/CheckBoxPreference;

    if-nez v0, :cond_6

    move v3, v2

    :cond_6
    invoke-virtual {v4, v3}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 321
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/ButtonSettings;->mCameraSleepOnRelease:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v0}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    goto :goto_1
.end method
