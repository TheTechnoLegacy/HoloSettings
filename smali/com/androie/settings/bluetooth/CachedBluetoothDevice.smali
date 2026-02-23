.class final Lcom/androie/settings/bluetooth/CachedBluetoothDevice;
.super Ljava/lang/Object;
.source "CachedBluetoothDevice.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/bluetooth/CachedBluetoothDevice$Callback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/androie/settings/bluetooth/CachedBluetoothDevice;",
        ">;"
    }
.end annotation


# instance fields
.field private mBtClass:Landroid/bluetooth/BluetoothClass;

.field private final mCallbacks:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lcom/androie/settings/bluetooth/CachedBluetoothDevice$Callback;",
            ">;"
        }
    .end annotation
.end field

.field private mConnectAfterPairing:Z

.field private mConnectAttempted:J

.field private final mContext:Landroid/content/Context;

.field private final mDevice:Landroid/bluetooth/BluetoothDevice;

.field private mDeviceRemove:Z

.field private mIsConnectingErrorPossible:Z

.field private final mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

.field private mLocalNapRoleConnected:Z

.field private mMessagePermissionChoice:I

.field private mName:Ljava/lang/String;

.field private mPhonebookPermissionChoice:I

.field private mProfileConnectionState:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/androie/settings/bluetooth/LocalBluetoothProfile;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mProfileManager:Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;

.field private final mProfiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/androie/settings/bluetooth/LocalBluetoothProfile;",
            ">;"
        }
    .end annotation
.end field

.field private final mRemovedProfiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/androie/settings/bluetooth/LocalBluetoothProfile;",
            ">;"
        }
    .end annotation
.end field

.field private mRssi:S

.field private mVisible:Z


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;Landroid/bluetooth/BluetoothDevice;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "adapter"    # Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;
    .param p3, "profileManager"    # Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;
    .param p4, "device"    # Landroid/bluetooth/BluetoothDevice;

    .prologue
    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    .line 59
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mRemovedProfiles:Ljava/util/List;

    .line 72
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mCallbacks:Ljava/util/Collection;

    .line 156
    iput-object p1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mContext:Landroid/content/Context;

    .line 157
    iput-object p2, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    .line 158
    iput-object p3, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfileManager:Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;

    .line 159
    iput-object p4, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    .line 160
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfileConnectionState:Ljava/util/HashMap;

    .line 161
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->fillData()V

    .line 162
    return-void
.end method

