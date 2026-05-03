.class Lcom/jellybyn/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment$2;
.super Ljava/lang/Object;
.source "AccessibilitySettings.java"

# interfaces
.implements Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch$OnBeforeCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment;->onInstallActionBarToggleSwitch()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment;)V
    .locals 0

    .prologue
    .line 897
    iput-object p1, p0, Lcom/jellybyn/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment$2;->this$0:Lcom/jellybyn/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBeforeCheckedChanged(Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch;Z)Z
    .locals 4
    .param p1, "toggleSwitch"    # Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch;
    .param p2, "checked"    # Z

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 900
    if-eqz p2, :cond_0

    .line 901
    invoke-virtual {p1, v3}, Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch;->setCheckedInternal(Z)V

    .line 902
    iget-object v0, p0, Lcom/jellybyn/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment$2;->this$0:Lcom/jellybyn/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment;

    invoke-virtual {v0}, Lcom/jellybyn/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "checked"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 903
    iget-object v0, p0, Lcom/jellybyn/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment$2;->this$0:Lcom/jellybyn/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment;

    invoke-virtual {v0, v2}, Lcom/jellybyn/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment;->showDialog(I)V

    .line 909
    :goto_0
    return v2

    .line 905
    :cond_0
    invoke-virtual {p1, v2}, Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch;->setCheckedInternal(Z)V

    .line 906
    iget-object v0, p0, Lcom/jellybyn/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment$2;->this$0:Lcom/jellybyn/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment;

    invoke-virtual {v0}, Lcom/jellybyn/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "checked"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 907
    iget-object v0, p0, Lcom/jellybyn/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment$2;->this$0:Lcom/jellybyn/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment;->showDialog(I)V

    goto :goto_0
.end method
