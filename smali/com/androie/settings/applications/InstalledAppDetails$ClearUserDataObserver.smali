.class Lcom/androie/settings/applications/InstalledAppDetails$ClearUserDataObserver;
.super Landroid/content/pm/IPackageDataObserver$Stub;
.source "InstalledAppDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/applications/InstalledAppDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ClearUserDataObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/applications/InstalledAppDetails;


# direct methods
.method constructor <init>(Lcom/androie/settings/applications/InstalledAppDetails;)V
    .locals 0

    .prologue
    .line 218
    iput-object p1, p0, Lcom/androie/settings/applications/InstalledAppDetails$ClearUserDataObserver;->this$0:Lcom/androie/settings/applications/InstalledAppDetails;

    invoke-direct {p0}, Landroid/content/pm/IPackageDataObserver$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public onRemoveCompleted(Ljava/lang/String;Z)V
    .locals 3
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "succeeded"    # Z

    .prologue
    const/4 v1, 0x1

    .line 220
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails$ClearUserDataObserver;->this$0:Lcom/androie/settings/applications/InstalledAppDetails;

    invoke-static {v2}, Lcom/androie/settings/applications/InstalledAppDetails;->access$400(Lcom/androie/settings/applications/InstalledAppDetails;)Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 221
    .local v0, "msg":Landroid/os/Message;
    if-eqz p2, :cond_0

    :goto_0
    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 222
    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails$ClearUserDataObserver;->this$0:Lcom/androie/settings/applications/InstalledAppDetails;

    invoke-static {v1}, Lcom/androie/settings/applications/InstalledAppDetails;->access$400(Lcom/androie/settings/applications/InstalledAppDetails;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 223
    return-void

    .line 221
    :cond_0
    const/4 v1, 0x2

    goto :goto_0
.end method
