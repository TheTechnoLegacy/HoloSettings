.class final Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;
.super Ljava/lang/Object;
.source "LocalBluetoothProfileManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$PanStateChangedHandler;,
        Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$StateChangedHandler;,
        Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;
    }
.end annotation


# instance fields
.field private mA2dpProfile:Lcom/jellybyn/settings/bluetooth/A2dpProfile;

.field private final mContext:Landroid/content/Context;

.field private final mDeviceManager:Lcom/jellybyn/settings/bluetooth/CachedBluetoothDeviceManager;

.field private final mEventManager:Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;

.field private mHeadsetProfile:Lcom/jellybyn/settings/bluetooth/HeadsetProfile;

.field private final mHidProfile:Lcom/jellybyn/settings/bluetooth/HidProfile;

.field private final mLocalAdapter:Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;

.field private mOppProfile:Lcom/jellybyn/settings/bluetooth/OppProfile;

.field private final mPanProfile:Lcom/jellybyn/settings/bluetooth/PanProfile;

.field private final mPbapProfile:Lcom/jellybyn/settings/bluetooth/PbapServerProfile;

.field private final mProfileNameMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;",
            ">;"
        }
    .end annotation
.end field

.field private final mServiceListeners:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;Lcom/jellybyn/settings/bluetooth/CachedBluetoothDeviceManager;Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "adapter"    # Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;
    .param p3, "deviceManager"    # Lcom/jellybyn/settings/bluetooth/CachedBluetoothDeviceManager;
    .param p4, "eventManager"    # Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;

    .prologue
    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mProfileNameMap:Ljava/util/Map;

    .line 179
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mServiceListeners:Ljava/util/Collection;

    .line 97
    iput-object p1, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mContext:Landroid/content/Context;

    .line 99
    iput-object p2, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mLocalAdapter:Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;

    .line 100
    iput-object p3, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mDeviceManager:Lcom/jellybyn/settings/bluetooth/CachedBluetoothDeviceManager;

    .line 101
    iput-object p4, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mEventManager:Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;

    .line 103
    iget-object v1, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mLocalAdapter:Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v1, p0}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;->setProfileManager(Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;)V

    .line 104
    iget-object v1, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mEventManager:Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;

    invoke-virtual {v1, p0}, Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;->setProfileManager(Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;)V

    .line 106
    invoke-virtual {p2}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;->getUuids()[Landroid/os/ParcelUuid;

    move-result-object v0

    .line 109
    .local v0, "uuids":[Landroid/os/ParcelUuid;
    if-eqz v0, :cond_0

    .line 110
    # invoke-virtual {p0, v0}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->updateLocalProfiles([Landroid/os/ParcelUuid;)V

    .line 114
    :cond_0
    new-instance v1, Lcom/jellybyn/settings/bluetooth/HidProfile;

    iget-object v2, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mLocalAdapter:Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;

    iget-object v3, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mDeviceManager:Lcom/jellybyn/settings/bluetooth/CachedBluetoothDeviceManager;

    invoke-direct {v1, p1, v2, v3, p0}, Lcom/jellybyn/settings/bluetooth/HidProfile;-><init>(Landroid/content/Context;Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;Lcom/jellybyn/settings/bluetooth/CachedBluetoothDeviceManager;Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;)V

    iput-object v1, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mHidProfile:Lcom/jellybyn/settings/bluetooth/HidProfile;

    .line 115
    iget-object v1, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mHidProfile:Lcom/jellybyn/settings/bluetooth/HidProfile;

    const-string v2, "HID"

    const-string v3, "android.bluetooth.input.profile.action.CONNECTION_STATE_CHANGED"

    invoke-direct {p0, v1, v2, v3}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->addProfile(Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    new-instance v1, Lcom/jellybyn/settings/bluetooth/PanProfile;

    invoke-direct {v1, p1}, Lcom/jellybyn/settings/bluetooth/PanProfile;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mPanProfile:Lcom/jellybyn/settings/bluetooth/PanProfile;

    .line 119
    iget-object v1, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mPanProfile:Lcom/jellybyn/settings/bluetooth/PanProfile;

    const-string v2, "PAN"

    const-string v3, "android.bluetooth.pan.profile.action.CONNECTION_STATE_CHANGED"

    invoke-direct {p0, v1, v2, v3}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->addPanProfile(Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    new-instance v1, Lcom/jellybyn/settings/bluetooth/PbapServerProfile;

    invoke-direct {v1, p1}, Lcom/jellybyn/settings/bluetooth/PbapServerProfile;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mPbapProfile:Lcom/jellybyn/settings/bluetooth/PbapServerProfile;

    .line 126
    const-string v1, "LocalBluetoothProfileManager"

    const-string v2, "LocalBluetoothProfileManager construction complete"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    return-void
.end method

.method static synthetic access$000(Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;)Lcom/jellybyn/settings/bluetooth/CachedBluetoothDeviceManager;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mDeviceManager:Lcom/jellybyn/settings/bluetooth/CachedBluetoothDeviceManager;

    return-object v0
.end method

.method static synthetic access$100(Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;)Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mLocalAdapter:Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;

    return-object v0
.end method

.method private addPanProfile(Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "profile"    # Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;
    .param p2, "profileName"    # Ljava/lang/String;
    .param p3, "stateChangedAction"    # Ljava/lang/String;

    .prologue
    .line 190
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mEventManager:Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;

    new-instance v1, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$PanStateChangedHandler;

    invoke-direct {v1, p0, p1}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$PanStateChangedHandler;-><init>(Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;)V

    invoke-virtual {v0, p3, v1}, Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;->addProfileHandler(Ljava/lang/String;Lcom/jellybyn/settings/bluetooth/BluetoothEventManager$Handler;)V

    .line 192
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mProfileNameMap:Ljava/util/Map;

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    return-void
.end method

.method private addProfile(Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "profile"    # Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;
    .param p2, "profileName"    # Ljava/lang/String;
    .param p3, "stateChangedAction"    # Ljava/lang/String;

    .prologue
    .line 184
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mEventManager:Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;

    new-instance v1, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$StateChangedHandler;

    invoke-direct {v1, p0, p1}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$StateChangedHandler;-><init>(Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;)V

    invoke-virtual {v0, p3, v1}, Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;->addProfileHandler(Ljava/lang/String;Lcom/jellybyn/settings/bluetooth/BluetoothEventManager$Handler;)V

    .line 185
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mProfileNameMap:Ljava/util/Map;

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    return-void
.end method


# virtual methods
.method addServiceListener(Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;)V
    .locals 1
    .param p1, "l"    # Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;

    .prologue
    .line 255
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mServiceListeners:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 256
    return-void
.end method

.method callServiceConnectedListeners()V
    .locals 3

    .prologue
    .line 265
    iget-object v2, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mServiceListeners:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;

    .line 266
    .local v1, "l":Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;
    invoke-interface {v1}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;->onServiceConnected()V

    goto :goto_0

    .line 268
    .end local v1    # "l":Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;
    :cond_0
    return-void
.end method

.method callServiceDisconnectedListeners()V
    .locals 3

    .prologue
    .line 272
    iget-object v2, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mServiceListeners:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;

    .line 273
    .local v1, "listener":Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;
    invoke-interface {v1}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;->onServiceDisconnected()V

    goto :goto_0

    .line 275
    .end local v1    # "listener":Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;
    :cond_0
    return-void
.end method

.method getA2dpProfile()Lcom/jellybyn/settings/bluetooth/A2dpProfile;
    .locals 1

    .prologue
    .line 293
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mA2dpProfile:Lcom/jellybyn/settings/bluetooth/A2dpProfile;

    return-object v0
.end method

.method getHeadsetProfile()Lcom/jellybyn/settings/bluetooth/HeadsetProfile;
    .locals 1

    .prologue
    .line 297
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mHeadsetProfile:Lcom/jellybyn/settings/bluetooth/HeadsetProfile;

    return-object v0
.end method

.method getPbapProfile()Lcom/jellybyn/settings/bluetooth/PbapServerProfile;
    .locals 1

    .prologue
    .line 301
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mPbapProfile:Lcom/jellybyn/settings/bluetooth/PbapServerProfile;

    return-object v0
.end method

.method getProfileByName(Ljava/lang/String;)Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 196
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mProfileNameMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;

    return-object v0
.end method

.method public declared-synchronized isManagerReady()Z
    .locals 2

    .prologue
    .line 281
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mHeadsetProfile:Lcom/jellybyn/settings/bluetooth/HeadsetProfile;

    .line 282
    .local v0, "profile":Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;
    if-eqz v0, :cond_0

    .line 283
    invoke-interface {v0}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;->isProfileReady()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 289
    :goto_0
    monitor-exit p0

    return v1

    .line 285
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mA2dpProfile:Lcom/jellybyn/settings/bluetooth/A2dpProfile;

    .line 286
    if-eqz v0, :cond_1

    .line 287
    invoke-interface {v0}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;->isProfileReady()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    goto :goto_0

    .line 289
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 281
    .end local v0    # "profile":Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method removeServiceListener(Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;)V
    .locals 1
    .param p1, "l"    # Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$ServiceListener;

    .prologue
    .line 260
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mServiceListeners:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 261
    return-void
.end method

.method setBluetoothStateOn()V
    .locals 2

    .prologue
    .line 201
    iget-object v1, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mLocalAdapter:Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v1}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;->getUuids()[Landroid/os/ParcelUuid;

    move-result-object v0

    .line 202
    .local v0, "uuids":[Landroid/os/ParcelUuid;
    if-eqz v0, :cond_0

    .line 203
    invoke-virtual {p0, v0}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->updateLocalProfiles([Landroid/os/ParcelUuid;)V

    .line 205
    :cond_0
    iget-object v1, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mEventManager:Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;

    invoke-virtual {v1}, Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;->readPairedDevices()Z

    .line 206
    return-void
.end method

.method updateLocalProfiles([Landroid/os/ParcelUuid;)V
    .locals 4
    .param p1, "uuids"    # [Landroid/os/ParcelUuid;

    .prologue
    .line 138
    # sget-object v0, Landroid/bluetooth/BluetoothUuid;->AudioSource:Landroid/os/ParcelUuid;

    # invoke-static {p1, v0}, Landroid/bluetooth/BluetoothUuid;->isUuidPresent([Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;)Z

    # move-result v0

    # if-eqz v0, :cond_4

    .line 139
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mA2dpProfile:Lcom/jellybyn/settings/bluetooth/A2dpProfile;

    if-nez v0, :cond_0

    .line 140
    const-string v0, "LocalBluetoothProfileManager"

    const-string v1, "Adding local A2DP profile"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    new-instance v0, Lcom/jellybyn/settings/bluetooth/A2dpProfile;

    iget-object v1, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mLocalAdapter:Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;

    iget-object v3, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mDeviceManager:Lcom/jellybyn/settings/bluetooth/CachedBluetoothDeviceManager;

    invoke-direct {v0, v1, v2, v3, p0}, Lcom/jellybyn/settings/bluetooth/A2dpProfile;-><init>(Landroid/content/Context;Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;Lcom/jellybyn/settings/bluetooth/CachedBluetoothDeviceManager;Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;)V

    iput-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mA2dpProfile:Lcom/jellybyn/settings/bluetooth/A2dpProfile;

    .line 142
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mA2dpProfile:Lcom/jellybyn/settings/bluetooth/A2dpProfile;

    const-string v1, "A2DP"

    const-string v2, "android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED"

    invoke-direct {p0, v0, v1, v2}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->addProfile(Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;Ljava/lang/String;Ljava/lang/String;)V

    .line 150
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

    .line 152
    :cond_1
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mHeadsetProfile:Lcom/jellybyn/settings/bluetooth/HeadsetProfile;

    if-nez v0, :cond_2

    .line 153
    const-string v0, "LocalBluetoothProfileManager"

    const-string v1, "Adding local HEADSET profile"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    new-instance v0, Lcom/jellybyn/settings/bluetooth/HeadsetProfile;

    iget-object v1, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mLocalAdapter:Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;

    iget-object v3, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mDeviceManager:Lcom/jellybyn/settings/bluetooth/CachedBluetoothDeviceManager;

    invoke-direct {v0, v1, v2, v3, p0}, Lcom/jellybyn/settings/bluetooth/HeadsetProfile;-><init>(Landroid/content/Context;Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;Lcom/jellybyn/settings/bluetooth/CachedBluetoothDeviceManager;Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;)V

    iput-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mHeadsetProfile:Lcom/jellybyn/settings/bluetooth/HeadsetProfile;

    .line 156
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mHeadsetProfile:Lcom/jellybyn/settings/bluetooth/HeadsetProfile;

    const-string v1, "HEADSET"

    const-string v2, "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"

    invoke-direct {p0, v0, v1, v2}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->addProfile(Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    :cond_2
    :goto_1
    sget-object v0, Landroid/bluetooth/BluetoothUuid;->ObexObjectPush:Landroid/os/ParcelUuid;

    invoke-static {p1, v0}, Landroid/bluetooth/BluetoothUuid;->isUuidPresent([Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 165
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mOppProfile:Lcom/jellybyn/settings/bluetooth/OppProfile;

    if-nez v0, :cond_3

    .line 166
    const-string v0, "LocalBluetoothProfileManager"

    const-string v1, "Adding local OPP profile"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    new-instance v0, Lcom/jellybyn/settings/bluetooth/OppProfile;

    invoke-direct {v0}, Lcom/jellybyn/settings/bluetooth/OppProfile;-><init>()V

    iput-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mOppProfile:Lcom/jellybyn/settings/bluetooth/OppProfile;

    .line 169
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mProfileNameMap:Ljava/util/Map;

    const-string v1, "OPP"

    iget-object v2, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mOppProfile:Lcom/jellybyn/settings/bluetooth/OppProfile;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mEventManager:Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;

    invoke-virtual {v0}, Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;->registerProfileIntentReceiver()V

    .line 177
    return-void

    .line 145
    :cond_4
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mA2dpProfile:Lcom/jellybyn/settings/bluetooth/A2dpProfile;

    if-eqz v0, :cond_0

    .line 146
    const-string v0, "LocalBluetoothProfileManager"

    const-string v1, "Warning: A2DP profile was previously added but the UUID is now missing."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 159
    :cond_5
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mHeadsetProfile:Lcom/jellybyn/settings/bluetooth/HeadsetProfile;

    if-eqz v0, :cond_2

    .line 160
    const-string v0, "LocalBluetoothProfileManager"

    const-string v1, "Warning: HEADSET profile was previously added but the UUID is now missing."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 171
    :cond_6
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mOppProfile:Lcom/jellybyn/settings/bluetooth/OppProfile;

    if-eqz v0, :cond_3

    .line 172
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
            "Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 319
    .local p3, "profiles":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;>;"
    .local p4, "removedProfiles":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;>;"
    monitor-enter p0

    :try_start_0
    invoke-interface {p4}, Ljava/util/Collection;->clear()V

    .line 320
    invoke-interface {p4, p3}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 321
    invoke-interface {p3}, Ljava/util/Collection;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 323
    if-nez p1, :cond_1

    .line 362
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 327
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mHeadsetProfile:Lcom/jellybyn/settings/bluetooth/HeadsetProfile;

    if-eqz v0, :cond_4

    .line 328
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

    .line 332
    :cond_3
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mHeadsetProfile:Lcom/jellybyn/settings/bluetooth/HeadsetProfile;

    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 333
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mHeadsetProfile:Lcom/jellybyn/settings/bluetooth/HeadsetProfile;

    invoke-interface {p4, v0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 337
    :cond_4
    sget-object v0, Lcom/jellybyn/settings/bluetooth/A2dpProfile;->SINK_UUIDS:[Landroid/os/ParcelUuid;

    invoke-static {p1, v0}, Landroid/bluetooth/BluetoothUuid;->containsAnyUuid([Landroid/os/ParcelUuid;[Landroid/os/ParcelUuid;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mA2dpProfile:Lcom/jellybyn/settings/bluetooth/A2dpProfile;

    if-eqz v0, :cond_5

    .line 339
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mA2dpProfile:Lcom/jellybyn/settings/bluetooth/A2dpProfile;

    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 340
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mA2dpProfile:Lcom/jellybyn/settings/bluetooth/A2dpProfile;

    invoke-interface {p4, v0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 343
    :cond_5
    sget-object v0, Landroid/bluetooth/BluetoothUuid;->ObexObjectPush:Landroid/os/ParcelUuid;

    invoke-static {p1, v0}, Landroid/bluetooth/BluetoothUuid;->isUuidPresent([Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mOppProfile:Lcom/jellybyn/settings/bluetooth/OppProfile;

    if-eqz v0, :cond_6

    .line 345
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mOppProfile:Lcom/jellybyn/settings/bluetooth/OppProfile;

    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 346
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mOppProfile:Lcom/jellybyn/settings/bluetooth/OppProfile;

    invoke-interface {p4, v0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 349
    :cond_6
    sget-object v0, Landroid/bluetooth/BluetoothUuid;->Hid:Landroid/os/ParcelUuid;

    invoke-static {p1, v0}, Landroid/bluetooth/BluetoothUuid;->isUuidPresent([Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mHidProfile:Lcom/jellybyn/settings/bluetooth/HidProfile;

    if-eqz v0, :cond_7

    .line 351
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mHidProfile:Lcom/jellybyn/settings/bluetooth/HidProfile;

    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 352
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mHidProfile:Lcom/jellybyn/settings/bluetooth/HidProfile;

    invoke-interface {p4, v0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 355
    :cond_7
    if-eqz p5, :cond_8

    .line 356
    const-string v0, "LocalBluetoothProfileManager"

    const-string v1, "Valid PAN-NAP connection exists."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    :cond_8
    sget-object v0, Landroid/bluetooth/BluetoothUuid;->NAP:Landroid/os/ParcelUuid;

    invoke-static {p1, v0}, Landroid/bluetooth/BluetoothUuid;->isUuidPresent([Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;)Z

    move-result v0

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mPanProfile:Lcom/jellybyn/settings/bluetooth/PanProfile;

    if-nez v0, :cond_a

    :cond_9
    if-eqz p5, :cond_0

    .line 359
    :cond_a
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mPanProfile:Lcom/jellybyn/settings/bluetooth/PanProfile;

    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 360
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;->mPanProfile:Lcom/jellybyn/settings/bluetooth/PanProfile;

    invoke-interface {p4, v0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 319
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
