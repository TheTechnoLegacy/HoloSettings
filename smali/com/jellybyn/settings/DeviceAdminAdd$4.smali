.class Lcom/jellybyn/settings/DeviceAdminAdd$4;
.super Ljava/lang/Object;
.source "DeviceAdminAdd.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/DeviceAdminAdd;->onCreateDialog(ILandroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/DeviceAdminAdd;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/DeviceAdminAdd;)V
    .locals 0

    .prologue
    .line 283
    iput-object p1, p0, Lcom/jellybyn/settings/DeviceAdminAdd$4;->this$0:Lcom/jellybyn/settings/DeviceAdminAdd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 285
    iget-object v0, p0, Lcom/jellybyn/settings/DeviceAdminAdd$4;->this$0:Lcom/jellybyn/settings/DeviceAdminAdd;

    iget-object v0, v0, Lcom/jellybyn/settings/DeviceAdminAdd;->mDPM:Landroid/app/admin/DevicePolicyManager;

    iget-object v1, p0, Lcom/jellybyn/settings/DeviceAdminAdd$4;->this$0:Lcom/jellybyn/settings/DeviceAdminAdd;

    iget-object v1, v1, Lcom/jellybyn/settings/DeviceAdminAdd;->mDeviceAdmin:Landroid/app/admin/DeviceAdminInfo;

    invoke-virtual {v1}, Landroid/app/admin/DeviceAdminInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/admin/DevicePolicyManager;->removeActiveAdmin(Landroid/content/ComponentName;)V

    .line 286
    iget-object v0, p0, Lcom/jellybyn/settings/DeviceAdminAdd$4;->this$0:Lcom/jellybyn/settings/DeviceAdminAdd;

    invoke-virtual {v0}, Lcom/jellybyn/settings/DeviceAdminAdd;->finish()V

    .line 287
    return-void
.end method
