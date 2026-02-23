.class Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;
.super Ljava/lang/Object;
.source "MiscFilesHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeleteHandler"
.end annotation


# instance fields
.field private mDefContainerConn:Landroid/content/ServiceConnection;

.field private mPath:Ljava/lang/String;

.field final synthetic this$1:Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;


# direct methods
.method public constructor <init>(Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;Ljava/lang/String;)V
    .locals 6
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 165
    iput-object p1, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;->this$1:Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 145
    new-instance v1, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler$1;

    invoke-direct {v1, p0}, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler$1;-><init>(Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;)V

    iput-object v1, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;->mDefContainerConn:Landroid/content/ServiceConnection;

    .line 166
    iput-object p2, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;->mPath:Ljava/lang/String;

    .line 167
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    sget-object v2, Lcom/androie/settings/deviceinfo/StorageMeasurement;->DEFAULT_CONTAINER_COMPONENT:Landroid/content/ComponentName;

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v0

    .line 169
    .local v0, "service":Landroid/content/Intent;
    iget-object v1, p1, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    iget-object v2, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;->mDefContainerConn:Landroid/content/ServiceConnection;

    const/4 v3, 0x1

    new-instance v4, Landroid/os/UserHandle;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Landroid/os/UserHandle;-><init>(I)V

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/androie/settings/deviceinfo/MiscFilesHandler;->bindServiceAsUser(Landroid/content/Intent;Landroid/content/ServiceConnection;ILandroid/os/UserHandle;)Z

    .line 171
    return-void
.end method

.method static synthetic access$100(Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;

    .prologue
    .line 144
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;->mPath:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;)Landroid/content/ServiceConnection;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;

    .prologue
    .line 144
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;->mDefContainerConn:Landroid/content/ServiceConnection;

    return-object v0
.end method
