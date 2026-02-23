.class Lcom/androie/settings/cyanogenmod/LockscreenInterface$2;
.super Ljava/lang/Object;
.source "LockscreenInterface.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/LockscreenInterface;->handleBackgroundSelection(I)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/LockscreenInterface;

.field final synthetic val$colorView:Lcom/androie/settings/notificationlight/ColorPickerView;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/LockscreenInterface;Lcom/androie/settings/notificationlight/ColorPickerView;)V
    .locals 0

    .prologue
    .line 259
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface$2;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenInterface;

    iput-object p2, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface$2;->val$colorView:Lcom/androie/settings/notificationlight/ColorPickerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 262
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface$2;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenInterface;

    invoke-static {v0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->access$000(Lcom/androie/settings/cyanogenmod/LockscreenInterface;)Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "lockscreen_background"

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface$2;->val$colorView:Lcom/androie/settings/notificationlight/ColorPickerView;

    invoke-virtual {v2}, Lcom/androie/settings/notificationlight/ColorPickerView;->getColor()I

    move-result v2

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 264
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface$2;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenInterface;

    invoke-static {v0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->access$100(Lcom/androie/settings/cyanogenmod/LockscreenInterface;)V

    .line 265
    return-void
.end method
