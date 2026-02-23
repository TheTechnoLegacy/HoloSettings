.class public Lcom/androie/settings/ChooseLockPatternSize$ChooseLockPatternSizeFragment;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "ChooseLockPatternSize.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/ChooseLockPatternSize;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ChooseLockPatternSizeFragment"
.end annotation


# instance fields
.field private mChooseLockSettingsHelper:Lcom/androie/settings/ChooseLockSettingsHelper;


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
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 42
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 43
    new-instance v0, Lcom/androie/settings/ChooseLockSettingsHelper;

    invoke-virtual {p0}, Lcom/androie/settings/ChooseLockPatternSize$ChooseLockPatternSizeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/androie/settings/ChooseLockSettingsHelper;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/androie/settings/ChooseLockPatternSize$ChooseLockPatternSizeFragment;->mChooseLockSettingsHelper:Lcom/androie/settings/ChooseLockSettingsHelper;

    .line 44
    const v0, 0x7f050040

    invoke-virtual {p0, v0}, Lcom/androie/settings/ChooseLockPatternSize$ChooseLockPatternSizeFragment;->addPreferencesFromResource(I)V

    .line 45
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 50
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 53
    const-string v1, "lock_pattern_size_4"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 54
    const/4 v0, 0x4

    .line 63
    :goto_0
    invoke-virtual {p0}, Lcom/androie/settings/ChooseLockPatternSize$ChooseLockPatternSizeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "lockscreen.biometric_weak_fallback"

    invoke-virtual {v1, v2, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    .line 66
    new-instance v2, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/androie/settings/ChooseLockPatternSize$ChooseLockPatternSizeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-class v4, Lcom/androie/settings/ChooseLockPattern;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 67
    const-string v3, "pattern_size"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;B)Landroid/content/Intent;

    .line 68
    const-string v0, "key_lock_method"

    const-string v3, "pattern"

    invoke-virtual {v2, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 69
    const-string v0, "confirm_credentials"

    invoke-virtual {v2, v0, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 70
    const-string v0, "lockscreen.biometric_weak_fallback"

    invoke-virtual {v2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 72
    const/high16 v0, 0x2000000

    invoke-virtual {v2, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 73
    invoke-virtual {p0, v2}, Lcom/androie/settings/ChooseLockPatternSize$ChooseLockPatternSizeFragment;->startActivity(Landroid/content/Intent;)V

    .line 75
    invoke-virtual {p0}, Lcom/androie/settings/ChooseLockPatternSize$ChooseLockPatternSizeFragment;->finish()V

    .line 76
    const/4 v0, 0x1

    return v0

    .line 55
    :cond_0
    const-string v1, "lock_pattern_size_5"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 56
    const/4 v0, 0x5

    goto :goto_0

    .line 57
    :cond_1
    const-string v1, "lock_pattern_size_6"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 58
    const/4 v0, 0x6

    goto :goto_0

    .line 60
    :cond_2
    const/4 v0, 0x3

    goto :goto_0
.end method
