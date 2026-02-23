.class Lcom/androie/settings/applications/InstalledAppDetails$2;
.super Landroid/content/BroadcastReceiver;
.source "InstalledAppDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/applications/InstalledAppDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/applications/InstalledAppDetails;


# direct methods
.method constructor <init>(Lcom/androie/settings/applications/InstalledAppDetails;)V
    .locals 0

    .prologue
    .line 1277
    iput-object p1, p0, Lcom/androie/settings/applications/InstalledAppDetails$2;->this$0:Lcom/androie/settings/applications/InstalledAppDetails;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 1280
    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails$2;->this$0:Lcom/androie/settings/applications/InstalledAppDetails;

    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails$2;->getResultCode()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lcom/androie/settings/applications/InstalledAppDetails;->access$1500(Lcom/androie/settings/applications/InstalledAppDetails;Z)V

    .line 1281
    return-void

    .line 1280
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
