.class Lcom/androie/settings/applications/ManageApplications$2;
.super Ljava/lang/Object;
.source "ManageApplications.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/applications/ManageApplications;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/applications/ManageApplications;


# direct methods
.method constructor <init>(Lcom/androie/settings/applications/ManageApplications;)V
    .locals 0

    .prologue
    .line 1260
    iput-object p1, p0, Lcom/androie/settings/applications/ManageApplications$2;->this$0:Lcom/androie/settings/applications/ManageApplications;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 3
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 1263
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications$2;->this$0:Lcom/androie/settings/applications/ManageApplications;

    invoke-static {p2}, Lcom/android/internal/app/IMediaContainerService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/app/IMediaContainerService;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/androie/settings/applications/ManageApplications;->access$1402(Lcom/androie/settings/applications/ManageApplications;Lcom/android/internal/app/IMediaContainerService;)Lcom/android/internal/app/IMediaContainerService;

    .line 1264
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications$2;->this$0:Lcom/androie/settings/applications/ManageApplications;

    invoke-static {v1}, Lcom/androie/settings/applications/ManageApplications;->access$100(Lcom/androie/settings/applications/ManageApplications;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 1265
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications$2;->this$0:Lcom/androie/settings/applications/ManageApplications;

    invoke-static {v1}, Lcom/androie/settings/applications/ManageApplications;->access$100(Lcom/androie/settings/applications/ManageApplications;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/applications/ManageApplications$TabInfo;

    iget-object v2, p0, Lcom/androie/settings/applications/ManageApplications$2;->this$0:Lcom/androie/settings/applications/ManageApplications;

    invoke-static {v2}, Lcom/androie/settings/applications/ManageApplications;->access$1400(Lcom/androie/settings/applications/ManageApplications;)Lcom/android/internal/app/IMediaContainerService;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/androie/settings/applications/ManageApplications$TabInfo;->setContainerService(Lcom/android/internal/app/IMediaContainerService;)V

    .line 1264
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1267
    :cond_0
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 1271
    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications$2;->this$0:Lcom/androie/settings/applications/ManageApplications;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/androie/settings/applications/ManageApplications;->access$1402(Lcom/androie/settings/applications/ManageApplications;Lcom/android/internal/app/IMediaContainerService;)Lcom/android/internal/app/IMediaContainerService;

    .line 1272
    return-void
.end method
