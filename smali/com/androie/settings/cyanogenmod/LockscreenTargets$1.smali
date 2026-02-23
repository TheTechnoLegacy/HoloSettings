.class Lcom/androie/settings/cyanogenmod/LockscreenTargets$1;
.super Ljava/lang/Object;
.source "LockscreenTargets.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/LockscreenTargets;->resetAll()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/LockscreenTargets;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)V
    .locals 0

    .prologue
    .line 246
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$1;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    const/4 v2, 0x0

    .line 249
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$1;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    invoke-static {v0, v2}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->access$100(Lcom/androie/settings/cyanogenmod/LockscreenTargets;Ljava/lang/String;)V

    .line 250
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$1;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    invoke-static {v0}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->access$200(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "lockscreen_targets"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 252
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$1;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    invoke-static {v0}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->access$200(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0800ad

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 254
    return-void
.end method
