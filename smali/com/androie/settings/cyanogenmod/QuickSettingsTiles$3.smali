.class Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$3;
.super Ljava/lang/Object;
.source "QuickSettingsTiles.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->resetTiles()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;)V
    .locals 0

    .prologue
    .line 265
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$3;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 267
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$3;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-virtual {v0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$3;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-static {v1}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->access$000(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;)Z

    move-result v1

    invoke-static {v0, v1}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->resetTiles(Landroid/content/Context;Z)V

    .line 268
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$3;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-virtual {v0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->genTiles()V

    .line 269
    return-void
.end method
