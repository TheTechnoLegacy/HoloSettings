.class public Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;
.super Landroid/preference/PreferenceCategory;
.source "StorageVolumePreferenceCategory.java"

# interfaces
.implements Landroid/media/MediaScannerConnection$OnScanCompletedListener;
.implements Lcom/androie/settings/deviceinfo/UsageBarPreference$OnRequestMediaRescanListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory$PreferenceHeader;
    }
.end annotation


# instance fields
.field private mFormatPreference:Landroid/preference/Preference;

.field private final mIsInternal:Z

.field private final mIsPrimary:Z

.field private mItemApps:Lcom/androie/settings/deviceinfo/StorageItemPreference;

.field private mItemAvailable:Lcom/androie/settings/deviceinfo/StorageItemPreference;

.field private mItemCache:Lcom/androie/settings/deviceinfo/StorageItemPreference;

.field private mItemDcim:Lcom/androie/settings/deviceinfo/StorageItemPreference;

.field private mItemDownloads:Lcom/androie/settings/deviceinfo/StorageItemPreference;

.field private mItemMisc:Lcom/androie/settings/deviceinfo/StorageItemPreference;

.field private mItemMusic:Lcom/androie/settings/deviceinfo/StorageItemPreference;

.field private mItemTotal:Lcom/androie/settings/deviceinfo/StorageItemPreference;

.field private mItemUsers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/androie/settings/deviceinfo/StorageItemPreference;",
            ">;"
        }
    .end annotation
.end field

.field private final mMeasure:Lcom/androie/settings/deviceinfo/StorageMeasurement;

.field private mMountTogglePreference:Landroid/preference/Preference;

.field private mReceiver:Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;

.field private final mResources:Landroid/content/res/Resources;

.field private mStorageLow:Landroid/preference/Preference;

.field private final mStorageManager:Landroid/os/storage/StorageManager;

.field private mTotalSize:J

.field private mUpdateHandler:Landroid/os/Handler;

.field private mUsageBarPreference:Lcom/androie/settings/deviceinfo/UsageBarPreference;

.field private mUsbConnected:Z

.field private mUsbFunction:Ljava/lang/String;

.field private final mUserManager:Landroid/os/UserManager;

.field private final mVolume:Landroid/os/storage/StorageVolume;


