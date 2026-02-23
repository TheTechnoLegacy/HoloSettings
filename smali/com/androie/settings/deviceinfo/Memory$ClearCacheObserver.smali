.class Lcom/androie/settings/deviceinfo/Memory$ClearCacheObserver;
.super Landroid/content/pm/IPackageDataObserver$Stub;
.source "Memory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/deviceinfo/Memory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ClearCacheObserver"
.end annotation


# instance fields
.field private mRemaining:I

.field private final mTarget:Lcom/androie/settings/deviceinfo/Memory;


# direct methods
.method public constructor <init>(Lcom/androie/settings/deviceinfo/Memory;I)V
    .locals 0
    .param p1, "target"    # Lcom/androie/settings/deviceinfo/Memory;
    .param p2, "remaining"    # I

    .prologue
    .line 367
    invoke-direct {p0}, Landroid/content/pm/IPackageDataObserver$Stub;-><init>()V

    .line 368
    iput-object p1, p0, Lcom/androie/settings/deviceinfo/Memory$ClearCacheObserver;->mTarget:Lcom/androie/settings/deviceinfo/Memory;

    .line 369
    iput p2, p0, Lcom/androie/settings/deviceinfo/Memory$ClearCacheObserver;->mRemaining:I

    .line 370
    return-void
.end method


# virtual methods
.method public onRemoveCompleted(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "succeeded"    # Z

    .prologue
    .line 374
    monitor-enter p0

    .line 375
    :try_start_0
    iget v0, p0, Lcom/androie/settings/deviceinfo/Memory$ClearCacheObserver;->mRemaining:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/androie/settings/deviceinfo/Memory$ClearCacheObserver;->mRemaining:I

    if-nez v0, :cond_0

    .line 376
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/Memory$ClearCacheObserver;->mTarget:Lcom/androie/settings/deviceinfo/Memory;

    invoke-static {v0}, Lcom/androie/settings/deviceinfo/Memory;->access$300(Lcom/androie/settings/deviceinfo/Memory;)V

    .line 378
    :cond_0
    monitor-exit p0

    .line 379
    return-void

    .line 378
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
