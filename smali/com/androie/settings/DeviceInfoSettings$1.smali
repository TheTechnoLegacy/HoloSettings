.class Lcom/androie/settings/DeviceInfoSettings$1;
.super Ljava/lang/Object;
.source "DeviceInfoSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/DeviceInfoSettings;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/DeviceInfoSettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/DeviceInfoSettings;)V
    .locals 0

    .prologue
    .line 257
    iput-object p1, p0, Lcom/androie/settings/DeviceInfoSettings$1;->this$0:Lcom/androie/settings/DeviceInfoSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 259
    const/4 v1, 0x1

    invoke-static {v1}, Landroid/os/SELinux;->setSELinuxEnforce(Z)Z

    .line 260
    iget-object v1, p0, Lcom/androie/settings/DeviceInfoSettings$1;->this$0:Lcom/androie/settings/DeviceInfoSettings;

    invoke-virtual {v1}, Lcom/androie/settings/DeviceInfoSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f080a30

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 262
    .local v0, "status":Ljava/lang/String;
    iget-object v1, p0, Lcom/androie/settings/DeviceInfoSettings$1;->this$0:Lcom/androie/settings/DeviceInfoSettings;

    const-string v2, "selinux_status"

    invoke-static {v1, v2, v0}, Lcom/androie/settings/DeviceInfoSettings;->access$000(Lcom/androie/settings/DeviceInfoSettings;Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    return-void
.end method
