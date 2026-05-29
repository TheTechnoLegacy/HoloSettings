.class public Lcom/jellybyn/settings/SettingsPreferenceFragment;
.super Landroid/preference/PreferenceFragment;
.source "SettingsPreferenceFragment.java"

# interfaces
.implements Lcom/jellybyn/settings/DialogCreatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;
    }
.end annotation


# instance fields
.field private mContentResolver:Landroid/content/ContentResolver;

.field private mDialogFragment:Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;

.field private mHelpUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    .line 193
    return-void
.end method

.method static synthetic access$200(Lcom/jellybyn/settings/SettingsPreferenceFragment;)Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/SettingsPreferenceFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mDialogFragment:Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    return-object v0
.end method

.method static synthetic access$202(Lcom/jellybyn/settings/SettingsPreferenceFragment;Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;)Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/SettingsPreferenceFragment;
    .param p1, "x1"    # Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mDialogFragment:Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    return-object p1
.end method


# virtual methods
.method public finish()V
    .locals 1

    .prologue
    .line 303
    invoke-virtual {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->onBackPressed()V

    .line 304
    return-void
.end method

.method public final finishFragment()V
    .locals 1

    .prologue
    .line 102
    invoke-virtual {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->onBackPressed()V

    .line 103
    return-void
.end method

.method protected getContentResolver()Landroid/content/ContentResolver;
    .locals 2

    .prologue
    .line 111
    invoke-virtual {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 112
    .local v0, "context":Landroid/content/Context;
    if-eqz v0, :cond_0

    .line 113
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iput-object v1, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mContentResolver:Landroid/content/ContentResolver;

    .line 115
    :cond_0
    iget-object v1, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mContentResolver:Landroid/content/ContentResolver;

    return-object v1
.end method

.method protected getHelpResource()I
    .locals 1

    .prologue
    .line 86
    const/4 v0, 0x0

    return v0
.end method

.method protected getNextButton()Landroid/widget/Button;
    .locals 1

    .prologue
    .line 299
    invoke-virtual {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/jellybyn/settings/ButtonBarHandler;

    invoke-interface {v0}, Lcom/jellybyn/settings/ButtonBarHandler;->getNextButton()Landroid/widget/Button;

    move-result-object v0

    return-object v0
.end method

.method protected getPackageManager()Landroid/content/pm/PackageManager;
    .locals 1

    .prologue
    .line 129
    invoke-virtual {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    return-object v0
.end method

.method protected getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 122
    invoke-virtual {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected hasNextButton()Z
    .locals 1

    .prologue
    .line 295
    invoke-virtual {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/jellybyn/settings/ButtonBarHandler;

    invoke-interface {v0}, Lcom/jellybyn/settings/ButtonBarHandler;->hasNextButton()Z

    move-result v0

    return v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 68
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 69
    iget-object v0, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mHelpUrl:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 70
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->setHasOptionsMenu(Z)V

    .line 72
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 57
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 60
    invoke-virtual {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->getHelpResource()I

    move-result v0

    .line 61
    .local v0, "helpResource":I
    if-eqz v0, :cond_0

    .line 62
    invoke-virtual {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mHelpUrl:Ljava/lang/String;

    .line 64
    :cond_0
    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 1
    .param p1, "dialogId"    # I

    .prologue
    .line 154
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 4
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v3, 0x0

    .line 91
    iget-object v1, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mHelpUrl:Ljava/lang/String;

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 92
    const/16 v1, 0x65

    const v2, 0x7f0b06f9

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    .line 93
    .local v0, "helpItem":Landroid/view/MenuItem;
    invoke-virtual {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mHelpUrl:Ljava/lang/String;

    invoke-static {v1, v0, v2}, Lcom/jellybyn/settings/HelpUtils;->prepareHelpMenuItem(Landroid/content/Context;Landroid/view/MenuItem;Ljava/lang/String;)Z

    .line 95
    .end local v0    # "helpItem":Landroid/view/MenuItem;
    :cond_0
    return-void
.end method

.method public onDetach()V
    .locals 1

    .prologue
    .line 134
    invoke-virtual {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->isRemoving()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 135
    iget-object v0, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mDialogFragment:Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    if-eqz v0, :cond_0

    .line 136
    iget-object v0, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mDialogFragment:Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    invoke-virtual {v0}, Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;->dismiss()V

    .line 137
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mDialogFragment:Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    .line 140
    :cond_0
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onDetach()V

    .line 141
    return-void
.end method

.method public onDialogShowing()V
    .locals 0

    .prologue
    .line 191
    return-void
.end method

.method protected removeDialog(I)V
    .locals 1
    .param p1, "dialogId"    # I

    .prologue
    .line 161
    iget-object v0, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mDialogFragment:Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mDialogFragment:Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    invoke-virtual {v0}, Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;->getDialogId()I

    move-result v0

    if-ne v0, p1, :cond_0

    .line 162
    iget-object v0, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mDialogFragment:Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    invoke-virtual {v0}, Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;->dismiss()V

    .line 164
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mDialogFragment:Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    .line 165
    return-void
.end method

.method protected removePreference(Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 75
    invoke-virtual {p0, p1}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 76
    .local v0, "pref":Landroid/preference/Preference;
    if-eqz v0, :cond_0

    .line 77
    invoke-virtual {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 79
    :cond_0
    return-void
.end method

.method protected setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/content/DialogInterface$OnDismissListener;

    .prologue
    .line 184
    iget-object v0, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mDialogFragment:Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    if-eqz v0, :cond_0

    .line 185
    iget-object v0, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mDialogFragment:Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    invoke-static {v0, p1}, Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;->access$102(Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;Landroid/content/DialogInterface$OnDismissListener;)Landroid/content/DialogInterface$OnDismissListener;

    .line 187
    :cond_0
    return-void
.end method

.method protected showDialog(I)V
    .locals 3
    .param p1, "dialogId"    # I

    .prologue
    .line 146
    iget-object v0, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mDialogFragment:Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    if-eqz v0, :cond_0

    .line 147
    const-string v0, "SettingsPreferenceFragment"

    const-string v1, "Old dialog fragment not null!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    :cond_0
    new-instance v0, Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    invoke-direct {v0, p0, p1}, Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;-><init>(Lcom/jellybyn/settings/DialogCreatable;I)V

    iput-object v0, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mDialogFragment:Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    .line 150
    iget-object v0, p0, Lcom/jellybyn/settings/SettingsPreferenceFragment;->mDialogFragment:Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    invoke-virtual {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/jellybyn/settings/SettingsPreferenceFragment$SettingsDialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 151
    return-void
.end method

.method public startFragment(Landroid/app/Fragment;Ljava/lang/String;ILandroid/os/Bundle;)Z
    .locals 7
    .param p1, "caller"    # Landroid/app/Fragment;
    .param p2, "fragmentClass"    # Ljava/lang/String;
    .param p3, "requestCode"    # I
    .param p4, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 308
    invoke-virtual {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    instance-of v1, v1, Landroid/preference/PreferenceActivity;

    if-eqz v1, :cond_0

    .line 309
    invoke-virtual {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    .line 310
    .local v0, "preferenceActivity":Landroid/preference/PreferenceActivity;
    const v3, 0x7f0b0133

    const/4 v4, 0x0

    move-object v1, p2

    move-object v2, p4

    move-object v5, p1

    move v6, p3

    invoke-virtual/range {v0 .. v6}, Landroid/preference/PreferenceActivity;->startPreferencePanel(Ljava/lang/String;Landroid/os/Bundle;ILjava/lang/CharSequence;Landroid/app/Fragment;I)V

    .line 312
    const/4 v1, 0x1

    .line 317
    .end local v0    # "preferenceActivity":Landroid/preference/PreferenceActivity;
    :goto_0
    return v1

    .line 314
    :cond_0
    const-string v1, "SettingsPreferenceFragment"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Parent isn\'t PreferenceActivity, thus there\'s no way to launch the given Fragment (name: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", requestCode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 317
    const/4 v1, 0x0

    goto :goto_0
.end method
