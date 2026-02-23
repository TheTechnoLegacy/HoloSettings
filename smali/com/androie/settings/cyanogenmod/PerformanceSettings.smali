.class public Lcom/androie/settings/cyanogenmod/PerformanceSettings;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "PerformanceSettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/cyanogenmod/PerformanceSettings$PerformanceProfileObserver;
    }
.end annotation


# instance fields
.field private alertDialog:Landroid/app/AlertDialog;

.field private mPerfProfileDefaultEntry:Ljava/lang/String;

.field private mPerfProfileEntries:[Ljava/lang/String;

.field private mPerfProfilePref:Landroid/preference/ListPreference;

.field private mPerfProfileValues:[Ljava/lang/String;

.field private mPerformanceProfileObserver:Landroid/database/ContentObserver;

.field private mUse16bppAlphaPref:Landroid/preference/CheckBoxPreference;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    .line 60
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerformanceProfileObserver:Landroid/database/ContentObserver;

    .line 64
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/cyanogenmod/PerformanceSettings;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/PerformanceSettings;

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->setCurrentValue()V

    return-void
.end method

.method private getCurrentPerformanceProfile()Ljava/lang/String;
    .locals 3

    .prologue
    .line 197
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "performance_profile"

    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 199
    .local v0, "value":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 200
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfileDefaultEntry:Ljava/lang/String;

    .line 202
    :cond_0
    return-object v0
.end method

.method private setCurrentPerfProfileSummary()V
    .locals 8

    .prologue
    .line 175
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->getCurrentPerformanceProfile()Ljava/lang/String;

    move-result-object v3

    .line 176
    .local v3, "value":Ljava/lang/String;
    const-string v2, ""

    .line 177
    .local v2, "summary":Ljava/lang/String;
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfileValues:[Ljava/lang/String;

    array-length v0, v4

    .line 178
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 180
    :try_start_0
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfileValues:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 181
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfileEntries:[Ljava/lang/String;

    aget-object v2, v4, v1
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 187
    :cond_1
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfilePref:Landroid/preference/ListPreference;

    const-string v5, "%s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v2, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 188
    return-void

    .line 183
    :catch_0
    move-exception v4

    goto :goto_1
.end method

.method private setCurrentValue()V
    .locals 2

    .prologue
    .line 191
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->getCurrentPerformanceProfile()Ljava/lang/String;

    move-result-object v0

    .line 192
    .local v0, "value":Ljava/lang/String;
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfilePref:Landroid/preference/ListPreference;

    invoke-virtual {v1, v0}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 193
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->setCurrentPerfProfileSummary()V

    .line 194
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 77
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 79
    const v3, 0x10400c0

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfileDefaultEntry:Ljava/lang/String;

    .line 81
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x1070017

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfileEntries:[Ljava/lang/String;

    .line 83
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x1070018

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfileValues:[Ljava/lang/String;

    .line 86
    const v3, 0x7f050029

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->addPreferencesFromResource(I)V

    .line 88
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    .line 90
    .local v1, "prefSet":Landroid/preference/PreferenceScreen;
    const-string v3, "pref_perf_profile"

    invoke-virtual {v1, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/ListPreference;

    iput-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfilePref:Landroid/preference/ListPreference;

    .line 91
    const v3, 0x10400bf

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 92
    .local v0, "perfProfileProp":Ljava/lang/String;
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfilePref:Landroid/preference/ListPreference;

    if-eqz v3, :cond_0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 93
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfilePref:Landroid/preference/ListPreference;

    invoke-virtual {v1, v3}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 94
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfilePref:Landroid/preference/ListPreference;

    .line 104
    :goto_0
    const-string v3, "pref_use_16bpp_alpha"

    invoke-virtual {v1, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/CheckBoxPreference;

    iput-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mUse16bppAlphaPref:Landroid/preference/CheckBoxPreference;

    .line 105
    const-string v3, "persist.sys.use_16bpp_alpha"

    const-string v4, "0"

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 106
    .local v2, "use16bppAlpha":Ljava/lang/String;
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mUse16bppAlphaPref:Landroid/preference/CheckBoxPreference;

    const-string v4, "1"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v3, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 108
    const-string v3, "hwa_settings"

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->removePreferenceIfPackageNotInstalled(Landroid/preference/Preference;)Z

    .line 111
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->alertDialog:Landroid/app/AlertDialog;

    .line 112
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->alertDialog:Landroid/app/AlertDialog;

    const v4, 0x7f080118

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog;->setTitle(I)V

    .line 113
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f080119

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 114
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->alertDialog:Landroid/app/AlertDialog;

    const/4 v4, -0x1

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x104000a

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/androie/settings/cyanogenmod/PerformanceSettings$1;

    invoke-direct {v6, p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings$1;-><init>(Lcom/androie/settings/cyanogenmod/PerformanceSettings;)V

    invoke-virtual {v3, v4, v5, v6}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 121
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->alertDialog:Landroid/app/AlertDialog;

    new-instance v4, Lcom/androie/settings/cyanogenmod/PerformanceSettings$2;

    invoke-direct {v4, p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings$2;-><init>(Lcom/androie/settings/cyanogenmod/PerformanceSettings;)V

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 126
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V

    .line 127
    return-void

    .line 96
    .end local v2    # "use16bppAlpha":Ljava/lang/String;
    :cond_0
    new-instance v3, Lcom/androie/settings/cyanogenmod/PerformanceSettings$PerformanceProfileObserver;

    new-instance v4, Landroid/os/Handler;

    invoke-direct {v4}, Landroid/os/Handler;-><init>()V

    invoke-direct {v3, p0, v4}, Lcom/androie/settings/cyanogenmod/PerformanceSettings$PerformanceProfileObserver;-><init>(Lcom/androie/settings/cyanogenmod/PerformanceSettings;Landroid/os/Handler;)V

    iput-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerformanceProfileObserver:Landroid/database/ContentObserver;

    .line 98
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfilePref:Landroid/preference/ListPreference;

    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfileEntries:[Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 99
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfilePref:Landroid/preference/ListPreference;

    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfileValues:[Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 100
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->setCurrentValue()V

    .line 101
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfilePref:Landroid/preference/ListPreference;

    invoke-virtual {v3, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    goto/16 :goto_0
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 142
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onPause()V

    .line 143
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfilePref:Landroid/preference/ListPreference;

    if-eqz v1, :cond_0

    .line 144
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 145
    .local v0, "resolver":Landroid/content/ContentResolver;
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerformanceProfileObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 147
    .end local v0    # "resolver":Landroid/content/ContentResolver;
    :cond_0
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 3
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 163
    if-eqz p2, :cond_0

    .line 164
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfilePref:Landroid/preference/ListPreference;

    if-ne p1, v0, :cond_0

    .line 165
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "performance_profile"

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 167
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->setCurrentPerfProfileSummary()V

    .line 168
    const/4 v0, 0x1

    .line 171
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 2
    .param p1, "preferenceScreen"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 151
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mUse16bppAlphaPref:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_1

    .line 152
    const-string v1, "persist.sys.use_16bpp_alpha"

    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mUse16bppAlphaPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "1"

    :goto_0
    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    const/4 v0, 0x1

    :goto_1
    return v0

    .line 152
    :cond_0
    const-string v0, "0"

    goto :goto_0

    .line 156
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/androie/settings/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v0

    goto :goto_1
.end method

.method public onResume()V
    .locals 4

    .prologue
    .line 131
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onResume()V

    .line 132
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerfProfilePref:Landroid/preference/ListPreference;

    if-eqz v1, :cond_0

    .line 133
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->setCurrentValue()V

    .line 134
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 135
    .local v0, "resolver":Landroid/content/ContentResolver;
    const-string v1, "performance_profile"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->mPerformanceProfileObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 138
    .end local v0    # "resolver":Landroid/content/ContentResolver;
    :cond_0
    return-void
.end method
