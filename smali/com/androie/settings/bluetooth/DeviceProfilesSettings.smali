.class public final Lcom/androie/settings/bluetooth/DeviceProfilesSettings;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "DeviceProfilesSettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;
.implements Lcom/androie/settings/bluetooth/CachedBluetoothDevice$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/bluetooth/DeviceProfilesSettings$RenameEditTextPreference;
    }
.end annotation


# instance fields
.field private final mAutoConnectPrefs:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/androie/settings/bluetooth/LocalBluetoothProfile;",
            "Landroid/preference/CheckBoxPreference;",
            ">;"
        }
    .end annotation
.end field

.field private mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

.field private mDeviceNamePref:Landroid/preference/EditTextPreference;

.field private mDisconnectDialog:Landroid/app/AlertDialog;

.field private mManager:Lcom/androie/settings/bluetooth/LocalBluetoothManager;

.field private mProfileContainer:Landroid/preference/PreferenceGroup;

.field private mProfileGroupIsRemoved:Z

.field private mProfileManager:Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;

.field private mRenameDeviceNamePref:Lcom/androie/settings/bluetooth/DeviceProfilesSettings$RenameEditTextPreference;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    .line 66
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mAutoConnectPrefs:Ljava/util/HashMap;

    .line 72
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/bluetooth/DeviceProfilesSettings;)Landroid/preference/EditTextPreference;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/bluetooth/DeviceProfilesSettings;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mDeviceNamePref:Landroid/preference/EditTextPreference;

    return-object v0
.end method

