.class Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler$1;
.super Ljava/lang/Object;
.source "MiscFilesHandler.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;


# direct methods
.method constructor <init>(Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;)V
    .locals 0

    .prologue
    .line 145
    iput-object p1, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler$1;->this$2:Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 4
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 148
    invoke-static {p2}, Lcom/android/internal/app/IMediaContainerService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/app/IMediaContainerService;

    move-result-object v1

    .line 151
    .local v1, "imcs":Lcom/android/internal/app/IMediaContainerService;
    :try_start_0
    iget-object v2, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler$1;->this$2:Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;

    invoke-static {v2}, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;->access$100(Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/android/internal/app/IMediaContainerService;->deleteFile(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 155
    :goto_0
    iget-object v2, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler$1;->this$2:Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;

    iget-object v2, v2, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;->this$1:Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;

    iget-object v2, v2, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    iget-object v3, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler$1;->this$2:Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;

    invoke-static {v3}, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;->access$200(Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;)Landroid/content/ServiceConnection;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/androie/settings/deviceinfo/MiscFilesHandler;->unbindService(Landroid/content/ServiceConnection;)V

    .line 156
    return-void

    .line 152
    :catch_0
    move-exception v0

    .line 153
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "MemorySettings"

    const-string v3, "Problem in container service"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 160
    return-void
.end method
