.class public Lcom/androie/settings/cyanogenmod/QuietHours;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "QuietHours.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field private mQuietHoursTimeRange:Lcom/androie/settings/cyanogenmod/TimeRangePreference;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x0

    .line 42
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 44
    const v3, 0x7f050035

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/QuietHours;->addPreferencesFromResource(I)V

    .line 45
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuietHours;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 46
    .local v0, "res":Landroid/content/res/Resources;
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuietHours;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 49
    .local v1, "resolver":Landroid/content/ContentResolver;
    const-string v3, "quiet_hours_timerange"

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/QuietHours;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Lcom/androie/settings/cyanogenmod/TimeRangePreference;

    iput-object v3, p0, Lcom/androie/settings/cyanogenmod/QuietHours;->mQuietHoursTimeRange:Lcom/androie/settings/cyanogenmod/TimeRangePreference;

    .line 53
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/QuietHours;->mQuietHoursTimeRange:Lcom/androie/settings/cyanogenmod/TimeRangePreference;

    const-string v4, "quiet_hours_start"

    invoke-static {v1, v4, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    const-string v5, "quiet_hours_end"

    invoke-static {v1, v5, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v5

    invoke-virtual {v3, v4, v5}, Lcom/androie/settings/cyanogenmod/TimeRangePreference;->setTimeRange(II)V

    .line 56
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/QuietHours;->mQuietHoursTimeRange:Lcom/androie/settings/cyanogenmod/TimeRangePreference;

    invoke-virtual {v3, p0}, Lcom/androie/settings/cyanogenmod/TimeRangePreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 59
    const v3, 0x1110023

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    if-nez v3, :cond_0

    .line 60
    const-string v3, "quiet_hours_dim"

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/QuietHours;->removePreference(Ljava/lang/String;)V

    .line 64
    :cond_0
    const-string v3, "vibrator"

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/QuietHours;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Vibrator;

    .line 65
    .local v2, "vibrator":Landroid/os/Vibrator;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/os/Vibrator;->hasVibrator()Z

    move-result v3

    if-nez v3, :cond_2

    .line 66
    :cond_1
    const-string v3, "quiet_hours_still"

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/QuietHours;->removePreference(Ljava/lang/String;)V

    .line 67
    const-string v3, "quiet_hours_haptic"

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/QuietHours;->removePreference(Ljava/lang/String;)V

    .line 69
    :cond_2
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 3
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 73
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuietHours;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 74
    .local v0, "resolver":Landroid/content/ContentResolver;
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/QuietHours;->mQuietHoursTimeRange:Lcom/androie/settings/cyanogenmod/TimeRangePreference;

    if-ne p1, v1, :cond_0

    .line 75
    const-string v1, "quiet_hours_start"

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/QuietHours;->mQuietHoursTimeRange:Lcom/androie/settings/cyanogenmod/TimeRangePreference;

    invoke-virtual {v2}, Lcom/androie/settings/cyanogenmod/TimeRangePreference;->getStartTime()I

    move-result v2

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 77
    const-string v1, "quiet_hours_end"

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/QuietHours;->mQuietHoursTimeRange:Lcom/androie/settings/cyanogenmod/TimeRangePreference;

    invoke-virtual {v2}, Lcom/androie/settings/cyanogenmod/TimeRangePreference;->getEndTime()I

    move-result v2

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 79
    const/4 v1, 0x1

    .line 81
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
