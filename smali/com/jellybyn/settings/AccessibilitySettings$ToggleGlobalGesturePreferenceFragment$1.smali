.class Lcom/jellybyn/settings/AccessibilitySettings$ToggleGlobalGesturePreferenceFragment$1;
.super Ljava/lang/Object;
.source "AccessibilitySettings.java"

# interfaces
.implements Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch$OnBeforeCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/AccessibilitySettings$ToggleGlobalGesturePreferenceFragment;->onInstallActionBarToggleSwitch()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/AccessibilitySettings$ToggleGlobalGesturePreferenceFragment;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/AccessibilitySettings$ToggleGlobalGesturePreferenceFragment;)V
    .locals 0

    .prologue
    .line 968
    iput-object p1, p0, Lcom/jellybyn/settings/AccessibilitySettings$ToggleGlobalGesturePreferenceFragment$1;->this$0:Lcom/jellybyn/settings/AccessibilitySettings$ToggleGlobalGesturePreferenceFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBeforeCheckedChanged(Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch;Z)Z
    .locals 2
    .param p1, "toggleSwitch"    # Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch;
    .param p2, "checked"    # Z

    .prologue
    .line 971
    invoke-virtual {p1, p2}, Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch;->setCheckedInternal(Z)V

    .line 972
    iget-object v0, p0, Lcom/jellybyn/settings/AccessibilitySettings$ToggleGlobalGesturePreferenceFragment$1;->this$0:Lcom/jellybyn/settings/AccessibilitySettings$ToggleGlobalGesturePreferenceFragment;

    invoke-virtual {v0}, Lcom/jellybyn/settings/AccessibilitySettings$ToggleGlobalGesturePreferenceFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "checked"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 973
    iget-object v0, p0, Lcom/jellybyn/settings/AccessibilitySettings$ToggleGlobalGesturePreferenceFragment$1;->this$0:Lcom/jellybyn/settings/AccessibilitySettings$ToggleGlobalGesturePreferenceFragment;

    iget-object v1, p0, Lcom/jellybyn/settings/AccessibilitySettings$ToggleGlobalGesturePreferenceFragment$1;->this$0:Lcom/jellybyn/settings/AccessibilitySettings$ToggleGlobalGesturePreferenceFragment;

    iget-object v1, v1, Lcom/jellybyn/settings/AccessibilitySettings$ToggleGlobalGesturePreferenceFragment;->mPreferenceKey:Ljava/lang/String;

    invoke-virtual {v0, v1, p2}, Lcom/jellybyn/settings/AccessibilitySettings$ToggleGlobalGesturePreferenceFragment;->onPreferenceToggled(Ljava/lang/String;Z)V

    .line 974
    const/4 v0, 0x0

    return v0
.end method
