.class Lcom/androie/settings/AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment$1;
.super Ljava/lang/Object;
.source "AccessibilitySettings.java"

# interfaces
.implements Lcom/androie/settings/AccessibilitySettings$ToggleSwitch$OnBeforeCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment;->onInstallActionBarToggleSwitch()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment;


# direct methods
.method constructor <init>(Lcom/androie/settings/AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment;)V
    .locals 0

    .prologue
    .line 978
    iput-object p1, p0, Lcom/androie/settings/AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment$1;->this$0:Lcom/androie/settings/AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBeforeCheckedChanged(Lcom/androie/settings/AccessibilitySettings$ToggleSwitch;Z)Z
    .locals 2
    .param p1, "toggleSwitch"    # Lcom/androie/settings/AccessibilitySettings$ToggleSwitch;
    .param p2, "checked"    # Z

    .prologue
    .line 981
    invoke-virtual {p1, p2}, Lcom/androie/settings/AccessibilitySettings$ToggleSwitch;->setCheckedInternal(Z)V

    .line 982
    iget-object v0, p0, Lcom/androie/settings/AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment$1;->this$0:Lcom/androie/settings/AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment;

    invoke-virtual {v0}, Lcom/androie/settings/AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "checked"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 983
    iget-object v0, p0, Lcom/androie/settings/AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment$1;->this$0:Lcom/androie/settings/AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment;

    iget-object v1, p0, Lcom/androie/settings/AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment$1;->this$0:Lcom/androie/settings/AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment;

    iget-object v1, v1, Lcom/androie/settings/AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment;->mPreferenceKey:Ljava/lang/String;

    invoke-virtual {v0, v1, p2}, Lcom/androie/settings/AccessibilitySettings$ToggleScreenMagnificationPreferenceFragment;->onPreferenceToggled(Ljava/lang/String;Z)V

    .line 984
    const/4 v0, 0x0

    return v0
.end method
