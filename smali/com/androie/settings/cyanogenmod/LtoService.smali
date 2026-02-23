.class public Lcom/androie/settings/cyanogenmod/LtoService;
.super Landroid/app/Service;
.source "LtoService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/cyanogenmod/LtoService$LtoDownloadTask;
    }
.end annotation


# instance fields
.field private mTask:Lcom/androie/settings/cyanogenmod/LtoService$LtoDownloadTask;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 142
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/cyanogenmod/LtoService;J)Landroid/app/PendingIntent;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/LtoService;
    .param p1, "x1"    # J

    .prologue
    .line 55
    invoke-direct {p0, p1, p2}, Lcom/androie/settings/cyanogenmod/LtoService;->scheduleNextDownload(J)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/androie/settings/cyanogenmod/LtoService;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/LtoService;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/LtoService;->notifyNewGpsData()V

    return-void
.end method

.method static synthetic access$200(Lcom/androie/settings/cyanogenmod/LtoService;)J
    .locals 2
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/LtoService;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/LtoService;->getLastDownload()J

    move-result-wide v0

    return-wide v0
.end method

.method private getLastDownload()J
    .locals 4

    .prologue
    .line 310
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 311
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "lto_last_download"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    return-wide v1
.end method

.method private notifyNewGpsData()V
    .locals 2

    .prologue
    .line 294
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.cyanogenmod.actions.NEW_GPS_DATA"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 295
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/androie/settings/cyanogenmod/LtoService;->sendStickyBroadcast(Landroid/content/Intent;)V

    .line 296
    return-void
.end method

.method private scheduleNextDownload(J)Landroid/app/PendingIntent;
    .locals 5

    .prologue
    .line 299
    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Lcom/androie/settings/cyanogenmod/LtoService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 300
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/androie/settings/cyanogenmod/LtoService;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 301
    const/4 v2, 0x0

    const/high16 v3, 0x48000000    # 131072.0f

    invoke-static {p0, v2, v1, v3}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 304
    invoke-static {}, Lorg/cyanogenmod/hardware/LongTermOrbits;->getDownloadInterval()J

    move-result-wide v2

    add-long/2addr v2, p1

    .line 305
    const/4 v4, 0x1

    invoke-virtual {v0, v4, v2, v3, v1}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 306
    return-object v1
.end method