.method private addPreferencesForProfiles()V
    .locals 4

    .prologue
    .line 178
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v3}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getConnectableProfiles()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .line 179
    .local v2, "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    invoke-direct {p0, v2}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->createProfilePreference(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)Landroid/preference/CheckBoxPreference;

    move-result-object v1

    .line 180
    .local v1, "pref":Landroid/preference/Preference;
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mProfileContainer:Landroid/preference/PreferenceGroup;

    invoke-virtual {v3, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    goto :goto_0

    .line 182
    .end local v1    # "pref":Landroid/preference/Preference;
    .end local v2    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    :cond_0
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->showOrHideProfileGroup()V

    .line 183
    return-void
.end method

.method private askDisconnect(Landroid/content/Context;Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "profile"    # Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .prologue
    .line 277
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    .line 278
    .local v0, "device":Lcom/androie/settings/bluetooth/CachedBluetoothDevice;
    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v3

    .line 279
    .local v3, "name":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 280
    const v6, 0x7f0803eb

    invoke-virtual {p1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 283
    :cond_0
    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v6

    invoke-interface {p2, v6}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->getNameResource(Landroid/bluetooth/BluetoothDevice;)I

    move-result v6

    invoke-virtual {p1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 285
    .local v4, "profileName":Ljava/lang/String;
    const v6, 0x7f0803e0

    invoke-virtual {p1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 286
    .local v5, "title":Ljava/lang/String;
    const v6, 0x7f0803e1

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v4, v7, v8

    const/4 v8, 0x1

    aput-object v3, v7, v8

    invoke-virtual {p1, v6, v7}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 289
    .local v2, "message":Ljava/lang/String;
    new-instance v1, Lcom/androie/settings/bluetooth/DeviceProfilesSettings$1;

    invoke-direct {v1, p0, v0, p2}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings$1;-><init>(Lcom/androie/settings/bluetooth/DeviceProfilesSettings;Lcom/androie/settings/bluetooth/CachedBluetoothDevice;Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V

    .line 297
    .local v1, "disconnectListener":Landroid/content/DialogInterface$OnClickListener;
    iget-object v6, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mDisconnectDialog:Landroid/app/AlertDialog;

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    invoke-static {p1, v6, v1, v5, v7}, Lcom/androie/settings/bluetooth/Utils;->showDisconnectDialog(Landroid/content/Context;Landroid/app/AlertDialog;Landroid/content/DialogInterface$OnClickListener;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/AlertDialog;

    move-result-object v6

    iput-object v6, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mDisconnectDialog:Landroid/app/AlertDialog;

    .line 299
    return-void
.end method

.method private createProfilePreference(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)Landroid/preference/CheckBoxPreference;
    .locals 4
    .param p1, "profile"    # Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .prologue
    const/4 v2, 0x0

    .line 205
    new-instance v1, Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    .line 206
    .local v1, "pref":Landroid/preference/CheckBoxPreference;
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 207
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v3}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    invoke-interface {p1, v3}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->getNameResource(Landroid/bluetooth/BluetoothDevice;)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/preference/CheckBoxPreference;->setTitle(I)V

    .line 208
    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setPersistent(Z)V

    .line 209
    invoke-interface {p1}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->getOrdinal()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->getProfilePreferenceIndex(I)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/preference/CheckBoxPreference;->setOrder(I)V

    .line 210
    invoke-virtual {v1, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 212
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v3}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getBtClass()Landroid/bluetooth/BluetoothClass;

    move-result-object v3

    invoke-interface {p1, v3}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->getDrawableResource(Landroid/bluetooth/BluetoothClass;)I

    move-result v0

    .line 213
    .local v0, "iconResource":I
    if-eqz v0, :cond_0

    .line 214
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/preference/CheckBoxPreference;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 220
    :cond_0
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v3}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->isBusy()Z

    move-result v3

    if-nez v3, :cond_1

    const/4 v2, 0x1

    :cond_1
    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 222
    invoke-direct {p0, v1, p1}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->refreshProfilePreference(Landroid/preference/CheckBoxPreference;Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V

    .line 224
    return-object v1
.end method

.method private getProfileOf(Landroid/preference/Preference;)Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    .locals 5
    .param p1, "pref"    # Landroid/preference/Preference;

    .prologue
    const/4 v2, 0x0

    .line 351
    instance-of v3, p1, Landroid/preference/CheckBoxPreference;

    if-nez v3, :cond_1

    .line 360
    :cond_0
    :goto_0
    return-object v2

    .line 354
    :cond_1
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    .line 355
    .local v1, "key":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 358
    :try_start_0
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mProfileManager:Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;->getProfileByName(Ljava/lang/String;)Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 359
    :catch_0
    move-exception v0

    .line 360
    .local v0, "ignored":Ljava/lang/IllegalArgumentException;
    goto :goto_0
.end method

.method private getProfilePreferenceIndex(I)I
    .locals 2
    .param p1, "profIndex"    # I

    .prologue
    .line 365
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mProfileContainer:Landroid/preference/PreferenceGroup;

    invoke-virtual {v0}, Landroid/preference/PreferenceGroup;->getOrder()I

    move-result v0

    mul-int/lit8 v1, p1, 0xa

    add-int/2addr v0, v1

    return v0
.end method

.method private onProfileClicked(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;Landroid/preference/CheckBoxPreference;)V
    .locals 6
    .param p1, "profile"    # Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    .param p2, "profilePref"    # Landroid/preference/CheckBoxPreference;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 254
    iget-object v5, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v5}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 256
    .local v0, "device":Landroid/bluetooth/BluetoothDevice;
    invoke-interface {p1, v0}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->getConnectionStatus(Landroid/bluetooth/BluetoothDevice;)I

    move-result v2

    .line 257
    .local v2, "status":I
    const/4 v5, 0x2

    if-ne v2, v5, :cond_0

    move v1, v3

    .line 260
    .local v1, "isConnected":Z
    :goto_0
    if-eqz v1, :cond_1

    .line 261
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {p0, v3, p1}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->askDisconnect(Landroid/content/Context;Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V

    .line 272
    :goto_1
    return-void

    .end local v1    # "isConnected":Z
    :cond_0
    move v1, v4

    .line 257
    goto :goto_0

    .line 263
    .restart local v1    # "isConnected":Z
    :cond_1
    invoke-interface {p1, v0}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->isPreferred(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 265
    invoke-interface {p1, v0, v4}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->setPreferred(Landroid/bluetooth/BluetoothDevice;Z)V

    .line 266
    invoke-direct {p0, p2, p1}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->refreshProfilePreference(Landroid/preference/CheckBoxPreference;Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V

    goto :goto_1

    .line 268
    :cond_2
    invoke-interface {p1, v0, v3}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->setPreferred(Landroid/bluetooth/BluetoothDevice;Z)V

    .line 269
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v3, p1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->connectProfile(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V

    goto :goto_1
.end method

.method private refresh()V
    .locals 2

    .prologue
    .line 306
    iget-object v1, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v0

    .line 307
    .local v0, "deviceName":Ljava/lang/String;
    iget-object v1, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mDeviceNamePref:Landroid/preference/EditTextPreference;

    invoke-virtual {v1, v0}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 308
    iget-object v1, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mDeviceNamePref:Landroid/preference/EditTextPreference;

    invoke-virtual {v1, v0}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 310
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->refreshProfiles()V

    .line 311
    return-void
.end method

.method private refreshProfilePreference(Landroid/preference/CheckBoxPreference;Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V
    .locals 5
    .param p1, "profilePref"    # Landroid/preference/CheckBoxPreference;
    .param p2, "profile"    # Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 335
    iget-object v1, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 340
    .local v0, "device":Landroid/bluetooth/BluetoothDevice;
    iget-object v1, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->isBusy()Z

    move-result v1

    if-nez v1, :cond_0

    move v1, v2

    :goto_0
    invoke-virtual {p1, v1}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 341
    instance-of v1, p2, Lcom/androie/settings/bluetooth/PanProfile;

    if-eqz v1, :cond_2

    .line 342
    invoke-interface {p2, v0}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->getConnectionStatus(Landroid/bluetooth/BluetoothDevice;)I

    move-result v1

    const/4 v4, 0x2

    if-ne v1, v4, :cond_1

    :goto_1
    invoke-virtual {p1, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 347
    :goto_2
    invoke-interface {p2, v0}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->getSummaryResourceForDevice(Landroid/bluetooth/BluetoothDevice;)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/preference/CheckBoxPreference;->setSummary(I)V

    .line 348
    return-void

    :cond_0
    move v1, v3

    .line 340
    goto :goto_0

    :cond_1
    move v2, v3

    .line 342
    goto :goto_1

    .line 345
    :cond_2
    invoke-interface {p2, v0}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->isPreferred(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v1

    invoke-virtual {p1, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_2
.end method

.method private refreshProfiles()V
    .locals 6

    .prologue
    .line 314
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v3}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getConnectableProfiles()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .line 315
    .local v1, "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    .line 316
    .local v2, "profilePref":Landroid/preference/CheckBoxPreference;
    if-nez v2, :cond_0

    .line 317
    invoke-direct {p0, v1}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->createProfilePreference(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)Landroid/preference/CheckBoxPreference;

    move-result-object v2

    .line 318
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mProfileContainer:Landroid/preference/PreferenceGroup;

    invoke-virtual {v3, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    goto :goto_0

    .line 320
    :cond_0
    invoke-direct {p0, v2, v1}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->refreshProfilePreference(Landroid/preference/CheckBoxPreference;Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V

    goto :goto_0

    .line 323
    .end local v1    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    .end local v2    # "profilePref":Landroid/preference/CheckBoxPreference;
    :cond_1
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v3}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getRemovedProfiles()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .line 324
    .restart local v1    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    .line 325
    .local v2, "profilePref":Landroid/preference/Preference;
    if-eqz v2, :cond_2

    .line 326
    const-string v3, "DeviceProfilesSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Removing "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " from profile list"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 327
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mProfileContainer:Landroid/preference/PreferenceGroup;

    invoke-virtual {v3, v2}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_1

    .line 330
    .end local v1    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    .end local v2    # "profilePref":Landroid/preference/Preference;
    :cond_3
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->showOrHideProfileGroup()V

    .line 331
    return-void
.end method

.method private showOrHideProfileGroup()V
    .locals 3

    .prologue
    .line 186
    iget-object v1, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mProfileContainer:Landroid/preference/PreferenceGroup;

    invoke-virtual {v1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    .line 187
    .local v0, "numProfiles":I
    iget-boolean v1, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mProfileGroupIsRemoved:Z

    if-nez v1, :cond_1

    if-nez v0, :cond_1

    .line 188
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mProfileContainer:Landroid/preference/PreferenceGroup;

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 189
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mProfileGroupIsRemoved:Z

    .line 194
    :cond_0
    :goto_0
    return-void

    .line 190
    :cond_1
    iget-boolean v1, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mProfileGroupIsRemoved:Z

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 191
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mProfileContainer:Landroid/preference/PreferenceGroup;

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 192
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mProfileGroupIsRemoved:Z

    goto :goto_0
.end method

.method private unpairDevice()V
    .locals 1

    .prologue
    .line 369
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->unpair()V

    .line 370
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 93
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 96
    if-eqz p1, :cond_0

    .line 97
    const-string v4, "device"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothDevice;

    .line 103
    .local v1, "device":Landroid/bluetooth/BluetoothDevice;
    :goto_0
    const v4, 0x7f05000c

    invoke-virtual {p0, v4}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->addPreferencesFromResource(I)V

    .line 104
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/preference/PreferenceScreen;->setOrderingAsAdded(Z)V

    .line 105
    const-string v4, "profile_container"

    invoke-virtual {p0, v4}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/PreferenceGroup;

    iput-object v4, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mProfileContainer:Landroid/preference/PreferenceGroup;

    .line 106
    const-string v4, "rename_device"

    invoke-virtual {p0, v4}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/EditTextPreference;

    iput-object v4, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mDeviceNamePref:Landroid/preference/EditTextPreference;

    .line 108
    if-nez v1, :cond_1

    .line 109
    const-string v4, "DeviceProfilesSettings"

    const-string v5, "Activity started without a remote Bluetooth device"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->finish()V

    .line 132
    :goto_1
    return-void

    .line 99
    .end local v1    # "device":Landroid/bluetooth/BluetoothDevice;
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 100
    .local v0, "args":Landroid/os/Bundle;
    const-string v4, "device"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothDevice;

    .restart local v1    # "device":Landroid/bluetooth/BluetoothDevice;
    goto :goto_0

    .line 113
    .end local v0    # "args":Landroid/os/Bundle;
    :cond_1
    new-instance v4, Lcom/androie/settings/bluetooth/DeviceProfilesSettings$RenameEditTextPreference;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings$RenameEditTextPreference;-><init>(Lcom/androie/settings/bluetooth/DeviceProfilesSettings;Lcom/androie/settings/bluetooth/DeviceProfilesSettings$1;)V

    iput-object v4, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mRenameDeviceNamePref:Lcom/androie/settings/bluetooth/DeviceProfilesSettings$RenameEditTextPreference;

    .line 114
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4}, Lcom/androie/settings/bluetooth/LocalBluetoothManager;->getInstance(Landroid/content/Context;)Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    move-result-object v4

    iput-object v4, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mManager:Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    .line 115
    iget-object v4, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mManager:Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {v4}, Lcom/androie/settings/bluetooth/LocalBluetoothManager;->getCachedDeviceManager()Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;

    move-result-object v2

    .line 117
    .local v2, "deviceManager":Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;
    iget-object v4, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mManager:Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {v4}, Lcom/androie/settings/bluetooth/LocalBluetoothManager;->getProfileManager()Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;

    move-result-object v4

    iput-object v4, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mProfileManager:Lcom/androie/settings/bluetooth/LocalBluetoothProfileManager;

    .line 118
    invoke-virtual {v2, v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;->findDevice(Landroid/bluetooth/BluetoothDevice;)Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    move-result-object v4

    iput-object v4, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    .line 119
    iget-object v4, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    if-nez v4, :cond_2

    .line 120
    const-string v4, "DeviceProfilesSettings"

    const-string v5, "Device not found, cannot connect to it"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->finish()V

    goto :goto_1

    .line 125
    :cond_2
    iget-object v4, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v4}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v3

    .line 126
    .local v3, "deviceName":Ljava/lang/String;
    iget-object v4, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mDeviceNamePref:Landroid/preference/EditTextPreference;

    invoke-virtual {v4, v3}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 127
    iget-object v4, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mDeviceNamePref:Landroid/preference/EditTextPreference;

    invoke-virtual {v4, v3}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 128
    iget-object v4, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mDeviceNamePref:Landroid/preference/EditTextPreference;

    invoke-virtual {v4, p0}, Landroid/preference/EditTextPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 131
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->addPreferencesForProfiles()V

    goto :goto_1
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 136
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onDestroy()V

    .line 137
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mDisconnectDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 138
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mDisconnectDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 139
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mDisconnectDialog:Landroid/app/AlertDialog;

    .line 141
    :cond_0
    return-void
.end method

.method public onDeviceAttributesChanged()V
    .locals 0

    .prologue
    .line 302
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->refresh()V

    .line 303
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 171
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onPause()V

    .line 173
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v0, p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->unregisterCallback(Lcom/androie/settings/bluetooth/CachedBluetoothDevice$Callback;)V

    .line 174
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mManager:Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/androie/settings/bluetooth/LocalBluetoothManager;->setForegroundActivity(Landroid/content/Context;)V

    .line 175
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 3
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 240
    iget-object v2, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mDeviceNamePref:Landroid/preference/EditTextPreference;

    if-ne p1, v2, :cond_1

    .line 241
    iget-object v1, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    check-cast p2, Ljava/lang/String;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {v1, p2}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->setName(Ljava/lang/String;)V

    .line 250
    const/4 v1, 0x1

    .end local p1    # "preference":Landroid/preference/Preference;
    :cond_0
    :goto_0
    return v1

    .line 242
    .restart local p1    # "preference":Landroid/preference/Preference;
    .restart local p2    # "newValue":Ljava/lang/Object;
    :cond_1
    instance-of v2, p1, Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_0

    .line 243
    invoke-direct {p0, p1}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->getProfileOf(Landroid/preference/Preference;)Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    move-result-object v0

    .line 244
    .local v0, "prof":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    check-cast p1, Landroid/preference/CheckBoxPreference;

    .end local p1    # "preference":Landroid/preference/Preference;
    invoke-direct {p0, v0, p1}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->onProfileClicked(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;Landroid/preference/CheckBoxPreference;)V

    goto :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 2
    .param p1, "screen"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 229
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 230
    .local v0, "key":Ljava/lang/String;
    const-string v1, "unpair"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 231
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->unpairDevice()V

    .line 232
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->finish()V

    .line 233
    const/4 v1, 0x1

    .line 236
    :goto_0
    return v1

    :cond_0
    invoke-super {p0, p1, p2}, Lcom/androie/settings/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v1

    goto :goto_0
.end method

.method public onResume()V
    .locals 5

    .prologue
    .line 151
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onResume()V

    .line 153
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mManager:Lcom/androie/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/androie/settings/bluetooth/LocalBluetoothManager;->setForegroundActivity(Landroid/content/Context;)V

    .line 154
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v3, p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->registerCallback(Lcom/androie/settings/bluetooth/CachedBluetoothDevice$Callback;)V

    .line 155
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v3}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v3

    const/16 v4, 0xa

    if-ne v3, v4, :cond_0

    .line 156
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->finish()V

    .line 157
    :cond_0
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->refresh()V

    .line 158
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mDeviceNamePref:Landroid/preference/EditTextPreference;

    invoke-virtual {v3}, Landroid/preference/EditTextPreference;->getEditText()Landroid/widget/EditText;

    move-result-object v2

    .line 159
    .local v2, "et":Landroid/widget/EditText;
    if-eqz v2, :cond_1

    .line 160
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mRenameDeviceNamePref:Lcom/androie/settings/bluetooth/DeviceProfilesSettings$RenameEditTextPreference;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 161
    iget-object v3, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mDeviceNamePref:Landroid/preference/EditTextPreference;

    invoke-virtual {v3}, Landroid/preference/EditTextPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v1

    .line 162
    .local v1, "d":Landroid/app/Dialog;
    instance-of v3, v1, Landroid/app/AlertDialog;

    if-eqz v3, :cond_1

    .line 163
    check-cast v1, Landroid/app/AlertDialog;

    .end local v1    # "d":Landroid/app/Dialog;
    const/4 v3, -0x1

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    .line 164
    .local v0, "b":Landroid/widget/Button;
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->length()I

    move-result v3

    if-lez v3, :cond_2

    const/4 v3, 0x1

    :goto_0
    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 167
    .end local v0    # "b":Landroid/widget/Button;
    :cond_1
    return-void

    .line 164
    .restart local v0    # "b":Landroid/widget/Button;
    :cond_2
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 145
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 146
    const-string v0, "device"

    iget-object v1, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 147
    return-void
.end method
