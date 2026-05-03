.class public Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;
.super Landroid/preference/PreferenceCategory;
.source "StorageVolumePreferenceCategory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory$PreferenceHeader;
    }
.end annotation


# instance fields
.field private mFormatPreference:Landroid/preference/Preference;

.field private mItemApps:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

.field private mItemAvailable:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

.field private mItemCache:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

.field private mItemDcim:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

.field private mItemDownloads:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

.field private mItemMisc:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

.field private mItemMusic:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

.field private mItemTotal:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

.field private mItemUsers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;",
            ">;"
        }
    .end annotation
.end field

.field private final mMeasure:Lcom/jellybyn/settings/deviceinfo/StorageMeasurement;

.field private mMountTogglePreference:Landroid/preference/Preference;

.field private mReceiver:Lcom/jellybyn/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;

.field private final mResources:Landroid/content/res/Resources;

.field private mStorageLow:Landroid/preference/Preference;

.field private final mStorageManager:Landroid/os/storage/StorageManager;

.field private mTotalSize:J

.field private mUpdateHandler:Landroid/os/Handler;

.field private mUsageBarPreference:Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;

.field private mUsbConnected:Z

.field private mUsbFunction:Ljava/lang/String;

.field private final mUserManager:Landroid/os/UserManager;

.field private final mVolume:Landroid/os/storage/StorageVolume;


