.class public Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch;
.super Landroid/widget/Switch;
.source "AccessibilitySettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/AccessibilitySettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ToggleSwitch"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch$OnBeforeCheckedChangeListener;
    }
.end annotation


# instance fields
.field private mOnBeforeListener:Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch$OnBeforeCheckedChangeListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 649
    invoke-direct {p0, p1}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 650
    return-void
.end method


# virtual methods
.method public setChecked(Z)V
    .locals 1
    .param p1, "checked"    # Z

    .prologue
    .line 658
    iget-object v0, p0, Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch;->mOnBeforeListener:Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch$OnBeforeCheckedChangeListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch;->mOnBeforeListener:Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch$OnBeforeCheckedChangeListener;

    invoke-interface {v0, p0, p1}, Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch$OnBeforeCheckedChangeListener;->onBeforeCheckedChanged(Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 663
    :goto_0
    return-void

    .line 662
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/Switch;->setChecked(Z)V

    goto :goto_0
.end method

.method public setCheckedInternal(Z)V
    .locals 0
    .param p1, "checked"    # Z

    .prologue
    .line 666
    invoke-super {p0, p1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 667
    return-void
.end method

.method public setOnBeforeCheckedChangeListener(Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch$OnBeforeCheckedChangeListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch$OnBeforeCheckedChangeListener;

    .prologue
    .line 653
    iput-object p1, p0, Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch;->mOnBeforeListener:Lcom/jellybyn/settings/AccessibilitySettings$ToggleSwitch$OnBeforeCheckedChangeListener;

    .line 654
    return-void
.end method