.method private shouldDownload()Z
    .locals 15

    .prologue
    const/4 v10, 0x0

    const/4 v11, 0x1

    .line 108
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v8

    .line 109
    .local v8, "prefs":Landroid/content/SharedPreferences;
    const-string v12, "connectivity"

    invoke-virtual {p0, v12}, Lcom/androie/settings/cyanogenmod/LtoService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 110
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v3

    .line 112
    .local v3, "info":Landroid/net/NetworkInfo;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v12

    if-nez v12, :cond_2

    .line 113
    :cond_0
    const-string v12, "LtoService"

    const-string v13, "No network connection is available for LTO download"

    invoke-static {v12, v13}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 127
    .local v6, "now":J
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/LtoService;->getLastDownload()J

    move-result-wide v4

    .line 128
    .local v4, "lastDownload":J
    invoke-static {}, Lorg/cyanogenmod/hardware/LongTermOrbits;->getDownloadInterval()J

    move-result-wide v12

    add-long v1, v4, v12

    .line 131
    .local v1, "due":J
    const-string v12, "LtoService"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Now "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " due "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "("

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    new-instance v14, Ljava/util/Date;

    invoke-direct {v14, v1, v2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ")"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    const-wide/16 v12, 0x0

    cmp-long v12, v4, v12

    if-eqz v12, :cond_3

    cmp-long v12, v6, v1

    if-gez v12, :cond_3

    .line 135
    const-string v11, "LtoService"

    const-string v12, "LTO download is not due yet"

    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    .end local v1    # "due":J
    .end local v4    # "lastDownload":J
    .end local v6    # "now":J
    :goto_0
    return v10

    .line 115
    :cond_2
    const-string v12, "gps_download_data_wifi_only"

    invoke-interface {v8, v12, v11}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v9

    .line 117
    .local v9, "wifiOnly":Z
    if-eqz v9, :cond_1

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getType()I

    move-result v12

    if-eq v12, v11, :cond_1

    .line 119
    const-string v11, "LtoService"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Active network is of type "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", but Wifi only was selected"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .end local v9    # "wifiOnly":Z
    .restart local v1    # "due":J
    .restart local v4    # "lastDownload":J
    .restart local v6    # "now":J
    :cond_3
    move v10, v11

    .line 139
    goto :goto_0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 96
    const/4 v0, 0x0

    return-object v0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LtoService;->mTask:Lcom/androie/settings/cyanogenmod/LtoService$LtoDownloadTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LtoService;->mTask:Lcom/androie/settings/cyanogenmod/LtoService$LtoDownloadTask;

    invoke-virtual {v0}, Lcom/androie/settings/cyanogenmod/LtoService$LtoDownloadTask;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask$Status;->FINISHED:Landroid/os/AsyncTask$Status;

    if-eq v0, v1, :cond_0

    .line 102
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LtoService;->mTask:Lcom/androie/settings/cyanogenmod/LtoService$LtoDownloadTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/androie/settings/cyanogenmod/LtoService$LtoDownloadTask;->cancel(Z)Z

    .line 103
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/LtoService;->mTask:Lcom/androie/settings/cyanogenmod/LtoService$LtoDownloadTask;

    .line 105
    :cond_0
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    const/4 v2, 0x3

    const/4 v1, 0x2

    const/4 v5, 0x0

    .line 69
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 70
    .local v0, "prefs":Landroid/content/SharedPreferences;
    invoke-static {}, Lorg/cyanogenmod/hardware/LongTermOrbits;->isSupported()Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "location_toggle"

    invoke-interface {v0, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 72
    const-string v2, "LtoService"

    const-string v3, "LTO is not supported by this device"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    :goto_0
    return v1

    .line 76
    :cond_0
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LtoService;->mTask:Lcom/androie/settings/cyanogenmod/LtoService$LtoDownloadTask;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LtoService;->mTask:Lcom/androie/settings/cyanogenmod/LtoService$LtoDownloadTask;

    invoke-virtual {v3}, Lcom/androie/settings/cyanogenmod/LtoService$LtoDownloadTask;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v3

    sget-object v4, Landroid/os/AsyncTask$Status;->FINISHED:Landroid/os/AsyncTask$Status;

    if-eq v3, v4, :cond_1

    .line 77
    const-string v1, "LtoService"

    const-string v3, "LTO download is still active, not starting new download"

    invoke-static {v1, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v2

    .line 78
    goto :goto_0

    .line 81
    :cond_1
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/LtoService;->shouldDownload()Z

    move-result v3

    if-nez v3, :cond_2

    .line 82
    const-string v2, "LtoService"

    const-string v3, "Service started, but shouldn\'t download ... stopping"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/LtoService;->stopSelf()V

    goto :goto_0

    .line 87
    :cond_2
    new-instance v1, Lcom/androie/settings/cyanogenmod/LtoService$LtoDownloadTask;

    invoke-static {}, Lorg/cyanogenmod/hardware/LongTermOrbits;->getSourceLocation()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lorg/cyanogenmod/hardware/LongTermOrbits;->getDestinationLocation()Ljava/io/File;

    move-result-object v4

    invoke-direct {v1, p0, v3, v4}, Lcom/androie/settings/cyanogenmod/LtoService$LtoDownloadTask;-><init>(Lcom/androie/settings/cyanogenmod/LtoService;Ljava/lang/String;Ljava/io/File;)V

    iput-object v1, p0, Lcom/androie/settings/cyanogenmod/LtoService;->mTask:Lcom/androie/settings/cyanogenmod/LtoService$LtoDownloadTask;

    .line 89
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LtoService;->mTask:Lcom/androie/settings/cyanogenmod/LtoService$LtoDownloadTask;

    new-array v3, v5, [Ljava/lang/Void;

    invoke-virtual {v1, v3}, Lcom/androie/settings/cyanogenmod/LtoService$LtoDownloadTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move v1, v2

    .line 91
    goto :goto_0
.end method
