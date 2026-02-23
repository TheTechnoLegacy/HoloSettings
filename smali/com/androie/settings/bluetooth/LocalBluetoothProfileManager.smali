.class final Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;
.super Ljava/lang/Object;
.source "LocalBluetoothProfileManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$PanStateChangedHandler;,
        Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$StateChangedHandler;,
        Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;
    }
.end annotation


# instance fields
.field private mA2dpProfile:Lcom/androie/settings/bluetooth/A2dpProfile;

.field private final mContext:Landroid/content/Context;

.field private final mDeviceManager:Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;

.field private mDunProfile:Lcom/androie/settings/bluetooth/DunServerProfile;

.field private final mEventManager:Lcom/androie/settings/bluetooth/BluetoothEventManager;

.field private mHeadsetProfile:Lcom/androie/settings/bluetooth/HeadsetProfile;

.field private final mHidProfile:Lcom/androie/settings/bluetooth/HidProfile;

.field private final mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

.field private mOppProfile:Lcom/androie/settings/bluetooth/OppProfile;

.field private final mPanProfile:Lcom/androie/settings/bluetooth/PanProfile;

.field private final mPbapProfile:Lcom/androie/settings/bluetooth/PbapServerProfile;

.field private final mProfileNameMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/androie/settings/bluetooth/LocalBluetoothProfile;",
            ">;"
        }
    .end annotation
.end field

.field private mSapProfile:Lcom/androie/settings/bluetooth/SapServerProfile;

