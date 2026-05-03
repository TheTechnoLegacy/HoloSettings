.class Lcom/jellybyn/settings/deviceinfo/Memory$ClearCacheObserver;
.super Landroid/content/pm/IPackageDataObserver$Stub;
.source "Memory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/deviceinfo/Memory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ClearCacheObserver"
.end annotation


# instance fields
.field private mRemaining:I

.field private final mTarget:Lcom/jellybyn/settings/deviceinfo/Memory;


# direct methods
.method public constructor <init>(Lcom/jellybyn/settings/deviceinfo/Memory;I)V
    .locals 0
    .param p1, "target"    # Lcom/jellybyn/settings/deviceinfo/Memory;
    .param p2, "remaining"    # I

    .prologue
    .line 369
    invoke-direct {p0}, Landroid/content/pm/IPackageDataObserver$Stub;-><init>()V

    .line 370
    iput-object p1, p0, Lcom/jellybyn/settings/deviceinfo/Memory$ClearCacheObserver;->mTarget:Lcom/jellybyn/settings/deviceinfo/Memory;

    .line 371
    iput p2, p0, Lcom/jellybyn/settings/deviceinfo/Memory$ClearCacheObserver;->mRemaining:I

    .line 372
    return-void
.end method


# virtual methods
.method public onRemoveCompleted(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "succeeded"    # Z

    .prologue
    .line 376
    monitor-enter p0

    .line 377
    :try_start_0
    iget v0, p0, Lcom/jellybyn/settings/deviceinfo/Memory$ClearCacheObserver;->mRemaining:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/jellybyn/settings/deviceinfo/Memory$ClearCacheObserver;->mRemaining:I

    if-nez v0, :cond_0

    .line 378
    iget-object v0, p0, Lcom/jellybyn/settings/deviceinfo/Memory$ClearCacheObserver;->mTarget:Lcom/jellybyn/settings/deviceinfo/Memory;

    invoke-static {v0}, Lcom/jellybyn/settings/deviceinfo/Memory;->access$300(Lcom/jellybyn/settings/deviceinfo/Memory;)V

    .line 380
    :cond_0
    monitor-exit p0

    .line 381
    return-void

    .line 380
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
