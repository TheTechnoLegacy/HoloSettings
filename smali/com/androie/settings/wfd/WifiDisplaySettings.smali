.class public final Lcom/androie/settings/wfd/WifiDisplaySettings;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "WifiDisplaySettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;
    }
.end annotation


# instance fields
.field private mActionBarSwitch:Landroid/widget/Switch;

.field private mAvailableDevicesCategory:Lcom/androie/settings/ProgressCategory;

.field private mDisableHDCP:Landroid/preference/CheckBoxPreference;

.field private mDisplayManager:Landroid/hardware/display/DisplayManager;

.field private mEmptyView:Landroid/widget/TextView;

.field private mPairedDevicesCategory:Landroid/preference/PreferenceGroup;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mRemoteDisplayAdapter:Landroid/hardware/display/IRemoteDisplayAdapter;

.field private mRemoteDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

.field private final mSettingsObserver:Landroid/database/ContentObserver;

.field private final mSwitchOnCheckedChangedListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field private mWifiDisplayOnSetting:Z

.field private mWifiDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 86
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    .line 437
    new-instance v0, Lcom/androie/settings/wfd/WifiDisplaySettings$4;

    invoke-direct {v0, p0}, Lcom/androie/settings/wfd/WifiDisplaySettings$4;-><init>(Lcom/androie/settings/wfd/WifiDisplaySettings;)V

    iput-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mSwitchOnCheckedChangedListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 447
    new-instance v0, Lcom/androie/settings/wfd/WifiDisplaySettings$5;

    invoke-direct {v0, p0}, Lcom/androie/settings/wfd/WifiDisplaySettings$5;-><init>(Lcom/androie/settings/wfd/WifiDisplaySettings;)V

    iput-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 465
    new-instance v0, Lcom/androie/settings/wfd/WifiDisplaySettings$6;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/androie/settings/wfd/WifiDisplaySettings$6;-><init>(Lcom/androie/settings/wfd/WifiDisplaySettings;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mSettingsObserver:Landroid/database/ContentObserver;

    .line 87
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/wfd/WifiDisplaySettings;)Landroid/hardware/display/WifiDisplayStatus;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/wfd/WifiDisplaySettings;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mWifiDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    return-object v0
.end method

.method static synthetic access$002(Lcom/androie/settings/wfd/WifiDisplaySettings;Landroid/hardware/display/WifiDisplayStatus;)Landroid/hardware/display/WifiDisplayStatus;
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/wfd/WifiDisplaySettings;
    .param p1, "x1"    # Landroid/hardware/display/WifiDisplayStatus;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mWifiDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    return-object p1
.end method

.method static synthetic access$100(Lcom/androie/settings/wfd/WifiDisplaySettings;)Landroid/hardware/display/DisplayManager;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/wfd/WifiDisplaySettings;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    return-object v0
.end method

.method static synthetic access$200(Lcom/androie/settings/wfd/WifiDisplaySettings;)Landroid/hardware/display/WifiDisplayStatus;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/wfd/WifiDisplaySettings;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mRemoteDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    return-object v0
.end method

.method static synthetic access$202(Lcom/androie/settings/wfd/WifiDisplaySettings;Landroid/hardware/display/WifiDisplayStatus;)Landroid/hardware/display/WifiDisplayStatus;
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/wfd/WifiDisplaySettings;
    .param p1, "x1"    # Landroid/hardware/display/WifiDisplayStatus;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mRemoteDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    return-object p1
.end method

.method static synthetic access$300(Lcom/androie/settings/wfd/WifiDisplaySettings;)Landroid/hardware/display/IRemoteDisplayAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/wfd/WifiDisplaySettings;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mRemoteDisplayAdapter:Landroid/hardware/display/IRemoteDisplayAdapter;

    return-object v0
.end method