.field private final mServiceListeners:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;Lcom/androie/settings/bluetooth/BluetoothEventManager;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "adapter"    # Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;
    .param p3, "deviceManager"    # Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;
    .param p4, "eventManager"    # Lcom/androie/settings/bluetooth/BluetoothEventManager;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mProfileNameMap:Ljava/util/Map;

    .line 198
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mServiceListeners:Ljava/util/Collection;

    .line 102
    iput-object p1, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mContext:Landroid/content/Context;

    .line 104
    iput-object p2, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    .line 105
    iput-object p3, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mDeviceManager:Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;

    .line 106
    iput-object p4, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mEventManager:Lcom/androie/settings/bluetooth/BluetoothEventManager;

    .line 108
    iget-object v1, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v1, p0}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->setProfileManager(Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;)V

    .line 109
    iget-object v1, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mEventManager:Lcom/androie/settings/bluetooth/BluetoothEventManager;

    invoke-virtual {v1, p0}, Lcom/androie/settings/bluetooth/BluetoothEventManager;->setProfileManager(Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;)V

    .line 111
    invoke-virtual {p2}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->getUuids()[Landroid/os/ParcelUuid;

    move-result-object v0

    .line 114
    .local v0, "uuids":[Landroid/os/ParcelUuid;
    if-eqz v0, :cond_0

    .line 115
    invoke-virtual {p0, v0}, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->updateLocalProfiles([Landroid/os/ParcelUuid;)V

    .line 119
    :cond_0
    new-instance v1, Lcom/androie/settings/bluetooth/HidProfile;

    iget-object v2, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    iget-object v3, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mDeviceManager:Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;

    invoke-direct {v1, p1, v2, v3, p0}, Lcom/androie/settings/bluetooth/HidProfile;-><init>(Landroid/content/Context;Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;)V

    iput-object v1, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mHidProfile:Lcom/androie/settings/bluetooth/HidProfile;

    .line 120
    iget-object v1, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mHidProfile:Lcom/androie/settings/bluetooth/HidProfile;

    const-string v2, "HID"

    const-string v3, "android.bluetooth.input.profile.action.CONNECTION_STATE_CHANGED"

    invoke-direct {p0, v1, v2, v3}, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->addProfile(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    new-instance v1, Lcom/androie/settings/bluetooth/PanProfile;

    invoke-direct {v1, p1}, Lcom/androie/settings/bluetooth/PanProfile;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mPanProfile:Lcom/androie/settings/bluetooth/PanProfile;

    .line 124
    iget-object v1, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mPanProfile:Lcom/androie/settings/bluetooth/PanProfile;

    const-string v2, "PAN"

    const-string v3, "android.bluetooth.pan.profile.action.CONNECTION_STATE_CHANGED"

    invoke-direct {p0, v1, v2, v3}, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->addPanProfile(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    const-string v1, "ro.bluetooth.sap"

    invoke-static {v1, v4}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-ne v1, v5, :cond_1

    .line 129
    new-instance v1, Lcom/androie/settings/bluetooth/SapServerProfile;

    invoke-direct {v1, p1}, Lcom/androie/settings/bluetooth/SapServerProfile;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mSapProfile:Lcom/androie/settings/bluetooth/SapServerProfile;

    .line 130
    iget-object v1, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mSapProfile:Lcom/androie/settings/bluetooth/SapServerProfile;

    const-string v2, "SAP Server"

    const-string v3, "codeaurora.bluetooth.sap.profile.action.CONNECTION_STATE_CHANGED"

    invoke-direct {p0, v1, v2, v3}, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->addProfile(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    :cond_1
    const-string v1, "ro.bluetooth.dun"

    invoke-static {v1, v4}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-ne v1, v5, :cond_2

    .line 135
    new-instance v1, Lcom/androie/settings/bluetooth/DunServerProfile;

    invoke-direct {v1, p1}, Lcom/androie/settings/bluetooth/DunServerProfile;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mDunProfile:Lcom/androie/settings/bluetooth/DunServerProfile;

    .line 136
    iget-object v1, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mDunProfile:Lcom/androie/settings/bluetooth/DunServerProfile;

    const-string v2, "DUN Server"

    const-string v3, "codeaurora.bluetooth.dun.profile.action.CONNECTION_STATE_CHANGED"

    invoke-direct {p0, v1, v2, v3}, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->addProfile(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    :cond_2
    new-instance v1, Lcom/androie/settings/bluetooth/PbapServerProfile;

    invoke-direct {v1, p1}, Lcom/androie/settings/bluetooth/PbapServerProfile;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mPbapProfile:Lcom/androie/settings/bluetooth/PbapServerProfile;

    .line 145
    const-string v1, "LocalBluetoothProfileManager"

    const-string v2, "LocalBluetoothProfileManager construction complete"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;)Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mDeviceManager:Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;

    return-object v0
.end method

.method static synthetic access$100(Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;)Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    return-object v0
.end method

.method private addPanProfile(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "profile"    # Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    .param p2, "profileName"    # Ljava/lang/String;
    .param p3, "stateChangedAction"    # Ljava/lang/String;

    .prologue
    .line 209
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mEventManager:Lcom/androie/settings/bluetooth/BluetoothEventManager;

    new-instance v1, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$PanStateChangedHandler;

    invoke-direct {v1, p0, p1}, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$PanStateChangedHandler;-><init>(Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V

    invoke-virtual {v0, p3, v1}, Lcom/androie/settings/bluetooth/BluetoothEventManager;->addProfileHandler(Ljava/lang/String;Lcom/androie/settings/bluetooth/BluetoothEventManager$Handler;)V

    .line 211
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mProfileNameMap:Ljava/util/Map;

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    return-void
.end method

.method private addProfile(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "profile"    # Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    .param p2, "profileName"    # Ljava/lang/String;
    .param p3, "stateChangedAction"    # Ljava/lang/String;

    .prologue
    .line 203
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mEventManager:Lcom/androie/settings/bluetooth/BluetoothEventManager;

    new-instance v1, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$StateChangedHandler;

    invoke-direct {v1, p0, p1}, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$StateChangedHandler;-><init>(Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V

    invoke-virtual {v0, p3, v1}, Lcom/androie/settings/bluetooth/BluetoothEventManager;->addProfileHandler(Ljava/lang/String;Lcom/androie/settings/bluetooth/BluetoothEventManager$Handler;)V

    .line 204
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mProfileNameMap:Ljava/util/Map;

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    return-void
.end method


# virtual methods
.method addServiceListener(Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;)V
    .locals 1
    .param p1, "l"    # Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;

    .prologue
    .line 274
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mServiceListeners:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 275
    return-void
.end method

.method callServiceConnectedListeners()V
    .locals 3

    .prologue
    .line 284
    iget-object v2, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mServiceListeners:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;

    .line 285
    .local v1, "l":Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;
    invoke-interface {v1}, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;->onServiceConnected()V

    goto :goto_0

    .line 287
    .end local v1    # "l":Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;
    :cond_0
    return-void
.end method

.method callServiceDisconnectedListeners()V
    .locals 3

    .prologue
    .line 291
    iget-object v2, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mServiceListeners:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;

    .line 292
    .local v1, "listener":Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;
    invoke-interface {v1}, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;->onServiceDisconnected()V

    goto :goto_0

    .line 294
    .end local v1    # "listener":Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;
    :cond_0
    return-void
.end method

.method getA2dpProfile()Lcom/androie/settings/bluetooth/A2dpProfile;
    .locals 1

    .prologue
    .line 312
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mA2dpProfile:Lcom/androie/settings/bluetooth/A2dpProfile;

    return-object v0
.end method

.method getHeadsetProfile()Lcom/androie/settings/bluetooth/HeadsetProfile;
    .locals 1

    .prologue
    .line 316
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mHeadsetProfile:Lcom/androie/settings/bluetooth/HeadsetProfile;

    return-object v0
.end method

.method getPbapProfile()Lcom/androie/settings/bluetooth/PbapServerProfile;
    .locals 1

    .prologue
    .line 320
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mPbapProfile:Lcom/androie/settings/bluetooth/PbapServerProfile;

    return-object v0
.end method

.method getProfileByName(Ljava/lang/String;)Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 215
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mProfileNameMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    return-object v0
.end method

.method public declared-synchronized isManagerReady()Z
    .locals 2

    .prologue
    .line 300
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mHeadsetProfile:Lcom/androie/settings/bluetooth/HeadsetProfile;

    .line 301
    .local v0, "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    if-eqz v0, :cond_0

    .line 302
    invoke-interface {v0}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->isProfileReady()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 308
    :goto_0
    monitor-exit p0

    return v1

    .line 304
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mA2dpProfile:Lcom/androie/settings/bluetooth/A2dpProfile;

    .line 305
    if-eqz v0, :cond_1

    .line 306
    invoke-interface {v0}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->isProfileReady()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    goto :goto_0

    .line 308
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 300
    .end local v0    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method removeServiceListener(Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;)V
    .locals 1
    .param p1, "l"    # Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;

    .prologue
    .line 279
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mServiceListeners:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 280
    return-void
.end method

.method setBluetoothStateOn()V
    .locals 2

    .prologue
    .line 220
    iget-object v1, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v1}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->getUuids()[Landroid/os/ParcelUuid;

    move-result-object v0

    .line 221
    .local v0, "uuids":[Landroid/os/ParcelUuid;
    if-eqz v0, :cond_0

    .line 222
    invoke-virtual {p0, v0}, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->updateLocalProfiles([Landroid/os/ParcelUuid;)V

    .line 224
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mEventManager:Lcom/androie/settings/bluetooth/BluetoothEventManager;

    invoke-virtual {v1}, Lcom/androie/settings/bluetooth/BluetoothEventManager;->readPairedDevices()Z

    .line 225
    return-void
.end method

.method updateLocalProfiles([Landroid/os/ParcelUuid;)V
    .locals 4
    .param p1, "uuids"    # [Landroid/os/ParcelUuid;

    .prologue
    .line 157
    sget-object v0, Landroid/bluetooth/BluetoothUuid;->AudioSource:Landroid/os/ParcelUuid;

    invoke-static {p1, v0}, Landroid/bluetooth/BluetoothUuid;->isUuidPresent([Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 158
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mA2dpProfile:Lcom/androie/settings/bluetooth/A2dpProfile;

    if-nez v0, :cond_0

    .line 159
    const-string v0, "LocalBluetoothProfileManager"

    const-string v1, "Adding local A2DP profile"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    new-instance v0, Lcom/androie/settings/bluetooth/A2dpProfile;

    iget-object v1, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    iget-object v3, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mDeviceManager:Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;

    invoke-direct {v0, v1, v2, v3, p0}, Lcom/androie/settings/bluetooth/A2dpProfile;-><init>(Landroid/content/Context;Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;)V

    iput-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mA2dpProfile:Lcom/androie/settings/bluetooth/A2dpProfile;

    .line 161
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mA2dpProfile:Lcom/androie/settings/bluetooth/A2dpProfile;

    const-string v1, "A2DP"

    const-string v2, "android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED"

    invoke-direct {p0, v0, v1, v2}, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->addProfile(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    :cond_0
    :goto_0
    sget-object v0, Landroid/bluetooth/BluetoothUuid;->Handsfree_AG:Landroid/os/ParcelUuid;

    invoke-static {p1, v0}, Landroid/bluetooth/BluetoothUuid;->isUuidPresent([Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Landroid/bluetooth/BluetoothUuid;->HSP_AG:Landroid/os/ParcelUuid;

    invoke-static {p1, v0}, Landroid/bluetooth/BluetoothUuid;->isUuidPresent([Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 171
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mHeadsetProfile:Lcom/androie/settings/bluetooth/HeadsetProfile;

    if-nez v0, :cond_2

    .line 172
    const-string v0, "LocalBluetoothProfileManager"

    const-string v1, "Adding local HEADSET profile"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    new-instance v0, Lcom/androie/settings/bluetooth/HeadsetProfile;

    iget-object v1, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    iget-object v3, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mDeviceManager:Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;

    invoke-direct {v0, v1, v2, v3, p0}, Lcom/androie/settings/bluetooth/HeadsetProfile;-><init>(Landroid/content/Context;Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;)V

    iput-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mHeadsetProfile:Lcom/androie/settings/bluetooth/HeadsetProfile;

    .line 175
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mHeadsetProfile:Lcom/androie/settings/bluetooth/HeadsetProfile;

    const-string v1, "HEADSET"

    const-string v2, "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"

    invoke-direct {p0, v0, v1, v2}, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->addProfile(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    :cond_2
    :goto_1
    sget-object v0, Landroid/bluetooth/BluetoothUuid;->ObexObjectPush:Landroid/os/ParcelUuid;

    invoke-static {p1, v0}, Landroid/bluetooth/BluetoothUuid;->isUuidPresent([Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 184
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mOppProfile:Lcom/androie/settings/bluetooth/OppProfile;

    if-nez v0, :cond_3

    .line 185
    const-string v0, "LocalBluetoothProfileManager"

    const-string v1, "Adding local OPP profile"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    new-instance v0, Lcom/androie/settings/bluetooth/OppProfile;

    invoke-direct {v0}, Lcom/androie/settings/bluetooth/OppProfile;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mOppProfile:Lcom/androie/settings/bluetooth/OppProfile;

    .line 188
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mProfileNameMap:Ljava/util/Map;

    const-string v1, "OPP"

    iget-object v2, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mOppProfile:Lcom/androie/settings/bluetooth/OppProfile;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mEventManager:Lcom/androie/settings/bluetooth/BluetoothEventManager;

    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/BluetoothEventManager;->registerProfileIntentReceiver()V

    .line 196
    return-void

    .line 164
    :cond_4
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mA2dpProfile:Lcom/androie/settings/bluetooth/A2dpProfile;

    if-eqz v0, :cond_0

    .line 165
    const-string v0, "LocalBluetoothProfileManager"

    const-string v1, "Warning: A2DP profile was previously added but the UUID is now missing."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 178
    :cond_5
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mHeadsetProfile:Lcom/androie/settings/bluetooth/HeadsetProfile;

    if-eqz v0, :cond_2

    .line 179
    const-string v0, "LocalBluetoothProfileManager"

    const-string v1, "Warning: HEADSET profile was previously added but the UUID is now missing."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 190
    :cond_6
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mOppProfile:Lcom/androie/settings/bluetooth/OppProfile;

    if-eqz v0, :cond_3

    .line 191
    const-string v0, "LocalBluetoothProfileManager"

    const-string v1, "Warning: OPP profile was previously added but the UUID is now missing."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method declared-synchronized updateProfiles([Landroid/os/ParcelUuid;[Landroid/os/ParcelUuid;Ljava/util/Collection;Ljava/util/Collection;Z)V
    .locals 2
    .param p1, "uuids"    # [Landroid/os/ParcelUuid;
    .param p2, "localUuids"    # [Landroid/os/ParcelUuid;
    .param p5, "isPanNapConnected"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/os/ParcelUuid;",
            "[",
            "Landroid/os/ParcelUuid;",
            "Ljava/util/Collection",
            "<",
            "Lcom/androie/settings/bluetooth/LocalBluetoothProfile;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Lcom/androie/settings/bluetooth/LocalBluetoothProfile;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 338
    .local p3, "profiles":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/androie/settings/bluetooth/LocalBluetoothProfile;>;"
    .local p4, "removedProfiles":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/androie/settings/bluetooth/LocalBluetoothProfile;>;"
    monitor-enter p0

    :try_start_0
    invoke-interface {p4}, Ljava/util/Collection;->clear()V

    .line 339
    invoke-interface {p4, p3}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 340
    invoke-interface {p3}, Ljava/util/Collection;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 342
    if-nez p1, :cond_1

    .line 381
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 346
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mHeadsetProfile:Lcom/androie/settings/bluetooth/HeadsetProfile;

    if-eqz v0, :cond_4

    .line 347
    sget-object v0, Landroid/bluetooth/BluetoothUuid;->HSP_AG:Landroid/os/ParcelUuid;

    invoke-static {p2, v0}, Landroid/bluetooth/BluetoothUuid;->isUuidPresent([Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Landroid/bluetooth/BluetoothUuid;->HSP:Landroid/os/ParcelUuid;

    invoke-static {p1, v0}, Landroid/bluetooth/BluetoothUuid;->isUuidPresent([Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;)Z

    move-result v0

    if-nez v0, :cond_3

    :cond_2
    sget-object v0, Landroid/bluetooth/BluetoothUuid;->Handsfree_AG:Landroid/os/ParcelUuid;

    invoke-static {p2, v0}, Landroid/bluetooth/BluetoothUuid;->isUuidPresent([Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;)Z

    move-result v0

    if-eqz v0, :cond_4

    sget-object v0, Landroid/bluetooth/BluetoothUuid;->Handsfree:Landroid/os/ParcelUuid;

    invoke-static {p1, v0}, Landroid/bluetooth/BluetoothUuid;->isUuidPresent([Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 351
    :cond_3
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mHeadsetProfile:Lcom/androie/settings/bluetooth/HeadsetProfile;

    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 352
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mHeadsetProfile:Lcom/androie/settings/bluetooth/HeadsetProfile;

    invoke-interface {p4, v0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 356
    :cond_4
    sget-object v0, Lcom/androie/settings/bluetooth/A2dpProfile;->SINK_UUIDS:[Landroid/os/ParcelUuid;

    invoke-static {p1, v0}, Landroid/bluetooth/BluetoothUuid;->containsAnyUuid([Landroid/os/ParcelUuid;[Landroid/os/ParcelUuid;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mA2dpProfile:Lcom/androie/settings/bluetooth/A2dpProfile;

    if-eqz v0, :cond_5

    .line 358
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mA2dpProfile:Lcom/androie/settings/bluetooth/A2dpProfile;

    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 359
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mA2dpProfile:Lcom/androie/settings/bluetooth/A2dpProfile;

    invoke-interface {p4, v0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 362
    :cond_5
    sget-object v0, Landroid/bluetooth/BluetoothUuid;->ObexObjectPush:Landroid/os/ParcelUuid;

    invoke-static {p1, v0}, Landroid/bluetooth/BluetoothUuid;->isUuidPresent([Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mOppProfile:Lcom/androie/settings/bluetooth/OppProfile;

    if-eqz v0, :cond_6

    .line 364
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mOppProfile:Lcom/androie/settings/bluetooth/OppProfile;

    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 365
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mOppProfile:Lcom/androie/settings/bluetooth/OppProfile;

    invoke-interface {p4, v0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 368
    :cond_6
    sget-object v0, Landroid/bluetooth/BluetoothUuid;->Hid:Landroid/os/ParcelUuid;

    invoke-static {p1, v0}, Landroid/bluetooth/BluetoothUuid;->isUuidPresent([Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mHidProfile:Lcom/androie/settings/bluetooth/HidProfile;

    if-eqz v0, :cond_7

    .line 370
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mHidProfile:Lcom/androie/settings/bluetooth/HidProfile;

    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 371
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mHidProfile:Lcom/androie/settings/bluetooth/HidProfile;

    invoke-interface {p4, v0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 374
    :cond_7
    if-eqz p5, :cond_8

    .line 375
    const-string v0, "LocalBluetoothProfileManager"

    const-string v1, "Valid PAN-NAP connection exists."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 376
    :cond_8
    sget-object v0, Landroid/bluetooth/BluetoothUuid;->NAP:Landroid/os/ParcelUuid;

    invoke-static {p1, v0}, Landroid/bluetooth/BluetoothUuid;->isUuidPresent([Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;)Z

    move-result v0

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mPanProfile:Lcom/androie/settings/bluetooth/PanProfile;

    if-nez v0, :cond_a

    :cond_9
    if-eqz p5, :cond_0

    .line 378
    :cond_a
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mPanProfile:Lcom/androie/settings/bluetooth/PanProfile;

    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 379
    iget-object v0, p0, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->mPanProfile:Lcom/androie/settings/bluetooth/PanProfile;

    invoke-interface {p4, v0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 338
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
