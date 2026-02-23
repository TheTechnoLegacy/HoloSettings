.class public Lcom/androie/settings/cyanogenmod/PieControl;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "PieControl.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# static fields
.field private static final TRIGGER:[Ljava/lang/String;


# instance fields
.field private mPieControl:Landroid/preference/CheckBoxPreference;

.field private mPieSensitivity:Landroid/preference/ListPreference;

.field private mPieSize:Landroid/preference/SeekBarDialogPreference;

.field private mPieTriggerObserver:Landroid/database/ContentObserver;

.field private mTrigger:[Landroid/preference/CheckBoxPreference;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 25
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "pie_control_trigger_left"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "pie_control_trigger_bottom"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "pie_control_trigger_right"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "pie_control_trigger_top"

    aput-object v2, v0, v1

    sput-object v0, Lcom/androie/settings/cyanogenmod/PieControl;->TRIGGER:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    .line 35
    const/4 v0, 0x4

    new-array v0, v0, [Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mTrigger:[Landroid/preference/CheckBoxPreference;

    .line 37
    new-instance v0, Lcom/androie/settings/cyanogenmod/PieControl$1;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/androie/settings/cyanogenmod/PieControl$1;-><init>(Lcom/androie/settings/cyanogenmod/PieControl;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieTriggerObserver:Landroid/database/ContentObserver;

    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/cyanogenmod/PieControl;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/PieControl;

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/PieControl;->updatePieTriggers()V

    return-void
.end method

.method private propagatePieControl(Z)V
    .locals 2
    .param p1, "value"    # Z

    .prologue
    .line 121
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mTrigger:[Landroid/preference/CheckBoxPreference;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 122
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mTrigger:[Landroid/preference/CheckBoxPreference;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 121
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 124
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieSensitivity:Landroid/preference/ListPreference;

    invoke-virtual {v1, p1}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 125
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieSize:Landroid/preference/SeekBarDialogPreference;

    invoke-virtual {v1, p1}, Landroid/preference/SeekBarDialogPreference;->setEnabled(Z)V

    .line 126
    return-void
.end method

.method private updatePieTriggers()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 129
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PieControl;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "pie_positions"

    const/4 v4, 0x2

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    .line 132
    .local v1, "triggerSlots":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mTrigger:[Landroid/preference/CheckBoxPreference;

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 133
    shl-int v2, v5, v0

    and-int/2addr v2, v1

    if-eqz v2, :cond_0

    .line 134
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mTrigger:[Landroid/preference/CheckBoxPreference;

    aget-object v2, v2, v0

    invoke-virtual {v2, v5}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 132
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 136
    :cond_0
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mTrigger:[Landroid/preference/CheckBoxPreference;

    aget-object v2, v2, v0

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_1

    .line 139
    :cond_1
    return-void
.end method

.method private updateSensitivity()V
    .locals 4

    .prologue
    .line 142
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PieControl;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "pie_sensitivity"

    const/4 v3, 0x3

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 144
    .local v0, "triggerSlots":I
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieSensitivity:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieSensitivity:Landroid/preference/ListPreference;

    invoke-virtual {v2}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 145
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 46
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 48
    const v2, 0x7f05002a

    invoke-virtual {p0, v2}, Lcom/androie/settings/cyanogenmod/PieControl;->addPreferencesFromResource(I)V

    .line 50
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PieControl;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    .line 51
    .local v1, "prefSet":Landroid/preference/PreferenceScreen;
    const-string v2, "pie_control_checkbox"

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    iput-object v2, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieControl:Landroid/preference/CheckBoxPreference;

    .line 52
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieControl:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 53
    const-string v2, "pie_control_sensitivity"

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/ListPreference;

    iput-object v2, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieSensitivity:Landroid/preference/ListPreference;

    .line 54
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieSensitivity:Landroid/preference/ListPreference;

    invoke-virtual {v2, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 55
    const-string v2, "pie_control_size"

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/SeekBarDialogPreference;

    iput-object v2, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieSize:Landroid/preference/SeekBarDialogPreference;

    .line 57
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v2, Lcom/androie/settings/cyanogenmod/PieControl;->TRIGGER:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 58
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mTrigger:[Landroid/preference/CheckBoxPreference;

    sget-object v2, Lcom/androie/settings/cyanogenmod/PieControl;->TRIGGER:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    aput-object v2, v3, v0

    .line 59
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mTrigger:[Landroid/preference/CheckBoxPreference;

    aget-object v2, v2, v0

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 57
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 61
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 116
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onPause()V

    .line 117
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PieControl;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieTriggerObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 118
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 8
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    .line 65
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieControl:Landroid/preference/CheckBoxPreference;

    if-ne p1, v4, :cond_1

    .line 66
    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    .line 68
    .local v2, "newState":Z
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PieControl;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "pie_controls"

    if-eqz v2, :cond_0

    move v4, v5

    :goto_0
    invoke-static {v6, v7, v4}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 70
    invoke-direct {p0, v2}, Lcom/androie/settings/cyanogenmod/PieControl;->propagatePieControl(Z)V

    .line 91
    .end local v2    # "newState":Z
    :goto_1
    return v5

    .line 68
    .restart local v2    # "newState":Z
    :cond_0
    const/4 v4, 0x0

    goto :goto_0

    .line 72
    .end local v2    # "newState":Z
    .restart local p2    # "newValue":Ljava/lang/Object;
    :cond_1
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieSensitivity:Landroid/preference/ListPreference;

    if-ne p1, v4, :cond_2

    move-object v2, p2

    .line 73
    check-cast v2, Ljava/lang/String;

    .line 75
    .local v2, "newState":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PieControl;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v6, "pie_sensitivity"

    invoke-static {v4, v6, v2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 77
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieSensitivity:Landroid/preference/ListPreference;

    iget-object v6, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieSensitivity:Landroid/preference/ListPreference;

    invoke-virtual {v6}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v6

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    aget-object v6, v6, v7

    invoke-virtual {v4, v6}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 80
    .end local v2    # "newState":Ljava/lang/String;
    :cond_2
    const/4 v3, 0x0

    .line 81
    .local v3, "triggerSlots":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mTrigger:[Landroid/preference/CheckBoxPreference;

    array-length v4, v4

    if-ge v1, v4, :cond_5

    .line 82
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mTrigger:[Landroid/preference/CheckBoxPreference;

    aget-object v4, v4, v1

    if-ne p1, v4, :cond_4

    move-object v4, p2

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 84
    .local v0, "checked":Z
    :goto_3
    if-eqz v0, :cond_3

    .line 85
    shl-int v4, v5, v1

    or-int/2addr v3, v4

    .line 81
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 82
    .end local v0    # "checked":Z
    :cond_4
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mTrigger:[Landroid/preference/CheckBoxPreference;

    aget-object v4, v4, v1

    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    goto :goto_3

    .line 88
    :cond_5
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PieControl;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v6, "pie_positions"

    invoke-static {v4, v6, v3}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_1
.end method

.method public onResume()V
    .locals 6

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 96
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onResume()V

    .line 98
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieControl:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PieControl;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "pie_controls"

    invoke-static {v4, v5, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v2, :cond_0

    move v1, v2

    :cond_0
    invoke-virtual {v3, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 100
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieControl:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v1

    invoke-direct {p0, v1}, Lcom/androie/settings/cyanogenmod/PieControl;->propagatePieControl(Z)V

    .line 102
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PieControl;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v3, "pie_sensitivity"

    const/4 v4, 0x3

    invoke-static {v1, v3, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 104
    .local v0, "sensitivity":I
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieSensitivity:Landroid/preference/ListPreference;

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 106
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PieControl;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v3, "pie_positions"

    invoke-static {v3}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/PieControl;->mPieTriggerObserver:Landroid/database/ContentObserver;

    invoke-virtual {v1, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 110
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/PieControl;->updatePieTriggers()V

    .line 111
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/PieControl;->updateSensitivity()V

    .line 112
    return-void
.end method
