.class public Lcom/androie/settings/extras/PartitionInfo;
.super Landroid/preference/PreferenceActivity;
.source "PartitionInfo.java"


# instance fields
.field private extfsIsMounted:Z

.field private mCachePartSize:Landroid/preference/Preference;

.field private mDataPartSize:Landroid/preference/Preference;

.field private mSDCardPartEXTSize:Landroid/preference/Preference;

.field private mSDCardPartFATSize:Landroid/preference/Preference;

.field private mSystemPartSize:Landroid/preference/Preference;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 61
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/androie/settings/extras/PartitionInfo;->extfsIsMounted:Z

    return-void
.end method

.method private ObtainFSPartSize(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p1, "PartitionPath"    # Ljava/lang/String;

    .prologue
    .line 101
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 102
    .local v4, "extraPath":Ljava/io/File;
    new-instance v5, Landroid/os/StatFs;

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 103
    .local v5, "extraStat":Landroid/os/StatFs;
    invoke-virtual {v5}, Landroid/os/StatFs;->getBlockSize()I

    move-result v7

    int-to-long v0, v7

    .line 104
    .local v0, "eBlockSize":J
    invoke-virtual {v5}, Landroid/os/StatFs;->getBlockCount()I

    move-result v7

    int-to-long v2, v7

    .line 105
    .local v2, "eTotalBlocks":J
    mul-long v7, v2, v0

    invoke-virtual {v5}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v9

    int-to-long v9, v9

    mul-long/2addr v9, v0

    sub-long/2addr v7, v9

    invoke-static {p0, v7, v8}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v6

    .line 106
    .local v6, "retstr":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lcom/androie/settings/extras/PartitionInfo;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f080379

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 107
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    mul-long v8, v2, v0

    invoke-static {p0, v8, v9}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 108
    return-object v6
.end method


# virtual methods
.method public fileExists(Ljava/lang/String;)Z
    .locals 2
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 112
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 113
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    return v1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 65
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 67
    const v2, 0x7f050028

    invoke-virtual {p0, v2}, Lcom/androie/settings/extras/PartitionInfo;->addPreferencesFromResource(I)V

    .line 69
    invoke-virtual {p0}, Lcom/androie/settings/extras/PartitionInfo;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    .line 71
    .local v1, "prefSet":Landroid/preference/PreferenceScreen;
    const-string v2, "system_part_info"

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/extras/PartitionInfo;->mSystemPartSize:Landroid/preference/Preference;

    .line 72
    const-string v2, "data_part_info"

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/extras/PartitionInfo;->mDataPartSize:Landroid/preference/Preference;

    .line 73
    const-string v2, "cache_part_info"

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/extras/PartitionInfo;->mCachePartSize:Landroid/preference/Preference;

    .line 74
    const-string v2, "sdcard_part_info_fat"

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/extras/PartitionInfo;->mSDCardPartFATSize:Landroid/preference/Preference;

    .line 75
    const-string v2, "sdcard_part_info_ext"

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/extras/PartitionInfo;->mSDCardPartEXTSize:Landroid/preference/Preference;

    .line 77
    const-string v2, "/dev/block/mmcblk0p2"

    invoke-virtual {p0, v2}, Lcom/androie/settings/extras/PartitionInfo;->fileExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 78
    const-string v2, "PartitionInfo"

    const-string v3, "sd: ext partition mounted"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/androie/settings/extras/PartitionInfo;->extfsIsMounted:Z

    .line 84
    :goto_0
    :try_start_0
    iget-object v2, p0, Lcom/androie/settings/extras/PartitionInfo;->mSystemPartSize:Landroid/preference/Preference;

    const-string v3, "/system"

    invoke-direct {p0, v3}, Lcom/androie/settings/extras/PartitionInfo;->ObtainFSPartSize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 85
    iget-object v2, p0, Lcom/androie/settings/extras/PartitionInfo;->mDataPartSize:Landroid/preference/Preference;

    const-string v3, "/data"

    invoke-direct {p0, v3}, Lcom/androie/settings/extras/PartitionInfo;->ObtainFSPartSize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 86
    iget-object v2, p0, Lcom/androie/settings/extras/PartitionInfo;->mCachePartSize:Landroid/preference/Preference;

    const-string v3, "/cache"

    invoke-direct {p0, v3}, Lcom/androie/settings/extras/PartitionInfo;->ObtainFSPartSize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 87
    iget-object v2, p0, Lcom/androie/settings/extras/PartitionInfo;->mSDCardPartFATSize:Landroid/preference/Preference;

    const-string v3, "/storage/sdcard0"

    invoke-direct {p0, v3}, Lcom/androie/settings/extras/PartitionInfo;->ObtainFSPartSize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 89
    iget-boolean v2, p0, Lcom/androie/settings/extras/PartitionInfo;->extfsIsMounted:Z

    if-eqz v2, :cond_1

    .line 90
    iget-object v2, p0, Lcom/androie/settings/extras/PartitionInfo;->mSDCardPartEXTSize:Landroid/preference/Preference;

    const-string v3, "/sd-ext"

    invoke-direct {p0, v3}, Lcom/androie/settings/extras/PartitionInfo;->ObtainFSPartSize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    :goto_1
    return-void

    .line 81
    :cond_0
    const-string v2, "PartitionInfo"

    const-string v3, "sd: ext partition not mounted"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 92
    :cond_1
    :try_start_1
    iget-object v2, p0, Lcom/androie/settings/extras/PartitionInfo;->mSDCardPartEXTSize:Landroid/preference/Preference;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setEnabled(Z)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 94
    :catch_0
    move-exception v0

    .line 95
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_1
.end method
