.class public final Lcom/androie/settings/bluetooth/BluetoothSettings;
.super Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;
.source "BluetoothSettings.java"


# instance fields
.field private mActivityStarted:Z

.field private mAvailableDevicesCategory:Landroid/preference/PreferenceGroup;

.field private mAvailableDevicesCategoryIsPresent:Z

.field private final mDeviceProfilesListener:Landroid/view/View$OnClickListener;

.field private mDiscoverableEnabler:Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;

.field private mEmptyView:Landroid/widget/TextView;

.field private final mIntentFilter:Landroid/content/IntentFilter;

.field mMyDevicePreference:Landroid/preference/Preference;

.field private mPairedDevicesCategory:Landroid/preference/PreferenceGroup;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mUserManager:Landroid/os/UserManager;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 98
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;-><init>()V

    .line 82
    new-instance v0, Lcom/androie/settings/bluetooth/BluetoothSettings$1;

    invoke-direct {v0, p0}, Lcom/androie/settings/bluetooth/BluetoothSettings$1;-><init>(Lcom/androie/settings/bluetooth/BluetoothSettings;)V

    iput-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 365
    new-instance v0, Lcom/androie/settings/bluetooth/BluetoothSettings$2;

    invoke-direct {v0, p0}, Lcom/androie/settings/bluetooth/BluetoothSettings$2;-><init>(Lcom/androie/settings/bluetooth/BluetoothSettings;)V

    iput-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mDeviceProfilesListener:Landroid/view/View$OnClickListener;

    .line 99
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.bluetooth.adapter.action.LOCAL_NAME_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mIntentFilter:Landroid/content/IntentFilter;

    .line 100
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/bluetooth/BluetoothSettings;)Landroid/os/UserManager;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/bluetooth/BluetoothSettings;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mUserManager:Landroid/os/UserManager;

    return-object v0
.end method

.method private addDeviceCategory(Landroid/preference/PreferenceGroup;ILcom/androie/settings/bluetooth/BluetoothDeviceFilter$Filter;)V
    .locals 1
    .param p1, "preferenceGroup"    # Landroid/preference/PreferenceGroup;
    .param p2, "titleId"    # I
    .param p3, "filter"    # Lcom/androie/settings/bluetooth/BluetoothDeviceFilter$Filter;

    .prologue
    .line 237
    invoke-virtual {p1, p2}, Landroid/preference/PreferenceGroup;->setTitle(I)V

    .line 238
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 239
    invoke-virtual {p0, p3}, Lcom/androie/settings/bluetooth/BluetoothSettings;->setFilter(Lcom/androie/settings/bluetooth/BluetoothDeviceFilter$Filter;)V

    .line 240
    invoke-virtual {p0, p1}, Lcom/androie/settings/bluetooth/BluetoothSettings;->setDeviceListGroup(Landroid/preference/PreferenceGroup;)V

    .line 241
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->addCachedDevices()V

    .line 242
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceGroup;->setEnabled(Z)V

    .line 243
    return-void
.end method

.method private startScanning()V
    .locals 2

    .prologue
    .line 222
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mUserManager:Landroid/os/UserManager;

    const-string v1, "no_config_bluetooth"

    invoke-virtual {v0, v1}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 227
    :goto_0
    return-void

    .line 223
    :cond_0
    iget-boolean v0, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mAvailableDevicesCategoryIsPresent:Z

    if-nez v0, :cond_1

    .line 224
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mAvailableDevicesCategory:Landroid/preference/PreferenceGroup;

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 226
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->startScanning(Z)V

    goto :goto_0
.end method