# direct methods
.method private constructor <init>(Landroid/content/Context;Landroid/os/storage/StorageVolume;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "volume"    # Landroid/os/storage/StorageVolume;

    .prologue
    const/4 v1, 0x0

    .line 136
    invoke-direct {p0, p1}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    .line 91
    invoke-static {}, Lcom/google/android/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemUsers:Ljava/util/List;

    .line 101
    new-instance v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory$1;

    invoke-direct {v0, p0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory$1;-><init>(Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;)V

    iput-object v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUpdateHandler:Landroid/os/Handler;

    .line 429
    new-instance v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory$2;

    invoke-direct {v0, p0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory$2;-><init>(Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;)V

    iput-object v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mReceiver:Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;

    .line 138
    iput-object p2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    .line 139
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mIsInternal:Z

    .line 140
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    invoke-virtual {v0}, Landroid/os/storage/StorageVolume;->isPrimary()Z

    move-result v1

    :cond_0
    iput-boolean v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mIsPrimary:Z

    .line 141
    invoke-static {p1, p2}, Lcom/androie/settings/deviceinfo/StorageMeasurement;->getInstance(Landroid/content/Context;Landroid/os/storage/StorageVolume;)Lcom/androie/settings/deviceinfo/StorageMeasurement;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMeasure:Lcom/androie/settings/deviceinfo/StorageMeasurement;

    .line 143
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    .line 144
    invoke-static {p1}, Landroid/os/storage/StorageManager;->from(Landroid/content/Context;)Landroid/os/storage/StorageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageManager:Landroid/os/storage/StorageManager;

    .line 145
    const-string v0, "user"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/UserManager;

    iput-object v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUserManager:Landroid/os/UserManager;

    .line 147
    if-eqz p2, :cond_2

    invoke-virtual {p2, p1}, Landroid/os/storage/StorageVolume;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {p0, v0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->setTitle(Ljava/lang/CharSequence;)V

    .line 149
    return-void

    :cond_1
    move v0, v1

    .line 139
    goto :goto_0

    .line 147
    :cond_2
    const v0, 0x7f08078a

    invoke-virtual {p1, v0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_1
.end method

.method static synthetic access$000(Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUpdateHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$100(Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;)Lcom/androie/settings/deviceinfo/UsageBarPreference;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/androie/settings/deviceinfo/UsageBarPreference;

    return-object v0
.end method

.method public static buildForInternal(Landroid/content/Context;)Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 124
    new-instance v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;-><init>(Landroid/content/Context;Landroid/os/storage/StorageVolume;)V

    return-object v0
.end method

.method public static buildForPhysical(Landroid/content/Context;Landroid/os/storage/StorageVolume;)Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "volume"    # Landroid/os/storage/StorageVolume;

    .prologue
    .line 132
    new-instance v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;

    invoke-direct {v0, p0, p1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;-><init>(Landroid/content/Context;Landroid/os/storage/StorageVolume;)V

    return-object v0
.end method

.method private buildItem(II)Lcom/androie/settings/deviceinfo/StorageItemPreference;
    .locals 2
    .param p1, "titleRes"    # I
    .param p2, "colorRes"    # I

    .prologue
    .line 152
    new-instance v0, Lcom/androie/settings/deviceinfo/StorageItemPreference;

    invoke-virtual {p0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lcom/androie/settings/deviceinfo/StorageItemPreference;-><init>(Landroid/content/Context;II)V

    return-object v0
.end method

.method private formatSize(J)Ljava/lang/String;
    .locals 1
    .param p1, "size"    # J

    .prologue
    .line 426
    invoke-virtual {p0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1, p2}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getUsersExcluding(Landroid/content/pm/UserInfo;)Ljava/util/List;
    .locals 4
    .param p1, "excluding"    # Landroid/content/pm/UserInfo;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/pm/UserInfo;",
            ")",
            "Ljava/util/List",
            "<",
            "Landroid/content/pm/UserInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 502
    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v2}, Landroid/os/UserManager;->getUsers()Ljava/util/List;

    move-result-object v1

    .line 503
    .local v1, "users":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 504
    .local v0, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/content/pm/UserInfo;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 505
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/UserInfo;

    iget v2, v2, Landroid/content/pm/UserInfo;->id:I

    iget v3, p1, Landroid/content/pm/UserInfo;->id:I

    if-ne v2, v3, :cond_0

    .line 506
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 509
    :cond_1
    return-object v1
.end method

.method private measure()V
    .locals 1

    .prologue
    .line 394
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMeasure:Lcom/androie/settings/deviceinfo/StorageMeasurement;

    invoke-virtual {v0}, Lcom/androie/settings/deviceinfo/StorageMeasurement;->invalidate()V

    .line 395
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMeasure:Lcom/androie/settings/deviceinfo/StorageMeasurement;

    invoke-virtual {v0}, Lcom/androie/settings/deviceinfo/StorageMeasurement;->measure()V

    .line 396
    return-void
.end method

.method private static varargs totalValues(Ljava/util/HashMap;[Ljava/lang/String;)J
    .locals 8
    .param p1, "keys"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;[",
            "Ljava/lang/String;",
            ")J"
        }
    .end annotation

    .prologue
    .line 339
    .local p0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Long;>;"
    const-wide/16 v4, 0x0

    .line 340
    .local v4, "total":J
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v3, :cond_1

    aget-object v2, v0, v1

    .line 341
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {p0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 342
    invoke-virtual {p0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    add-long/2addr v4, v6

    .line 340
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 345
    .end local v2    # "key":Ljava/lang/String;
    :cond_1
    return-wide v4
.end method

.method private updatePreference(Lcom/androie/settings/deviceinfo/StorageItemPreference;J)V
    .locals 5
    .param p1, "pref"    # Lcom/androie/settings/deviceinfo/StorageItemPreference;
    .param p2, "size"    # J

    .prologue
    .line 384
    const-wide/16 v1, 0x0

    cmp-long v1, p2, v1

    if-lez v1, :cond_0

    .line 385
    invoke-direct {p0, p2, p3}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->formatSize(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/androie/settings/deviceinfo/StorageItemPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 386
    invoke-virtual {p1}, Lcom/androie/settings/deviceinfo/StorageItemPreference;->getOrder()I

    move-result v0

    .line 387
    .local v0, "order":I
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/androie/settings/deviceinfo/UsageBarPreference;

    long-to-float v2, p2

    iget-wide v3, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mTotalSize:J

    long-to-float v3, v3

    div-float/2addr v2, v3

    iget v3, p1, Lcom/androie/settings/deviceinfo/StorageItemPreference;->color:I

    invoke-virtual {v1, v0, v2, v3}, Lcom/androie/settings/deviceinfo/UsageBarPreference;->addEntry(IFI)V

    .line 391
    .end local v0    # "order":I
    :goto_0
    return-void

    .line 389
    :cond_0
    invoke-virtual {p0, p1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_0
.end method

.method private updatePreferencesFromState()V
    .locals 7

    .prologue
    const v6, 0x7f080693

    const v3, 0x7f08068d

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 264
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    if-nez v1, :cond_1

    .line 321
    :cond_0
    :goto_0
    return-void

    .line 266
    :cond_1
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    invoke-virtual {v1, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 268
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageManager:Landroid/os/storage/StorageManager;

    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    invoke-virtual {v2}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/storage/StorageManager;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 270
    .local v0, "state":Ljava/lang/String;
    const-string v1, "mounted_ro"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 271
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemAvailable:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    const v2, 0x7f080680

    invoke-virtual {v1, v2}, Lcom/androie/settings/deviceinfo/StorageItemPreference;->setTitle(I)V

    .line 272
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    if-eqz v1, :cond_2

    .line 273
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    invoke-virtual {p0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 279
    :cond_2
    :goto_1
    const-string v1, "mounted"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "mounted_ro"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 281
    :cond_3
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    invoke-virtual {v1, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 282
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    const v3, 0x7f08068a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 283
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    const v3, 0x7f08068b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 304
    :cond_4
    :goto_2
    iget-boolean v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsbConnected:Z

    if-eqz v1, :cond_c

    const-string v1, "mtp"

    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsbFunction:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, "ptp"

    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsbFunction:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 306
    :cond_5
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    invoke-virtual {v1, v5}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 307
    const-string v1, "mounted"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "mounted_ro"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 309
    :cond_6
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 313
    :cond_7
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    if-eqz v1, :cond_0

    .line 314
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    invoke-virtual {v1, v5}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 315
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 276
    :cond_8
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemAvailable:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    const v2, 0x7f08067f

    invoke-virtual {v1, v2}, Lcom/androie/settings/deviceinfo/StorageItemPreference;->setTitle(I)V

    goto/16 :goto_1

    .line 285
    :cond_9
    const-string v1, "unmounted"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    const-string v1, "nofs"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    const-string v1, "unmountable"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 287
    :cond_a
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    invoke-virtual {v1, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 288
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 289
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    const v3, 0x7f08068e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 296
    :goto_3
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/androie/settings/deviceinfo/UsageBarPreference;

    invoke-virtual {p0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 297
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemTotal:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    invoke-virtual {p0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 298
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemAvailable:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    invoke-virtual {p0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 299
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    if-eqz v1, :cond_4

    .line 300
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    invoke-virtual {p0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_2

    .line 291
    :cond_b
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    invoke-virtual {v1, v5}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 292
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 293
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    const v3, 0x7f08068c

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_3

    .line 317
    :cond_c
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    if-eqz v1, :cond_0

    .line 318
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    invoke-virtual {v1, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 319
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    const v3, 0x7f080690

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto/16 :goto_0
.end method


# virtual methods
.method public getStorageVolume()Landroid/os/storage/StorageVolume;
    .locals 1

    .prologue
    .line 259
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    return-object v0
.end method

.method public init()V
    .locals 23

    .prologue
    .line 156
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->getContext()Landroid/content/Context;

    move-result-object v7

    .line 160
    .local v7, "context":Landroid/content/Context;
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Landroid/app/IActivityManager;->getCurrentUser()Landroid/content/pm/UserInfo;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v10

    .line 165
    .local v10, "currentUser":Landroid/content/pm/UserInfo;
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->getUsersExcluding(Landroid/content/pm/UserInfo;)Ljava/util/List;

    move-result-object v15

    .line 166
    .local v15, "otherUsers":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    move-object/from16 v20, v0

    if-nez v20, :cond_5

    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v20

    if-lez v20, :cond_5

    const/16 v18, 0x1

    .line 168
    .local v18, "showUsers":Z
    :goto_0
    const/4 v5, 0x0

    .line 169
    .local v5, "allowMediaScan":Z
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mIsInternal:Z

    move/from16 v20, v0

    if-eqz v20, :cond_0

    invoke-static {}, Landroid/os/Environment;->isExternalStorageEmulated()Z

    move-result v20

    if-nez v20, :cond_1

    :cond_0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mIsPrimary:Z

    move/from16 v20, v0

    if-eqz v20, :cond_6

    .line 170
    :cond_1
    const/4 v5, 0x1

    .line 175
    :cond_2
    :goto_1
    new-instance v20, Lcom/androie/settings/deviceinfo/UsageBarPreference;

    move-object/from16 v0, v20

    invoke-direct {v0, v7}, Lcom/androie/settings/deviceinfo/UsageBarPreference;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/androie/settings/deviceinfo/UsageBarPreference;

    .line 176
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/androie/settings/deviceinfo/UsageBarPreference;

    move-object/from16 v20, v0

    const/16 v21, -0x2

    invoke-virtual/range {v20 .. v21}, Lcom/androie/settings/deviceinfo/UsageBarPreference;->setOrder(I)V

    .line 177
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/androie/settings/deviceinfo/UsageBarPreference;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/UsageBarPreference;->setOnRequestMediaRescanListener(Lcom/androie/settings/deviceinfo/UsageBarPreference$OnRequestMediaRescanListener;)V

    .line 178
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/androie/settings/deviceinfo/UsageBarPreference;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Lcom/androie/settings/deviceinfo/UsageBarPreference;->setAllowMediaScan(Z)V

    .line 179
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/androie/settings/deviceinfo/UsageBarPreference;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 181
    const v20, 0x7f080681

    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->buildItem(II)Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemTotal:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    .line 182
    const v20, 0x7f08067f

    const v21, 0x7f0a000b

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->buildItem(II)Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemAvailable:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    .line 183
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemTotal:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 184
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemAvailable:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 186
    const v20, 0x7f080683

    const v21, 0x7f0a000c

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->buildItem(II)Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemApps:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    .line 187
    const v20, 0x7f080686

    const v21, 0x7f0a000e

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->buildItem(II)Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemDcim:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    .line 188
    const v20, 0x7f080687

    const v21, 0x7f0a000f

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->buildItem(II)Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemMusic:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    .line 189
    const v20, 0x7f080685

    const v21, 0x7f0a000d

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->buildItem(II)Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemDownloads:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    .line 190
    const v20, 0x7f080689

    const v21, 0x7f0a0010

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->buildItem(II)Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemCache:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    .line 191
    const v20, 0x7f080688

    const v21, 0x7f0a0011

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->buildItem(II)Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemMisc:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    .line 193
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemCache:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v20, v0

    const-string v21, "cache"

    invoke-virtual/range {v20 .. v21}, Lcom/androie/settings/deviceinfo/StorageItemPreference;->setKey(Ljava/lang/String;)V

    .line 195
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    move-object/from16 v20, v0

    if-eqz v20, :cond_3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/os/storage/StorageVolume;->isPrimary()Z

    move-result v20

    if-eqz v20, :cond_7

    :cond_3
    const/16 v17, 0x1

    .line 196
    .local v17, "showDetails":Z
    :goto_2
    if-eqz v17, :cond_9

    .line 197
    if-eqz v18, :cond_4

    .line 198
    new-instance v20, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory$PreferenceHeader;

    iget-object v0, v10, Landroid/content/pm/UserInfo;->name:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v7, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory$PreferenceHeader;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 201
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemApps:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 202
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemDcim:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 203
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemMusic:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 204
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemDownloads:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 205
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemCache:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 206
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemMisc:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 208
    if-eqz v18, :cond_9

    .line 209
    new-instance v20, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory$PreferenceHeader;

    const v21, 0x7f0806a5

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-direct {v0, v7, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory$PreferenceHeader;-><init>(Landroid/content/Context;I)V

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 211
    const/4 v8, 0x0

    .line 212
    .local v8, "count":I
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_9

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/content/pm/UserInfo;

    .line 213
    .local v13, "info":Landroid/content/pm/UserInfo;
    add-int/lit8 v9, v8, 0x1

    .end local v8    # "count":I
    .local v9, "count":I
    rem-int/lit8 v20, v8, 0x2

    if-nez v20, :cond_8

    const v6, 0x7f0a0012

    .line 215
    .local v6, "colorRes":I
    :goto_4
    new-instance v19, Lcom/androie/settings/deviceinfo/StorageItemPreference;

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->getContext()Landroid/content/Context;

    move-result-object v20

    iget-object v0, v13, Landroid/content/pm/UserInfo;->name:Ljava/lang/String;

    move-object/from16 v21, v0

    iget v0, v13, Landroid/content/pm/UserInfo;->id:I

    move/from16 v22, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    move/from16 v3, v22

    invoke-direct {v0, v1, v2, v6, v3}, Lcom/androie/settings/deviceinfo/StorageItemPreference;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;II)V

    .line 217
    .local v19, "userPref":Lcom/androie/settings/deviceinfo/StorageItemPreference;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemUsers:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 218
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    move v8, v9

    .line 219
    .end local v9    # "count":I
    .restart local v8    # "count":I
    goto :goto_3

    .line 161
    .end local v5    # "allowMediaScan":Z
    .end local v6    # "colorRes":I
    .end local v8    # "count":I
    .end local v10    # "currentUser":Landroid/content/pm/UserInfo;
    .end local v12    # "i$":Ljava/util/Iterator;
    .end local v13    # "info":Landroid/content/pm/UserInfo;
    .end local v15    # "otherUsers":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    .end local v17    # "showDetails":Z
    .end local v18    # "showUsers":Z
    .end local v19    # "userPref":Lcom/androie/settings/deviceinfo/StorageItemPreference;
    :catch_0
    move-exception v11

    .line 162
    .local v11, "e":Landroid/os/RemoteException;
    new-instance v20, Ljava/lang/RuntimeException;

    const-string v21, "Failed to get current user"

    invoke-direct/range {v20 .. v21}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 166
    .end local v11    # "e":Landroid/os/RemoteException;
    .restart local v10    # "currentUser":Landroid/content/pm/UserInfo;
    .restart local v15    # "otherUsers":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    :cond_5
    const/16 v18, 0x0

    goto/16 :goto_0

    .line 171
    .restart local v5    # "allowMediaScan":Z
    .restart local v18    # "showUsers":Z
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    move-object/from16 v20, v0

    if-eqz v20, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/os/storage/StorageVolume;->isRemovable()Z

    move-result v20

    if-nez v20, :cond_2

    .line 172
    const/4 v5, 0x1

    goto/16 :goto_1

    .line 195
    :cond_7
    const/16 v17, 0x0

    goto/16 :goto_2

    .line 213
    .restart local v9    # "count":I
    .restart local v12    # "i$":Ljava/util/Iterator;
    .restart local v13    # "info":Landroid/content/pm/UserInfo;
    .restart local v17    # "showDetails":Z
    :cond_8
    const v6, 0x7f0a0013

    goto :goto_4

    .line 223
    .end local v9    # "count":I
    .end local v12    # "i$":Ljava/util/Iterator;
    .end local v13    # "info":Landroid/content/pm/UserInfo;
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    move-object/from16 v20, v0

    if-eqz v20, :cond_d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/os/storage/StorageVolume;->isRemovable()Z

    move-result v14

    .line 225
    .local v14, "isRemovable":Z
    :goto_5
    new-instance v20, Landroid/preference/Preference;

    move-object/from16 v0, v20

    invoke-direct {v0, v7}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    .line 226
    if-eqz v14, :cond_a

    .line 227
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    move-object/from16 v20, v0

    const v21, 0x7f08068a

    invoke-virtual/range {v20 .. v21}, Landroid/preference/Preference;->setTitle(I)V

    .line 228
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    move-object/from16 v20, v0

    const v21, 0x7f08068b

    invoke-virtual/range {v20 .. v21}, Landroid/preference/Preference;->setSummary(I)V

    .line 229
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 234
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    move-object/from16 v20, v0

    if-eqz v20, :cond_e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/os/storage/StorageVolume;->isPrimary()Z

    move-result v4

    .line 235
    .local v4, "allowFormat":Z
    :goto_6
    if-eqz v4, :cond_b

    .line 236
    new-instance v20, Landroid/preference/Preference;

    move-object/from16 v0, v20

    invoke-direct {v0, v7}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    .line 237
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    move-object/from16 v20, v0

    const v21, 0x7f08068f

    invoke-virtual/range {v20 .. v21}, Landroid/preference/Preference;->setTitle(I)V

    .line 238
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    move-object/from16 v20, v0

    const v21, 0x7f080690

    invoke-virtual/range {v20 .. v21}, Landroid/preference/Preference;->setSummary(I)V

    .line 239
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 242
    :cond_b
    invoke-static {}, Landroid/app/ActivityThread;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object v16

    .line 244
    .local v16, "pm":Landroid/content/pm/IPackageManager;
    :try_start_1
    invoke-interface/range {v16 .. v16}, Landroid/content/pm/IPackageManager;->isStorageLow()Z

    move-result v20

    if-eqz v20, :cond_f

    .line 245
    new-instance v20, Landroid/preference/Preference;

    move-object/from16 v0, v20

    invoke-direct {v0, v7}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageLow:Landroid/preference/Preference;

    .line 246
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageLow:Landroid/preference/Preference;

    move-object/from16 v20, v0

    const/16 v21, -0x1

    invoke-virtual/range {v20 .. v21}, Landroid/preference/Preference;->setOrder(I)V

    .line 247
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageLow:Landroid/preference/Preference;

    move-object/from16 v20, v0

    const v21, 0x7f08069b

    invoke-virtual/range {v20 .. v21}, Landroid/preference/Preference;->setTitle(I)V

    .line 248
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageLow:Landroid/preference/Preference;

    move-object/from16 v20, v0

    const v21, 0x7f08069c

    invoke-virtual/range {v20 .. v21}, Landroid/preference/Preference;->setSummary(I)V

    .line 249
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageLow:Landroid/preference/Preference;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 256
    :cond_c
    :goto_7
    return-void

    .line 223
    .end local v4    # "allowFormat":Z
    .end local v14    # "isRemovable":Z
    .end local v16    # "pm":Landroid/content/pm/IPackageManager;
    :cond_d
    const/4 v14, 0x0

    goto/16 :goto_5

    .line 234
    .restart local v14    # "isRemovable":Z
    :cond_e
    const/4 v4, 0x0

    goto :goto_6

    .line 250
    .restart local v4    # "allowFormat":Z
    .restart local v16    # "pm":Landroid/content/pm/IPackageManager;
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageLow:Landroid/preference/Preference;

    move-object/from16 v20, v0

    if-eqz v20, :cond_c

    .line 251
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageLow:Landroid/preference/Preference;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 252
    const/16 v20, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageLow:Landroid/preference/Preference;
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_7

    .line 254
    :catch_1
    move-exception v20

    goto :goto_7
.end method

.method public intentForClick(Landroid/preference/Preference;)Landroid/content/Intent;
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 447
    const/4 v0, 0x0

    .line 452
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    .line 453
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    if-ne p1, v1, :cond_1

    .line 454
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 455
    invoke-virtual {p0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/androie/settings/MediaFormat;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 456
    const-string v1, "storage_volume"

    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 478
    :cond_0
    :goto_0
    return-object v0

    .line 457
    :cond_1
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemApps:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    if-ne p1, v1, :cond_2

    .line 458
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MANAGE_PACKAGE_STORAGE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 459
    invoke-virtual {p0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/androie/settings/Settings$ManageApplicationsActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    goto :goto_0

    .line 461
    :cond_2
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemDownloads:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    if-ne p1, v1, :cond_3

    .line 462
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW_DOWNLOADS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.app.DownloadManager.extra_sortBySize"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    goto :goto_0

    .line 464
    :cond_3
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemMusic:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    if-ne p1, v1, :cond_4

    .line 465
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GET_CONTENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 466
    const-string v1, "audio/mp3"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 467
    :cond_4
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemDcim:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    if-ne p1, v1, :cond_5

    .line 468
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 469
    const-string v1, "android.intent.extra.LOCAL_ONLY"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 471
    const-string v1, "vnd.android.cursor.dir/image"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 472
    :cond_5
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemMisc:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    if-ne p1, v1, :cond_0

    .line 473
    invoke-virtual {p0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 474
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 475
    const-string v1, "storage_volume"

    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_0
.end method

.method public mountToggleClicked(Landroid/preference/Preference;)Z
    .locals 1
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 443
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCacheCleared()V
    .locals 0

    .prologue
    .line 418
    invoke-direct {p0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->measure()V

    .line 419
    return-void
.end method

.method public onMediaScannerFinished()V
    .locals 0

    .prologue
    .line 414
    invoke-direct {p0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->measure()V

    .line 415
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 422
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMeasure:Lcom/androie/settings/deviceinfo/StorageMeasurement;

    invoke-virtual {v0}, Lcom/androie/settings/deviceinfo/StorageMeasurement;->cleanUp()V

    .line 423
    return-void
.end method

.method public onRequestMediaRescan()V
    .locals 7

    .prologue
    .line 514
    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v1

    .line 515
    .local v1, "currentUser":I
    new-instance v0, Landroid/os/Environment$UserEnvironment;

    invoke-direct {v0, v1}, Landroid/os/Environment$UserEnvironment;-><init>(I)V

    .line 517
    .local v0, "currentEnv":Landroid/os/Environment$UserEnvironment;
    const/4 v2, 0x0

    .line 518
    .local v2, "path":Ljava/io/File;
    iget-boolean v3, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mIsInternal:Z

    if-eqz v3, :cond_0

    invoke-static {}, Landroid/os/Environment;->isExternalStorageEmulated()Z

    move-result v3

    if-nez v3, :cond_1

    :cond_0
    iget-boolean v3, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mIsPrimary:Z

    if-eqz v3, :cond_2

    .line 519
    :cond_1
    invoke-virtual {v0}, Landroid/os/Environment$UserEnvironment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    .line 524
    :goto_0
    const-string v3, "StorageVolumePreferenceCategory"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Request scan of "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 525
    invoke-virtual {p0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->getContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x0

    invoke-static {v3, v4, v5, p0}, Landroid/media/MediaScannerConnection;->scanFile(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V

    .line 527
    return-void

    .line 521
    :cond_2
    iget-object v3, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    invoke-virtual {v3}, Landroid/os/storage/StorageVolume;->getPathFile()Ljava/io/File;

    move-result-object v2

    goto :goto_0
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 399
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mMeasure:Lcom/androie/settings/deviceinfo/StorageMeasurement;

    iget-object v1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mReceiver:Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/StorageMeasurement;->setReceiver(Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;)V

    .line 400
    invoke-direct {p0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->measure()V

    .line 401
    return-void
.end method

.method public onScanCompleted(Ljava/lang/String;Landroid/net/Uri;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 531
    if-eqz p2, :cond_0

    .line 532
    invoke-direct {p0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->measure()V

    .line 534
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory$3;

    invoke-direct {v1, p0, p2}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory$3;-><init>(Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;Landroid/net/Uri;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 543
    return-void
.end method

.method public onStorageStateChanged()V
    .locals 0

    .prologue
    .line 404
    invoke-direct {p0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->measure()V

    .line 405
    return-void
.end method

.method public onUsbStateChanged(ZLjava/lang/String;)V
    .locals 0
    .param p1, "isUsbConnected"    # Z
    .param p2, "usbFunction"    # Ljava/lang/String;

    .prologue
    .line 408
    iput-boolean p1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsbConnected:Z

    .line 409
    iput-object p2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsbFunction:Ljava/lang/String;

    .line 410
    invoke-direct {p0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->measure()V

    .line 411
    return-void
.end method

.method public updateApproximate(JJ)V
    .locals 6
    .param p1, "totalSize"    # J
    .param p3, "availSize"    # J

    .prologue
    .line 324
    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemTotal:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    invoke-direct {p0, p1, p2}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->formatSize(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/androie/settings/deviceinfo/StorageItemPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 325
    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemAvailable:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    invoke-direct {p0, p3, p4}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->formatSize(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/androie/settings/deviceinfo/StorageItemPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 327
    iput-wide p1, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mTotalSize:J

    .line 329
    sub-long v0, p1, p3

    .line 331
    .local v0, "usedSize":J
    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/androie/settings/deviceinfo/UsageBarPreference;

    invoke-virtual {v2}, Lcom/androie/settings/deviceinfo/UsageBarPreference;->clear()V

    .line 332
    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/androie/settings/deviceinfo/UsageBarPreference;

    const/4 v3, 0x0

    long-to-float v4, v0

    long-to-float v5, p1

    div-float/2addr v4, v5

    const v5, -0x777778

    invoke-virtual {v2, v3, v4, v5}, Lcom/androie/settings/deviceinfo/UsageBarPreference;->addEntry(IFI)V

    .line 333
    iget-object v2, p0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/androie/settings/deviceinfo/UsageBarPreference;

    invoke-virtual {v2}, Lcom/androie/settings/deviceinfo/UsageBarPreference;->commit()V

    .line 335
    invoke-direct {p0}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->updatePreferencesFromState()V

    .line 336
    return-void
.end method

.method public updateDetails(Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementDetails;)V
    .locals 16
    .param p1, "details"    # Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementDetails;

    .prologue
    .line 349
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    if-eqz v12, :cond_0

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    invoke-virtual {v12}, Landroid/os/storage/StorageVolume;->isPrimary()Z

    move-result v12

    if-eqz v12, :cond_1

    :cond_0
    const/4 v8, 0x1

    .line 350
    .local v8, "showDetails":Z
    :goto_0
    if-nez v8, :cond_2

    .line 381
    :goto_1
    return-void

    .line 349
    .end local v8    # "showDetails":Z
    :cond_1
    const/4 v8, 0x0

    goto :goto_0

    .line 353
    .restart local v8    # "showDetails":Z
    :cond_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemTotal:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v0, p1

    iget-wide v13, v0, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementDetails;->totalSize:J

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->formatSize(J)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/androie/settings/deviceinfo/StorageItemPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 354
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemAvailable:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v0, p1

    iget-wide v13, v0, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementDetails;->availSize:J

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->formatSize(J)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/androie/settings/deviceinfo/StorageItemPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 356
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/androie/settings/deviceinfo/UsageBarPreference;

    invoke-virtual {v12}, Lcom/androie/settings/deviceinfo/UsageBarPreference;->clear()V

    .line 358
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemApps:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v0, p1

    iget-wide v13, v0, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementDetails;->appsSize:J

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13, v14}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->updatePreference(Lcom/androie/settings/deviceinfo/StorageItemPreference;J)V

    .line 360
    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementDetails;->mediaSize:Ljava/util/HashMap;

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/String;

    const/4 v14, 0x0

    sget-object v15, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    aput-object v15, v13, v14

    const/4 v14, 0x1

    sget-object v15, Landroid/os/Environment;->DIRECTORY_MOVIES:Ljava/lang/String;

    aput-object v15, v13, v14

    const/4 v14, 0x2

    sget-object v15, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->totalValues(Ljava/util/HashMap;[Ljava/lang/String;)J

    move-result-wide v1

    .line 362
    .local v1, "dcimSize":J
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemDcim:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v1, v2}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->updatePreference(Lcom/androie/settings/deviceinfo/StorageItemPreference;J)V

    .line 364
    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementDetails;->mediaSize:Ljava/util/HashMap;

    const/4 v13, 0x5

    new-array v13, v13, [Ljava/lang/String;

    const/4 v14, 0x0

    sget-object v15, Landroid/os/Environment;->DIRECTORY_MUSIC:Ljava/lang/String;

    aput-object v15, v13, v14

    const/4 v14, 0x1

    sget-object v15, Landroid/os/Environment;->DIRECTORY_ALARMS:Ljava/lang/String;

    aput-object v15, v13, v14

    const/4 v14, 0x2

    sget-object v15, Landroid/os/Environment;->DIRECTORY_NOTIFICATIONS:Ljava/lang/String;

    aput-object v15, v13, v14

    const/4 v14, 0x3

    sget-object v15, Landroid/os/Environment;->DIRECTORY_RINGTONES:Ljava/lang/String;

    aput-object v15, v13, v14

    const/4 v14, 0x4

    sget-object v15, Landroid/os/Environment;->DIRECTORY_PODCASTS:Ljava/lang/String;

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->totalValues(Ljava/util/HashMap;[Ljava/lang/String;)J

    move-result-wide v6

    .line 367
    .local v6, "musicSize":J
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemMusic:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v6, v7}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->updatePreference(Lcom/androie/settings/deviceinfo/StorageItemPreference;J)V

    .line 369
    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementDetails;->mediaSize:Ljava/util/HashMap;

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/String;

    const/4 v14, 0x0

    sget-object v15, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->totalValues(Ljava/util/HashMap;[Ljava/lang/String;)J

    move-result-wide v3

    .line 370
    .local v3, "downloadsSize":J
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemDownloads:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v3, v4}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->updatePreference(Lcom/androie/settings/deviceinfo/StorageItemPreference;J)V

    .line 372
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemCache:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v0, p1

    iget-wide v13, v0, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementDetails;->cacheSize:J

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13, v14}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->updatePreference(Lcom/androie/settings/deviceinfo/StorageItemPreference;J)V

    .line 373
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemMisc:Lcom/androie/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v0, p1

    iget-wide v13, v0, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementDetails;->miscSize:J

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13, v14}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->updatePreference(Lcom/androie/settings/deviceinfo/StorageItemPreference;J)V

    .line 375
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemUsers:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/androie/settings/deviceinfo/StorageItemPreference;

    .line 376
    .local v9, "userPref":Lcom/androie/settings/deviceinfo/StorageItemPreference;
    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/androie/settings/deviceinfo/StorageMeasurement$MeasurementDetails;->usersSize:Landroid/util/SparseLongArray;

    iget v13, v9, Lcom/androie/settings/deviceinfo/StorageItemPreference;->userHandle:I

    invoke-virtual {v12, v13}, Landroid/util/SparseLongArray;->get(I)J

    move-result-wide v10

    .line 377
    .local v10, "userSize":J
    move-object/from16 v0, p0

    invoke-direct {v0, v9, v10, v11}, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->updatePreference(Lcom/androie/settings/deviceinfo/StorageItemPreference;J)V

    goto :goto_2

    .line 380
    .end local v9    # "userPref":Lcom/androie/settings/deviceinfo/StorageItemPreference;
    .end local v10    # "userSize":J
    :cond_3
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/androie/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/androie/settings/deviceinfo/UsageBarPreference;

    invoke-virtual {v12}, Lcom/androie/settings/deviceinfo/UsageBarPreference;->commit()V

    goto/16 :goto_1
.end method
