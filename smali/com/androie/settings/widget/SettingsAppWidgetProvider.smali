.class public Lcom/androie/settings/widget/SettingsAppWidgetProvider;
.super Landroid/appwidget/AppWidgetProvider;
.source "SettingsAppWidgetProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/widget/SettingsAppWidgetProvider$1;,
        Lcom/androie/settings/widget/SettingsAppWidgetProvider$SettingsObserver;,
        Lcom/androie/settings/widget/SettingsAppWidgetProvider$SyncStateTracker;,
        Lcom/androie/settings/widget/SettingsAppWidgetProvider$GpsStateTracker;,
        Lcom/androie/settings/widget/SettingsAppWidgetProvider$BluetoothStateTracker;,
        Lcom/androie/settings/widget/SettingsAppWidgetProvider$WifiStateTracker;,
        Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;
    }
.end annotation


# static fields
.field private static final IND_DRAWABLE_MID:[I

.field private static final IND_DRAWABLE_OFF:[I

.field private static final IND_DRAWABLE_ON:[I

.field static final THIS_APPWIDGET:Landroid/content/ComponentName;

.field private static final sBluetoothState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

.field private static final sGpsState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

.field private static sLocalBluetoothAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

.field private static sSettingsObserver:Lcom/androie/settings/widget/SettingsAppWidgetProvider$SettingsObserver;

.field private static final sSyncState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

.field private static final sWifiState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x3

    const/4 v3, 0x0

    .line 53
    new-instance v0, Landroid/content/ComponentName;

    const-string v1, "com.android.settings"

    const-string v2, "com.android.settings.widget.SettingsAppWidgetProvider"

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->THIS_APPWIDGET:Landroid/content/ComponentName;

    .line 57
    sput-object v3, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sLocalBluetoothAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    .line 80
    new-array v0, v4, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->IND_DRAWABLE_OFF:[I

    .line 86
    new-array v0, v4, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->IND_DRAWABLE_MID:[I

    .line 92
    new-array v0, v4, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->IND_DRAWABLE_ON:[I

    .line 103
    new-instance v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider$WifiStateTracker;

    invoke-direct {v0, v3}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$WifiStateTracker;-><init>(Lcom/androie/settings/widget/SettingsAppWidgetProvider$1;)V

    sput-object v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sWifiState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

    .line 104
    new-instance v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider$BluetoothStateTracker;

    invoke-direct {v0, v3}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$BluetoothStateTracker;-><init>(Lcom/androie/settings/widget/SettingsAppWidgetProvider$1;)V

    sput-object v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sBluetoothState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

    .line 105
    new-instance v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider$GpsStateTracker;

    invoke-direct {v0, v3}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$GpsStateTracker;-><init>(Lcom/androie/settings/widget/SettingsAppWidgetProvider$1;)V

    sput-object v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sGpsState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

    .line 106
    new-instance v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider$SyncStateTracker;

    invoke-direct {v0, v3}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$SyncStateTracker;-><init>(Lcom/androie/settings/widget/SettingsAppWidgetProvider$1;)V

    sput-object v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sSyncState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

    return-void

    .line 80
    nop

    :array_0
    .array-data 4
        0x7f020013
        0x7f020012
        0x7f020014
    .end array-data

    .line 86
    :array_1
    .array-data 4
        0x7f020010
        0x7f02000f
        0x7f020011
    .end array-data

    .line 92
    :array_2
    .array-data 4
        0x7f020016
        0x7f020015
        0x7f020017
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Landroid/appwidget/AppWidgetProvider;-><init>()V

    .line 906
    return-void
.end method

.method static synthetic access$400()[I
    .locals 1

    .prologue
    .line 50
    sget-object v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->IND_DRAWABLE_OFF:[I

    return-object v0
.end method

.method static synthetic access$500()[I
    .locals 1

    .prologue
    .line 50
    sget-object v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->IND_DRAWABLE_ON:[I

    return-object v0
.end method

.method static synthetic access$600()[I
    .locals 1

    .prologue
    .line 50
    sget-object v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->IND_DRAWABLE_MID:[I

    return-object v0
.end method

.method static synthetic access$800()Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;
    .locals 1

    .prologue
    .line 50
    sget-object v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sLocalBluetoothAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    return-object v0
.end method

.method static synthetic access$802(Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;)Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    .prologue
    .line 50
    sput-object p0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sLocalBluetoothAdapter:Lcom/androie/settings/bluetooth/LocalBluetoothAdapter;

    return-object p0
.end method

.method static buildUpdate(Landroid/content/Context;)Landroid/widget/RemoteViews;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 662
    new-instance v0, Landroid/widget/RemoteViews;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f0400ce

    invoke-direct {v0, v1, v2}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 664
    .local v0, "views":Landroid/widget/RemoteViews;
    const v1, 0x7f0c0211

    const/4 v2, 0x0

    invoke-static {p0, v2}, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->getLaunchPendingIntent(Landroid/content/Context;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 666
    const v1, 0x7f0c021d

    const/4 v2, 0x1

    invoke-static {p0, v2}, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->getLaunchPendingIntent(Landroid/content/Context;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 669
    const v1, 0x7f0c021a

    const/4 v2, 0x2

    invoke-static {p0, v2}, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->getLaunchPendingIntent(Landroid/content/Context;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 672
    const v1, 0x7f0c0217

    const/4 v2, 0x3

    invoke-static {p0, v2}, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->getLaunchPendingIntent(Landroid/content/Context;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 674
    const v1, 0x7f0c0214

    const/4 v2, 0x4

    invoke-static {p0, v2}, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->getLaunchPendingIntent(Landroid/content/Context;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 678
    invoke-static {v0, p0}, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->updateButtons(Landroid/widget/RemoteViews;Landroid/content/Context;)V

    .line 679
    return-object v0
.end method

.method private static checkObserver(Landroid/content/Context;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 627
    sget-object v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sSettingsObserver:Lcom/androie/settings/widget/SettingsAppWidgetProvider$SettingsObserver;

    if-nez v0, :cond_0

    .line 628
    new-instance v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider$SettingsObserver;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$SettingsObserver;-><init>(Landroid/os/Handler;Landroid/content/Context;)V

    sput-object v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sSettingsObserver:Lcom/androie/settings/widget/SettingsAppWidgetProvider$SettingsObserver;

    .line 630
    sget-object v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sSettingsObserver:Lcom/androie/settings/widget/SettingsAppWidgetProvider$SettingsObserver;

    invoke-virtual {v0}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$SettingsObserver;->startObserving()V

    .line 632
    :cond_0
    return-void
.end method

.method private static getBrightness(Landroid/content/Context;)I
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 821
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "screen_brightness"

    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 826
    :goto_0
    return v0

    .line 824
    :catch_0
    move-exception v1

    .line 826
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static getBrightnessMode(Landroid/content/Context;)Z
    .locals 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 837
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "screen_brightness_mode"

    invoke-static {v4, v5}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 839
    .local v0, "brightnessMode":I
    if-ne v0, v2, :cond_0

    .line 843
    .end local v0    # "brightnessMode":I
    :goto_0
    return v2

    .restart local v0    # "brightnessMode":I
    :cond_0
    move v2, v3

    .line 839
    goto :goto_0

    .line 840
    .end local v0    # "brightnessMode":I
    :catch_0
    move-exception v1

    .line 841
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "SettingsAppWidgetProvider"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getBrightnessMode: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v3

    .line 843
    goto :goto_0
.end method

.method private static getLaunchPendingIntent(Landroid/content/Context;I)Landroid/app/PendingIntent;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 761
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 762
    const-class v1, Lcom/androie/settings/widget/SettingsAppWidgetProvider;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 763
    const-string v1, "android.intent.category.ALTERNATIVE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 764
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "custom:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 765
    invoke-static {p0, v3, v0, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 767
    return-object v0
.end method

.method private toggleBrightness(Landroid/content/Context;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 853
    :try_start_0
    const-string v6, "power"

    invoke-static {v6}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v6

    invoke-static {v6}, Landroid/os/IPowerManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/IPowerManager;

    move-result-object v5

    .line 855
    .local v5, "power":Landroid/os/IPowerManager;
    if-eqz v5, :cond_1

    .line 856
    const-string v6, "power"

    invoke-virtual {p1, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/PowerManager;

    .line 858
    .local v4, "pm":Landroid/os/PowerManager;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 859
    .local v2, "cr":Landroid/content/ContentResolver;
    const-string v6, "screen_brightness"

    invoke-static {v2, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result v0

    .line 861
    .local v0, "brightness":I
    const/4 v1, 0x0

    .line 863
    .local v1, "brightnessMode":I
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x1110017

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 865
    const-string v6, "screen_brightness_mode"

    invoke-static {v2, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result v1

    .line 871
    :cond_0
    const/4 v6, 0x1

    if-ne v1, v6, :cond_2

    .line 872
    invoke-virtual {v4}, Landroid/os/PowerManager;->getMinimumScreenBrightnessSetting()I

    move-result v0

    .line 873
    const/4 v1, 0x0

    .line 883
    :goto_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x1110017

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 886
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "screen_brightness_mode"

    invoke-static {v6, v7, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 893
    :goto_1
    if-nez v1, :cond_1

    .line 894
    invoke-interface {v5, v0}, Landroid/os/IPowerManager;->setTemporaryScreenBrightnessSettingOverride(I)V

    .line 895
    const-string v6, "screen_brightness"

    invoke-static {v2, v6, v0}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 903
    .end local v0    # "brightness":I
    .end local v1    # "brightnessMode":I
    .end local v2    # "cr":Landroid/content/ContentResolver;
    .end local v4    # "pm":Landroid/os/PowerManager;
    .end local v5    # "power":Landroid/os/IPowerManager;
    :cond_1
    :goto_2
    return-void

    .line 874
    .restart local v0    # "brightness":I
    .restart local v1    # "brightnessMode":I
    .restart local v2    # "cr":Landroid/content/ContentResolver;
    .restart local v4    # "pm":Landroid/os/PowerManager;
    .restart local v5    # "power":Landroid/os/IPowerManager;
    :cond_2
    invoke-virtual {v4}, Landroid/os/PowerManager;->getDefaultScreenBrightnessSetting()I

    move-result v6

    if-ge v0, v6, :cond_3

    .line 875
    invoke-virtual {v4}, Landroid/os/PowerManager;->getDefaultScreenBrightnessSetting()I

    move-result v0

    goto :goto_0

    .line 876
    :cond_3
    invoke-virtual {v4}, Landroid/os/PowerManager;->getMaximumScreenBrightnessSetting()I

    move-result v6

    if-ge v0, v6, :cond_4

    .line 877
    invoke-virtual {v4}, Landroid/os/PowerManager;->getMaximumScreenBrightnessSetting()I

    move-result v0

    goto :goto_0

    .line 879
    :cond_4
    const/4 v1, 0x1

    .line 880
    invoke-virtual {v4}, Landroid/os/PowerManager;->getMinimumScreenBrightnessSetting()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v0

    goto :goto_0

    .line 891
    :cond_5
    const/4 v1, 0x0

    goto :goto_1

    .line 898
    .end local v0    # "brightness":I
    .end local v1    # "brightnessMode":I
    .end local v2    # "cr":Landroid/content/ContentResolver;
    .end local v4    # "pm":Landroid/os/PowerManager;
    .end local v5    # "power":Landroid/os/IPowerManager;
    :catch_0
    move-exception v3

    .line 899
    .local v3, "e":Landroid/os/RemoteException;
    const-string v6, "SettingsAppWidgetProvider"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "toggleBrightness: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 900
    .end local v3    # "e":Landroid/os/RemoteException;
    :catch_1
    move-exception v3

    .line 901
    .local v3, "e":Landroid/provider/Settings$SettingNotFoundException;
    const-string v6, "SettingsAppWidgetProvider"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "toggleBrightness: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method private static updateButtons(Landroid/widget/RemoteViews;Landroid/content/Context;)V
    .locals 11
    .param p0, "views"    # Landroid/widget/RemoteViews;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const v10, 0x7f0c021e

    const v9, 0x7f0c021d

    const v8, 0x7f0808f4

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 702
    sget-object v4, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sWifiState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

    invoke-virtual {v4, p1, p0}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;->setImageViewResources(Landroid/content/Context;Landroid/widget/RemoteViews;)V

    .line 703
    sget-object v4, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sBluetoothState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

    invoke-virtual {v4, p1, p0}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;->setImageViewResources(Landroid/content/Context;Landroid/widget/RemoteViews;)V

    .line 704
    sget-object v4, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sGpsState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

    invoke-virtual {v4, p1, p0}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;->setImageViewResources(Landroid/content/Context;Landroid/widget/RemoteViews;)V

    .line 705
    sget-object v4, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sSyncState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

    invoke-virtual {v4, p1, p0}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;->setImageViewResources(Landroid/content/Context;Landroid/widget/RemoteViews;)V

    .line 707
    invoke-static {p1}, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->getBrightnessMode(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 708
    new-array v4, v7, [Ljava/lang/Object;

    const v5, 0x7f0808f5

    invoke-virtual {p1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p1, v8, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v9, v4}, Landroid/widget/RemoteViews;->setContentDescription(ILjava/lang/CharSequence;)V

    .line 711
    const v4, 0x7f020045

    invoke-virtual {p0, v10, v4}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 713
    const v4, 0x7f0c021f

    const v5, 0x7f020017

    invoke-virtual {p0, v4, v5}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 751
    :goto_0
    return-void

    .line 716
    :cond_0
    invoke-static {p1}, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->getBrightness(Landroid/content/Context;)I

    move-result v0

    .line 717
    .local v0, "brightness":I
    const-string v4, "power"

    invoke-virtual {p1, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/PowerManager;

    .line 719
    .local v3, "pm":Landroid/os/PowerManager;
    invoke-virtual {v3}, Landroid/os/PowerManager;->getMaximumScreenBrightnessSetting()I

    move-result v4

    int-to-float v4, v4

    const v5, 0x3f4ccccd    # 0.8f

    mul-float/2addr v4, v5

    float-to-int v1, v4

    .line 721
    .local v1, "full":I
    invoke-virtual {v3}, Landroid/os/PowerManager;->getMaximumScreenBrightnessSetting()I

    move-result v4

    int-to-float v4, v4

    const v5, 0x3e99999a    # 0.3f

    mul-float/2addr v4, v5

    float-to-int v2, v4

    .line 723
    .local v2, "half":I
    if-le v0, v1, :cond_1

    .line 724
    new-array v4, v7, [Ljava/lang/Object;

    const v5, 0x7f0808f6

    invoke-virtual {p1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p1, v8, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v9, v4}, Landroid/widget/RemoteViews;->setContentDescription(ILjava/lang/CharSequence;)V

    .line 727
    const v4, 0x7f020046

    invoke-virtual {p0, v10, v4}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 743
    :goto_1
    if-le v0, v2, :cond_3

    .line 744
    const v4, 0x7f0c021f

    const v5, 0x7f020017

    invoke-virtual {p0, v4, v5}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    goto :goto_0

    .line 729
    :cond_1
    if-le v0, v2, :cond_2

    .line 730
    new-array v4, v7, [Ljava/lang/Object;

    const v5, 0x7f0808f7

    invoke-virtual {p1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p1, v8, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v9, v4}, Landroid/widget/RemoteViews;->setContentDescription(ILjava/lang/CharSequence;)V

    .line 733
    const v4, 0x7f020047

    invoke-virtual {p0, v10, v4}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    goto :goto_1

    .line 736
    :cond_2
    new-array v4, v7, [Ljava/lang/Object;

    const v5, 0x7f0808f8

    invoke-virtual {p1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p1, v8, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v9, v4}, Landroid/widget/RemoteViews;->setContentDescription(ILjava/lang/CharSequence;)V

    .line 739
    const v4, 0x7f020048

    invoke-virtual {p0, v10, v4}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    goto :goto_1

    .line 747
    :cond_3
    const v4, 0x7f0c021f

    const v5, 0x7f020014

    invoke-virtual {p0, v4, v5}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    goto/16 :goto_0
.end method

.method public static updateWidget(Landroid/content/Context;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 688
    invoke-static {p0}, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->buildUpdate(Landroid/content/Context;)Landroid/widget/RemoteViews;

    move-result-object v1

    .line 690
    .local v1, "views":Landroid/widget/RemoteViews;
    invoke-static {p0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v0

    .line 691
    .local v0, "gm":Landroid/appwidget/AppWidgetManager;
    sget-object v2, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->THIS_APPWIDGET:Landroid/content/ComponentName;

    invoke-virtual {v0, v2, v1}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(Landroid/content/ComponentName;Landroid/widget/RemoteViews;)V

    .line 692
    invoke-static {p0}, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->checkObserver(Landroid/content/Context;)V

    .line 693
    return-void
.end method


# virtual methods
.method public onDisabled(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 652
    sget-object v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sSettingsObserver:Lcom/androie/settings/widget/SettingsAppWidgetProvider$SettingsObserver;

    if-eqz v0, :cond_0

    .line 653
    sget-object v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sSettingsObserver:Lcom/androie/settings/widget/SettingsAppWidgetProvider$SettingsObserver;

    invoke-virtual {v0}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$SettingsObserver;->stopObserving()V

    .line 654
    const/4 v0, 0x0

    sput-object v0, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sSettingsObserver:Lcom/androie/settings/widget/SettingsAppWidgetProvider$SettingsObserver;

    .line 656
    :cond_0
    return-void
.end method

.method public onEnabled(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 647
    invoke-static {p1}, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->checkObserver(Landroid/content/Context;)V

    .line 648
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 778
    invoke-super {p0, p1, p2}, Landroid/appwidget/AppWidgetProvider;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    .line 779
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 780
    .local v0, "action":Ljava/lang/String;
    const-string v3, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 781
    sget-object v3, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sWifiState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

    invoke-virtual {v3, p1, p2}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;->onActualStateChange(Landroid/content/Context;Landroid/content/Intent;)V

    .line 810
    :cond_0
    :goto_0
    invoke-static {p1}, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->updateWidget(Landroid/content/Context;)V

    .line 811
    :cond_1
    return-void

    .line 782
    :cond_2
    const-string v3, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 783
    sget-object v3, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sBluetoothState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

    invoke-virtual {v3, p1, p2}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;->onActualStateChange(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_0

    .line 784
    :cond_3
    const-string v3, "android.location.PROVIDERS_CHANGED"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 785
    sget-object v3, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sGpsState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

    invoke-virtual {v3, p1, p2}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;->onActualStateChange(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_0

    .line 786
    :cond_4
    sget-object v3, Landroid/content/ContentResolver;->ACTION_SYNC_CONN_STATUS_CHANGED:Landroid/content/Intent;

    invoke-virtual {v3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 787
    sget-object v3, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sSyncState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

    invoke-virtual {v3, p1, p2}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;->onActualStateChange(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_0

    .line 788
    :cond_5
    const-string v3, "android.intent.category.ALTERNATIVE"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->hasCategory(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 789
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    .line 790
    .local v2, "data":Landroid/net/Uri;
    invoke-virtual {v2}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 791
    .local v1, "buttonId":I
    if-nez v1, :cond_6

    .line 792
    sget-object v3, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sWifiState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

    invoke-virtual {v3, p1}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;->toggleState(Landroid/content/Context;)V

    goto :goto_0

    .line 793
    :cond_6
    const/4 v3, 0x1

    if-ne v1, v3, :cond_7

    .line 794
    invoke-direct {p0, p1}, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->toggleBrightness(Landroid/content/Context;)V

    goto :goto_0

    .line 795
    :cond_7
    const/4 v3, 0x2

    if-ne v1, v3, :cond_8

    .line 796
    sget-object v3, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sSyncState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

    invoke-virtual {v3, p1}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;->toggleState(Landroid/content/Context;)V

    goto :goto_0

    .line 797
    :cond_8
    const/4 v3, 0x3

    if-ne v1, v3, :cond_9

    .line 798
    sget-object v3, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sGpsState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

    invoke-virtual {v3, p1}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;->toggleState(Landroid/content/Context;)V

    goto :goto_0

    .line 799
    :cond_9
    const/4 v3, 0x4

    if-ne v1, v3, :cond_0

    .line 800
    sget-object v3, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->sBluetoothState:Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;

    invoke-virtual {v3, p1}, Lcom/androie/settings/widget/SettingsAppWidgetProvider$StateTracker;->toggleState(Landroid/content/Context;)V

    goto :goto_0
.end method

.method public onUpdate(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "appWidgetManager"    # Landroid/appwidget/AppWidgetManager;
    .param p3, "appWidgetIds"    # [I

    .prologue
    .line 638
    invoke-static {p1}, Lcom/androie/settings/widget/SettingsAppWidgetProvider;->buildUpdate(Landroid/content/Context;)Landroid/widget/RemoteViews;

    move-result-object v1

    .line 640
    .local v1, "view":Landroid/widget/RemoteViews;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p3

    if-ge v0, v2, :cond_0

    .line 641
    aget v2, p3, v0

    invoke-virtual {p2, v2, v1}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(ILandroid/widget/RemoteViews;)V

    .line 640
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 643
    :cond_0
    return-void
.end method
