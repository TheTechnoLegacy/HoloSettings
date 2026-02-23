.class public Lcom/androie/settings/cyanogenmod/MemoryManagement;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "MemoryManagement.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# static fields
.field private static final ZRAM_DEFAULT:Ljava/lang/String;


# instance fields
.field private mKSMPref:Landroid/preference/CheckBoxPreference;

.field private mPurgeableAssetsPref:Landroid/preference/CheckBoxPreference;

.field private mzRAM:Landroid/preference/ListPreference;

.field private swapAvailable:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    const-string v0, "ro.zram.default"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->ZRAM_DEFAULT:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    .line 62
    const/4 v0, -0x1

    iput v0, p0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->swapAvailable:I

    return-void
.end method

.method private isSwapAvailable()Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 129
    iget v0, p0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->swapAvailable:I

    if-gez v0, :cond_0

    .line 130
    new-instance v0, Ljava/io/File;

    const-string v3, "/proc/swaps"

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_0
    iput v0, p0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->swapAvailable:I

    .line 132
    :cond_0
    iget v0, p0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->swapAvailable:I

    if-lez v0, :cond_2

    :goto_1
    return v1

    :cond_1
    move v0, v2

    .line 130
    goto :goto_0

    :cond_2
    move v1, v2

    .line 132
    goto :goto_1
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 66
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 68
    const v2, 0x7f050023

    invoke-virtual {p0, v2}, Lcom/androie/settings/cyanogenmod/MemoryManagement;->addPreferencesFromResource(I)V

    .line 70
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/MemoryManagement;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    .line 72
    .local v0, "prefSet":Landroid/preference/PreferenceScreen;
    const-string v2, "pref_zram_size"

    invoke-virtual {v0, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/ListPreference;

    iput-object v2, p0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->mzRAM:Landroid/preference/ListPreference;

    .line 73
    const-string v2, "pref_purgeable_assets"

    invoke-virtual {v0, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    iput-object v2, p0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->mPurgeableAssetsPref:Landroid/preference/CheckBoxPreference;

    .line 74
    const-string v2, "pref_ksm"

    invoke-virtual {v0, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    iput-object v2, p0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->mKSMPref:Landroid/preference/CheckBoxPreference;

    .line 76
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/MemoryManagement;->isSwapAvailable()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 77
    const-string v2, "persist.service.zram"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "1"

    if-ne v2, v3, :cond_0

    .line 78
    const-string v2, "persist.service.zram"

    sget-object v3, Lcom/androie/settings/cyanogenmod/MemoryManagement;->ZRAM_DEFAULT:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    :cond_0
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->mzRAM:Landroid/preference/ListPreference;

    const-string v3, "persist.service.zram"

    sget-object v4, Lcom/androie/settings/cyanogenmod/MemoryManagement;->ZRAM_DEFAULT:Ljava/lang/String;

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 81
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->mzRAM:Landroid/preference/ListPreference;

    invoke-virtual {v2, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 86
    :goto_0
    const-string v2, "/sys/kernel/mm/ksm/run"

    invoke-static {v2}, Lcom/androie/settings/Utils;->fileExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 87
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->mKSMPref:Landroid/preference/CheckBoxPreference;

    const-string v3, "1"

    const-string v4, "/sys/kernel/mm/ksm/run"

    invoke-static {v4}, Lcom/androie/settings/Utils;->fileReadOneLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 92
    :goto_1
    const-string v2, "persist.sys.purgeable_assets"

    const-string v3, "0"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 94
    .local v1, "purgeableAssets":Ljava/lang/String;
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->mPurgeableAssetsPref:Landroid/preference/CheckBoxPreference;

    const-string v3, "1"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 95
    return-void

    .line 83
    .end local v1    # "purgeableAssets":Ljava/lang/String;
    :cond_1
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->mzRAM:Landroid/preference/ListPreference;

    invoke-virtual {v0, v2}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_0

    .line 89
    :cond_2
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->mKSMPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, v2}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_1
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 115
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->mzRAM:Landroid/preference/ListPreference;

    if-ne p1, v0, :cond_0

    .line 116
    if-eqz p2, :cond_0

    .line 117
    const-string v0, "persist.service.zram"

    check-cast p2, Ljava/lang/String;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-static {v0, p2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    const/4 v0, 0x1

    .line 122
    :goto_0
    return v0

    .restart local p2    # "newValue":Ljava/lang/Object;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 3
    .param p1, "preferenceScreen"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    const/4 v1, 0x1

    .line 100
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->mPurgeableAssetsPref:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_1

    .line 101
    const-string v2, "persist.sys.purgeable_assets"

    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->mPurgeableAssetsPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "1"

    :goto_0
    invoke-static {v2, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    move v0, v1

    .line 111
    :goto_1
    return v0

    .line 101
    :cond_0
    const-string v0, "0"

    goto :goto_0

    .line 106
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->mKSMPref:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_3

    .line 107
    const-string v2, "/sys/kernel/mm/ksm/run"

    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/MemoryManagement;->mKSMPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "1"

    :goto_2
    invoke-static {v2, v0}, Lcom/androie/settings/Utils;->fileWriteOneLine(Ljava/lang/String;Ljava/lang/String;)Z

    move v0, v1

    .line 108
    goto :goto_1

    .line 107
    :cond_2
    const-string v0, "0"

    goto :goto_2

    .line 111
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method
