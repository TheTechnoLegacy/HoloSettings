.class public abstract Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;
.super Lcom/jellybyn/settings/SettingsPreferenceFragment;
.source "DeviceListPreferenceFragment.java"

# interfaces
.implements Lcom/jellybyn/settings/bluetooth/BluetoothCallback;


# instance fields
.field private mDeviceListGroup:Landroid/preference/PreferenceGroup;

.field final mDevicePreferenceMap:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;",
            "Lcom/jellybyn/settings/bluetooth/BluetoothDevicePreference;",
            ">;"
        }
    .end annotation
.end field

.field private mFilter:Lcom/jellybyn/settings/bluetooth/BluetoothDeviceFilter$Filter;

.field mLocalAdapter:Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;

.field mLocalManager:Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;

.field mSelectedDevice:Landroid/bluetooth/BluetoothDevice;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 61
    invoke-direct {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;-><init>()V

    .line 58
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mDevicePreferenceMap:Ljava/util/WeakHashMap;

    .line 62
    sget-object v0, Lcom/jellybyn/settings/bluetooth/BluetoothDeviceFilter;->ALL_FILTER:Lcom/jellybyn/settings/bluetooth/BluetoothDeviceFilter$Filter;

    iput-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mFilter:Lcom/jellybyn/settings/bluetooth/BluetoothDeviceFilter$Filter;

    .line 63
    return-void
.end method

.method private updateProgressUi(Z)V
    .locals 1
    .param p1, "start"    # Z

    .prologue
    .line 196
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mDeviceListGroup:Landroid/preference/PreferenceGroup;

    instance-of v0, v0, Lcom/jellybyn/settings/bluetooth/BluetoothProgressCategory;

    if-eqz v0, :cond_0

    .line 197
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mDeviceListGroup:Landroid/preference/PreferenceGroup;

    check-cast v0, Lcom/jellybyn/settings/bluetooth/BluetoothProgressCategory;

    invoke-virtual {v0, p1}, Lcom/jellybyn/settings/bluetooth/BluetoothProgressCategory;->setProgress(Z)V

    .line 199
    :cond_0
    return-void
.end method


# virtual methods
.method addCachedDevices()V
    .locals 4

    .prologue
    .line 124
    iget-object v3, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {v3}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;->getCachedDeviceManager()Lcom/jellybyn/settings/bluetooth/CachedBluetoothDeviceManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/jellybyn/settings/bluetooth/CachedBluetoothDeviceManager;->getCachedDevicesCopy()Ljava/util/Collection;

    move-result-object v1

    .line 126
    .local v1, "cachedDevices":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;>;"
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;

    .line 127
    .local v0, "cachedDevice":Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;
    invoke-virtual {p0, v0}, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->onDeviceAdded(Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;)V

    goto :goto_0

    .line 129
    .end local v0    # "cachedDevice":Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;
    :cond_0
    return-void
.end method

.method abstract addPreferencesForActivity()V
.end method

.method createDevicePreference(Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;)V
    .locals 2
    .param p1, "cachedDevice"    # Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;

    .prologue
    .line 168
    new-instance v0, Lcom/jellybyn/settings/bluetooth/BluetoothDevicePreference;

    invoke-virtual {p0}, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/jellybyn/settings/bluetooth/BluetoothDevicePreference;-><init>(Landroid/content/Context;Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;)V

    .line 171
    .local v0, "preference":Lcom/jellybyn/settings/bluetooth/BluetoothDevicePreference;
    invoke-virtual {p0, v0}, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->initDevicePreference(Lcom/jellybyn/settings/bluetooth/BluetoothDevicePreference;)V

    .line 172
    iget-object v1, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mDeviceListGroup:Landroid/preference/PreferenceGroup;

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 173
    iget-object v1, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mDevicePreferenceMap:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    return-void
.end method

.method initDevicePreference(Lcom/jellybyn/settings/bluetooth/BluetoothDevicePreference;)V
    .locals 0
    .param p1, "preference"    # Lcom/jellybyn/settings/bluetooth/BluetoothDevicePreference;

    .prologue
    .line 182
    return-void
.end method

.method public onBluetoothStateChanged(I)V
    .locals 1
    .param p1, "bluetoothState"    # I

    .prologue
    .line 202
    const/16 v0, 0xa

    if-ne p1, v0, :cond_0

    .line 203
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->updateProgressUi(Z)V

    .line 205
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 75
    invoke-super {p0, p1}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 77
    invoke-virtual {p0}, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;->getInstance(Landroid/content/Context;)Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;

    move-result-object v0

    iput-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;

    .line 78
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;

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
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mLocalAdapter:Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;

    .line 84
    invoke-virtual {p0}, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->addPreferencesForActivity()V

    .line 86
    const-string v0, "bt_device_list"

    invoke-virtual {p0, v0}, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceCategory;

    iput-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mDeviceListGroup:Landroid/preference/PreferenceGroup;

    goto :goto_0
.end method

.method public onDeviceAdded(Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;)V
    .locals 2
    .param p1, "cachedDevice"    # Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;

    .prologue
    .line 155
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mDevicePreferenceMap:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 165
    :cond_0
    :goto_0
    return-void

    .line 160
    :cond_1
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mLocalAdapter:Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v0}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;->getBluetoothState()I

    move-result v0

    const/16 v1, 0xc

    if-ne v0, v1, :cond_0

    .line 162
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mFilter:Lcom/jellybyn/settings/bluetooth/BluetoothDeviceFilter$Filter;

    invoke-virtual {p1}, Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/jellybyn/settings/bluetooth/BluetoothDeviceFilter$Filter;->matches(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 163
    invoke-virtual {p0, p1}, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->createDevicePreference(Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;)V

    goto :goto_0
.end method

.method public onDeviceDeleted(Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;)V
    .locals 2
    .param p1, "cachedDevice"    # Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;

    .prologue
    .line 185
    iget-object v1, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mDevicePreferenceMap:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jellybyn/settings/bluetooth/BluetoothDevicePreference;

    .line 186
    .local v0, "preference":Lcom/jellybyn/settings/bluetooth/BluetoothDevicePreference;
    if-eqz v0, :cond_0

    .line 187
    iget-object v1, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mDeviceListGroup:Landroid/preference/PreferenceGroup;

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 189
    :cond_0
    return-void
.end method

.method onDevicePreferenceClick(Lcom/jellybyn/settings/bluetooth/BluetoothDevicePreference;)V
    .locals 0
    .param p1, "btPreference"    # Lcom/jellybyn/settings/bluetooth/BluetoothDevicePreference;

    .prologue
    .line 151
    invoke-virtual {p1}, Lcom/jellybyn/settings/bluetooth/BluetoothDevicePreference;->onClicked()V

    .line 152
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 109
    invoke-super {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onPause()V

    .line 110
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;

    if-nez v0, :cond_0

    .line 115
    :goto_0
    return-void

    .line 112
    :cond_0
    invoke-virtual {p0}, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->removeAllDevices()V

    .line 113
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;->setForegroundActivity(Landroid/content/Context;)V

    .line 114
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;->getEventManager()Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;->unregisterCallback(Lcom/jellybyn/settings/bluetooth/BluetoothCallback;)V

    goto :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 5
    .param p1, "preferenceScreen"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    const/4 v2, 0x1

    .line 134
    const-string v3, "bt_scan"

    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 135
    iget-object v3, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mLocalAdapter:Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v3, v2}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;->startScanning(Z)V

    .line 147
    :goto_0
    return v2

    .line 139
    :cond_0
    instance-of v3, p2, Lcom/jellybyn/settings/bluetooth/BluetoothDevicePreference;

    if-eqz v3, :cond_1

    move-object v0, p2

    .line 140
    check-cast v0, Lcom/jellybyn/settings/bluetooth/BluetoothDevicePreference;

    .line 141
    .local v0, "btPreference":Lcom/jellybyn/settings/bluetooth/BluetoothDevicePreference;
    invoke-virtual {v0}, Lcom/jellybyn/settings/bluetooth/BluetoothDevicePreference;->getCachedDevice()Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;

    move-result-object v1

    .line 142
    .local v1, "device":Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;
    invoke-virtual {v1}, Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    iput-object v3, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 143
    invoke-virtual {p0, v0}, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->onDevicePreferenceClick(Lcom/jellybyn/settings/bluetooth/BluetoothDevicePreference;)V

    goto :goto_0

    .line 147
    .end local v0    # "btPreference":Lcom/jellybyn/settings/bluetooth/BluetoothDevicePreference;
    .end local v1    # "device":Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v2

    goto :goto_0
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 98
    invoke-super {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onResume()V

    .line 99
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;

    if-nez v0, :cond_0

    .line 105
    :goto_0
    return-void

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {p0}, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;->setForegroundActivity(Landroid/content/Context;)V

    .line 102
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mLocalManager:Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothManager;->getEventManager()Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;->registerCallback(Lcom/jellybyn/settings/bluetooth/BluetoothCallback;)V

    .line 104
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mLocalAdapter:Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v0}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;->isDiscovering()Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->updateProgressUi(Z)V

    goto :goto_0
.end method

.method public onScanningStateChanged(Z)V
    .locals 0
    .param p1, "started"    # Z

    .prologue
    .line 192
    invoke-direct {p0, p1}, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->updateProgressUi(Z)V

    .line 193
    return-void
.end method

.method removeAllDevices()V
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mLocalAdapter:Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v0}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothAdapter;->stopScanning()V

    .line 119
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mDevicePreferenceMap:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->clear()V

    .line 120
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mDeviceListGroup:Landroid/preference/PreferenceGroup;

    invoke-virtual {v0}, Landroid/preference/PreferenceGroup;->removeAll()V

    .line 121
    return-void
