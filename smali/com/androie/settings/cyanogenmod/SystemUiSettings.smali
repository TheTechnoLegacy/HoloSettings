.class public Lcom/androie/settings/cyanogenmod/SystemUiSettings;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "SystemUiSettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field private mExpandedDesktopNoNavbarPref:Landroid/preference/CheckBoxPreference;

.field private mExpandedDesktopPref:Landroid/preference/ListPreference;

.field private mPieControl:Landroid/preference/PreferenceScreen;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    return-void
.end method

.method private updateExpandedDesktop(I)V
    .locals 6
    .param p1, "value"    # I

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 128
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 129
    .local v0, "cr":Landroid/content/ContentResolver;
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 130
    .local v1, "res":Landroid/content/res/Resources;
    const/4 v2, -0x1

    .line 132
    .local v2, "summary":I
    const-string v3, "expanded_desktop_style"

    invoke-static {v0, v3, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 134
    if-nez p1, :cond_2

    .line 136
    const-string v3, "power_menu_expanded_desktop_enabled"

    invoke-static {v0, v3, v5}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 137
    const-string v3, "expanded_desktop_state"

    invoke-static {v0, v3, v5}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 138
    const v2, 0x7f0801dd

    .line 147
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->mExpandedDesktopPref:Landroid/preference/ListPreference;

    if-eqz v3, :cond_1

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 148
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->mExpandedDesktopPref:Landroid/preference/ListPreference;

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 150
    :cond_1
    return-void

    .line 139
    :cond_2
    if-ne p1, v4, :cond_3

    .line 140
    const-string v3, "power_menu_expanded_desktop_enabled"

    invoke-static {v0, v3, v4}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 141
    const v2, 0x7f0801de

    goto :goto_0

    .line 142
    :cond_3
    const/4 v3, 0x2

    if-ne p1, v3, :cond_0

    .line 143
    const-string v3, "power_menu_expanded_desktop_enabled"

    invoke-static {v0, v3, v4}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 144
    const v2, 0x7f0801df

    goto :goto_0
.end method

.method private updatePieControlSummary()V
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 115
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->mPieControl:Landroid/preference/PreferenceScreen;

    if-eqz v1, :cond_1

    .line 116
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "pie_controls"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 119
    .local v0, "enabled":Z
    :cond_0
    if-eqz v0, :cond_2

    .line 120
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->mPieControl:Landroid/preference/PreferenceScreen;

    const v2, 0x7f0802a3

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->setSummary(I)V

    .line 125
    .end local v0    # "enabled":Z
    :cond_1
    :goto_0
    return-void

    .line 122
    .restart local v0    # "enabled":Z
    :cond_2
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->mPieControl:Landroid/preference/PreferenceScreen;

    const v2, 0x7f0802a4

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->setSummary(I)V

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    .line 51
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 53
    const v4, 0x7f05004c

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->addPreferencesFromResource(I)V

    .line 54
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    .line 56
    .local v3, "prefScreen":Landroid/preference/PreferenceScreen;
    const-string v4, "pie_control"

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/PreferenceScreen;

    iput-object v4, p0, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->mPieControl:Landroid/preference/PreferenceScreen;

    .line 59
    const-string v4, "expanded_desktop"

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/ListPreference;

    iput-object v4, p0, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->mExpandedDesktopPref:Landroid/preference/ListPreference;

    .line 60
    const-string v4, "expanded_desktop_no_navbar"

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/CheckBoxPreference;

    iput-object v4, p0, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->mExpandedDesktopNoNavbarPref:Landroid/preference/CheckBoxPreference;

    .line 63
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v6

    const-string v7, "touch_screen_gesture_settings"

    invoke-static {v4, v6, v7}, Lcom/androie/settings/Utils;->updatePreferenceToSpecificActivityFromMetaDataOrRemove(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    .line 66
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v6, "expanded_desktop_style"

    invoke-static {v4, v6, v5}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    .line 70
    .local v1, "expandedDesktopValue":I
    :try_start_0
    invoke-static {}, Landroid/view/WindowManagerGlobal;->getWindowManagerService()Landroid/view/IWindowManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/IWindowManager;->hasNavigationBar()Z

    move-result v2

    .line 73
    .local v2, "hasNavBar":Z
    if-eqz v2, :cond_1

    .line 74
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->mExpandedDesktopPref:Landroid/preference/ListPreference;

    invoke-virtual {v4, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 75
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->mExpandedDesktopPref:Landroid/preference/ListPreference;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 76
    invoke-direct {p0, v1}, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->updateExpandedDesktop(I)V

    .line 77
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->mExpandedDesktopNoNavbarPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 85
    :goto_0
    if-nez v2, :cond_0

    .line 86
    const-string v4, "navigation_bar"

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 87
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->mPieControl:Landroid/preference/PreferenceScreen;

    .line 92
    .end local v2    # "hasNavBar":Z
    :cond_0
    :goto_1
    return-void

    .line 79
    .restart local v2    # "hasNavBar":Z
    :cond_1
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->mExpandedDesktopNoNavbarPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 80
    iget-object v6, p0, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->mExpandedDesktopNoNavbarPref:Landroid/preference/CheckBoxPreference;

    if-lez v1, :cond_2

    const/4 v4, 0x1

    :goto_2
    invoke-virtual {v6, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 81
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->mExpandedDesktopPref:Landroid/preference/ListPreference;

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 89
    .end local v2    # "hasNavBar":Z
    :catch_0
    move-exception v0

    .line 90
    .local v0, "e":Landroid/os/RemoteException;
    const-string v4, "SystemSettings"

    const-string v5, "Error getting navigation bar status"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .end local v0    # "e":Landroid/os/RemoteException;
    .restart local v2    # "hasNavBar":Z
    :cond_2
    move v4, v5

    .line 80
    goto :goto_2
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 5
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "objValue"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 101
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->mExpandedDesktopPref:Landroid/preference/ListPreference;

    if-ne p1, v4, :cond_1

    .line 102
    check-cast p2, Ljava/lang/String;

    .end local p2    # "objValue":Ljava/lang/Object;
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 103
    .local v0, "expandedDesktopValue":I
    invoke-direct {p0, v0}, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->updateExpandedDesktop(I)V

    move v2, v3

    .line 111
    .end local v0    # "expandedDesktopValue":I
    :cond_0
    :goto_0
    return v2

    .line 105
    .restart local p2    # "objValue":Ljava/lang/Object;
    :cond_1
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->mExpandedDesktopNoNavbarPref:Landroid/preference/CheckBoxPreference;

    if-ne p1, v4, :cond_0

    .line 106
    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "objValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 107
    .local v1, "value":Z
    if-eqz v1, :cond_2

    const/4 v2, 0x2

    :cond_2
    invoke-direct {p0, v2}, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->updateExpandedDesktop(I)V

    move v2, v3

    .line 108
    goto :goto_0
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 96
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onResume()V

    .line 97
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/SystemUiSettings;->updatePieControlSummary()V

    .line 98
    return-void
.end method