.method private updateContent(IZ)V
    .locals 10
    .param p1, "bluetoothState"    # I
    .param p2, "scanState"    # Z

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 246
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    .line 247
    .local v3, "preferenceScreen":Landroid/preference/PreferenceScreen;
    const/4 v0, 0x0

    .line 249
    .local v0, "messageId":I
    packed-switch p1, :pswitch_data_0

    .line 340
    :goto_0
    invoke-virtual {p0, v3}, Lcom/androie/settings/bluetooth/BluetoothSettings;->setDeviceListGroup(Landroid/preference/PreferenceGroup;)V

    .line 341
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->removeAllDevices()V

    .line 342
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mEmptyView:Landroid/widget/TextView;

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(I)V

    .line 343
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 344
    :goto_1
    return-void

    .line 251
    :pswitch_0
    invoke-virtual {v3}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 252
    invoke-virtual {v3, v8}, Landroid/preference/PreferenceScreen;->setOrderingAsAdded(Z)V

    .line 253
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mDevicePreferenceMap:Ljava/util/WeakHashMap;

    invoke-virtual {v4}, Ljava/util/WeakHashMap;->clear()V

    .line 256
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mMyDevicePreference:Landroid/preference/Preference;

    if-nez v4, :cond_0

    .line 257
    new-instance v4, Landroid/preference/Preference;

    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mMyDevicePreference:Landroid/preference/Preference;

    .line 259
    :cond_0
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mMyDevicePreference:Landroid/preference/Preference;

    iget-object v5, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v5}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 260
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x1110032

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 261
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mMyDevicePreference:Landroid/preference/Preference;

    const v5, 0x7f020055

    invoke-virtual {v4, v5}, Landroid/preference/Preference;->setIcon(I)V

    .line 265
    :goto_2
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mMyDevicePreference:Landroid/preference/Preference;

    invoke-virtual {v4, v9}, Landroid/preference/Preference;->setPersistent(Z)V

    .line 266
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mMyDevicePreference:Landroid/preference/Preference;

    invoke-virtual {v4, v8}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 267
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mMyDevicePreference:Landroid/preference/Preference;

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 269
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mUserManager:Landroid/os/UserManager;

    const-string v5, "no_config_bluetooth"

    invoke-virtual {v4, v5}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 270
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mDiscoverableEnabler:Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;

    if-nez v4, :cond_1

    .line 271
    new-instance v4, Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;

    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    iget-object v6, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    iget-object v7, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mMyDevicePreference:Landroid/preference/Preference;

    invoke-direct {v4, v5, v6, v7}, Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;-><init>(Landroid/content/Context;Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;Landroid/preference/Preference;)V

    iput-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mDiscoverableEnabler:Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;

    .line 273
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mDiscoverableEnabler:Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;

    invoke-virtual {v4}, Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;->resume()V

    .line 274
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4}, Lcom/androie/settings/bluetooth/LocalBluetoothManager;->getInstance(Landroid/content/Context;)Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    move-result-object v4

    iget-object v5, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mDiscoverableEnabler:Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;

    invoke-virtual {v4, v5}, Lcom/androie/settings/bluetooth/LocalBluetoothManager;->setDiscoverableEnabler(Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;)V

    .line 280
    :cond_1
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mPairedDevicesCategory:Landroid/preference/PreferenceGroup;

    if-nez v4, :cond_7

    .line 281
    new-instance v4, Landroid/preference/PreferenceCategory;

    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mPairedDevicesCategory:Landroid/preference/PreferenceGroup;

    .line 285
    :goto_3
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mPairedDevicesCategory:Landroid/preference/PreferenceGroup;

    const v5, 0x7f0804f6

    sget-object v6, Lcom/androie/settings/bluetooth/BluetoothDeviceFilter;->BONDED_DEVICE_FILTER:Lcom/androie/settings/bluetooth/BluetoothDeviceFilter$Filter;

    invoke-direct {p0, v4, v5, v6}, Lcom/androie/settings/bluetooth/BluetoothSettings;->addDeviceCategory(Landroid/preference/PreferenceGroup;ILcom/androie/settings/bluetooth/BluetoothDeviceFilter$Filter;)V

    .line 288
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mPairedDevicesCategory:Landroid/preference/PreferenceGroup;

    invoke-virtual {v4}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    .line 290
    .local v2, "numberOfPairedDevices":I
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mDiscoverableEnabler:Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;

    if-eqz v4, :cond_2

    .line 291
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mDiscoverableEnabler:Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;

    invoke-virtual {v4, v2}, Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;->setNumberOfPairedDevices(I)V

    .line 295
    :cond_2
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mAvailableDevicesCategory:Landroid/preference/PreferenceGroup;

    if-nez v4, :cond_8

    .line 296
    new-instance v4, Lcom/androie/settings/bluetooth/BluetoothProgressCategory;

    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct {v4, v5, v6}, Lcom/androie/settings/bluetooth/BluetoothProgressCategory;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mAvailableDevicesCategory:Landroid/preference/PreferenceGroup;

    .line 300
    :goto_4
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mUserManager:Landroid/os/UserManager;

    const-string v5, "no_config_bluetooth"

    invoke-virtual {v4, v5}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 301
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mAvailableDevicesCategory:Landroid/preference/PreferenceGroup;

    const v5, 0x7f0804f7

    sget-object v6, Lcom/androie/settings/bluetooth/BluetoothDeviceFilter;->UNBONDED_DEVICE_FILTER:Lcom/androie/settings/bluetooth/BluetoothDeviceFilter$Filter;

    invoke-direct {p0, v4, v5, v6}, Lcom/androie/settings/bluetooth/BluetoothSettings;->addDeviceCategory(Landroid/preference/PreferenceGroup;ILcom/androie/settings/bluetooth/BluetoothDeviceFilter$Filter;)V

    .line 305
    :cond_3
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mAvailableDevicesCategory:Landroid/preference/PreferenceGroup;

    invoke-virtual {v4}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    .line 306
    .local v1, "numberOfAvailableDevices":I
    iput-boolean v8, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mAvailableDevicesCategoryIsPresent:Z

    .line 308
    if-nez v1, :cond_4

    .line 309
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mAvailableDevicesCategory:Landroid/preference/PreferenceGroup;

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 310
    iput-boolean v9, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mAvailableDevicesCategoryIsPresent:Z

    .line 313
    :cond_4
    if-nez v2, :cond_5

    .line 314
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mPairedDevicesCategory:Landroid/preference/PreferenceGroup;

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 315
    if-ne p2, v8, :cond_9

    .line 316
    iput-boolean v9, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mActivityStarted:Z

    .line 317
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->startScanning()V

    .line 324
    :cond_5
    :goto_5
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->invalidateOptionsMenu()V

    goto/16 :goto_1

    .line 263
    .end local v1    # "numberOfAvailableDevices":I
    .end local v2    # "numberOfPairedDevices":I
    :cond_6
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mMyDevicePreference:Landroid/preference/Preference;

    const v5, 0x7f02005b

    invoke-virtual {v4, v5}, Landroid/preference/Preference;->setIcon(I)V

    goto/16 :goto_2

    .line 283
    :cond_7
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mPairedDevicesCategory:Landroid/preference/PreferenceGroup;

    invoke-virtual {v4}, Landroid/preference/PreferenceGroup;->removeAll()V

    goto :goto_3

    .line 298
    .restart local v2    # "numberOfPairedDevices":I
    :cond_8
    iget-object v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mAvailableDevicesCategory:Landroid/preference/PreferenceGroup;

    invoke-virtual {v4}, Landroid/preference/PreferenceGroup;->removeAll()V

    goto :goto_4

    .line 319
    .restart local v1    # "numberOfAvailableDevices":I
    :cond_9
    iget-boolean v4, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mAvailableDevicesCategoryIsPresent:Z

    if-nez v4, :cond_5

    .line 320
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    iget-object v5, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mAvailableDevicesCategory:Landroid/preference/PreferenceGroup;

    invoke-virtual {v4, v5}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    goto :goto_5

    .line 328
    .end local v1    # "numberOfAvailableDevices":I
    .end local v2    # "numberOfPairedDevices":I
    :pswitch_1
    const v0, 0x7f0803fa

    .line 329
    goto/16 :goto_0

    .line 332
    :pswitch_2
    const v0, 0x7f080500

    .line 333
    goto/16 :goto_0

    .line 336
    :pswitch_3
    const v0, 0x7f0803f9

    goto/16 :goto_0

    .line 249
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method addPreferencesForActivity()V
    .locals 9

    .prologue
    const/16 v8, 0x10

    const/4 v7, -0x2

    const/4 v6, 0x0

    .line 114
    const v4, 0x7f05000d

    invoke-virtual {p0, v4}, Lcom/androie/settings/bluetooth/BluetoothSettings;->addPreferencesFromResource(I)V

    .line 116
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    .line 118
    .local v1, "activity":Landroid/app/Activity;
    new-instance v0, Landroid/widget/Switch;

    invoke-direct {v0, v1}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 120
    .local v0, "actionBarSwitch":Landroid/widget/Switch;
    instance-of v4, v1, Landroid/preference/PreferenceActivity;

    if-eqz v4, :cond_1

    move-object v3, v1

    .line 121
    check-cast v3, Landroid/preference/PreferenceActivity;

    .line 122
    .local v3, "preferenceActivity":Landroid/preference/PreferenceActivity;
    invoke-virtual {v3}, Landroid/preference/PreferenceActivity;->onIsHidingHeaders()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v3}, Landroid/preference/PreferenceActivity;->onIsMultiPane()Z

    move-result v4

    if-nez v4, :cond_1

    .line 123
    :cond_0
    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f070014

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 125
    .local v2, "padding":I
    invoke-virtual {v0, v6, v6, v2, v6}, Landroid/widget/Switch;->setPaddingRelative(IIII)V

    .line 126
    invoke-virtual {v1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v4

    invoke-virtual {v4, v8, v8}, Landroid/app/ActionBar;->setDisplayOptions(II)V

    .line 128
    invoke-virtual {v1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v4

    new-instance v5, Landroid/app/ActionBar$LayoutParams;

    const v6, 0x800015

    invoke-direct {v5, v7, v7, v6}, Landroid/app/ActionBar$LayoutParams;-><init>(III)V

    invoke-virtual {v4, v0, v5}, Landroid/app/ActionBar;->setCustomView(Landroid/view/View;Landroid/app/ActionBar$LayoutParams;)V

    .line 135
    .line 137
    .end local v2    # "padding":I
    .end local v3    # "preferenceActivity":Landroid/preference/PreferenceActivity;
    :cond_1
    const/4 v4, 0x1

    invoke-virtual {p0, v4}, Lcom/androie/settings/bluetooth/BluetoothSettings;->setHasOptionsMenu(Z)V

    .line 138
    return-void
.end method

.method protected getHelpResource()I
    .locals 1

    .prologue
    .line 400
    const v0, 0x7f080a60

    return v0
.end method

.method initDevicePreference(Lcom/androie/settings/bluetooth/BluetoothDevicePreference;)V
    .locals 3
    .param p1, "preference"    # Lcom/androie/settings/bluetooth/BluetoothDevicePreference;

    .prologue
    .line 391
    invoke-virtual {p1}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->getCachedDevice()Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    move-result-object v0

    .line 392
    .local v0, "cachedDevice":Lcom/androie/settings/bluetooth/CachedBluetoothDevice;
    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v1

    const/16 v2, 0xc

    if-ne v1, v2, :cond_0

    .line 394
    iget-object v1, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mDeviceProfilesListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, v1}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->setOnSettingsClickListener(Landroid/view/View$OnClickListener;)V

    .line 396
    :cond_0
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 104
    invoke-super {p0, p1}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 105
    const-string v0, "user"

    invoke-virtual {p0, v0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/UserManager;

    iput-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mUserManager:Landroid/os/UserManager;

    .line 106
    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mActivityStarted:Z

    .line 108
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x1020004

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mEmptyView:Landroid/widget/TextView;

    .line 109
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getListView()Landroid/widget/ListView;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mEmptyView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 110
    return-void

    .line 106
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onBluetoothStateChanged(I)V
    .locals 1
    .param p1, "bluetoothState"    # I

    .prologue
    .line 348
    invoke-super {p0, p1}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->onBluetoothStateChanged(I)V

    .line 349
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->updateContent(IZ)V

    .line 350
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 7
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 172
    iget-object v5, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    if-nez v5, :cond_1

    .line 192
    :cond_0
    :goto_0
    return-void

    .line 174
    :cond_1
    iget-object v5, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mUserManager:Landroid/os/UserManager;

    const-string v6, "no_config_bluetooth"

    invoke-virtual {v5, v6}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 176
    iget-object v5, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v5}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->getBluetoothState()I

    move-result v5

    const/16 v6, 0xc

    if-ne v5, v6, :cond_2

    move v0, v3

    .line 177
    .local v0, "bluetoothIsEnabled":Z
    :goto_1
    iget-object v5, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v5}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->isDiscovering()Z

    move-result v1

    .line 178
    .local v1, "isDiscovering":Z
    if-eqz v1, :cond_3

    const v2, 0x7f0804f4

    .line 180
    .local v2, "textId":I
    :goto_2
    invoke-interface {p1, v4, v3, v4, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v6

    if-eqz v0, :cond_4

    if-nez v1, :cond_4

    move v5, v3

    :goto_3
    invoke-interface {v6, v5}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v5

    invoke-interface {v5, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 183
    const/4 v3, 0x2

    const v5, 0x7f0803dc

    invoke-interface {p1, v4, v3, v4, v5}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 186
    const/4 v3, 0x3

    const v5, 0x7f0803d3

    invoke-interface {p1, v4, v3, v4, v5}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 189
    const/4 v3, 0x4

    const v5, 0x7f0803f1

    invoke-interface {p1, v4, v3, v4, v5}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 191
    invoke-super {p0, p1, p2}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    goto :goto_0

    .end local v0    # "bluetoothIsEnabled":Z
    .end local v1    # "isDiscovering":Z
    .end local v2    # "textId":I
    :cond_2
    move v0, v4

    .line 176
    goto :goto_1

    .line 178
    .restart local v0    # "bluetoothIsEnabled":Z
    .restart local v1    # "isDiscovering":Z
    :cond_3
    const v2, 0x7f0804f3

    goto :goto_2

    .restart local v2    # "textId":I
    :cond_4
    move v5, v4

    .line 180
    goto :goto_3
.end method

.method public onDeviceBondStateChanged(Lcom/androie/settings/bluetooth/CachedBluetoothDevice;I)V
    .locals 2
    .param p1, "cachedDevice"    # Lcom/androie/settings/bluetooth/CachedBluetoothDevice;
    .param p2, "bondState"    # I

    .prologue
    .line 360
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->setDeviceListGroup(Landroid/preference/PreferenceGroup;)V

    .line 361
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->removeAllDevices()V

    .line 362
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->getBluetoothState()I

    move-result v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/androie/settings/bluetooth/BluetoothSettings;->updateContent(IZ)V

    .line 363
    return-void
.end method

.method onDevicePreferenceClick(Lcom/androie/settings/bluetooth/BluetoothDevicePreference;)V
    .locals 1
    .param p1, "btPreference"    # Lcom/androie/settings/bluetooth/BluetoothDevicePreference;

    .prologue
    .line 231
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->stopScanning()V

    .line 232
    invoke-super {p0, p1}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->onDevicePreferenceClick(Lcom/androie/settings/bluetooth/BluetoothDevicePreference;)V

    .line 233
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 5
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v1, 0x1

    .line 196
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 218
    invoke-super {p0, p1}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :cond_0
    :goto_0
    return v1

    .line 198
    :pswitch_0
    iget-object v2, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v2}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->getBluetoothState()I

    move-result v2

    const/16 v3, 0xc

    if-ne v2, v3, :cond_0

    .line 199
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->startScanning()V

    goto :goto_0

    .line 204
    :pswitch_1
    new-instance v2, Lcom/androie/settings/bluetooth/BluetoothNameDialogFragment;

    invoke-direct {v2}, Lcom/androie/settings/bluetooth/BluetoothNameDialogFragment;-><init>()V

    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    const-string v4, "rename device"

    invoke-virtual {v2, v3, v4}, Lcom/androie/settings/bluetooth/BluetoothNameDialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_0

    .line 209
    :pswitch_2
    new-instance v2, Lcom/androie/settings/bluetooth/BluetoothVisibilityTimeoutFragment;

    invoke-direct {v2}, Lcom/androie/settings/bluetooth/BluetoothVisibilityTimeoutFragment;-><init>()V

    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    const-string v4, "visibility timeout"

    invoke-virtual {v2, v3, v4}, Lcom/androie/settings/bluetooth/BluetoothVisibilityTimeoutFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_0

    .line 214
    :pswitch_3
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.btopp.intent.action.OPEN_RECEIVED_FILES"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 215
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0

    .line 196
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 160
    invoke-super {p0}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->onPause()V

    .line 161
    if-eqz v0, :cond_0

    .line 162
    .line 164
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 165
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mDiscoverableEnabler:Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;

    if-eqz v0, :cond_1

    .line 166
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mDiscoverableEnabler:Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;

    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;->pause()V

    .line 168
    :cond_1
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 144
    if-eqz v0, :cond_0

    .line 145
    .line 147
    :cond_0
    invoke-super {p0}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->onResume()V

    .line 149
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mDiscoverableEnabler:Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;

    if-eqz v0, :cond_1

    .line 150
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mDiscoverableEnabler:Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;

    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;->resume()V

    .line 152
    :cond_1
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 153
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    if-eqz v0, :cond_2

    .line 154
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mLocalAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;->getBluetoothState()I

    move-result v0

    iget-boolean v1, p0, Lcom/androie/settings/bluetooth/BluetoothSettings;->mActivityStarted:Z

    invoke-direct {p0, v0, v1}, Lcom/androie/settings/bluetooth/BluetoothSettings;->updateContent(IZ)V

    .line 156
    :cond_2
    return-void
.end method

.method public onScanningStateChanged(Z)V
    .locals 1
    .param p1, "started"    # Z

    .prologue
    .line 354
    invoke-super {p0, p1}, Lcom/androie/settings/bluetooth/DeviceListPreferenceFragment;->onScanningStateChanged(Z)V

    .line 356
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 357
    return-void
.end method
