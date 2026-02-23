.class public abstract Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "DeviceListPreferenceFragment.java"

# interfaces
.implements Lcom/androie/settings/bluetooth/BluetoothCallback;


# instance fields
.field private mDeviceListGroup:Landroid/preference/PreferenceGroup;

.field final mDevicePreferenceMap:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Lcom/androie/settings/bluetooth/CachedBluetoothDevice;",
            "Lcom/androie/settings/bluetooth/BluetoothDevicePreference;",
            ">;"
        }
    .end annotation
.end field

.field private mFilter:Lcom/androie/settings/bluetooth/BluetoothDeviceFilter$Filter;

.field mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

.field mLocalManager:Lcom/androie/settings/bluetooth/LocalBluetoothManager;

.field mSelectedDevice:Landroid/bluetooth/BluetoothDevice;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 61
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    .line 58
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mDevicePreferenceMap:Ljava/util/WeakHashMap;

    .line 62
    sget-object v0, Lcom/androie/settings/bluetooth/BluetoothDeviceFilter;->ALL_FILTER:Lcom/androie/settings/bluetooth/BluetoothDeviceFilter$Filter;

    iput-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mFilter:Lcom/androie/settings/bluetooth/BluetoothDeviceFilter$Filter;

    .line 63
    return-void
.end method

.method private updateProgressUi(Z)V
    .locals 1
    .param p1, "start"    # Z

    .prologue
    .line 221
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mDeviceListGroup:Landroid/preference/PreferenceGroup;

    instance-of v0, v0, Lcom/androie/settings/bluetooth/BluetoothProgressCategory;

    if-eqz v0, :cond_0

    .line 222
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mDeviceListGroup:Landroid/preference/PreferenceGroup;

    check-cast v0, Lcom/androie/settings/bluetooth/BluetoothProgressCategory;

    invoke-virtual {v0, p1}, Lcom/androie/settings/bluetooth/BluetoothProgressCategory;->setProgress(Z)V

    .line 224
    :cond_0
    return-void
.end method


# virtual methods
.method addCachedDevices()V
    .locals 4

    .prologue
    .line 129
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {v3}, Lcom/androie/settings/bluetooth/LocalBluetoothManager;->getCachedDeviceManager()Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;->getCachedDevicesCopy()Ljava/util/Collection;

    move-result-object v1

    .line 131
    .local v1, "cachedDevices":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/androie/settings/bluetooth/CachedBluetoothDevice;>;"
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    .line 132
    .local v0, "cachedDevice":Lcom/androie/settings/bluetooth/CachedBluetoothDevice;
    invoke-virtual {p0, v0}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->onDeviceAdded(Lcom/androie/settings/bluetooth/CachedBluetoothDevice;)V

    goto :goto_0

    .line 134
    .end local v0    # "cachedDevice":Lcom/androie/settings/bluetooth/CachedBluetoothDevice;
    :cond_0
    return-void
.end method

.method abstract addPreferencesForActivity()V
.end method

.method createDevicePreference(Lcom/androie/settings/bluetooth/CachedBluetoothDevice;)V
    .locals 2
    .param p1, "cachedDevice"    # Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    .prologue
    .line 190
    new-instance v0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;

    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;-><init>(Landroid/content/Context;Lcom/androie/settings/bluetooth/CachedBluetoothDevice;)V

    .line 193
    .local v0, "preference":Lcom/androie/settings/bluetooth/BluetoothDevicePreference;
    invoke-virtual {p0, v0}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->initDevicePreference(Lcom/androie/settings/bluetooth/BluetoothDevicePreference;)V

    .line 194
    iget-object v1, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mDeviceListGroup:Landroid/preference/PreferenceGroup;

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 195
    iget-object v1, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mDevicePreferenceMap:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    return-void
.end method

.method initDevicePreference(Lcom/androie/settings/bluetooth/BluetoothDevicePreference;)V
    .locals 0
    .param p1, "preference"    # Lcom/androie/settings/bluetooth/BluetoothDevicePreference;

    .prologue
    .line 204
    return-void
.end method