# direct methods
.method private constructor <init>(Landroid/content/Context;Landroid/os/storage/StorageVolume;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "volume"    # Landroid/os/storage/StorageVolume;

    .prologue
    .line 120
    invoke-direct {p0, p1}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    .line 75
    invoke-static {}, Lcom/google/android/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemUsers:Ljava/util/List;

    .line 85
    new-instance v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory$1;

    invoke-direct {v0, p0}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory$1;-><init>(Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;)V

    iput-object v0, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUpdateHandler:Landroid/os/Handler;

    .line 402
    new-instance v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory$2;

    invoke-direct {v0, p0}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory$2;-><init>(Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;)V

    iput-object v0, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mReceiver:Lcom/jellybyn/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;

    .line 122
    iput-object p2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    .line 123
    invoke-static {p1, p2}, Lcom/jellybyn/settings/deviceinfo/StorageMeasurement;->getInstance(Landroid/content/Context;Landroid/os/storage/StorageVolume;)Lcom/jellybyn/settings/deviceinfo/StorageMeasurement;

    move-result-object v0

    iput-object v0, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMeasure:Lcom/jellybyn/settings/deviceinfo/StorageMeasurement;

    .line 125
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    .line 126
    invoke-static {p1}, Landroid/os/storage/StorageManager;->from(Landroid/content/Context;)Landroid/os/storage/StorageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageManager:Landroid/os/storage/StorageManager;

    .line 127
    const-string v0, "user"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/UserManager;

    iput-object v0, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUserManager:Landroid/os/UserManager;

    .line 129
    if-eqz p2, :cond_0

    invoke-virtual {p2, p1}, Landroid/os/storage/StorageVolume;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->setTitle(Ljava/lang/CharSequence;)V

    .line 131
    return-void

    .line 129
    :cond_0
    const v0, 0x7f0b0420

    invoke-virtual {p1, v0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUpdateHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public static buildForInternal(Landroid/content/Context;)Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 108
    new-instance v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;-><init>(Landroid/content/Context;Landroid/os/storage/StorageVolume;)V

    return-object v0
.end method

.method public static buildForPhysical(Landroid/content/Context;Landroid/os/storage/StorageVolume;)Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "volume"    # Landroid/os/storage/StorageVolume;

    .prologue
    .line 116
    new-instance v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;

    invoke-direct {v0, p0, p1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;-><init>(Landroid/content/Context;Landroid/os/storage/StorageVolume;)V

    return-object v0
.end method

.method private buildItem(II)Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;
    .locals 2
    .param p1, "titleRes"    # I
    .param p2, "colorRes"    # I

    .prologue
    .line 134
    new-instance v0, Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    invoke-virtual {p0}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;-><init>(Landroid/content/Context;II)V

    return-object v0
.end method

.method private formatSize(J)Ljava/lang/String;
    .locals 1
    .param p1, "size"    # J

    .prologue
    .line 399
    invoke-virtual {p0}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->getContext()Landroid/content/Context;

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
    .line 475
    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v2}, Landroid/os/UserManager;->getUsers()Ljava/util/List;

    move-result-object v1

    .line 476
    .local v1, "users":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 477
    .local v0, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/content/pm/UserInfo;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 478
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/UserInfo;

    iget v2, v2, Landroid/content/pm/UserInfo;->id:I

    iget v3, p1, Landroid/content/pm/UserInfo;->id:I

    if-ne v2, v3, :cond_0

    .line 479
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 482
    :cond_1
    return-object v1
.end method

.method private measure()V
    .locals 1

    .prologue
    .line 367
    iget-object v0, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMeasure:Lcom/jellybyn/settings/deviceinfo/StorageMeasurement;

    invoke-virtual {v0}, Lcom/jellybyn/settings/deviceinfo/StorageMeasurement;->invalidate()V

    .line 368
    iget-object v0, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMeasure:Lcom/jellybyn/settings/deviceinfo/StorageMeasurement;

    invoke-virtual {v0}, Lcom/jellybyn/settings/deviceinfo/StorageMeasurement;->measure()V

    .line 369
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
    .line 312
    .local p0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Long;>;"
    const-wide/16 v4, 0x0

    .line 313
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

    .line 314
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {p0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 315
    invoke-virtual {p0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    add-long/2addr v4, v6

    .line 313
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 318
    .end local v2    # "key":Ljava/lang/String;
    :cond_1
    return-wide v4
.end method

.method private updatePreference(Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;J)V
    .locals 5
    .param p1, "pref"    # Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;
    .param p2, "size"    # J

    .prologue
    .line 357
    const-wide/16 v1, 0x0

    cmp-long v1, p2, v1

    if-lez v1, :cond_0

    .line 358
    invoke-direct {p0, p2, p3}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->formatSize(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 359
    invoke-virtual {p1}, Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;->getOrder()I

    move-result v0

    .line 360
    .local v0, "order":I
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;

    long-to-float v2, p2

    iget-wide v3, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mTotalSize:J

    long-to-float v3, v3

    div-float/2addr v2, v3

    iget v3, p1, Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;->color:I

    invoke-virtual {v1, v0, v2, v3}, Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;->addEntry(IFI)V

    .line 364
    .end local v0    # "order":I
    :goto_0
    return-void

    .line 362
    :cond_0
    invoke-virtual {p0, p1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_0
.end method

.method private updatePreferencesFromState()V
    .locals 7

    .prologue
    const v6, 0x7f0b0328

    const v3, 0x7f0b0322

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 237
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    if-nez v1, :cond_1

    .line 294
    :cond_0
    :goto_0
    return-void

    .line 239
    :cond_1
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    invoke-virtual {v1, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 241
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageManager:Landroid/os/storage/StorageManager;

    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    invoke-virtual {v2}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/storage/StorageManager;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 243
    .local v0, "state":Ljava/lang/String;
    const-string v1, "mounted_ro"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 244
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemAvailable:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    const v2, 0x7f0b0315

    invoke-virtual {v1, v2}, Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;->setTitle(I)V

    .line 245
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    if-eqz v1, :cond_2

    .line 246
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    invoke-virtual {p0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 252
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

    .line 254
    :cond_3
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    invoke-virtual {v1, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 255
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    const v3, 0x7f0b031f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 256
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    const v3, 0x7f0b0320

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 277
    :cond_4
    :goto_2
    iget-boolean v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsbConnected:Z

    if-eqz v1, :cond_c

    const-string v1, "mtp"

    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsbFunction:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, "ptp"

    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsbFunction:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 279
    :cond_5
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    invoke-virtual {v1, v5}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 280
    const-string v1, "mounted"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "mounted_ro"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 282
    :cond_6
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 286
    :cond_7
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    if-eqz v1, :cond_0

    .line 287
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    invoke-virtual {v1, v5}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 288
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 249
    :cond_8
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemAvailable:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    const v2, 0x7f0b0314

    invoke-virtual {v1, v2}, Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;->setTitle(I)V

    goto/16 :goto_1

    .line 258
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

    .line 260
    :cond_a
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    invoke-virtual {v1, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 261
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 262
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    const v3, 0x7f0b0323

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 269
    :goto_3
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;

    invoke-virtual {p0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 270
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemTotal:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    invoke-virtual {p0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 271
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemAvailable:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    invoke-virtual {p0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 272
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    if-eqz v1, :cond_4

    .line 273
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    invoke-virtual {p0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_2

    .line 264
    :cond_b
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    invoke-virtual {v1, v5}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 265
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 266
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    const v3, 0x7f0b0321

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_3

    .line 290
    :cond_c
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    if-eqz v1, :cond_0

    .line 291
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    invoke-virtual {v1, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 292
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mResources:Landroid/content/res/Resources;

    const v3, 0x7f0b0325

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto/16 :goto_0
.end method


# virtual methods
.method public getStorageVolume()Landroid/os/storage/StorageVolume;
    .locals 1

    .prologue
    .line 232
    iget-object v0, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    return-object v0
.end method

.method public init()V
    .locals 22

    .prologue
    .line 138
    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->getContext()Landroid/content/Context;

    move-result-object v6

    .line 142
    .local v6, "context":Landroid/content/Context;
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Landroid/app/IActivityManager;->getCurrentUser()Landroid/content/pm/UserInfo;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    .line 147
    .local v9, "currentUser":Landroid/content/pm/UserInfo;
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->getUsersExcluding(Landroid/content/pm/UserInfo;)Ljava/util/List;

    move-result-object v14

    .line 148
    .local v14, "otherUsers":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    move-object/from16 v19, v0

    if-nez v19, :cond_2

    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v19

    if-lez v19, :cond_2

    const/16 v17, 0x1

    .line 150
    .local v17, "showUsers":Z
    :goto_0
    new-instance v19, Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;

    move-object/from16 v0, v19

    invoke-direct {v0, v6}, Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;

    .line 151
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;

    move-object/from16 v19, v0

    const/16 v20, -0x2

    invoke-virtual/range {v19 .. v20}, Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;->setOrder(I)V

    .line 152
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 154
    const v19, 0x7f0b0316

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->buildItem(II)Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemTotal:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    .line 155
    const v19, 0x7f0b0314

    const v20, 0x7f0a0003

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->buildItem(II)Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemAvailable:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    .line 156
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemTotal:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 157
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemAvailable:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 159
    const v19, 0x7f0b0318

    const v20, 0x7f0a0004

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->buildItem(II)Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemApps:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    .line 160
    const v19, 0x7f0b031b

    const v20, 0x7f0a0006

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->buildItem(II)Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemDcim:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    .line 161
    const v19, 0x7f0b031c

    const v20, 0x7f0a0007

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->buildItem(II)Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemMusic:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    .line 162
    const v19, 0x7f0b031a

    const v20, 0x7f0a0005

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->buildItem(II)Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemDownloads:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    .line 163
    const v19, 0x7f0b031e

    const v20, 0x7f0a0008

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->buildItem(II)Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemCache:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    .line 164
    const v19, 0x7f0b031d

    const v20, 0x7f0a0009

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->buildItem(II)Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemMisc:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    .line 166
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemCache:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v19, v0

    const-string v20, "cache"

    invoke-virtual/range {v19 .. v20}, Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;->setKey(Ljava/lang/String;)V

    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    move-object/from16 v19, v0

    if-eqz v19, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/os/storage/StorageVolume;->isPrimary()Z

    move-result v19

    if-eqz v19, :cond_3

    :cond_0
    const/16 v16, 0x1

    .line 169
    .local v16, "showDetails":Z
    :goto_1
    if-eqz v16, :cond_5

    .line 170
    if-eqz v17, :cond_1

    .line 171
    new-instance v19, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory$PreferenceHeader;

    iget-object v0, v9, Landroid/content/pm/UserInfo;->name:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v0, v6, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory$PreferenceHeader;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 174
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemApps:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 175
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemDcim:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 176
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemMusic:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 177
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemDownloads:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 178
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemCache:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 179
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemMisc:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 181
    if-eqz v17, :cond_5

    .line 182
    new-instance v19, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory$PreferenceHeader;

    const v20, 0x7f0b033a

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-direct {v0, v6, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory$PreferenceHeader;-><init>(Landroid/content/Context;I)V

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 184
    const/4 v7, 0x0

    .line 185
    .local v7, "count":I
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_5

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/content/pm/UserInfo;

    .line 186
    .local v12, "info":Landroid/content/pm/UserInfo;
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "count":I
    .local v8, "count":I
    rem-int/lit8 v19, v7, 0x2

    if-nez v19, :cond_4

    const v5, 0x7f0a000a

    .line 188
    .local v5, "colorRes":I
    :goto_3
    new-instance v18, Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->getContext()Landroid/content/Context;

    move-result-object v19

    iget-object v0, v12, Landroid/content/pm/UserInfo;->name:Ljava/lang/String;

    move-object/from16 v20, v0

    iget v0, v12, Landroid/content/pm/UserInfo;->id:I

    move/from16 v21, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    move/from16 v3, v21

    invoke-direct {v0, v1, v2, v5, v3}, Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;II)V

    .line 190
    .local v18, "userPref":Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemUsers:Ljava/util/List;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    move v7, v8

    .line 192
    .end local v8    # "count":I
    .restart local v7    # "count":I
    goto :goto_2

    .line 143
    .end local v5    # "colorRes":I
    .end local v7    # "count":I
    .end local v9    # "currentUser":Landroid/content/pm/UserInfo;
    .end local v11    # "i$":Ljava/util/Iterator;
    .end local v12    # "info":Landroid/content/pm/UserInfo;
    .end local v14    # "otherUsers":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    .end local v16    # "showDetails":Z
    .end local v17    # "showUsers":Z
    .end local v18    # "userPref":Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;
    :catch_0
    move-exception v10

    .line 144
    .local v10, "e":Landroid/os/RemoteException;
    new-instance v19, Ljava/lang/RuntimeException;

    const-string v20, "Failed to get current user"

    invoke-direct/range {v19 .. v20}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 148
    .end local v10    # "e":Landroid/os/RemoteException;
    .restart local v9    # "currentUser":Landroid/content/pm/UserInfo;
    .restart local v14    # "otherUsers":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    :cond_2
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 168
    .restart local v17    # "showUsers":Z
    :cond_3
    const/16 v16, 0x0

    goto/16 :goto_1

    .line 186
    .restart local v8    # "count":I
    .restart local v11    # "i$":Ljava/util/Iterator;
    .restart local v12    # "info":Landroid/content/pm/UserInfo;
    .restart local v16    # "showDetails":Z
    :cond_4
    const v5, 0x7f0a000b

    goto :goto_3

    .line 196
    .end local v8    # "count":I
    .end local v11    # "i$":Ljava/util/Iterator;
    .end local v12    # "info":Landroid/content/pm/UserInfo;
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    move-object/from16 v19, v0

    if-eqz v19, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/os/storage/StorageVolume;->isRemovable()Z

    move-result v13

    .line 198
    .local v13, "isRemovable":Z
    :goto_4
    new-instance v19, Landroid/preference/Preference;

    move-object/from16 v0, v19

    invoke-direct {v0, v6}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    .line 199
    if-eqz v13, :cond_6

    .line 200
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    move-object/from16 v19, v0

    const v20, 0x7f0b031f

    invoke-virtual/range {v19 .. v20}, Landroid/preference/Preference;->setTitle(I)V

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    move-object/from16 v19, v0

    const v20, 0x7f0b0320

    invoke-virtual/range {v19 .. v20}, Landroid/preference/Preference;->setSummary(I)V

    .line 202
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 207
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    move-object/from16 v19, v0

    if-eqz v19, :cond_a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/os/storage/StorageVolume;->isPrimary()Z

    move-result v4

    .line 208
    .local v4, "allowFormat":Z
    :goto_5
    if-eqz v4, :cond_7

    .line 209
    new-instance v19, Landroid/preference/Preference;

    move-object/from16 v0, v19

    invoke-direct {v0, v6}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    .line 210
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    move-object/from16 v19, v0

    const v20, 0x7f0b0324

    invoke-virtual/range {v19 .. v20}, Landroid/preference/Preference;->setTitle(I)V

    .line 211
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    move-object/from16 v19, v0

    const v20, 0x7f0b0325

    invoke-virtual/range {v19 .. v20}, Landroid/preference/Preference;->setSummary(I)V

    .line 212
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 215
    :cond_7
    invoke-static {}, Landroid/app/ActivityThread;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object v15

    .line 217
    .local v15, "pm":Landroid/content/pm/IPackageManager;
    :try_start_1
    invoke-interface {v15}, Landroid/content/pm/IPackageManager;->isStorageLow()Z

    move-result v19

    if-eqz v19, :cond_b

    .line 218
    new-instance v19, Landroid/preference/Preference;

    move-object/from16 v0, v19

    invoke-direct {v0, v6}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageLow:Landroid/preference/Preference;

    .line 219
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageLow:Landroid/preference/Preference;

    move-object/from16 v19, v0

    const/16 v20, -0x1

    invoke-virtual/range {v19 .. v20}, Landroid/preference/Preference;->setOrder(I)V

    .line 220
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageLow:Landroid/preference/Preference;

    move-object/from16 v19, v0

    const v20, 0x7f0b0330

    invoke-virtual/range {v19 .. v20}, Landroid/preference/Preference;->setTitle(I)V

    .line 221
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageLow:Landroid/preference/Preference;

    move-object/from16 v19, v0

    const v20, 0x7f0b0331

    invoke-virtual/range {v19 .. v20}, Landroid/preference/Preference;->setSummary(I)V

    .line 222
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageLow:Landroid/preference/Preference;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 229
    :cond_8
    :goto_6
    return-void

    .line 196
    .end local v4    # "allowFormat":Z
    .end local v13    # "isRemovable":Z
    .end local v15    # "pm":Landroid/content/pm/IPackageManager;
    :cond_9
    const/4 v13, 0x0

    goto/16 :goto_4

    .line 207
    .restart local v13    # "isRemovable":Z
    :cond_a
    const/4 v4, 0x0

    goto :goto_5

    .line 223
    .restart local v4    # "allowFormat":Z
    .restart local v15    # "pm":Landroid/content/pm/IPackageManager;
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageLow:Landroid/preference/Preference;

    move-object/from16 v19, v0

    if-eqz v19, :cond_8

    .line 224
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageLow:Landroid/preference/Preference;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 225
    const/16 v19, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mStorageLow:Landroid/preference/Preference;
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_6

    .line 227
    :catch_1
    move-exception v19

    goto :goto_6
.end method

.method public intentForClick(Landroid/preference/Preference;)Landroid/content/Intent;
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 420
    const/4 v0, 0x0

    .line 425
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    .line 426
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mFormatPreference:Landroid/preference/Preference;

    if-ne p1, v1, :cond_1

    .line 427
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 428
    invoke-virtual {p0}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/jellybyn/settings/MediaFormat;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 429
    const-string v1, "storage_volume"

    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 451
    :cond_0
    :goto_0
    return-object v0

    .line 430
    :cond_1
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemApps:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    if-ne p1, v1, :cond_2

    .line 431
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MANAGE_PACKAGE_STORAGE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 432
    invoke-virtual {p0}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/jellybyn/settings/Settings$ManageApplicationsActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    goto :goto_0

    .line 434
    :cond_2
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemDownloads:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    if-ne p1, v1, :cond_3

    .line 435
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW_DOWNLOADS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.app.DownloadManager.extra_sortBySize"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    goto :goto_0

    .line 437
    :cond_3
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemMusic:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    if-ne p1, v1, :cond_4

    .line 438
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GET_CONTENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 439
    const-string v1, "audio/mp3"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 440
    :cond_4
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemDcim:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    if-ne p1, v1, :cond_5

    .line 441
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 442
    const-string v1, "android.intent.extra.LOCAL_ONLY"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 444
    const-string v1, "vnd.android.cursor.dir/image"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 445
    :cond_5
    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemMisc:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    if-ne p1, v1, :cond_0

    .line 446
    invoke-virtual {p0}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 447
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/jellybyn/settings/deviceinfo/MiscFilesHandler;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 448
    const-string v1, "storage_volume"

    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_0
.end method

.method public mountToggleClicked(Landroid/preference/Preference;)Z
    .locals 1
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 416
    iget-object v0, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMountTogglePreference:Landroid/preference/Preference;

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
    .line 391
    invoke-direct {p0}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->measure()V

    .line 392
    return-void
.end method

.method public onMediaScannerFinished()V
    .locals 0

    .prologue
    .line 387
    invoke-direct {p0}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->measure()V

    .line 388
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 395
    iget-object v0, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMeasure:Lcom/jellybyn/settings/deviceinfo/StorageMeasurement;

    invoke-virtual {v0}, Lcom/jellybyn/settings/deviceinfo/StorageMeasurement;->cleanUp()V

    .line 396
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 372
    iget-object v0, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mMeasure:Lcom/jellybyn/settings/deviceinfo/StorageMeasurement;

    iget-object v1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mReceiver:Lcom/jellybyn/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/deviceinfo/StorageMeasurement;->setReceiver(Lcom/jellybyn/settings/deviceinfo/StorageMeasurement$MeasurementReceiver;)V

    .line 373
    invoke-direct {p0}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->measure()V

    .line 374
    return-void
.end method

.method public onStorageStateChanged()V
    .locals 0

    .prologue
    .line 377
    invoke-direct {p0}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->measure()V

    .line 378
    return-void
.end method

.method public onUsbStateChanged(ZLjava/lang/String;)V
    .locals 0
    .param p1, "isUsbConnected"    # Z
    .param p2, "usbFunction"    # Ljava/lang/String;

    .prologue
    .line 381
    iput-boolean p1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsbConnected:Z

    .line 382
    iput-object p2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsbFunction:Ljava/lang/String;

    .line 383
    invoke-direct {p0}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->measure()V

    .line 384
    return-void
.end method

.method public updateApproximate(JJ)V
    .locals 6
    .param p1, "totalSize"    # J
    .param p3, "availSize"    # J

    .prologue
    .line 297
    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemTotal:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    invoke-direct {p0, p1, p2}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->formatSize(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 298
    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemAvailable:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    invoke-direct {p0, p3, p4}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->formatSize(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 300
    iput-wide p1, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mTotalSize:J

    .line 302
    sub-long v0, p1, p3

    .line 304
    .local v0, "usedSize":J
    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;

    invoke-virtual {v2}, Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;->clear()V

    .line 305
    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;

    const/4 v3, 0x0

    long-to-float v4, v0

    long-to-float v5, p1

    div-float/2addr v4, v5

    const v5, -0x777778

    invoke-virtual {v2, v3, v4, v5}, Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;->addEntry(IFI)V

    .line 306
    iget-object v2, p0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;

    invoke-virtual {v2}, Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;->commit()V

    .line 308
    invoke-direct {p0}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->updatePreferencesFromState()V

    .line 309
    return-void
.end method

.method public updateDetails(Lcom/jellybyn/settings/deviceinfo/StorageMeasurement$MeasurementDetails;)V
    .locals 16
    .param p1, "details"    # Lcom/jellybyn/settings/deviceinfo/StorageMeasurement$MeasurementDetails;

    .prologue
    .line 322
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    if-eqz v12, :cond_0

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mVolume:Landroid/os/storage/StorageVolume;

    invoke-virtual {v12}, Landroid/os/storage/StorageVolume;->isPrimary()Z

    move-result v12

    if-eqz v12, :cond_1

    :cond_0
    const/4 v8, 0x1

    .line 323
    .local v8, "showDetails":Z
    :goto_0
    if-nez v8, :cond_2

    .line 354
    :goto_1
    return-void

    .line 322
    .end local v8    # "showDetails":Z
    :cond_1
    const/4 v8, 0x0

    goto :goto_0

    .line 326
    .restart local v8    # "showDetails":Z
    :cond_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemTotal:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v0, p1

    iget-wide v13, v0, Lcom/jellybyn/settings/deviceinfo/StorageMeasurement$MeasurementDetails;->totalSize:J

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->formatSize(J)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 327
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemAvailable:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v0, p1

    iget-wide v13, v0, Lcom/jellybyn/settings/deviceinfo/StorageMeasurement$MeasurementDetails;->availSize:J

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->formatSize(J)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 329
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;

    invoke-virtual {v12}, Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;->clear()V

    .line 331
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemApps:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v0, p1

    iget-wide v13, v0, Lcom/jellybyn/settings/deviceinfo/StorageMeasurement$MeasurementDetails;->appsSize:J

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13, v14}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->updatePreference(Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;J)V

    .line 333
    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/jellybyn/settings/deviceinfo/StorageMeasurement$MeasurementDetails;->mediaSize:Ljava/util/HashMap;

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

    invoke-static {v12, v13}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->totalValues(Ljava/util/HashMap;[Ljava/lang/String;)J

    move-result-wide v1

    .line 335
    .local v1, "dcimSize":J
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemDcim:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v1, v2}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->updatePreference(Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;J)V

    .line 337
    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/jellybyn/settings/deviceinfo/StorageMeasurement$MeasurementDetails;->mediaSize:Ljava/util/HashMap;

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

    invoke-static {v12, v13}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->totalValues(Ljava/util/HashMap;[Ljava/lang/String;)J

    move-result-wide v6

    .line 340
    .local v6, "musicSize":J
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemMusic:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v6, v7}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->updatePreference(Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;J)V

    .line 342
    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/jellybyn/settings/deviceinfo/StorageMeasurement$MeasurementDetails;->mediaSize:Ljava/util/HashMap;

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/String;

    const/4 v14, 0x0

    sget-object v15, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->totalValues(Ljava/util/HashMap;[Ljava/lang/String;)J

    move-result-wide v3

    .line 343
    .local v3, "downloadsSize":J
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemDownloads:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v3, v4}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->updatePreference(Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;J)V

    .line 345
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemCache:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v0, p1

    iget-wide v13, v0, Lcom/jellybyn/settings/deviceinfo/StorageMeasurement$MeasurementDetails;->cacheSize:J

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13, v14}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->updatePreference(Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;J)V

    .line 346
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemMisc:Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    move-object/from16 v0, p1

    iget-wide v13, v0, Lcom/jellybyn/settings/deviceinfo/StorageMeasurement$MeasurementDetails;->miscSize:J

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13, v14}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->updatePreference(Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;J)V

    .line 348
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mItemUsers:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;

    .line 349
    .local v9, "userPref":Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;
    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/jellybyn/settings/deviceinfo/StorageMeasurement$MeasurementDetails;->usersSize:Landroid/util/SparseLongArray;

    iget v13, v9, Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;->userHandle:I

    invoke-virtual {v12, v13}, Landroid/util/SparseLongArray;->get(I)J

    move-result-wide v10

    .line 350
    .local v10, "userSize":J
    move-object/from16 v0, p0

    invoke-direct {v0, v9, v10, v11}, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->updatePreference(Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;J)V

    goto :goto_2

    .line 353
    .end local v9    # "userPref":Lcom/jellybyn/settings/deviceinfo/StorageItemPreference;
    .end local v10    # "userSize":J
    :cond_3
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/jellybyn/settings/deviceinfo/StorageVolumePreferenceCategory;->mUsageBarPreference:Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;

    invoke-virtual {v12}, Lcom/jellybyn/settings/deviceinfo/UsageBarPreference;->commit()V

    goto/16 :goto_1
.end method
