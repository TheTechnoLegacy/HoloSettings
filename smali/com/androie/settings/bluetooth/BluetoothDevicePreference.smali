.class public final Lcom/androie/settings/bluetooth/BluetoothDevicePreference;
.super Landroid/preference/Preference;
.source "BluetoothDevicePreference.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/androie/settings/bluetooth/CachedBluetoothDevice$Callback;


# static fields
.field private static sDimAlpha:I


# instance fields
.field private final mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

.field private mDisconnectDialog:Landroid/app/AlertDialog;

.field private mOnSettingsClickListener:Landroid/view/View$OnClickListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    const/high16 v0, -0x80000000

    sput v0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->sDimAlpha:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/androie/settings/bluetooth/CachedBluetoothDevice;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cachedDevice"    # Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    .prologue
    .line 58
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 60
    sget v2, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->sDimAlpha:I

    const/high16 v3, -0x80000000

    if-ne v2, v3, :cond_0

    .line 61
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 62
    .local v0, "outValue":Landroid/util/TypedValue;
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const v3, 0x1010033

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v0, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 63
    invoke-virtual {v0}, Landroid/util/TypedValue;->getFloat()F

    move-result v2

    const/high16 v3, 0x437f0000    # 255.0f

    mul-float/2addr v2, v3

    float-to-int v2, v2

    sput v2, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->sDimAlpha:I

    .line 66
    .end local v0    # "outValue":Landroid/util/TypedValue;
    :cond_0
    iput-object p2, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    .line 68
    invoke-virtual {p2}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v2

    const/16 v3, 0xc

    if-ne v2, v3, :cond_1

    .line 69
    const-string v2, "user"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/UserManager;

    .line 70
    .local v1, "um":Landroid/os/UserManager;
    const-string v2, "no_config_bluetooth"

    invoke-virtual {v1, v2}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 71
    const v2, 0x7f040082

    invoke-virtual {p0, v2}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->setWidgetLayoutResource(I)V

    .line 75
    .end local v1    # "um":Landroid/os/UserManager;
    :cond_1
    iget-object v2, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v2, p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->registerCallback(Lcom/androie/settings/bluetooth/CachedBluetoothDevice$Callback;)V

    .line 77
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->onDeviceAttributesChanged()V

    .line 78
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/bluetooth/BluetoothDevicePreference;)Lcom/androie/settings/bluetooth/CachedBluetoothDevice;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/bluetooth/BluetoothDevicePreference;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    return-object v0
.end method