.method public onBluetoothStateChanged(I)V
    .locals 1
    .param p1, "bluetoothState"    # I

    .prologue
    .line 227
    const/16 v0, 0xa

    if-ne p1, v0, :cond_0

    .line 228
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->updateProgressUi(Z)V

    .line 230
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 75
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 77
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/androie/settings/bluetooth/LocalBluetoothManager;->getInstance(Landroid/content/Context;)Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    .line 78
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    if-nez v0, :cond_0

    .line 79
    const-string v0, "DeviceListPreferenceFragment"

    const-string v1, "Bluetooth is not supported on this device"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    :goto_0
    return-void

    .line 82
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    .line 84
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->addPreferencesForActivity()V

    .line 86
    const-string v0, "bt_device_list"

    invoke-virtual {p0, v0}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceCategory;

    iput-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mDeviceListGroup:Landroid/preference/PreferenceGroup;

    goto :goto_0
.end method

.method public onDeviceAdded(Lcom/androie/settings/bluetooth/CachedBluetoothDevice;)V
    .locals 2
    .param p1, "cachedDevice"    # Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    .prologue
    .line 177
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mDevicePreferenceMap:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 187
    :cond_0
    :goto_0
    return-void

    .line 182
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->getBluetoothState()I

    move-result v0

    const/16 v1, 0xc

    if-ne v0, v1, :cond_0

    .line 184
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mFilter:Lcom/androie/settings/bluetooth/BluetoothDeviceFilter$Filter;

    invoke-virtual {p1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/androie/settings/bluetooth/BluetoothDeviceFilter$Filter;->matches(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 185
    invoke-virtual {p0, p1}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->createDevicePreference(Lcom/androie/settings/bluetooth/CachedBluetoothDevice;)V

    goto :goto_0
.end method

.method public onDeviceDeleted(Lcom/androie/settings/bluetooth/CachedBluetoothDevice;)V
    .locals 2
    .param p1, "cachedDevice"    # Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    .prologue
    .line 207
    iget-object v1, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mDevicePreferenceMap:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;

    .line 208
    .local v0, "preference":Lcom/androie/settings/bluetooth/BluetoothDevicePreference;
    if-eqz v0, :cond_0

    .line 209
    iget-object v1, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mDeviceListGroup:Landroid/preference/PreferenceGroup;

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 211
    :cond_0
    return-void
.end method

.method onDevicePreferenceClick(Lcom/androie/settings/bluetooth/BluetoothDevicePreference;)V
    .locals 0
    .param p1, "btPreference"    # Lcom/androie/settings/bluetooth/BluetoothDevicePreference;

    .prologue
    .line 173
    invoke-virtual {p1}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->onClicked()V

    .line 174
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 109
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onPause()V

    .line 110
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    if-nez v0, :cond_0

    .line 114
    :goto_0
    return-void

    .line 112
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/androie/settings/bluetooth/LocalBluetoothManager;->setForegroundActivity(Landroid/content/Context;)V

    .line 113
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/LocalBluetoothManager;->getEventManager()Lcom/androie/settings/bluetooth/BluetoothEventManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/androie/settings/bluetooth/BluetoothEventManager;->unregisterCallback(Lcom/androie/settings/bluetooth/BluetoothCallback;)V

    goto :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 5
    .param p1, "preferenceScreen"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    const/4 v2, 0x1

    .line 156
    const-string v3, "bt_scan"

    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 157
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v3, v2}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->startScanning(Z)V

    .line 169
    :goto_0
    return v2

    .line 161
    :cond_0
    instance-of v3, p2, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;

    if-eqz v3, :cond_1

    move-object v0, p2

    .line 162
    check-cast v0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;

    .line 163
    .local v0, "btPreference":Lcom/androie/settings/bluetooth/BluetoothDevicePreference;
    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->getCachedDevice()Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    move-result-object v1

    .line 164
    .local v1, "device":Lcom/androie/settings/bluetooth/CachedBluetoothDevice;
    invoke-virtual {v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 165
    invoke-virtual {p0, v0}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->onDevicePreferenceClick(Lcom/androie/settings/bluetooth/BluetoothDevicePreference;)V

    goto :goto_0

    .line 169
    .end local v0    # "btPreference":Lcom/androie/settings/bluetooth/BluetoothDevicePreference;
    .end local v1    # "device":Lcom/androie/settings/bluetooth/CachedBluetoothDevice;
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/androie/settings/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v2

    goto :goto_0
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 98
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onResume()V

    .line 99
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    if-nez v0, :cond_0

    .line 105
    :goto_0
    return-void

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/androie/settings/bluetooth/LocalBluetoothManager;->setForegroundActivity(Landroid/content/Context;)V

    .line 102
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/LocalBluetoothManager;->getEventManager()Lcom/androie/settings/bluetooth/BluetoothEventManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/androie/settings/bluetooth/BluetoothEventManager;->registerCallback(Lcom/androie/settings/bluetooth/BluetoothCallback;)V

    .line 104
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->isDiscovering()Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->updateProgressUi(Z)V

    goto :goto_0
.end method

.method public onScanningStateChanged(Z)V
    .locals 0
    .param p1, "started"    # Z

    .prologue
    .line 214
    if-nez p1, :cond_0

    .line 215
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->removeOorDevices()V

    .line 217
    :cond_0
    invoke-direct {p0, p1}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->updateProgressUi(Z)V

    .line 218
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 118
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onStop()V

    .line 119
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->removeAllDevices()V

    .line 120
    return-void
.end method

.method removeAllDevices()V
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->stopScanning()V

    .line 124
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mDevicePreferenceMap:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->clear()V

    .line 125
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mDeviceListGroup:Landroid/preference/PreferenceGroup;

    invoke-virtual {v0}, Landroid/preference/PreferenceGroup;->removeAll()V

    .line 126
    return-void
.end method

.method removeOorDevices()V
    .locals 7

    .prologue
    .line 137
    iget-object v4, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {v4}, Lcom/androie/settings/bluetooth/LocalBluetoothManager;->getCachedDeviceManager()Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;->getCachedDevicesCopy()Ljava/util/Collection;

    move-result-object v1

    .line 139
    .local v1, "cachedDevices":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/androie/settings/bluetooth/CachedBluetoothDevice;>;"
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    .line 140
    .local v0, "cachedDevice":Lcom/androie/settings/bluetooth/CachedBluetoothDevice;
    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v4

    const/16 v5, 0xa

    if-ne v4, v5, :cond_0

    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->isVisible()Z

    move-result v4

    if-nez v4, :cond_0

    .line 142
    const-string v4, "DeviceListPreferenceFragment"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Device Removed "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    iget-object v4, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mDevicePreferenceMap:Ljava/util/WeakHashMap;

    invoke-virtual {v4, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;

    .line 144
    .local v3, "preference":Lcom/androie/settings/bluetooth/BluetoothDevicePreference;
    if-eqz v3, :cond_1

    .line 145
    iget-object v4, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mDeviceListGroup:Landroid/preference/PreferenceGroup;

    invoke-virtual {v4, v3}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 147
    :cond_1
    iget-object v4, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mDevicePreferenceMap:Ljava/util/WeakHashMap;

    invoke-virtual {v4, v0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->setRemovable(Z)V

    goto :goto_0

    .line 151
    .end local v0    # "cachedDevice":Lcom/androie/settings/bluetooth/CachedBluetoothDevice;
    .end local v3    # "preference":Lcom/androie/settings/bluetooth/BluetoothDevicePreference;
    :cond_2
    return-void
.end method

.method setDeviceListGroup(Landroid/preference/PreferenceGroup;)V
    .locals 0
    .param p1, "preferenceGroup"    # Landroid/preference/PreferenceGroup;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mDeviceListGroup:Landroid/preference/PreferenceGroup;

    .line 91
    return-void
.end method

.method final setFilter(I)V
    .locals 1
    .param p1, "filterType"    # I

    .prologue
    .line 70
    invoke-static {p1}, Lcom/androie/settings/bluetooth/BluetoothDeviceFilter;->getFilter(I)Lcom/androie/settings/bluetooth/BluetoothDeviceFilter$Filter;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mFilter:Lcom/androie/settings/bluetooth/BluetoothDeviceFilter$Filter;

    .line 71
    return-void
.end method

.method final setFilter(Lcom/androie/settings/bluetooth/BluetoothDeviceFilter$Filter;)V
    .locals 0
    .param p1, "filter"    # Lcom/androie/settings/bluetooth/BluetoothDeviceFilter$Filter;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->mFilter:Lcom/androie/settings/bluetooth/BluetoothDeviceFilter$Filter;

    .line 67
    return-void
.end method
