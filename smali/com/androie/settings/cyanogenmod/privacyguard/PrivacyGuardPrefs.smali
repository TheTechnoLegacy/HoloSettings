.class public Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardPrefs;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "PrivacyGuardPrefs.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field private mPrivacyGuardDefault:Landroid/preference/CheckBoxPreference;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 48
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 50
    const v2, 0x7f05002d

    invoke-virtual {p0, v2}, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardPrefs;->addPreferencesFromResource(I)V

    .line 51
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardPrefs;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    .line 53
    .local v1, "prefSet":Landroid/preference/PreferenceScreen;
    const-string v2, "privacy_guard_default"

    invoke-virtual {p0, v2}, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardPrefs;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    iput-object v2, p0, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardPrefs;->mPrivacyGuardDefault:Landroid/preference/CheckBoxPreference;

    .line 54
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardPrefs;->mPrivacyGuardDefault:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 57
    :try_start_0
    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardPrefs;->mPrivacyGuardDefault:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardPrefs;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v6, "privacy_guard_default"

    invoke-static {v2, v6}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result v2

    if-ne v2, v3, :cond_0

    move v2, v3

    :goto_0
    invoke-virtual {v5, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    :goto_1
    return-void

    :cond_0
    move v2, v4

    .line 57
    goto :goto_0

    .line 59
    :catch_0
    move-exception v0

    .line 60
    .local v0, "e":Landroid/provider/Settings$SettingNotFoundException;
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardPrefs;->mPrivacyGuardDefault:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    .line 67
    invoke-super {p0, p1, p2, p3}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v3

    .line 68
    .local v3, "view":Landroid/view/View;
    const v4, 0x102000a

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    .line 70
    .local v0, "list":Landroid/widget/ListView;
    invoke-virtual {v0}, Landroid/widget/ListView;->getPaddingTop()I

    move-result v2

    .line 71
    .local v2, "paddingTop":I
    invoke-virtual {v0}, Landroid/widget/ListView;->getPaddingBottom()I

    move-result v1

    .line 72
    .local v1, "paddingBottom":I
    invoke-virtual {v0, v5, v2, v5, v1}, Landroid/widget/ListView;->setPadding(IIII)V

    .line 73
    return-object v3
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 5
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 78
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardPrefs;->mPrivacyGuardDefault:Landroid/preference/CheckBoxPreference;

    if-ne p1, v3, :cond_1

    .line 79
    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 80
    .local v0, "value":Z
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardPrefs;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "privacy_guard_default"

    if-eqz v0, :cond_0

    move v1, v2

    :cond_0
    invoke-static {v3, v4, v1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 84
    .end local v0    # "value":Z
    :goto_0
    return v2

    .restart local p2    # "newValue":Ljava/lang/Object;
    :cond_1
    move v2, v1

    goto :goto_0
.end method