.end method

.method setDeviceListGroup(Landroid/preference/PreferenceGroup;)V
    .locals 0
    .param p1, "preferenceGroup"    # Landroid/preference/PreferenceGroup;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mDeviceListGroup:Landroid/preference/PreferenceGroup;

    .line 91
    return-void
.end method

.method final setFilter(I)V
    .locals 1
    .param p1, "filterType"    # I

    .prologue
    .line 70
    invoke-static {p1}, Lcom/jellybyn/settings/bluetooth/BluetoothDeviceFilter;->getFilter(I)Lcom/jellybyn/settings/bluetooth/BluetoothDeviceFilter$Filter;

    move-result-object v0

    iput-object v0, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mFilter:Lcom/jellybyn/settings/bluetooth/BluetoothDeviceFilter$Filter;

    .line 71
    return-void
.end method

.method final setFilter(Lcom/jellybyn/settings/bluetooth/BluetoothDeviceFilter$Filter;)V
    .locals 0
    .param p1, "filter"    # Lcom/jellybyn/settings/bluetooth/BluetoothDeviceFilter$Filter;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/jellybyn/settings/bluetooth/DeviceListPreferenceFragment;->mFilter:Lcom/jellybyn/settings/bluetooth/BluetoothDeviceFilter$Filter;

    .line 67
    return-void
.end method
