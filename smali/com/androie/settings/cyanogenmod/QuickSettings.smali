.class public Lcom/androie/settings/cyanogenmod/QuickSettings;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "QuickSettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/cyanogenmod/QuickSettings$MultiSelectListPreferenceComparator;
    }
.end annotation


# instance fields
.field private mDynamicTiles:Landroid/preference/PreferenceCategory;

.field private mGeneralSettings:Landroid/preference/PreferenceCategory;

.field private mNetworkMode:Landroid/preference/ListPreference;

.field private mQuickPulldown:Landroid/preference/ListPreference;

.field private mRingMode:Landroid/preference/MultiSelectListPreference;

.field private mScreenTimeoutMode:Landroid/preference/ListPreference;

.field private mStaticTiles:Landroid/preference/PreferenceCategory;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    .line 165
    return-void
.end method

.method public static parseStoredValue(Ljava/lang/CharSequence;)[Ljava/lang/String;
    .locals 2
    .param p0, "val"    # Ljava/lang/CharSequence;

    .prologue
    .line 245
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 246
    const/4 v0, 0x0

    .line 248
    :goto_0
    return-object v0

    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OV=I=XseparatorX=I=VO"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private updatePulldownSummary(I)V
    .locals 6
    .param p1, "value"    # I

    .prologue
    .line 231
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 233
    .local v1, "res":Landroid/content/res/Resources;
    if-nez p1, :cond_0

    .line 235
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mQuickPulldown:Landroid/preference/ListPreference;

    const v3, 0x7f080240

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 242
    :goto_0
    return-void

    .line 237
    :cond_0
    const/4 v2, 0x2

    if-ne p1, v2, :cond_1

    const v2, 0x7f08023e

    :goto_1
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 240
    .local v0, "direction":Ljava/lang/String;
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mQuickPulldown:Landroid/preference/ListPreference;

    const v3, 0x7f08023d

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-virtual {v1, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 237
    .end local v0    # "direction":Ljava/lang/String;
    :cond_1
    const v2, 0x7f08023f

    goto :goto_1
.end method

.method private updateSummary(Ljava/lang/String;Landroid/preference/MultiSelectListPreference;I)V
    .locals 7
    .param p1, "val"    # Ljava/lang/String;
    .param p2, "pref"    # Landroid/preference/MultiSelectListPreference;
    .param p3, "defSummary"    # I

    .prologue
    .line 212
    invoke-static {p1}, Lcom/androie/settings/cyanogenmod/QuickSettings;->parseStoredValue(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v5

    .line 213
    .local v5, "values":[Ljava/lang/String;
    if-eqz v5, :cond_2

    .line 214
    array-length v3, v5

    .line 215
    .local v3, "length":I
    invoke-virtual {p2}, Landroid/preference/MultiSelectListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v0

    .line 216
    .local v0, "entries":[Ljava/lang/CharSequence;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 217
    .local v4, "summary":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_1

    .line 218
    aget-object v6, v5, v2

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    aget-object v1, v0, v6

    .line 219
    .local v1, "entry":Ljava/lang/CharSequence;
    if-eqz v2, :cond_0

    .line 220
    const-string v6, " | "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    :cond_0
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 217
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 224
    .end local v1    # "entry":Ljava/lang/CharSequence;
    :cond_1
    invoke-virtual {p2, v4}, Landroid/preference/MultiSelectListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 228
    .end local v0    # "entries":[Ljava/lang/CharSequence;
    .end local v2    # "i":I
    .end local v3    # "length":I
    .end local v4    # "summary":Ljava/lang/StringBuilder;
    :goto_1
    return-void

    .line 226
    :cond_2
    invoke-virtual {p2, p3}, Landroid/preference/MultiSelectListPreference;->setSummary(I)V

    goto :goto_1
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 74
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 76
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    .line 77
    .local v1, "prefSet":Landroid/preference/PreferenceScreen;
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettings;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    .line 78
    .local v3, "resolver":Landroid/content/ContentResolver;
    const-string v7, "pref_general_settings"

    invoke-virtual {v1, v7}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    check-cast v7, Landroid/preference/PreferenceCategory;

    iput-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mGeneralSettings:Landroid/preference/PreferenceCategory;

    .line 79
    const-string v7, "static_tiles"

    invoke-virtual {v1, v7}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    check-cast v7, Landroid/preference/PreferenceCategory;

    iput-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mStaticTiles:Landroid/preference/PreferenceCategory;

    .line 80
    const-string v7, "pref_dynamic_tiles"

    invoke-virtual {v1, v7}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    check-cast v7, Landroid/preference/PreferenceCategory;

    iput-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mDynamicTiles:Landroid/preference/PreferenceCategory;

    .line 81
    const-string v7, "quick_pulldown"

    invoke-virtual {v1, v7}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    check-cast v7, Landroid/preference/ListPreference;

    iput-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mQuickPulldown:Landroid/preference/ListPreference;

    .line 83
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettings;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-static {v7}, Lcom/androie/settings/Utils;->isPhone(Landroid/content/Context;)Z

    move-result v7

    if-nez v7, :cond_7

    .line 84
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mQuickPulldown:Landroid/preference/ListPreference;

    if-eqz v7, :cond_0

    .line 85
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mGeneralSettings:Landroid/preference/PreferenceCategory;

    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mQuickPulldown:Landroid/preference/ListPreference;

    invoke-virtual {v7, v8}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 96
    :cond_0
    :goto_0
    const-string v7, "pref_ring_mode"

    invoke-virtual {v1, v7}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    check-cast v7, Landroid/preference/MultiSelectListPreference;

    iput-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mRingMode:Landroid/preference/MultiSelectListPreference;

    .line 98
    const-string v7, "vibrator"

    invoke-virtual {p0, v7}, Lcom/androie/settings/cyanogenmod/QuickSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/os/Vibrator;

    .line 99
    .local v6, "vibrator":Landroid/os/Vibrator;
    invoke-virtual {v6}, Landroid/os/Vibrator;->hasVibrator()Z

    move-result v7

    if-eqz v7, :cond_8

    .line 100
    const-string v7, "expanded_ring_mode"

    invoke-static {v3, v7}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 102
    .local v5, "storedRingMode":Ljava/lang/String;
    if-eqz v5, :cond_1

    .line 103
    const-string v7, "OV=I=XseparatorX=I=VO"

    invoke-static {v5, v7}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 104
    .local v4, "ringModeArray":[Ljava/lang/String;
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mRingMode:Landroid/preference/MultiSelectListPreference;

    new-instance v8, Ljava/util/HashSet;

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v7, v8}, Landroid/preference/MultiSelectListPreference;->setValues(Ljava/util/Set;)V

    .line 105
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mRingMode:Landroid/preference/MultiSelectListPreference;

    const v8, 0x7f080248

    invoke-direct {p0, v5, v7, v8}, Lcom/androie/settings/cyanogenmod/QuickSettings;->updateSummary(Ljava/lang/String;Landroid/preference/MultiSelectListPreference;I)V

    .line 107
    .end local v4    # "ringModeArray":[Ljava/lang/String;
    :cond_1
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mRingMode:Landroid/preference/MultiSelectListPreference;

    invoke-virtual {v7, p0}, Landroid/preference/MultiSelectListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 113
    .end local v5    # "storedRingMode":Ljava/lang/String;
    :goto_1
    const-string v7, "pref_network_mode"

    invoke-virtual {v1, v7}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    check-cast v7, Landroid/preference/ListPreference;

    iput-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mNetworkMode:Landroid/preference/ListPreference;

    .line 114
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mNetworkMode:Landroid/preference/ListPreference;

    if-eqz v7, :cond_2

    .line 115
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mNetworkMode:Landroid/preference/ListPreference;

    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 116
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v7, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 120
    :cond_2
    const-string v7, "pref_screentimeout_mode"

    invoke-virtual {v1, v7}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    check-cast v7, Landroid/preference/ListPreference;

    iput-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mScreenTimeoutMode:Landroid/preference/ListPreference;

    .line 121
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mScreenTimeoutMode:Landroid/preference/ListPreference;

    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mScreenTimeoutMode:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 122
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mScreenTimeoutMode:Landroid/preference/ListPreference;

    invoke-virtual {v7, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 125
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettings;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-static {v7}, Lcom/android/internal/util/cm/QSUtils;->deviceSupportsDockBattery(Landroid/content/Context;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 126
    const-string v7, "qs_dyanmic_dock_battery"

    invoke-virtual {p0, v7}, Lcom/androie/settings/cyanogenmod/QuickSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 127
    .local v0, "pref":Landroid/preference/Preference;
    if-eqz v0, :cond_3

    .line 128
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mDynamicTiles:Landroid/preference/PreferenceCategory;

    invoke-virtual {v7, v0}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 131
    .end local v0    # "pref":Landroid/preference/Preference;
    :cond_3
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettings;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-static {v7}, Lcom/android/internal/util/cm/QSUtils;->deviceSupportsImeSwitcher(Landroid/content/Context;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 132
    const-string v7, "qs_dyanmic_ime"

    invoke-virtual {p0, v7}, Lcom/androie/settings/cyanogenmod/QuickSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 133
    .restart local v0    # "pref":Landroid/preference/Preference;
    if-eqz v0, :cond_4

    .line 134
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mDynamicTiles:Landroid/preference/PreferenceCategory;

    invoke-virtual {v7, v0}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 137
    .end local v0    # "pref":Landroid/preference/Preference;
    :cond_4
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettings;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-static {v7}, Lcom/android/internal/util/cm/QSUtils;->deviceSupportsUsbTether(Landroid/content/Context;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 138
    const-string v7, "qs_dyanmic_usbtether"

    invoke-virtual {p0, v7}, Lcom/androie/settings/cyanogenmod/QuickSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 139
    .restart local v0    # "pref":Landroid/preference/Preference;
    if-eqz v0, :cond_5

    .line 140
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mDynamicTiles:Landroid/preference/PreferenceCategory;

    invoke-virtual {v7, v0}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 143
    .end local v0    # "pref":Landroid/preference/Preference;
    :cond_5
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettings;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-static {v7}, Lcom/android/internal/util/cm/QSUtils;->deviceSupportsWifiDisplay(Landroid/content/Context;)Z

    move-result v7

    if-nez v7, :cond_6

    .line 144
    const-string v7, "qs_dyanmic_wifi"

    invoke-virtual {p0, v7}, Lcom/androie/settings/cyanogenmod/QuickSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 145
    .restart local v0    # "pref":Landroid/preference/Preference;
    if-eqz v0, :cond_6

    .line 146
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mDynamicTiles:Landroid/preference/PreferenceCategory;

    invoke-virtual {v7, v0}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 149
    .end local v0    # "pref":Landroid/preference/Preference;
    :cond_6
    return-void

    .line 88
    .end local v6    # "vibrator":Landroid/os/Vibrator;
    :cond_7
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mQuickPulldown:Landroid/preference/ListPreference;

    invoke-virtual {v7, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 89
    const-string v7, "qs_quick_pulldown"

    const/4 v8, 0x0

    invoke-static {v3, v7, v8}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    .line 91
    .local v2, "quickPulldownValue":I
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mQuickPulldown:Landroid/preference/ListPreference;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 92
    invoke-direct {p0, v2}, Lcom/androie/settings/cyanogenmod/QuickSettings;->updatePulldownSummary(I)V

    goto/16 :goto_0

    .line 109
    .end local v2    # "quickPulldownValue":I
    .restart local v6    # "vibrator":Landroid/os/Vibrator;
    :cond_8
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mStaticTiles:Landroid/preference/PreferenceCategory;

    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mRingMode:Landroid/preference/MultiSelectListPreference;

    invoke-virtual {v7, v8}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_1
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 68
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 69
    const v0, 0x7f050034

    invoke-virtual {p0, v0}, Lcom/androie/settings/cyanogenmod/QuickSettings;->addPreferencesFromResource(I)V

    .line 70
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 8
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x1

    .line 180
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    .line 181
    .local v3, "resolver":Landroid/content/ContentResolver;
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mRingMode:Landroid/preference/MultiSelectListPreference;

    if-ne p1, v5, :cond_0

    .line 182
    new-instance v0, Ljava/util/ArrayList;

    check-cast p2, Ljava/util/Set;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 183
    .local v0, "arrValue":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v5, Lcom/androie/settings/cyanogenmod/QuickSettings$MultiSelectListPreferenceComparator;

    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mRingMode:Landroid/preference/MultiSelectListPreference;

    invoke-direct {v5, p0, v7}, Lcom/androie/settings/cyanogenmod/QuickSettings$MultiSelectListPreferenceComparator;-><init>(Lcom/androie/settings/cyanogenmod/QuickSettings;Landroid/preference/MultiSelectListPreference;)V

    invoke-static {v0, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 184
    const-string v5, "OV=I=XseparatorX=I=VO"

    invoke-static {v5, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v4

    .line 185
    .local v4, "value":Ljava/lang/String;
    const-string v5, "expanded_ring_mode"

    invoke-static {v3, v5, v4}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 186
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mRingMode:Landroid/preference/MultiSelectListPreference;

    const v7, 0x7f080248

    invoke-direct {p0, v4, v5, v7}, Lcom/androie/settings/cyanogenmod/QuickSettings;->updateSummary(Ljava/lang/String;Landroid/preference/MultiSelectListPreference;I)V

    move v5, v6

    .line 207
    .end local v0    # "arrValue":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v4    # "value":Ljava/lang/String;
    :goto_0
    return v5

    .line 188
    .restart local p2    # "newValue":Ljava/lang/Object;
    :cond_0
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mNetworkMode:Landroid/preference/ListPreference;

    if-ne p1, v5, :cond_1

    move-object v5, p2

    .line 189
    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 190
    .local v4, "value":I
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mNetworkMode:Landroid/preference/ListPreference;

    check-cast p2, Ljava/lang/String;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {v5, p2}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v1

    .line 191
    .local v1, "index":I
    const-string v5, "expanded_network_mode"

    invoke-static {v3, v5, v4}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 192
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mNetworkMode:Landroid/preference/ListPreference;

    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v7}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v7

    aget-object v7, v7, v1

    invoke-virtual {v5, v7}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    move v5, v6

    .line 193
    goto :goto_0

    .line 194
    .end local v1    # "index":I
    .end local v4    # "value":I
    .restart local p2    # "newValue":Ljava/lang/Object;
    :cond_1
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mQuickPulldown:Landroid/preference/ListPreference;

    if-ne p1, v5, :cond_2

    .line 195
    check-cast p2, Ljava/lang/String;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 196
    .local v2, "quickPulldownValue":I
    const-string v5, "qs_quick_pulldown"

    invoke-static {v3, v5, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 198
    invoke-direct {p0, v2}, Lcom/androie/settings/cyanogenmod/QuickSettings;->updatePulldownSummary(I)V

    move v5, v6

    .line 199
    goto :goto_0

    .line 200
    .end local v2    # "quickPulldownValue":I
    .restart local p2    # "newValue":Ljava/lang/Object;
    :cond_2
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mScreenTimeoutMode:Landroid/preference/ListPreference;

    if-ne p1, v5, :cond_3

    move-object v5, p2

    .line 201
    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 202
    .restart local v4    # "value":I
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mScreenTimeoutMode:Landroid/preference/ListPreference;

    check-cast p2, Ljava/lang/String;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {v5, p2}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v1

    .line 203
    .restart local v1    # "index":I
    const-string v5, "expanded_screentimeout_mode"

    invoke-static {v3, v5, v4}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 204
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mScreenTimeoutMode:Landroid/preference/ListPreference;

    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mScreenTimeoutMode:Landroid/preference/ListPreference;

    invoke-virtual {v7}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v7

    aget-object v7, v7, v1

    invoke-virtual {v5, v7}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    move v5, v6

    .line 205
    goto :goto_0

    .line 207
    .end local v1    # "index":I
    .end local v4    # "value":I
    .restart local p2    # "newValue":Ljava/lang/Object;
    :cond_3
    const/4 v5, 0x0

    goto :goto_0
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 153
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onResume()V

    .line 154
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->updateAvailableTiles(Landroid/content/Context;)V

    .line 156
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mNetworkMode:Landroid/preference/ListPreference;

    if-eqz v0, :cond_0

    .line 157
    const-string v0, "toggleNetworkMode"

    invoke-static {v0}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->isTileAvailable(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 158
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mStaticTiles:Landroid/preference/PreferenceCategory;

    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 163
    :cond_0
    :goto_0
    return-void

    .line 160
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mStaticTiles:Landroid/preference/PreferenceCategory;

    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/QuickSettings;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_0
.end method
