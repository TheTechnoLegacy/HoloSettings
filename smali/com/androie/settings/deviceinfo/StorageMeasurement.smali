.class public Lcom/androie/settings/deviceinfo/StorageMeasurement;
.super Ljava/lang/Object;
.source "StorageMeasurement.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/deviceinfo/StorageMeasurement$FileInfo;,
        Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementHandler;,
        Lcom/androie/settings/deviceinfo/StorageMeasurement$StatsObserver;,
        Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;,
        Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementDetails;
    }
.end annotation


# static fields
.field public static final DEFAULT_CONTAINER_COMPONENT:Landroid/content/ComponentName;

.field static final LOGV:Z

.field private static sInstances:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/os/storage/StorageVolume;",
            "Lcom/androie/settings/deviceinfo/StorageMeasurement;",
            ">;"
        }
    .end annotation
.end field

.field private static final sMeasureMediaTypes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAvailSize:J

.field mFileInfoForMisc:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/androie/settings/deviceinfo/StorageMeasurement$FileInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mHandler:Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementHandler;

.field private final mIsInternal:Z

.field private final mIsPrimary:Z

.field private volatile mReceiver:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;",
            ">;"
        }
    .end annotation
.end field

.field private mTotalSize:J

.field private final mVolume:Landroid/os/storage/StorageVolume;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x2

    .line 66
    const-string v0, "StorageMeasurement"

    invoke-static {v0, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->LOGV:Z

    .line 70
    new-instance v0, Landroid/content/ComponentName;

    const-string v1, "com.android.defcontainer"

    const-string v2, "com.android.defcontainer.DefaultContainerService"

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->DEFAULT_CONTAINER_COMPONENT:Landroid/content/ComponentName;

    .line 74
    const/16 v0, 0xa

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    sget-object v2, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Landroid/os/Environment;->DIRECTORY_MOVIES:Ljava/lang/String;

    aput-object v2, v0, v1

    sget-object v1, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    aput-object v1, v0, v3

    const/4 v1, 0x3

    sget-object v2, Landroid/os/Environment;->DIRECTORY_MUSIC:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Landroid/os/Environment;->DIRECTORY_ALARMS:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Landroid/os/Environment;->DIRECTORY_NOTIFICATIONS:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Landroid/os/Environment;->DIRECTORY_RINGTONES:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Landroid/os/Environment;->DIRECTORY_PODCASTS:Ljava/lang/String;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Landroid/os/Environment;->DIRECTORY_ANDROID:Ljava/lang/String;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/google/android/collect/Sets;->newHashSet([Ljava/lang/Object;)Ljava/util/HashSet;

    move-result-object v0

    sput-object v0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->sMeasureMediaTypes:Ljava/util/Set;

    .line 82
    invoke-static {}, Lcom/google/android/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v0

    sput-object v0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->sInstances:Ljava/util/HashMap;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Landroid/os/storage/StorageVolume;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "volume"    # Landroid/os/storage/StorageVolume;

    .prologue
    const/4 v2, 0x0

    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 168
    iput-object p2, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mVolume:Landroid/os/storage/StorageVolume;

    .line 169
    if-nez p2, :cond_1

    const/4 v1, 0x1

    :goto_0
    iput-boolean v1, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mIsInternal:Z

    .line 170
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/os/storage/StorageVolume;->isPrimary()Z

    move-result v2

    :cond_0
    iput-boolean v2, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mIsPrimary:Z

    .line 173
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "MemoryMeasurement"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 174
    .local v0, "handlerThread":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 175
    new-instance v1, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementHandler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, p1, v2}, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementHandler;-><init>(Lcom/androie/settings/deviceinfo/StorageMeasurement;Landroid/content/Context;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mHandler:Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementHandler;

    .line 176
    return-void

    .end local v0    # "handlerThread":Landroid/os/HandlerThread;
    :cond_1
    move v1, v2

    .line 169
    goto :goto_0
.end method

.method static synthetic access$000(Landroid/util/SparseLongArray;IJ)V
    .locals 0
    .param p0, "x0"    # Landroid/util/SparseLongArray;
    .param p1, "x1"    # I
    .param p2, "x2"    # J

    .prologue
    .line 62
    invoke-static {p0, p1, p2, p3}, Lcom/androie/settings/deviceinfo/StorageMeasurement;->addValue(Landroid/util/SparseLongArray;IJ)V

    return-void
.end method

.method static synthetic access$1000()Ljava/util/Set;
    .locals 1

    .prologue
    .line 62
    sget-object v0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->sMeasureMediaTypes:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/android/internal/app/IMediaContainerService;Ljava/io/File;)J
    .locals 2
    .param p0, "x0"    # Lcom/android/internal/app/IMediaContainerService;
    .param p1, "x1"    # Ljava/io/File;

    .prologue
    .line 62
    invoke-static {p0, p1}, Lcom/androie/settings/deviceinfo/StorageMeasurement;->getDirectorySize(Lcom/android/internal/app/IMediaContainerService;Ljava/io/File;)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$1200(Lcom/androie/settings/deviceinfo/StorageMeasurement;Lcom/android/internal/app/IMediaContainerService;Ljava/io/File;)J
    .locals 2
    .param p0, "x0"    # Lcom/androie/settings/deviceinfo/StorageMeasurement;
    .param p1, "x1"    # Lcom/android/internal/app/IMediaContainerService;
    .param p2, "x2"    # Ljava/io/File;

    .prologue
    .line 62
    invoke-direct {p0, p1, p2}, Lcom/androie/settings/deviceinfo/StorageMeasurement;->measureMisc(Lcom/android/internal/app/IMediaContainerService;Ljava/io/File;)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$300(Lcom/androie/settings/deviceinfo/StorageMeasurement;Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementDetails;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/deviceinfo/StorageMeasurement;
    .param p1, "x1"    # Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementDetails;

    .prologue
    .line 62
    invoke-direct {p0, p1}, Lcom/androie/settings/deviceinfo/StorageMeasurement;->sendExactUpdate(Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementDetails;)V

    return-void
.end method

.method static synthetic access$400(Lcom/androie/settings/deviceinfo/StorageMeasurement;)Landroid/os/storage/StorageVolume;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/deviceinfo/StorageMeasurement;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mVolume:Landroid/os/storage/StorageVolume;

    return-object v0
.end method

.method static synthetic access$500(Lcom/androie/settings/deviceinfo/StorageMeasurement;)J
    .locals 2
    .param p0, "x0"    # Lcom/androie/settings/deviceinfo/StorageMeasurement;

    .prologue
    .line 62
    iget-wide v0, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mTotalSize:J

    return-wide v0
.end method

.method static synthetic access$502(Lcom/androie/settings/deviceinfo/StorageMeasurement;J)J
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/deviceinfo/StorageMeasurement;
    .param p1, "x1"    # J

    .prologue
    .line 62
    iput-wide p1, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mTotalSize:J

    return-wide p1
.end method

.method static synthetic access$600(Lcom/androie/settings/deviceinfo/StorageMeasurement;)J
    .locals 2
    .param p0, "x0"    # Lcom/androie/settings/deviceinfo/StorageMeasurement;

    .prologue
    .line 62
    iget-wide v0, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mAvailSize:J

    return-wide v0
.end method

.method static synthetic access$602(Lcom/androie/settings/deviceinfo/StorageMeasurement;J)J
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/deviceinfo/StorageMeasurement;
    .param p1, "x1"    # J

    .prologue
    .line 62
    iput-wide p1, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mAvailSize:J

    return-wide p1
.end method

.method static synthetic access$700(Lcom/androie/settings/deviceinfo/StorageMeasurement;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/deviceinfo/StorageMeasurement;

    .prologue
    .line 62
    invoke-direct {p0}, Lcom/androie/settings/deviceinfo/StorageMeasurement;->sendInternalApproximateUpdate()V

    return-void
.end method

.method static synthetic access$800(Lcom/androie/settings/deviceinfo/StorageMeasurement;)Z
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/deviceinfo/StorageMeasurement;

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mIsInternal:Z

    return v0
.end method

.method static synthetic access$900(Lcom/androie/settings/deviceinfo/StorageMeasurement;)Z
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/deviceinfo/StorageMeasurement;

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mIsPrimary:Z

    return v0
.end method

.method private static addValue(Landroid/util/SparseLongArray;IJ)V
    .locals 2
    .param p0, "array"    # Landroid/util/SparseLongArray;
    .param p1, "key"    # I
    .param p2, "value"    # J

    .prologue
    .line 545
    invoke-virtual {p0, p1}, Landroid/util/SparseLongArray;->get(I)J

    move-result-wide v0

    add-long/2addr v0, p2

    invoke-virtual {p0, p1, v0, v1}, Landroid/util/SparseLongArray;->put(IJ)V

    .line 546
    return-void
.end method

.method private static getDirectorySize(Lcom/android/internal/app/IMediaContainerService;Ljava/io/File;)J
    .locals 6
    .param p0, "imcs"    # Lcom/android/internal/app/IMediaContainerService;
    .param p1, "path"    # Ljava/io/File;

    .prologue
    .line 465
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v3}, Lcom/android/internal/app/IMediaContainerService;->calculateDirectorySize(Ljava/lang/String;)J

    move-result-wide v1

    .line 466
    .local v1, "size":J
    const-string v3, "StorageMeasurement"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getDirectorySize("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") returned "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 470
    .end local v1    # "size":J
    :goto_0
    return-wide v1

    .line 468
    :catch_0
    move-exception v0

    .line 469
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "StorageMeasurement"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not read memory from default container service for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 470
    const-wide/16 v1, 0x0

    goto :goto_0
.end method

.method public static getInstance(Landroid/content/Context;Landroid/os/storage/StorageVolume;)Lcom/androie/settings/deviceinfo/StorageMeasurement;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "volume"    # Landroid/os/storage/StorageVolume;

    .prologue
    .line 89
    sget-object v2, Lcom/androie/settings/deviceinfo/StorageMeasurement;->sInstances:Ljava/util/HashMap;

    monitor-enter v2

    .line 90
    :try_start_0
    sget-object v1, Lcom/androie/settings/deviceinfo/StorageMeasurement;->sInstances:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/deviceinfo/StorageMeasurement;

    .line 91
    .local v0, "value":Lcom/androie/settings/deviceinfo/StorageMeasurement;
    if-nez v0, :cond_0

    .line 92
    new-instance v0, Lcom/androie/settings/deviceinfo/StorageMeasurement;

    .end local v0    # "value":Lcom/androie/settings/deviceinfo/StorageMeasurement;
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/androie/settings/deviceinfo/StorageMeasurement;-><init>(Landroid/content/Context;Landroid/os/storage/StorageVolume;)V

    .line 93
    .restart local v0    # "value":Lcom/androie/settings/deviceinfo/StorageMeasurement;
    sget-object v1, Lcom/androie/settings/deviceinfo/StorageMeasurement;->sInstances:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    :cond_0
    monitor-exit v2

    return-object v0

    .line 96
    .end local v0    # "value":Lcom/androie/settings/deviceinfo/StorageMeasurement;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private measureMisc(Lcom/android/internal/app/IMediaContainerService;Ljava/io/File;)J
    .locals 25
    .param p1, "imcs"    # Lcom/android/internal/app/IMediaContainerService;
    .param p2, "dir"    # Ljava/io/File;

    .prologue
    .line 475
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mFileInfoForMisc:Ljava/util/List;

    .line 477
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v24

    .line 479
    .local v24, "p":Landroid/os/Parcel;
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Lcom/android/internal/app/IMediaContainerService;->listDirectory(Ljava/lang/String;)[B

    move-result-object v13

    .line 480
    .local v13, "bytes":[B
    const/4 v1, 0x0

    array-length v7, v13

    move-object/from16 v0, v24

    invoke-virtual {v0, v13, v1, v7}, Landroid/os/Parcel;->unmarshall([BII)V

    .line 481
    const/4 v1, 0x0

    move-object/from16 v0, v24

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->setDataPosition(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 488
    const-wide/16 v5, 0x0

    .line 489
    .local v5, "counter":J
    const-wide/16 v21, 0x0

    .line 491
    .local v21, "miscSize":J
    invoke-virtual/range {v24 .. v24}, Landroid/os/Parcel;->readInt()I

    move-result v14

    .line 492
    .local v14, "count":I
    const/16 v18, 0x0

    .local v18, "i":I
    :goto_0
    move/from16 v0, v18

    if-ge v0, v14, :cond_6

    .line 493
    invoke-virtual/range {v24 .. v24}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 494
    .local v2, "path":Ljava/lang/String;
    invoke-virtual/range {v24 .. v24}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v23

    .line 495
    .local v23, "name":Ljava/lang/String;
    invoke-virtual/range {v24 .. v24}, Landroid/os/Parcel;->readInt()I

    move-result v1

    const/4 v7, 0x1

    if-ne v1, v7, :cond_1

    const/16 v19, 0x1

    .line 496
    .local v19, "isDirectory":Z
    :goto_1
    invoke-virtual/range {v24 .. v24}, Landroid/os/Parcel;->readInt()I

    move-result v1

    const/4 v7, 0x1

    if-ne v1, v7, :cond_2

    const/16 v20, 0x1

    .line 497
    .local v20, "isFile":Z
    :goto_2
    if-eqz v20, :cond_3

    invoke-virtual/range {v24 .. v24}, Landroid/os/Parcel;->readLong()J

    move-result-wide v3

    .line 499
    .local v3, "fileSize":J
    :goto_3
    sget-object v1, Lcom/androie/settings/deviceinfo/StorageMeasurement;->sMeasureMediaTypes:Ljava/util/Set;

    move-object/from16 v0, v23

    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 492
    :cond_0
    :goto_4
    add-int/lit8 v18, v18, 0x1

    goto :goto_0

    .line 482
    .end local v2    # "path":Ljava/lang/String;
    .end local v3    # "fileSize":J
    .end local v5    # "counter":J
    .end local v13    # "bytes":[B
    .end local v14    # "count":I
    .end local v18    # "i":I
    .end local v19    # "isDirectory":Z
    .end local v20    # "isFile":Z
    .end local v21    # "miscSize":J
    .end local v23    # "name":Ljava/lang/String;
    :catch_0
    move-exception v17

    .line 483
    .local v17, "e":Ljava/lang/Exception;
    const-string v1, "StorageMeasurement"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Could not list directory from default container service for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p2

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v17

    invoke-static {v1, v7, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 484
    const-wide/16 v21, 0x0

    .line 518
    .end local v17    # "e":Ljava/lang/Exception;
    :goto_5
    return-wide v21

    .line 495
    .restart local v2    # "path":Ljava/lang/String;
    .restart local v5    # "counter":J
    .restart local v13    # "bytes":[B
    .restart local v14    # "count":I
    .restart local v18    # "i":I
    .restart local v21    # "miscSize":J
    .restart local v23    # "name":Ljava/lang/String;
    :cond_1
    const/16 v19, 0x0

    goto :goto_1

    .line 496
    .restart local v19    # "isDirectory":Z
    :cond_2
    const/16 v20, 0x0

    goto :goto_2

    .line 497
    .restart local v20    # "isFile":Z
    :cond_3
    const-wide/16 v3, 0x0

    goto :goto_3

    .line 503
    .restart local v3    # "fileSize":J
    :cond_4
    if-eqz v20, :cond_5

    .line 504
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mFileInfoForMisc:Ljava/util/List;

    new-instance v1, Lcom/androie/settings/deviceinfo/StorageMeasurement$FileInfo;

    const-wide/16 v11, 0x1

    add-long v15, v5, v11

    .end local v5    # "counter":J
    .local v15, "counter":J
    invoke-direct/range {v1 .. v6}, Lcom/androie/settings/deviceinfo/StorageMeasurement$FileInfo;-><init>(Ljava/lang/String;JJ)V

    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 505
    add-long v21, v21, v3

    move-wide v5, v15

    .end local v15    # "counter":J
    .restart local v5    # "counter":J
    goto :goto_4

    .line 506
    :cond_5
    if-eqz v19, :cond_0

    .line 507
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-static {v0, v1}, Lcom/androie/settings/deviceinfo/StorageMeasurement;->getDirectorySize(Lcom/android/internal/app/IMediaContainerService;Ljava/io/File;)J

    move-result-wide v9

    .line 508
    .local v9, "dirSize":J
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mFileInfoForMisc:Ljava/util/List;

    new-instance v7, Lcom/androie/settings/deviceinfo/StorageMeasurement$FileInfo;

    const-wide/16 v11, 0x1

    add-long v15, v5, v11

    .end local v5    # "counter":J
    .restart local v15    # "counter":J
    move-object v8, v2

    move-wide v11, v5

    invoke-direct/range {v7 .. v12}, Lcom/androie/settings/deviceinfo/StorageMeasurement$FileInfo;-><init>(Ljava/lang/String;JJ)V

    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 509
    add-long v21, v21, v9

    move-wide v5, v15

    .end local v15    # "counter":J
    .restart local v5    # "counter":J
    goto :goto_4

    .line 516
    .end local v2    # "path":Ljava/lang/String;
    .end local v3    # "fileSize":J
    .end local v9    # "dirSize":J
    .end local v19    # "isDirectory":Z
    .end local v20    # "isFile":Z
    .end local v23    # "name":Ljava/lang/String;
    :cond_6
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mFileInfoForMisc:Ljava/util/List;

    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    goto :goto_5
.end method

.method private sendExactUpdate(Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementDetails;)V
    .locals 3
    .param p1, "details"    # Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementDetails;

    .prologue
    .line 209
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mReceiver:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mReceiver:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;

    move-object v0, v1

    .line 210
    .local v0, "receiver":Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;
    :goto_0
    if-nez v0, :cond_2

    .line 211
    sget-boolean v1, Lcom/androie/settings/deviceinfo/StorageMeasurement;->LOGV:Z

    if-eqz v1, :cond_0

    .line 212
    const-string v1, "StorageMeasurement"

    const-string v2, "measurements dropped because receiver is null! wasted effort"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    :cond_0
    :goto_1
    return-void

    .line 209
    .end local v0    # "receiver":Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 216
    .restart local v0    # "receiver":Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;
    :cond_2
    invoke-interface {v0, p0, p1}, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;->updateDetails(Lcom/androie/settings/deviceinfo/StorageMeasurement;Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementDetails;)V

    goto :goto_1
.end method

.method private sendInternalApproximateUpdate()V
    .locals 6

    .prologue
    .line 201
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mReceiver:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mReceiver:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;

    move-object v0, v1

    .line 202
    .local v0, "receiver":Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;
    :goto_0
    if-nez v0, :cond_1

    .line 206
    :goto_1
    return-void

    .line 201
    .end local v0    # "receiver":Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 205
    .restart local v0    # "receiver":Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;
    :cond_1
    iget-wide v2, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mTotalSize:J

    iget-wide v4, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mAvailSize:J

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;->updateApproximate(Lcom/androie/settings/deviceinfo/StorageMeasurement;JJ)V

    goto :goto_1
.end method


# virtual methods
.method public cleanUp()V
    .locals 2

    .prologue
    .line 191
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mReceiver:Ljava/lang/ref/WeakReference;

    .line 192
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mHandler:Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementHandler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementHandler;->removeMessages(I)V

    .line 193
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mHandler:Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementHandler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementHandler;->sendEmptyMessage(I)Z

    .line 194
    return-void
.end method

.method public invalidate()V
    .locals 2

    .prologue
    .line 197
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mHandler:Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementHandler;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementHandler;->sendEmptyMessage(I)Z

    .line 198
    return-void
.end method

.method public measure()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 185
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mHandler:Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementHandler;

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementHandler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 186
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mHandler:Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementHandler;

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementHandler;->sendEmptyMessage(I)Z

    .line 188
    :cond_0
    return-void
.end method

.method public setReceiver(Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;)V
    .locals 1
    .param p1, "receiver"    # Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;

    .prologue
    .line 179
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mReceiver:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mReceiver:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    .line 180
    :cond_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->mReceiver:Ljava/lang/ref/WeakReference;

    .line 182
    :cond_1
    return-void
.end method