.method static synthetic access$402(Lcom/androie/settings/wfd/WifiDisplaySettings;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/wfd/WifiDisplaySettings;
    .param p1, "x1"    # Z

    .prologue
    .line 63
    iput-boolean p1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mWifiDisplayOnSetting:Z

    return p1
.end method

.method static synthetic access$500(Lcom/androie/settings/wfd/WifiDisplaySettings;)Landroid/content/ContentResolver;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/wfd/WifiDisplaySettings;

    .prologue
    .line 63
    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/androie/settings/wfd/WifiDisplaySettings;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/wfd/WifiDisplaySettings;

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->applyState()V

    return-void
.end method

.method static synthetic access$700(Lcom/androie/settings/wfd/WifiDisplaySettings;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/wfd/WifiDisplaySettings;

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->update()V

    return-void
.end method

.method static synthetic access$800(Lcom/androie/settings/wfd/WifiDisplaySettings;Landroid/hardware/display/WifiDisplay;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/wfd/WifiDisplaySettings;
    .param p1, "x1"    # Landroid/hardware/display/WifiDisplay;
    .param p2, "x2"    # Z

    .prologue
    .line 63
    invoke-direct {p0, p1, p2}, Lcom/androie/settings/wfd/WifiDisplaySettings;->showOptionsDialog(Landroid/hardware/display/WifiDisplay;Z)V

    return-void
.end method

.method private applyState()V
    .locals 14

    .prologue
    .line 245
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mWifiDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    invoke-virtual {v10}, Landroid/hardware/display/WifiDisplayStatus;->getFeatureState()I

    move-result v4

    .line 246
    .local v4, "featureState":I
    iget-object v11, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mActionBarSwitch:Landroid/widget/Switch;

    const/4 v10, 0x1

    if-eq v4, v10, :cond_0

    const/4 v10, 0x1

    :goto_0
    invoke-virtual {v11, v10}, Landroid/widget/Switch;->setEnabled(Z)V

    .line 247
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mActionBarSwitch:Landroid/widget/Switch;

    iget-boolean v11, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mWifiDisplayOnSetting:Z

    invoke-virtual {v10, v11}, Landroid/widget/Switch;->setChecked(Z)V

    .line 249
    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v9

    .line 250
    .local v9, "preferenceScreen":Landroid/preference/PreferenceScreen;
    invoke-virtual {v9}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 252
    const/4 v10, 0x3

    if-ne v4, v10, :cond_e

    .line 253
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mWifiDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    invoke-virtual {v10}, Landroid/hardware/display/WifiDisplayStatus;->getRememberedDisplays()[Landroid/hardware/display/WifiDisplay;

    move-result-object v7

    .line 254
    .local v7, "pairedDisplays":[Landroid/hardware/display/WifiDisplay;
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mWifiDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    invoke-virtual {v10}, Landroid/hardware/display/WifiDisplayStatus;->getAvailableDisplays()[Landroid/hardware/display/WifiDisplay;

    move-result-object v1

    .line 256
    .local v1, "availableDisplays":[Landroid/hardware/display/WifiDisplay;
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mRemoteDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    invoke-virtual {v10}, Landroid/hardware/display/WifiDisplayStatus;->getRememberedDisplays()[Landroid/hardware/display/WifiDisplay;

    move-result-object v8

    .line 257
    .local v8, "pairedRemoteDisplays":[Landroid/hardware/display/WifiDisplay;
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mRemoteDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    invoke-virtual {v10}, Landroid/hardware/display/WifiDisplayStatus;->getAvailableDisplays()[Landroid/hardware/display/WifiDisplay;

    move-result-object v2

    .line 259
    .local v2, "availableRemoteDisplays":[Landroid/hardware/display/WifiDisplay;
    new-instance v10, Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getActivity()Landroid/app/Activity;

    move-result-object v11

    invoke-virtual {v11}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v10, v11}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    iput-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mDisableHDCP:Landroid/preference/CheckBoxPreference;

    .line 260
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mDisableHDCP:Landroid/preference/CheckBoxPreference;

    const v11, 0x7f080253

    invoke-virtual {v10, v11}, Landroid/preference/CheckBoxPreference;->setTitle(I)V

    .line 261
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mDisableHDCP:Landroid/preference/CheckBoxPreference;

    const v11, 0x7f080254

    invoke-virtual {v10, v11}, Landroid/preference/CheckBoxPreference;->setSummary(I)V

    .line 262
    iget-object v11, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mDisableHDCP:Landroid/preference/CheckBoxPreference;

    const-string v10, "persist.sys.wfd.nohdcp"

    const-string v12, "0"

    invoke-static {v10, v12}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    if-eqz v10, :cond_1

    const/4 v10, 0x1

    :goto_1
    invoke-virtual {v11, v10}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 263
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mDisableHDCP:Landroid/preference/CheckBoxPreference;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/preference/CheckBoxPreference;->setOrder(I)V

    .line 264
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mDisableHDCP:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v9, v10}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 266
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mPairedDevicesCategory:Landroid/preference/PreferenceGroup;

    if-nez v10, :cond_2

    .line 267
    new-instance v10, Landroid/preference/PreferenceCategory;

    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getActivity()Landroid/app/Activity;

    move-result-object v11

    invoke-direct {v10, v11}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    iput-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mPairedDevicesCategory:Landroid/preference/PreferenceGroup;

    .line 268
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mPairedDevicesCategory:Landroid/preference/PreferenceGroup;

    const v11, 0x7f08052a

    invoke-virtual {v10, v11}, Landroid/preference/PreferenceGroup;->setTitle(I)V

    .line 272
    :goto_2
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mPairedDevicesCategory:Landroid/preference/PreferenceGroup;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Landroid/preference/PreferenceGroup;->setOrder(I)V

    .line 273
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mPairedDevicesCategory:Landroid/preference/PreferenceGroup;

    invoke-virtual {v9, v10}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 275
    move-object v0, v7

    .local v0, "arr$":[Landroid/hardware/display/WifiDisplay;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_3
    if-ge v5, v6, :cond_3

    aget-object v3, v0, v5

    .line 276
    .local v3, "d":Landroid/hardware/display/WifiDisplay;
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mPairedDevicesCategory:Landroid/preference/PreferenceGroup;

    const/4 v11, 0x1

    const/4 v12, 0x0

    invoke-direct {p0, v3, v11, v12}, Lcom/androie/settings/wfd/WifiDisplaySettings;->createWifiDisplayPreference(Landroid/hardware/display/WifiDisplay;ZZ)Landroid/preference/Preference;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 275
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 246
    .end local v0    # "arr$":[Landroid/hardware/display/WifiDisplay;
    .end local v1    # "availableDisplays":[Landroid/hardware/display/WifiDisplay;
    .end local v2    # "availableRemoteDisplays":[Landroid/hardware/display/WifiDisplay;
    .end local v3    # "d":Landroid/hardware/display/WifiDisplay;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    .end local v7    # "pairedDisplays":[Landroid/hardware/display/WifiDisplay;
    .end local v8    # "pairedRemoteDisplays":[Landroid/hardware/display/WifiDisplay;
    .end local v9    # "preferenceScreen":Landroid/preference/PreferenceScreen;
    :cond_0
    const/4 v10, 0x0

    goto/16 :goto_0

    .line 262
    .restart local v1    # "availableDisplays":[Landroid/hardware/display/WifiDisplay;
    .restart local v2    # "availableRemoteDisplays":[Landroid/hardware/display/WifiDisplay;
    .restart local v7    # "pairedDisplays":[Landroid/hardware/display/WifiDisplay;
    .restart local v8    # "pairedRemoteDisplays":[Landroid/hardware/display/WifiDisplay;
    .restart local v9    # "preferenceScreen":Landroid/preference/PreferenceScreen;
    :cond_1
    const/4 v10, 0x0

    goto :goto_1

    .line 270
    :cond_2
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mPairedDevicesCategory:Landroid/preference/PreferenceGroup;

    invoke-virtual {v10}, Landroid/preference/PreferenceGroup;->removeAll()V

    goto :goto_2

    .line 279
    .restart local v0    # "arr$":[Landroid/hardware/display/WifiDisplay;
    .restart local v5    # "i$":I
    .restart local v6    # "len$":I
    :cond_3
    move-object v0, v8

    array-length v6, v0

    const/4 v5, 0x0

    :goto_4
    if-ge v5, v6, :cond_5

    aget-object v3, v0, v5

    .line 280
    .restart local v3    # "d":Landroid/hardware/display/WifiDisplay;
    invoke-virtual {v3}, Landroid/hardware/display/WifiDisplay;->isHidden()Z

    move-result v10

    if-eqz v10, :cond_4

    .line 279
    :goto_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 283
    :cond_4
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mPairedDevicesCategory:Landroid/preference/PreferenceGroup;

    const/4 v11, 0x1

    const/4 v12, 0x1

    invoke-direct {p0, v3, v11, v12}, Lcom/androie/settings/wfd/WifiDisplaySettings;->createWifiDisplayPreference(Landroid/hardware/display/WifiDisplay;ZZ)Landroid/preference/Preference;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    goto :goto_5

    .line 286
    .end local v3    # "d":Landroid/hardware/display/WifiDisplay;
    :cond_5
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mPairedDevicesCategory:Landroid/preference/PreferenceGroup;

    invoke-virtual {v10}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v10

    if-nez v10, :cond_6

    .line 287
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mPairedDevicesCategory:Landroid/preference/PreferenceGroup;

    invoke-virtual {v9, v10}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 290
    :cond_6
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mAvailableDevicesCategory:Lcom/androie/settings/ProgressCategory;

    if-nez v10, :cond_8

    .line 291
    new-instance v10, Lcom/androie/settings/ProgressCategory;

    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getActivity()Landroid/app/Activity;

    move-result-object v11

    const/4 v12, 0x0

    const v13, 0x7f080529

    invoke-direct {v10, v11, v12, v13}, Lcom/androie/settings/ProgressCategory;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mAvailableDevicesCategory:Lcom/androie/settings/ProgressCategory;

    .line 293
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mAvailableDevicesCategory:Lcom/androie/settings/ProgressCategory;

    const v11, 0x7f08052b

    invoke-virtual {v10, v11}, Lcom/androie/settings/ProgressCategory;->setTitle(I)V

    .line 297
    :goto_6
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mAvailableDevicesCategory:Lcom/androie/settings/ProgressCategory;

    const/4 v11, 0x2

    invoke-virtual {v10, v11}, Lcom/androie/settings/ProgressCategory;->setOrder(I)V

    .line 298
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mAvailableDevicesCategory:Lcom/androie/settings/ProgressCategory;

    invoke-virtual {v9, v10}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 300
    move-object v0, v1

    array-length v6, v0

    const/4 v5, 0x0

    :goto_7
    if-ge v5, v6, :cond_9

    aget-object v3, v0, v5

    .line 301
    .restart local v3    # "d":Landroid/hardware/display/WifiDisplay;
    invoke-virtual {v3}, Landroid/hardware/display/WifiDisplay;->getDeviceAddress()Ljava/lang/String;

    move-result-object v10

    invoke-static {v7, v10}, Lcom/androie/settings/wfd/WifiDisplaySettings;->contains([Landroid/hardware/display/WifiDisplay;Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_7

    .line 302
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mAvailableDevicesCategory:Lcom/androie/settings/ProgressCategory;

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct {p0, v3, v11, v12}, Lcom/androie/settings/wfd/WifiDisplaySettings;->createWifiDisplayPreference(Landroid/hardware/display/WifiDisplay;ZZ)Landroid/preference/Preference;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/androie/settings/ProgressCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 300
    :cond_7
    add-int/lit8 v5, v5, 0x1

    goto :goto_7

    .line 295
    .end local v3    # "d":Landroid/hardware/display/WifiDisplay;
    :cond_8
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mAvailableDevicesCategory:Lcom/androie/settings/ProgressCategory;

    invoke-virtual {v10}, Lcom/androie/settings/ProgressCategory;->removeAll()V

    goto :goto_6

    .line 305
    :cond_9
    move-object v0, v2

    array-length v6, v0

    const/4 v5, 0x0

    :goto_8
    if-ge v5, v6, :cond_b

    aget-object v3, v0, v5

    .line 306
    .restart local v3    # "d":Landroid/hardware/display/WifiDisplay;
    invoke-virtual {v3}, Landroid/hardware/display/WifiDisplay;->getDeviceAddress()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v10}, Lcom/androie/settings/wfd/WifiDisplaySettings;->contains([Landroid/hardware/display/WifiDisplay;Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_a

    invoke-virtual {v3}, Landroid/hardware/display/WifiDisplay;->getDeviceName()Ljava/lang/String;

    move-result-object v10

    const-string v11, "hidden:"

    invoke-virtual {v10, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_a

    .line 308
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mAvailableDevicesCategory:Lcom/androie/settings/ProgressCategory;

    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-direct {p0, v3, v11, v12}, Lcom/androie/settings/wfd/WifiDisplaySettings;->createWifiDisplayPreference(Landroid/hardware/display/WifiDisplay;ZZ)Landroid/preference/Preference;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/androie/settings/ProgressCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 305
    :cond_a
    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    .line 311
    .end local v3    # "d":Landroid/hardware/display/WifiDisplay;
    :cond_b
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mWifiDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    invoke-virtual {v10}, Landroid/hardware/display/WifiDisplayStatus;->getScanState()I

    move-result v10

    const/4 v11, 0x1

    if-eq v10, v11, :cond_c

    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mRemoteDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    invoke-virtual {v10}, Landroid/hardware/display/WifiDisplayStatus;->getScanState()I

    move-result v10

    const/4 v11, 0x1

    if-ne v10, v11, :cond_d

    .line 313
    :cond_c
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mAvailableDevicesCategory:Lcom/androie/settings/ProgressCategory;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Lcom/androie/settings/ProgressCategory;->setProgress(Z)V

    .line 323
    .end local v0    # "arr$":[Landroid/hardware/display/WifiDisplay;
    .end local v1    # "availableDisplays":[Landroid/hardware/display/WifiDisplay;
    .end local v2    # "availableRemoteDisplays":[Landroid/hardware/display/WifiDisplay;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    .end local v7    # "pairedDisplays":[Landroid/hardware/display/WifiDisplay;
    .end local v8    # "pairedRemoteDisplays":[Landroid/hardware/display/WifiDisplay;
    :goto_9
    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-virtual {v10}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 324
    return-void

    .line 315
    .restart local v0    # "arr$":[Landroid/hardware/display/WifiDisplay;
    .restart local v1    # "availableDisplays":[Landroid/hardware/display/WifiDisplay;
    .restart local v2    # "availableRemoteDisplays":[Landroid/hardware/display/WifiDisplay;
    .restart local v5    # "i$":I
    .restart local v6    # "len$":I
    .restart local v7    # "pairedDisplays":[Landroid/hardware/display/WifiDisplay;
    .restart local v8    # "pairedRemoteDisplays":[Landroid/hardware/display/WifiDisplay;
    :cond_d
    iget-object v10, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mAvailableDevicesCategory:Lcom/androie/settings/ProgressCategory;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lcom/androie/settings/ProgressCategory;->setProgress(Z)V

    goto :goto_9

    .line 318
    .end local v0    # "arr$":[Landroid/hardware/display/WifiDisplay;
    .end local v1    # "availableDisplays":[Landroid/hardware/display/WifiDisplay;
    .end local v2    # "availableRemoteDisplays":[Landroid/hardware/display/WifiDisplay;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    .end local v7    # "pairedDisplays":[Landroid/hardware/display/WifiDisplay;
    .end local v8    # "pairedRemoteDisplays":[Landroid/hardware/display/WifiDisplay;
    :cond_e
    iget-object v11, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mEmptyView:Landroid/widget/TextView;

    const/4 v10, 0x2

    if-ne v4, v10, :cond_f

    const v10, 0x7f080525

    :goto_a
    invoke-virtual {v11, v10}, Landroid/widget/TextView;->setText(I)V

    goto :goto_9

    :cond_f
    const v10, 0x7f080526

    goto :goto_a
.end method

.method private static contains([Landroid/hardware/display/WifiDisplay;Ljava/lang/String;)Z
    .locals 5
    .param p0, "displays"    # [Landroid/hardware/display/WifiDisplay;
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 429
    move-object v0, p0

    .local v0, "arr$":[Landroid/hardware/display/WifiDisplay;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 430
    .local v1, "d":Landroid/hardware/display/WifiDisplay;
    invoke-virtual {v1}, Landroid/hardware/display/WifiDisplay;->getDeviceAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 431
    const/4 v4, 0x1

    .line 434
    .end local v1    # "d":Landroid/hardware/display/WifiDisplay;
    :goto_1
    return v4

    .line 429
    .restart local v1    # "d":Landroid/hardware/display/WifiDisplay;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 434
    .end local v1    # "d":Landroid/hardware/display/WifiDisplay;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method private createWifiDisplayPreference(Landroid/hardware/display/WifiDisplay;ZZ)Landroid/preference/Preference;
    .locals 4
    .param p1, "d"    # Landroid/hardware/display/WifiDisplay;
    .param p2, "paired"    # Z
    .param p3, "isRemote"    # Z

    .prologue
    .line 327
    new-instance v1, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;

    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2, p1, p3}, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;-><init>(Lcom/androie/settings/wfd/WifiDisplaySettings;Landroid/content/Context;Landroid/hardware/display/WifiDisplay;Z)V

    .line 328
    .local v1, "p":Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;
    const/4 v0, 0x0

    .line 329
    .local v0, "displayStatus":Landroid/hardware/display/WifiDisplayStatus;
    if-eqz p3, :cond_2

    .line 330
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mRemoteDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    .line 334
    :goto_0
    invoke-virtual {v0}, Landroid/hardware/display/WifiDisplayStatus;->getActiveDisplay()Landroid/hardware/display/WifiDisplay;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/hardware/display/WifiDisplay;->equals(Landroid/hardware/display/WifiDisplay;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 335
    invoke-virtual {v0}, Landroid/hardware/display/WifiDisplayStatus;->getActiveDisplayState()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 347
    :cond_0
    :goto_1
    if-eqz p2, :cond_1

    .line 348
    const v2, 0x7f0400d6

    invoke-virtual {v1, v2}, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->setWidgetLayoutResource(I)V

    .line 350
    :cond_1
    return-object v1

    .line 332
    :cond_2
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mWifiDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    goto :goto_0

    .line 337
    :pswitch_0
    const v2, 0x7f08052d

    invoke-virtual {v1, v2}, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->setSummary(I)V

    goto :goto_1

    .line 340
    :pswitch_1
    const v2, 0x7f08052c

    invoke-virtual {v1, v2}, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->setSummary(I)V

    goto :goto_1

    .line 343
    :cond_3
    if-eqz p2, :cond_0

    invoke-virtual {v0}, Landroid/hardware/display/WifiDisplayStatus;->getAvailableDisplays()[Landroid/hardware/display/WifiDisplay;

    move-result-object v2

    invoke-virtual {p1}, Landroid/hardware/display/WifiDisplay;->getDeviceAddress()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/androie/settings/wfd/WifiDisplaySettings;->contains([Landroid/hardware/display/WifiDisplay;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 345
    const v2, 0x7f08052e

    invoke-virtual {v1, v2}, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->setSummary(I)V

    goto :goto_1

    .line 335
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private scanRemoteDisplays()V
    .locals 1

    .prologue
    .line 137
    :try_start_0
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mRemoteDisplayAdapter:Landroid/hardware/display/IRemoteDisplayAdapter;

    invoke-interface {v0}, Landroid/hardware/display/IRemoteDisplayAdapter;->scanRemoteDisplays()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    :goto_0
    return-void

    .line 139
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private showDisconnectDialog(Landroid/hardware/display/WifiDisplay;Z)V
    .locals 8
    .param p1, "display"    # Landroid/hardware/display/WifiDisplay;
    .param p2, "isRemoteDisplay"    # Z

    .prologue
    const/4 v5, 0x1

    .line 354
    new-instance v1, Lcom/androie/settings/wfd/WifiDisplaySettings$1;

    invoke-direct {v1, p0, p2, p1}, Lcom/androie/settings/wfd/WifiDisplaySettings$1;-><init>(Lcom/androie/settings/wfd/WifiDisplaySettings;ZLandroid/hardware/display/WifiDisplay;)V

    .line 369
    .local v1, "ok":Landroid/content/DialogInterface$OnClickListener;
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f080530

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080531

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {p1}, Landroid/hardware/display/WifiDisplay;->getFriendlyDisplayName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x104000a

    invoke-virtual {v2, v3, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/high16 v3, 0x1040000

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 377
    .local v0, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 378
    return-void
.end method

.method private showOptionsDialog(Landroid/hardware/display/WifiDisplay;Z)V
    .locals 8
    .param p1, "display"    # Landroid/hardware/display/WifiDisplay;
    .param p2, "isRemoteDisplay"    # Z

    .prologue
    .line 381
    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v5

    const v6, 0x7f0400d5

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 382
    .local v4, "view":Landroid/view/View;
    const v5, 0x7f0c002c

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 383
    .local v3, "nameEditText":Landroid/widget/EditText;
    invoke-virtual {p1}, Landroid/hardware/display/WifiDisplay;->getFriendlyDisplayName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 385
    new-instance v1, Lcom/androie/settings/wfd/WifiDisplaySettings$2;

    invoke-direct {v1, p0, v3, p1, p2}, Lcom/androie/settings/wfd/WifiDisplaySettings$2;-><init>(Lcom/androie/settings/wfd/WifiDisplaySettings;Landroid/widget/EditText;Landroid/hardware/display/WifiDisplay;Z)V

    .line 403
    .local v1, "done":Landroid/content/DialogInterface$OnClickListener;
    new-instance v2, Lcom/androie/settings/wfd/WifiDisplaySettings$3;

    invoke-direct {v2, p0, p2, p1}, Lcom/androie/settings/wfd/WifiDisplaySettings$3;-><init>(Lcom/androie/settings/wfd/WifiDisplaySettings;ZLandroid/hardware/display/WifiDisplay;)V

    .line 418
    .local v2, "forget":Landroid/content/DialogInterface$OnClickListener;
    new-instance v5, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x7f080532

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x7f080534

    invoke-virtual {v5, v6, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x7f080533

    invoke-virtual {v5, v6, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 425
    .local v0, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 426
    return-void
.end method

.method private update()V
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 233
    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "wifi_display_on"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mWifiDisplayOnSetting:Z

    .line 235
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    invoke-virtual {v0}, Landroid/hardware/display/DisplayManager;->getWifiDisplayStatus()Landroid/hardware/display/WifiDisplayStatus;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mWifiDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    .line 237
    :try_start_0
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mRemoteDisplayAdapter:Landroid/hardware/display/IRemoteDisplayAdapter;

    invoke-interface {v0}, Landroid/hardware/display/IRemoteDisplayAdapter;->getRemoteDisplayStatus()Landroid/hardware/display/WifiDisplayStatus;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mRemoteDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 241
    :goto_0
    invoke-direct {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->applyState()V

    .line 242
    return-void

    .line 239
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v5, 0x10

    const/4 v6, -0x2

    const/4 v4, 0x0

    .line 102
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 104
    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 105
    .local v0, "activity":Landroid/app/Activity;
    new-instance v2, Landroid/widget/Switch;

    invoke-direct {v2, v0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mActionBarSwitch:Landroid/widget/Switch;

    .line 106
    iget-object v2, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mActionBarSwitch:Landroid/widget/Switch;

    iget-object v3, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mSwitchOnCheckedChangedListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v2, v3}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 108
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070014

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 110
    .local v1, "padding":I
    iget-object v2, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mActionBarSwitch:Landroid/widget/Switch;

    invoke-virtual {v2, v4, v4, v1, v4}, Landroid/widget/Switch;->setPaddingRelative(IIII)V

    .line 111
    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v2

    invoke-virtual {v2, v5, v5}, Landroid/app/ActionBar;->setDisplayOptions(II)V

    .line 113
    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v2

    iget-object v3, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mActionBarSwitch:Landroid/widget/Switch;

    new-instance v4, Landroid/app/ActionBar$LayoutParams;

    const v5, 0x800015

    invoke-direct {v4, v6, v6, v5}, Landroid/app/ActionBar$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v3, v4}, Landroid/app/ActionBar;->setCustomView(Landroid/view/View;Landroid/app/ActionBar$LayoutParams;)V

    .line 119
    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getView()Landroid/view/View;

    move-result-object v2

    const v3, 0x1020004

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mEmptyView:Landroid/widget/TextView;

    .line 120
    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getListView()Landroid/widget/ListView;

    move-result-object v2

    iget-object v3, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mEmptyView:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 122
    invoke-direct {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->update()V

    .line 124
    iget-object v2, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mWifiDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    invoke-virtual {v2}, Landroid/hardware/display/WifiDisplayStatus;->getFeatureState()I

    move-result v2

    if-nez v2, :cond_0

    .line 125
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 127
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 91
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 93
    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "display"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/display/DisplayManager;

    iput-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    .line 94
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    invoke-virtual {v0}, Landroid/hardware/display/DisplayManager;->getRemoteDisplayAdapter()Landroid/hardware/display/IRemoteDisplayAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mRemoteDisplayAdapter:Landroid/hardware/display/IRemoteDisplayAdapter;

    .line 96
    const v0, 0x7f05005a

    invoke-virtual {p0, v0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->addPreferencesFromResource(I)V

    .line 97
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->setHasOptionsMenu(Z)V

    .line 98
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 5
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 173
    iget-object v1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mWifiDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    invoke-virtual {v1}, Landroid/hardware/display/WifiDisplayStatus;->getScanState()I

    move-result v1

    if-ne v1, v2, :cond_0

    const v1, 0x7f080528

    :goto_0
    invoke-interface {p1, v3, v2, v3, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    .line 177
    .local v0, "item":Landroid/view/MenuItem;
    iget-object v1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mWifiDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    invoke-virtual {v1}, Landroid/hardware/display/WifiDisplayStatus;->getFeatureState()I

    move-result v1

    const/4 v4, 0x3

    if-ne v1, v4, :cond_1

    iget-object v1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mWifiDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    invoke-virtual {v1}, Landroid/hardware/display/WifiDisplayStatus;->getScanState()I

    move-result v1

    if-nez v1, :cond_1

    move v1, v2

    :goto_1
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 179
    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 180
    invoke-super {p0, p1, p2}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 181
    return-void

    .line 173
    .end local v0    # "item":Landroid/view/MenuItem;
    :cond_0
    const v1, 0x7f080527

    goto :goto_0

    .restart local v0    # "item":Landroid/view/MenuItem;
    :cond_1
    move v1, v3

    .line 177
    goto :goto_1
.end method

.method public onDestroyView()V
    .locals 2

    .prologue
    .line 131
    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setCustomView(Landroid/view/View;)V

    .line 132
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onDestroyView()V

    .line 133
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v1, 0x3

    .line 185
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 195
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 187
    :pswitch_0
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mWifiDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    invoke-virtual {v0}, Landroid/hardware/display/WifiDisplayStatus;->getFeatureState()I

    move-result v0

    if-ne v0, v1, :cond_0

    .line 188
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    invoke-virtual {v0}, Landroid/hardware/display/DisplayManager;->scanWifiDisplays()V

    .line 190
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mRemoteDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    invoke-virtual {v0}, Landroid/hardware/display/WifiDisplayStatus;->getFeatureState()I

    move-result v0

    if-ne v0, v1, :cond_1

    .line 191
    invoke-direct {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->scanRemoteDisplays()V

    .line 193
    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    .line 185
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 3

    .prologue
    .line 163
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onPause()V

    .line 165
    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 166
    .local v0, "context":Landroid/content/Context;
    iget-object v1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 168
    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mSettingsObserver:Landroid/database/ContentObserver;

    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 169
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 5
    .param p1, "preferenceScreen"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 201
    instance-of v3, p2, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;

    if-eqz v3, :cond_4

    move-object v2, p2

    .line 202
    check-cast v2, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;

    .line 203
    .local v2, "p":Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;
    invoke-virtual {v2}, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->getDisplay()Landroid/hardware/display/WifiDisplay;

    move-result-object v0

    .line 205
    .local v0, "display":Landroid/hardware/display/WifiDisplay;
    const/4 v1, 0x0

    .line 206
    .local v1, "isActive":Z
    invoke-virtual {v2}, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->isRemoteDisplay()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 207
    iget-object v3, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mRemoteDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    invoke-virtual {v3}, Landroid/hardware/display/WifiDisplayStatus;->getActiveDisplay()Landroid/hardware/display/WifiDisplay;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/hardware/display/WifiDisplay;->equals(Landroid/hardware/display/WifiDisplay;)Z

    move-result v1

    .line 212
    :goto_0
    if-eqz v1, :cond_2

    .line 213
    invoke-virtual {v2}, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->isRemoteDisplay()Z

    move-result v3

    invoke-direct {p0, v0, v3}, Lcom/androie/settings/wfd/WifiDisplaySettings;->showDisconnectDialog(Landroid/hardware/display/WifiDisplay;Z)V

    .line 229
    .end local v0    # "display":Landroid/hardware/display/WifiDisplay;
    .end local v1    # "isActive":Z
    .end local v2    # "p":Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;
    :cond_0
    :goto_1
    invoke-super {p0, p1, p2}, Lcom/androie/settings/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v3

    :goto_2
    return v3

    .line 209
    .restart local v0    # "display":Landroid/hardware/display/WifiDisplay;
    .restart local v1    # "isActive":Z
    .restart local v2    # "p":Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;
    :cond_1
    iget-object v3, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mWifiDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    invoke-virtual {v3}, Landroid/hardware/display/WifiDisplayStatus;->getActiveDisplay()Landroid/hardware/display/WifiDisplay;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/hardware/display/WifiDisplay;->equals(Landroid/hardware/display/WifiDisplay;)Z

    move-result v1

    goto :goto_0

    .line 214
    :cond_2
    invoke-virtual {v2}, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->isRemoteDisplay()Z

    move-result v3

    if-nez v3, :cond_3

    .line 215
    iget-object v3, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    invoke-virtual {v0}, Landroid/hardware/display/WifiDisplay;->getDeviceAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/hardware/display/DisplayManager;->connectWifiDisplay(Ljava/lang/String;)V

    goto :goto_1

    .line 218
    :cond_3
    :try_start_0
    iget-object v3, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mRemoteDisplayAdapter:Landroid/hardware/display/IRemoteDisplayAdapter;

    invoke-virtual {v0}, Landroid/hardware/display/WifiDisplay;->getDeviceAddress()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/hardware/display/IRemoteDisplayAdapter;->connectRemoteDisplay(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 220
    :catch_0
    move-exception v3

    goto :goto_1

    .line 224
    .end local v0    # "display":Landroid/hardware/display/WifiDisplay;
    .end local v1    # "isActive":Z
    .end local v2    # "p":Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;
    :cond_4
    iget-object v3, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mDisableHDCP:Landroid/preference/CheckBoxPreference;

    if-ne p2, v3, :cond_0

    .line 225
    const-string v4, "persist.sys.wfd.nohdcp"

    iget-object v3, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mDisableHDCP:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_5

    const-string v3, "1"

    :goto_3
    invoke-static {v4, v3}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    const/4 v3, 0x1

    goto :goto_2

    .line 225
    :cond_5
    const-string v3, "0"

    goto :goto_3
.end method

.method public onResume()V
    .locals 6

    .prologue
    .line 145
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onResume()V

    .line 147
    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 148
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 149
    .local v1, "filter":Landroid/content/IntentFilter;
    const-string v2, "android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 150
    const-string v2, "android.hardware.display.action.REMOTE_DISPLAY_STATUS_CHANGED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 151
    iget-object v2, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v2, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 153
    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "wifi_display_on"

    invoke-static {v3}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mSettingsObserver:Landroid/database/ContentObserver;

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 156
    iget-object v2, p0, Lcom/androie/settings/wfd/WifiDisplaySettings;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    invoke-virtual {v2}, Landroid/hardware/display/DisplayManager;->scanWifiDisplays()V

    .line 157
    invoke-direct {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->scanRemoteDisplays()V

    .line 158
    invoke-direct {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->update()V

    .line 159
    return-void
.end method