.method private askDisconnect()V
    .locals 8

    .prologue
    .line 190
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 191
    .local v0, "context":Landroid/content/Context;
    iget-object v5, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v5}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v3

    .line 192
    .local v3, "name":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 193
    const v5, 0x7f0803eb

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 195
    :cond_0
    const v5, 0x7f0803df

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v3, v6, v7

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 196
    .local v2, "message":Ljava/lang/String;
    const v5, 0x7f0803de

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 198
    .local v4, "title":Ljava/lang/String;
    new-instance v1, Lcom/androie/settings/bluetooth/BluetoothDevicePreference$1;

    invoke-direct {v1, p0}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference$1;-><init>(Lcom/androie/settings/bluetooth/BluetoothDevicePreference;)V

    .line 204
    .local v1, "disconnectListener":Landroid/content/DialogInterface$OnClickListener;
    iget-object v5, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mDisconnectDialog:Landroid/app/AlertDialog;

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v6

    invoke-static {v0, v5, v1, v4, v6}, Lcom/androie/settings/bluetooth/Utils;->showDisconnectDialog(Landroid/content/Context;Landroid/app/AlertDialog;Landroid/content/DialogInterface$OnClickListener;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/AlertDialog;

    move-result-object v5

    iput-object v5, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mDisconnectDialog:Landroid/app/AlertDialog;

    .line 206
    return-void
.end method

.method private getBtClassDrawable()I
    .locals 8

    .prologue
    const/4 v5, 0x0

    .line 270
    iget-object v6, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v6}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getBtClass()Landroid/bluetooth/BluetoothClass;

    move-result-object v0

    .line 271
    .local v0, "btClass":Landroid/bluetooth/BluetoothClass;
    if-eqz v0, :cond_1

    .line 272
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothClass;->getMajorDeviceClass()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    .line 292
    :goto_0
    iget-object v6, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v6}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getProfiles()Ljava/util/List;

    move-result-object v3

    .line 293
    .local v3, "profiles":Ljava/util/List;, "Ljava/util/List<Lcom/androie/settings/bluetooth/LocalBluetoothProfile;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .line 294
    .local v2, "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    invoke-interface {v2, v0}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->getDrawableResource(Landroid/bluetooth/BluetoothClass;)I

    move-result v4

    .line 295
    .local v4, "resId":I
    if-eqz v4, :cond_0

    .line 308
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    .end local v3    # "profiles":Ljava/util/List;, "Ljava/util/List<Lcom/androie/settings/bluetooth/LocalBluetoothProfile;>;"
    .end local v4    # "resId":I
    :goto_1
    return v4

    .line 274
    :sswitch_0
    const v4, 0x7f02005b

    goto :goto_1

    .line 277
    :sswitch_1
    const v4, 0x7f020055

    goto :goto_1

    .line 280
    :sswitch_2
    invoke-static {v0}, Lcom/androie/settings/bluetooth/HidProfile;->getHidClassDrawable(Landroid/bluetooth/BluetoothClass;)I

    move-result v4

    goto :goto_1

    .line 283
    :sswitch_3
    const v4, 0x7f020059

    goto :goto_1

    .line 289
    :cond_1
    const-string v6, "BluetoothDevicePreference"

    const-string v7, "mBtClass is null"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 299
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v3    # "profiles":Ljava/util/List;, "Ljava/util/List<Lcom/androie/settings/bluetooth/LocalBluetoothProfile;>;"
    :cond_2
    if-eqz v0, :cond_4

    .line 300
    const/4 v6, 0x1

    invoke-virtual {v0, v6}, Landroid/bluetooth/BluetoothClass;->doesClassMatch(I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 301
    const v4, 0x7f020057

    goto :goto_1

    .line 304
    :cond_3
    invoke-virtual {v0, v5}, Landroid/bluetooth/BluetoothClass;->doesClassMatch(I)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 305
    const v4, 0x7f020058

    goto :goto_1

    :cond_4
    move v4, v5

    .line 308
    goto :goto_1

    .line 272
    nop

    :sswitch_data_0
    .sparse-switch
        0x100 -> :sswitch_0
        0x200 -> :sswitch_1
        0x500 -> :sswitch_2
        0x600 -> :sswitch_3
    .end sparse-switch
.end method

.method private getConnectionSummary()I
    .locals 8

    .prologue
    .line 216
    iget-object v1, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    .line 218
    .local v1, "cachedDevice":Lcom/androie/settings/bluetooth/CachedBluetoothDevice;
    const/4 v6, 0x0

    .line 219
    .local v6, "profileConnected":Z
    const/4 v0, 0x0

    .line 220
    .local v0, "a2dpNotConnected":Z
    const/4 v3, 0x0

    .line 222
    .local v3, "headsetNotConnected":Z
    invoke-virtual {v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getProfiles()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    .line 223
    .local v5, "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    invoke-virtual {v1, v5}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getProfileConnectionState(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)I

    move-result v2

    .line 225
    .local v2, "connectionStatus":I
    packed-switch v2, :pswitch_data_0

    goto :goto_0

    .line 235
    :pswitch_0
    invoke-interface {v5}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->isProfileReady()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v7

    invoke-interface {v5, v7}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->isPreferred(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 236
    instance-of v7, v5, Lcom/androie/settings/bluetooth/A2dpProfile;

    if-eqz v7, :cond_1

    .line 237
    const/4 v0, 0x1

    goto :goto_0

    .line 228
    :pswitch_1
    invoke-static {v2}, Lcom/androie/settings/bluetooth/Utils;->getConnectionStateSummary(I)I

    move-result v7

    .line 265
    .end local v2    # "connectionStatus":I
    .end local v5    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    :goto_1
    return v7

    .line 231
    .restart local v2    # "connectionStatus":I
    .restart local v5    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    :pswitch_2
    const/4 v6, 0x1

    .line 232
    goto :goto_0

    .line 238
    :cond_1
    instance-of v7, v5, Lcom/androie/settings/bluetooth/HeadsetProfile;

    if-eqz v7, :cond_0

    .line 239
    const/4 v3, 0x1

    goto :goto_0

    .line 246
    .end local v2    # "connectionStatus":I
    .end local v5    # "profile":Lcom/androie/settings/bluetooth/LocalBluetoothProfile;
    :cond_2
    if-eqz v6, :cond_6

    .line 247
    if-eqz v0, :cond_3

    if-eqz v3, :cond_3

    .line 248
    const v7, 0x7f0803e5

    goto :goto_1

    .line 249
    :cond_3
    if-eqz v0, :cond_4

    .line 250
    const v7, 0x7f0803e4

    goto :goto_1

    .line 251
    :cond_4
    if-eqz v3, :cond_5

    .line 252
    const v7, 0x7f0803e3

    goto :goto_1

    .line 254
    :cond_5
    const v7, 0x7f0803e2

    goto :goto_1

    .line 258
    :cond_6
    invoke-virtual {v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v7

    packed-switch v7, :pswitch_data_1

    .line 265
    const/4 v7, 0x0

    goto :goto_1

    .line 260
    :pswitch_3
    const v7, 0x7f0803ea

    goto :goto_1

    .line 225
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_1
    .end packed-switch

    .line 258
    :pswitch_data_1
    .packed-switch 0xb
        :pswitch_3
    .end packed-switch
.end method

.method private pair()V
    .locals 3

    .prologue
    .line 209
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->startPairing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 210
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f0804ed

    invoke-static {v0, v1, v2}, Lcom/androie/settings/bluetooth/Utils;->showError(Landroid/content/Context;Ljava/lang/String;I)V

    .line 213
    :cond_0
    return-void
.end method


# virtual methods
.method public compareTo(Landroid/preference/Preference;)I
    .locals 2
    .param p1, "another"    # Landroid/preference/Preference;

    .prologue
    .line 167
    instance-of v0, p1, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;

    if-nez v0, :cond_0

    .line 169
    invoke-super {p0, p1}, Landroid/preference/Preference;->compareTo(Landroid/preference/Preference;)I

    move-result v0

    .line 172
    .end local p1    # "another":Landroid/preference/Preference;
    :goto_0
    return v0

    .restart local p1    # "another":Landroid/preference/Preference;
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    check-cast p1, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;

    .end local p1    # "another":Landroid/preference/Preference;
    iget-object v1, p1, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v0, v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->compareTo(Lcom/androie/settings/bluetooth/CachedBluetoothDevice;)I

    move-result v0

    goto :goto_0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 45
    check-cast p1, Landroid/preference/Preference;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->compareTo(Landroid/preference/Preference;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 153
    if-eqz p1, :cond_0

    instance-of v0, p1, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;

    if-nez v0, :cond_1

    .line 154
    :cond_0
    const/4 v0, 0x0

    .line 156
    .end local p1    # "o":Ljava/lang/Object;
    :goto_0
    return v0

    .restart local p1    # "o":Ljava/lang/Object;
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    check-cast p1, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v1, p1, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v0, v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method getCachedDevice()Lcom/androie/settings/bluetooth/CachedBluetoothDevice;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->hashCode()I

    move-result v0

    return v0
.end method

.method protected onBindView(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 128
    const-string v1, "bt_checkbox"

    invoke-virtual {p0, v1}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->findPreferenceInHierarchy(Ljava/lang/String;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 129
    const-string v1, "bt_checkbox"

    invoke-virtual {p0, v1}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->setDependency(Ljava/lang/String;)V

    .line 132
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v1

    const/16 v2, 0xc

    if-ne v1, v2, :cond_1

    .line 133
    const v1, 0x7f0c013a

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 134
    .local v0, "deviceDetails":Landroid/widget/ImageView;
    if-eqz v0, :cond_1

    .line 135
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 136
    iget-object v1, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 137
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0xff

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAlpha(I)V

    .line 141
    .end local v0    # "deviceDetails":Landroid/widget/ImageView;
    :cond_1
    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    .line 142
    return-void

    .line 137
    .restart local v0    # "deviceDetails":Landroid/widget/ImageView;
    :cond_2
    sget v1, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->sDimAlpha:I

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 146
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mOnSettingsClickListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_0

    .line 147
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mOnSettingsClickListener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 149
    :cond_0
    return-void
.end method

.method onClicked()V
    .locals 3

    .prologue
    .line 177
    iget-object v1, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v0

    .line 179
    .local v0, "bondState":I
    iget-object v1, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 180
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->askDisconnect()V

    .line 186
    :cond_0
    :goto_0
    return-void

    .line 181
    :cond_1
    const/16 v1, 0xc

    if-ne v0, v1, :cond_2

    .line 182
    iget-object v1, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->connect(Z)V

    goto :goto_0

    .line 183
    :cond_2
    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    .line 184
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->pair()V

    goto :goto_0
.end method

.method public onDeviceAttributesChanged()V
    .locals 3

    .prologue
    .line 104
    iget-object v2, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v2}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 106
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->getConnectionSummary()I

    move-result v1

    .line 107
    .local v1, "summaryResId":I
    if-eqz v1, :cond_1

    .line 108
    invoke-virtual {p0, v1}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->setSummary(I)V

    .line 113
    :goto_0
    invoke-direct {p0}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->getBtClassDrawable()I

    move-result v0

    .line 114
    .local v0, "iconResId":I
    if-eqz v0, :cond_0

    .line 115
    invoke-virtual {p0, v0}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->setIcon(I)V

    .line 119
    :cond_0
    iget-object v2, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v2}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->isBusy()Z

    move-result v2

    if-nez v2, :cond_2

    const/4 v2, 0x1

    :goto_1
    invoke-virtual {p0, v2}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->setEnabled(Z)V

    .line 122
    invoke-virtual {p0}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->notifyHierarchyChanged()V

    .line 123
    return-void

    .line 110
    .end local v0    # "iconResId":I
    :cond_1
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 119
    .restart local v0    # "iconResId":I
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method protected onPrepareForRemoval()V
    .locals 1

    .prologue
    .line 90
    invoke-super {p0}, Landroid/preference/Preference;->onPrepareForRemoval()V

    .line 91
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mCachedDevice:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v0, p0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->unregisterCallback(Lcom/androie/settings/bluetooth/CachedBluetoothDevice$Callback;)V

    .line 92
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mDisconnectDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 93
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mDisconnectDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 94
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mDisconnectDialog:Landroid/app/AlertDialog;

    .line 96
    :cond_0
    return-void
.end method

.method public setOnSettingsClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->mOnSettingsClickListener:Landroid/view/View$OnClickListener;

    .line 86
    return-void
.end method