.method private connectAutoConnectableProfiles()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 235
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->ensurePaired()Z

    move-result v2

    if-nez v2, :cond_1

    .line 247
    :cond_0
    return-void

    .line 239
    :cond_1
    iput-boolean v3, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mIsConnectingErrorPossible:Z

    .line 241
    iget-object v2, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .line 242
    .local v1, "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    invoke-interface {v1}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->isAutoConnectable()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 243
    iget-object v2, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-interface {v1, v2, v3}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->setPreferred(Landroid/bluetooth/BluetoothDevice;Z)V

    .line 244
    invoke-virtual {p0, v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->connectInt(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V

    goto :goto_0
.end method

.method private connectWithoutResettingTimer(Z)V
    .locals 5
    .param p1, "connectAllProfiles"    # Z

    .prologue
    .line 203
    iget-object v3, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 211
    const-string v3, "CachedBluetoothDevice"

    const-string v4, "No profiles. Maybe we will connect later"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    :cond_0
    :goto_0
    return-void

    .line 216
    :cond_1
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mIsConnectingErrorPossible:Z

    .line 218
    const/4 v1, 0x0

    .line 219
    .local v1, "preferredProfiles":I
    iget-object v3, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .line 220
    .local v2, "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    if-eqz p1, :cond_3

    invoke-interface {v2}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->isConnectable()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 221
    :goto_2
    iget-object v3, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-interface {v2, v3}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->isPreferred(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 222
    add-int/lit8 v1, v1, 0x1

    .line 223
    invoke-virtual {p0, v2}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->connectInt(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V

    goto :goto_1

    .line 220
    :cond_3
    invoke-interface {v2}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->isAutoConnectable()Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_2

    .line 229
    .end local v2    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    :cond_4
    if-nez v1, :cond_0

    .line 230
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->connectAutoConnectableProfiles()V

    goto :goto_0
.end method

.method private describe(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)Ljava/lang/String;
    .locals 3
    .param p1, "profile"    # Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .prologue
    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 113
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "Address:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 114
    if-eqz p1, :cond_0

    .line 115
    const-string v1, " Profile:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 118
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private dispatchAttributesChanged()V
    .locals 4

    .prologue
    .line 590
    iget-object v3, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mCallbacks:Ljava/util/Collection;

    monitor-enter v3

    .line 591
    :try_start_0
    iget-object v2, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mCallbacks:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice$Callback;

    .line 592
    .local v0, "callback":Lcom/androie/settings/bluetooth/CachedBluetoothDevice$Callback;
    invoke-interface {v0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice$Callback;->onDeviceAttributesChanged()V

    goto :goto_0

    .line 594
    .end local v0    # "callback":Lcom/androie/settings/bluetooth/CachedBluetoothDevice$Callback;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 595
    return-void
.end method

.method private ensurePaired()Z
    .locals 2

    .prologue
    .line 277
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    .line 278
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->startPairing()Z

    .line 279
    const/4 v0, 0x0

    .line 281
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private fetchBtClass()V
    .locals 1

    .prologue
    .line 470
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getBluetoothClass()Landroid/bluetooth/BluetoothClass;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mBtClass:Landroid/bluetooth/BluetoothClass;

    .line 471
    return-void
.end method

.method private fetchName()V
    .locals 1

    .prologue
    .line 389
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAliasName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    .line 391
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 392
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    .line 395
    :cond_0
    return-void
.end method

.method private fetchPermissionChoice(Ljava/lang/String;)I
    .locals 3
    .param p1, "prefsName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 674
    iget-object v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mContext:Landroid/content/Context;

    invoke-virtual {v1, p1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 676
    .local v0, "preference":Landroid/content/SharedPreferences;
    iget-object v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    return v1
.end method

.method private fillData()V
    .locals 1

    .prologue
    .line 353
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->fetchName()V

    .line 354
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->fetchBtClass()V

    .line 355
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->updateProfiles()Z

    .line 356
    const-string v0, "bluetooth_phonebook_permission"

    invoke-direct {p0, v0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->fetchPermissionChoice(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mPhonebookPermissionChoice:I

    .line 357
    const-string v0, "bluetooth_message_permissions"

    invoke-direct {p0, v0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->fetchPermissionChoice(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mMessagePermissionChoice:I

    .line 358
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mVisible:Z

    .line 359
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->dispatchAttributesChanged()V

    .line 360
    return-void
.end method

.method private savePermissionChoice(Ljava/lang/String;I)V
    .locals 3
    .param p1, "prefsName"    # Ljava/lang/String;
    .param p2, "permissionChoice"    # I

    .prologue
    .line 663
    iget-object v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mContext:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 665
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    if-nez p2, :cond_0

    .line 666
    iget-object v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 670
    :goto_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 671
    return-void

    .line 668
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_0
.end method

.method private updateProfiles()Z
    .locals 6

    .prologue
    const/4 v0, 0x0

    .line 474
    iget-object v3, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getUuids()[Landroid/os/ParcelUuid;

    move-result-object v1

    .line 475
    .local v1, "uuids":[Landroid/os/ParcelUuid;
    if-nez v1, :cond_1

    .line 492
    :cond_0
    :goto_0
    return v0

    .line 477
    :cond_1
    iget-object v3, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v3}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->getUuids()[Landroid/os/ParcelUuid;

    move-result-object v2

    .line 478
    .local v2, "localUuids":[Landroid/os/ParcelUuid;
    if-eqz v2, :cond_0

    .line 480
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfileManager:Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;

    iget-object v3, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    iget-object v4, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mRemovedProfiles:Ljava/util/List;

    iget-boolean v5, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mLocalNapRoleConnected:Z

    invoke-virtual/range {v0 .. v5}, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->updateProfiles([Landroid/os/ParcelUuid;[Landroid/os/ParcelUuid;Ljava/util/Collection;Ljava/util/Collection;Z)V

    .line 492
    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public clearProfileConnectionState()V
    .locals 5

    .prologue
    .line 344
    const-string v2, "CachedBluetoothDevice"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " Clearing all connection state for dev:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v4}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 346
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getProfiles()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .line 347
    .local v1, "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    iget-object v2, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfileConnectionState:Ljava/util/HashMap;

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 349
    .end local v1    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    :cond_0
    return-void
.end method

.method public compareTo(Lcom/androie/settings/bluetooth/CachedBluetoothDevice;)I
    .locals 6
    .param p1, "another"    # Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    .prologue
    const/16 v5, 0xc

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 620
    invoke-virtual {p1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    :goto_0
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->isConnected()Z

    move-result v4

    if-eqz v4, :cond_1

    move v4, v2

    :goto_1
    sub-int v0, v1, v4

    .line 621
    .local v0, "comparison":I
    if-eqz v0, :cond_2

    move v1, v0

    .line 637
    :goto_2
    return v1

    .end local v0    # "comparison":I
    :cond_0
    move v1, v3

    .line 620
    goto :goto_0

    :cond_1
    move v4, v3

    goto :goto_1

    .line 624
    .restart local v0    # "comparison":I
    :cond_2
    invoke-virtual {p1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v1

    if-ne v1, v5, :cond_3

    move v1, v2

    :goto_3
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v4

    if-ne v4, v5, :cond_4

    move v4, v2

    :goto_4
    sub-int v0, v1, v4

    .line 626
    if-eqz v0, :cond_5

    move v1, v0

    goto :goto_2

    :cond_3
    move v1, v3

    .line 624
    goto :goto_3

    :cond_4
    move v4, v3

    goto :goto_4

    .line 629
    :cond_5
    iget-boolean v1, p1, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mVisible:Z

    if-eqz v1, :cond_6

    move v1, v2

    :goto_5
    iget-boolean v4, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mVisible:Z

    if-eqz v4, :cond_7

    :goto_6
    sub-int v0, v1, v2

    .line 630
    if-eqz v0, :cond_8

    move v1, v0

    goto :goto_2

    :cond_6
    move v1, v3

    .line 629
    goto :goto_5

    :cond_7
    move v2, v3

    goto :goto_6

    .line 633
    :cond_8
    iget-short v1, p1, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mRssi:S

    iget-short v2, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mRssi:S

    sub-int v0, v1, v2

    .line 634
    if-eqz v0, :cond_9

    move v1, v0

    goto :goto_2

    .line 637
    :cond_9
    iget-object v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    iget-object v2, p1, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    goto :goto_2
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 42
    check-cast p1, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->compareTo(Lcom/androie/settings/bluetooth/CachedBluetoothDevice;)I

    move-result v0

    return v0
.end method

.method connect(Z)V
    .locals 2
    .param p1, "connectAllProfiles"    # Z

    .prologue
    .line 187
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->ensurePaired()Z

    move-result v0

    if-nez v0, :cond_0

    .line 193
    :goto_0
    return-void

    .line 191
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mConnectAttempted:J

    .line 192
    invoke-direct {p0, p1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->connectWithoutResettingTimer(Z)V

    goto :goto_0
.end method

.method declared-synchronized connectInt(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V
    .locals 3
    .param p1, "profile"    # Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .prologue
    .line 264
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->ensurePaired()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 274
    :goto_0
    monitor-exit p0

    return-void

    .line 267
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-interface {p1, v0}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->connect(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 269
    const-string v0, "CachedBluetoothDevice"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Command sent successfully:CONNECT "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0, p1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->describe(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 264
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 273
    :cond_1
    :try_start_2
    const-string v0, "CachedBluetoothDevice"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to connect "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method connectProfile(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V
    .locals 2
    .param p1, "profile"    # Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .prologue
    .line 255
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mConnectAttempted:J

    .line 257
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mIsConnectingErrorPossible:Z

    .line 258
    invoke-virtual {p0, p1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->connectInt(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V

    .line 260
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->refresh()V

    .line 261
    return-void
.end method

.method disconnect()V
    .locals 5

    .prologue
    .line 165
    iget-object v3, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .line 166
    .local v2, "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    invoke-virtual {p0, v2}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->disconnect(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V

    goto :goto_0

    .line 171
    .end local v2    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    :cond_0
    iget-object v3, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfileManager:Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;

    invoke-virtual {v3}, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->getPbapProfile()Lcom/androie/settings/bluetooth/PbapServerProfile;

    move-result-object v0

    .line 172
    .local v0, "PbapProfile":Lcom/androie/settings/bluetooth/PbapServerProfile;
    iget-object v3, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0, v3}, Lcom/androie/settings/bluetooth/PbapServerProfile;->getConnectionStatus(Landroid/bluetooth/BluetoothDevice;)I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 174
    iget-object v3, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0, v3}, Lcom/androie/settings/bluetooth/PbapServerProfile;->disconnect(Landroid/bluetooth/BluetoothDevice;)Z

    .line 176
    :cond_1
    return-void
.end method

.method disconnect(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V
    .locals 3
    .param p1, "profile"    # Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .prologue
    .line 179
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-interface {p1, v0}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->disconnect(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 181
    const-string v0, "CachedBluetoothDevice"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Command sent successfully:DISCONNECT "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0, p1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->describe(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    :cond_0
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 604
    if-eqz p1, :cond_0

    instance-of v0, p1, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    if-nez v0, :cond_1

    .line 605
    :cond_0
    const/4 v0, 0x0

    .line 607
    .end local p1    # "o":Ljava/lang/Object;
    :goto_0
    return v0

    .restart local p1    # "o":Ljava/lang/Object;
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    check-cast p1, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v1, p1, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0, v1}, Landroid/bluetooth/BluetoothDevice;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method getBondState()I
    .locals 1

    .prologue
    .line 423
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getBondState()I

    move-result v0

    return v0
.end method

.method getBtClass()Landroid/bluetooth/BluetoothClass;
    .locals 1

    .prologue
    .line 555
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mBtClass:Landroid/bluetooth/BluetoothClass;

    return-object v0
.end method

.method getConnectableProfiles()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/androie/settings/bluetooth/LocalBluetoothProfile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 563
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 565
    .local v0, "connectableProfiles":Ljava/util/List;, "Ljava/util/List<Lcom/androie/settings/bluetooth/LocalBluetoothProfile;>;"
    iget-object v3, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .line 566
    .local v2, "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    invoke-interface {v2}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->isConnectable()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 567
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 570
    .end local v2    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    :cond_1
    return-object v0
.end method

.method getDevice()Landroid/bluetooth/BluetoothDevice;
    .locals 1

    .prologue
    .line 363
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    return-object v0
.end method

.method getMessagePermissionChoice()I
    .locals 1

    .prologue
    .line 649
    iget v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mMessagePermissionChoice:I

    return v0
.end method

.method getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 367
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    return-object v0
.end method

.method getPhonebookPermissionChoice()I
    .locals 1

    .prologue
    .line 645
    iget v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mPhonebookPermissionChoice:I

    return v0
.end method

.method getProfileConnectionState(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)I
    .locals 3
    .param p1, "profile"    # Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .prologue
    .line 332
    iget-object v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfileConnectionState:Ljava/util/HashMap;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfileConnectionState:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_1

    .line 335
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-interface {p1, v1}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->getConnectionStatus(Landroid/bluetooth/BluetoothDevice;)I

    move-result v0

    .line 336
    .local v0, "state":I
    iget-object v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfileConnectionState:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 338
    .end local v0    # "state":I
    :cond_1
    iget-object v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfileConnectionState:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1
.end method

.method getProfiles()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/androie/settings/bluetooth/LocalBluetoothProfile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 559
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method getRemovedProfiles()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/androie/settings/bluetooth/LocalBluetoothProfile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 574
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mRemovedProfiles:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 612
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method isBusy()Z
    .locals 6

    .prologue
    const/4 v3, 0x1

    .line 456
    iget-object v4, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .line 457
    .local v1, "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    invoke-virtual {p0, v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getProfileConnectionState(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)I

    move-result v2

    .line 458
    .local v2, "status":I
    if-eq v2, v3, :cond_1

    const/4 v4, 0x3

    if-ne v2, v4, :cond_0

    .line 463
    .end local v1    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    .end local v2    # "status":I
    :cond_1
    :goto_0
    return v3

    :cond_2
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v4

    const/16 v5, 0xb

    if-eq v4, v5, :cond_1

    const/4 v3, 0x0

    goto :goto_0
.end method

.method isConnected()Z
    .locals 4

    .prologue
    .line 439
    iget-object v3, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .line 440
    .local v1, "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    invoke-virtual {p0, v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getProfileConnectionState(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)I

    move-result v2

    .line 441
    .local v2, "status":I
    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    .line 442
    const/4 v3, 0x1

    .line 446
    .end local v1    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    .end local v2    # "status":I
    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method isRemovable()Z
    .locals 1

    .prologue
    .line 406
    iget-boolean v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDeviceRemove:Z

    return v0
.end method

.method isVisible()Z
    .locals 1

    .prologue
    .line 402
    iget-boolean v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mVisible:Z

    return v0
.end method

.method onBondingDockConnect()V
    .locals 1

    .prologue
    .line 198
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->connect(Z)V

    .line 199
    return-void
.end method

.method onBondingStateChanged(I)V
    .locals 2
    .param p1, "bondState"    # I

    .prologue
    const/4 v1, 0x0

    .line 528
    const/16 v0, 0xa

    if-ne p1, v0, :cond_0

    .line 529
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 530
    iput-boolean v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mConnectAfterPairing:Z

    .line 531
    invoke-virtual {p0, v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->setPhonebookPermissionChoice(I)V

    .line 532
    invoke-virtual {p0, v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->setMessagePermissionChoice(I)V

    .line 535
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->refresh()V

    .line 537
    const/16 v0, 0xc

    if-ne p1, v0, :cond_2

    .line 538
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->isBluetoothDock()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 539
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->onBondingDockConnect()V

    .line 543
    :cond_1
    :goto_0
    iput-boolean v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mConnectAfterPairing:Z

    .line 545
    :cond_2
    return-void

    .line 540
    :cond_3
    iget-boolean v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mConnectAfterPairing:Z

    if-eqz v0, :cond_1

    .line 541
    invoke-virtual {p0, v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->connect(Z)V

    goto :goto_0
.end method

.method onProfileStateChanged(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;I)V
    .locals 3
    .param p1, "profile"    # Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    .param p2, "newProfileState"    # I

    .prologue
    .line 123
    const-string v0, "CachedBluetoothDevice"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onProfileStateChanged: profile "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " newProfileState "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->getBluetoothState()I

    move-result v0

    const/16 v1, 0xd

    if-ne v0, v1, :cond_1

    .line 128
    const-string v0, "CachedBluetoothDevice"

    const-string v1, " BT Turninig Off...Profile conn state change ignored..."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    .end local p1    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    :cond_0
    :goto_0
    return-void

    .line 131
    .restart local p1    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfileConnectionState:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    const/4 v0, 0x2

    if-ne p2, v0, :cond_2

    .line 133
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 134
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mRemovedProfiles:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 135
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    instance-of v0, p1, Lcom/androie/settings/bluetooth/PanProfile;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/androie/settings/bluetooth/PanProfile;

    .end local p1    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {p1, v0}, Lcom/androie/settings/bluetooth/PanProfile;->isLocalRoleNap(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 139
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mLocalNapRoleConnected:Z

    goto :goto_0

    .line 142
    .restart local p1    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    :cond_2
    iget-boolean v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mLocalNapRoleConnected:Z

    if-eqz v0, :cond_0

    instance-of v0, p1, Lcom/androie/settings/bluetooth/PanProfile;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/androie/settings/bluetooth/PanProfile;

    iget-object v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0, v1}, Lcom/androie/settings/bluetooth/PanProfile;->isLocalRoleNap(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-nez p2, :cond_0

    .line 145
    const-string v0, "CachedBluetoothDevice"

    const-string v1, "Removing PanProfile from device after NAP disconnect"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 147
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mRemovedProfiles:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 148
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mLocalNapRoleConnected:Z

    goto :goto_0
.end method

.method onUuidChanged()V
    .locals 4

    .prologue
    .line 508
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->updateProfiles()Z

    .line 519
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mConnectAttempted:J

    const-wide/16 v2, 0x1388

    add-long/2addr v0, v2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 522
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->connectWithoutResettingTimer(Z)V

    .line 524
    :cond_0
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->dispatchAttributesChanged()V

    .line 525
    return-void
.end method

.method refresh()V
    .locals 0

    .prologue
    .line 398
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->dispatchAttributesChanged()V

    .line 399
    return-void
.end method

.method refreshBtClass()V
    .locals 0

    .prologue
    .line 500
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->fetchBtClass()V

    .line 501
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->dispatchAttributesChanged()V

    .line 502
    return-void
.end method

.method refreshName()V
    .locals 0

    .prologue
    .line 384
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->fetchName()V

    .line 385
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->dispatchAttributesChanged()V

    .line 386
    return-void
.end method

.method registerCallback(Lcom/androie/settings/bluetooth/CachedBluetoothDevice$Callback;)V
    .locals 2
    .param p1, "callback"    # Lcom/androie/settings/bluetooth/CachedBluetoothDevice$Callback;

    .prologue
    .line 578
    iget-object v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mCallbacks:Ljava/util/Collection;

    monitor-enter v1

    .line 579
    :try_start_0
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mCallbacks:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 580
    monitor-exit v1

    .line 581
    return-void

    .line 580
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method setBtClass(Landroid/bluetooth/BluetoothClass;)V
    .locals 1
    .param p1, "btClass"    # Landroid/bluetooth/BluetoothClass;

    .prologue
    .line 548
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mBtClass:Landroid/bluetooth/BluetoothClass;

    if-eq v0, p1, :cond_0

    .line 549
    iput-object p1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mBtClass:Landroid/bluetooth/BluetoothClass;

    .line 550
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->dispatchAttributesChanged()V

    .line 552
    :cond_0
    return-void
.end method

.method setMessagePermissionChoice(I)V
    .locals 1
    .param p1, "permissionChoice"    # I

    .prologue
    .line 658
    const-string v0, "bluetooth_message_permissions"

    invoke-direct {p0, v0, p1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->savePermissionChoice(Ljava/lang/String;I)V

    .line 659
    iput p1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mMessagePermissionChoice:I

    .line 660
    return-void
.end method

.method setName(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 371
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 372
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 374
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    .line 379
    :goto_0
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->dispatchAttributesChanged()V

    .line 381
    :cond_0
    return-void

    .line 376
    :cond_1
    iput-object p1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    .line 377
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0, p1}, Landroid/bluetooth/BluetoothDevice;->setAlias(Ljava/lang/String;)Z

    goto :goto_0
.end method

.method setPhonebookPermissionChoice(I)V
    .locals 1
    .param p1, "permissionChoice"    # I

    .prologue
    .line 653
    const-string v0, "bluetooth_phonebook_permission"

    invoke-direct {p0, v0, p1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->savePermissionChoice(Ljava/lang/String;I)V

    .line 654
    iput p1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mPhonebookPermissionChoice:I

    .line 655
    return-void
.end method

.method setRemovable(Z)V
    .locals 0
    .param p1, "removable"    # Z

    .prologue
    .line 418
    iput-boolean p1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDeviceRemove:Z

    .line 419
    return-void
.end method

.method setRssi(S)V
    .locals 1
    .param p1, "rssi"    # S

    .prologue
    .line 427
    iget-short v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mRssi:S

    if-eq v0, p1, :cond_0

    .line 428
    iput-short p1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mRssi:S

    .line 429
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->dispatchAttributesChanged()V

    .line 431
    :cond_0
    return-void
.end method

.method setVisible(Z)V
    .locals 1
    .param p1, "visible"    # Z

    .prologue
    .line 411
    iget-boolean v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mVisible:Z

    if-eq v0, p1, :cond_0

    .line 412
    iput-boolean p1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mVisible:Z

    .line 413
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->dispatchAttributesChanged()V

    .line 415
    :cond_0
    return-void
.end method

.method startPairing()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 287
    iget-object v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v1}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->isDiscovering()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 288
    iget-object v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v1}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->cancelDiscovery()V

    .line 291
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->createBond()Z

    move-result v1

    if-nez v1, :cond_1

    .line 292
    const/4 v0, 0x0

    .line 296
    :goto_0
    return v0

    .line 295
    :cond_1
    iput-boolean v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mConnectAfterPairing:Z

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 599
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method unpair()V
    .locals 6

    .prologue
    .line 308
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v1

    .line 310
    .local v1, "state":I
    const/16 v3, 0xb

    if-ne v1, v3, :cond_0

    .line 311
    iget-object v3, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->cancelBondProcess()Z

    .line 314
    :cond_0
    const/16 v3, 0xa

    if-eq v1, v3, :cond_1

    .line 315
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    .line 316
    .local v0, "dev":Landroid/bluetooth/BluetoothDevice;
    if-eqz v0, :cond_1

    .line 317
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->removeBond()Z

    move-result v2

    .line 318
    .local v2, "successful":Z
    if-eqz v2, :cond_1

    .line 320
    const-string v3, "CachedBluetoothDevice"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Command sent successfully:REMOVE_BOND "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct {p0, v5}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->describe(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->setRemovable(Z)V

    .line 329
    .end local v0    # "dev":Landroid/bluetooth/BluetoothDevice;
    .end local v2    # "successful":Z
    :cond_1
    return-void
.end method

.method unregisterCallback(Lcom/androie/settings/bluetooth/CachedBluetoothDevice$Callback;)V
    .locals 2
    .param p1, "callback"    # Lcom/androie/settings/bluetooth/CachedBluetoothDevice$Callback;

    .prologue
    .line 584
    iget-object v1, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mCallbacks:Ljava/util/Collection;

    monitor-enter v1

    .line 585
    :try_start_0
    iget-object v0, p0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->mCallbacks:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 586
    monitor-exit v1

    .line 587
    return-void

    .line 586
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
