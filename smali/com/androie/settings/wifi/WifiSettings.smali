.class public Lcom/androie/settings/wifi/WifiSettings;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "WifiSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/wifi/WifiSettings$ProportionalOuterFrame;,
        Lcom/androie/settings/wifi/WifiSettings$Scanner;,
        Lcom/androie/settings/wifi/WifiSettings$Multimap;
    }
.end annotation


# instance fields
.field private mAccessPointSavedState:Landroid/os/Bundle;

.field private mAutoFinishOnConnection:Z

.field private mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

.field private mConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mDialog:Lcom/androie/settings/wifi/WifiDialog;

.field private mDlgAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

.field private mDlgEdit:Z

.field private mEmptyView:Landroid/widget/TextView;

.field private mEnableNextOnConnection:Z

.field private final mFilter:Landroid/content/IntentFilter;

.field private mForgetListener:Landroid/net/wifi/WifiManager$ActionListener;

.field private mIbssSupported:Z

.field private mLastInfo:Landroid/net/wifi/WifiInfo;

.field private mLastState:Landroid/net/NetworkInfo$DetailedState;

.field private mP2pSupported:Z

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mSaveListener:Landroid/net/wifi/WifiManager$ActionListener;

.field private final mScanner:Lcom/androie/settings/wifi/WifiSettings$Scanner;

.field private mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

.field private mSetupWizardMode:Z

.field mSupportedChannels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/net/wifi/WifiChannel;",
            ">;"
        }
    .end annotation
.end field

.field private mUserManager:Landroid/os/UserManager;

.field private mWifiEnabler:Lcom/androie/settings/wifi/WifiEnabler;

.field private mWifiManager:Landroid/net/wifi/WifiManager;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 184
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    .line 145
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 185
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    .line 186
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 187
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.SCAN_RESULTS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 188
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.NETWORK_IDS_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 189
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.supplicant.STATE_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 190
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.CONFIGURED_NETWORKS_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 191
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.LINK_CONFIGURATION_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 192
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 193
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.RSSI_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 195
    new-instance v0, Lcom/androie/settings/wifi/WifiSettings$1;

    invoke-direct {v0, p0}, Lcom/androie/settings/wifi/WifiSettings$1;-><init>(Lcom/androie/settings/wifi/WifiSettings;)V

    iput-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 202
    new-instance v0, Lcom/androie/settings/wifi/WifiSettings$Scanner;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/androie/settings/wifi/WifiSettings$Scanner;-><init>(Lcom/androie/settings/wifi/WifiSettings;Lcom/androie/settings/wifi/WifiSettings$1;)V

    iput-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mScanner:Lcom/androie/settings/wifi/WifiSettings$Scanner;

    .line 203
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/wifi/WifiSettings;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/wifi/WifiSettings;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Landroid/content/Intent;

    .prologue
    .line 94
    invoke-direct {p0, p1, p2}, Lcom/androie/settings/wifi/WifiSettings;->handleEvent(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$200(Lcom/androie/settings/wifi/WifiSettings;)Landroid/net/wifi/WifiManager;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/wifi/WifiSettings;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/androie/settings/wifi/WifiSettings;I)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/wifi/WifiSettings;
    .param p1, "x1"    # I

    .prologue
    .line 94
    invoke-virtual {p0, p1}, Lcom/androie/settings/wifi/WifiSettings;->showDialog(I)V

    return-void
.end method

.method static synthetic access$400(Lcom/androie/settings/wifi/WifiSettings;I)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/wifi/WifiSettings;
    .param p1, "x1"    # I

    .prologue
    .line 94
    invoke-virtual {p0, p1}, Lcom/androie/settings/wifi/WifiSettings;->showDialog(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/androie/settings/wifi/WifiSettings;I)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/wifi/WifiSettings;
    .param p1, "x1"    # I

    .prologue
    .line 94
    invoke-virtual {p0, p1}, Lcom/androie/settings/wifi/WifiSettings;->showDialog(I)V

    return-void
.end method

.method private addMessagePreference(I)V
    .locals 1
    .param p1, "messageId"    # I

    .prologue
    .line 768
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 769
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 770
    return-void
.end method

.method private changeNextButtonState(Z)V
    .locals 1
    .param p1, "connected"    # Z

    .prologue
    .line 985
    iget-boolean v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mEnableNextOnConnection:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->hasNextButton()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 986
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getNextButton()Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 988
    :cond_0
    return-void
.end method

.method private constructAccessPoints()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/androie/settings/wifi/AccessPoint;",
            ">;"
        }
    .end annotation

    .prologue
    .line 774
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 777
    new-instance v4, Lcom/androie/settings/wifi/WifiSettings$Multimap;

    const/4 v0, 0x0

    invoke-direct {v4, p0, v0}, Lcom/androie/settings/wifi/WifiSettings$Multimap;-><init>(Lcom/androie/settings/wifi/WifiSettings;Lcom/androie/settings/wifi/WifiSettings$1;)V

    .line 779
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getConfiguredNetworks()Ljava/util/List;

    move-result-object v0

    .line 780
    if-eqz v0, :cond_0

    .line 781
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiConfiguration;

    .line 782
    new-instance v2, Lcom/androie/settings/wifi/AccessPoint;

    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v2, v5, v0}, Lcom/androie/settings/wifi/AccessPoint;-><init>(Landroid/content/Context;Landroid/net/wifi/WifiConfiguration;)V

    .line 783
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mLastInfo:Landroid/net/wifi/WifiInfo;

    iget-object v5, p0, Lcom/androie/settings/wifi/WifiSettings;->mLastState:Landroid/net/NetworkInfo$DetailedState;

    invoke-virtual {v2, v0, v5}, Lcom/androie/settings/wifi/AccessPoint;->update(Landroid/net/wifi/WifiInfo;Landroid/net/NetworkInfo$DetailedState;)V

    .line 784
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 785
    iget-object v0, v2, Lcom/androie/settings/wifi/AccessPoint;->ssid:Ljava/lang/String;

    invoke-virtual {v4, v0, v2}, Lcom/androie/settings/wifi/WifiSettings$Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 789
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getScanResults()Ljava/util/List;

    move-result-object v0

    .line 790
    if-eqz v0, :cond_4

    .line 791
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/ScanResult;

    .line 793
    iget-object v1, v0, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, v0, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_1

    .line 798
    iget-boolean v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mIbssSupported:Z

    if-nez v1, :cond_2

    iget-object v1, v0, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    const-string v2, "[IBSS]"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 802
    :cond_2
    const/4 v1, 0x0

    .line 803
    iget-object v2, v0, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    invoke-virtual {v4, v2}, Lcom/androie/settings/wifi/WifiSettings$Multimap;->getAll(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move v2, v1

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/wifi/AccessPoint;

    .line 804
    invoke-virtual {v1, v0}, Lcom/androie/settings/wifi/AccessPoint;->update(Landroid/net/wifi/ScanResult;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 805
    const/4 v1, 0x1

    :goto_3
    move v2, v1

    .line 806
    goto :goto_2

    .line 807
    :cond_3
    if-nez v2, :cond_1

    .line 808
    new-instance v1, Lcom/androie/settings/wifi/AccessPoint;

    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/androie/settings/wifi/AccessPoint;-><init>(Landroid/content/Context;Landroid/net/wifi/ScanResult;)V

    .line 809
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 810
    iget-object v0, v1, Lcom/androie/settings/wifi/AccessPoint;->ssid:Ljava/lang/String;

    invoke-virtual {v4, v0, v1}, Lcom/androie/settings/wifi/WifiSettings$Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1

    .line 816
    :cond_4
    invoke-static {v3}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 817
    return-object v3

    :cond_5
    move v1, v2

    goto :goto_3
.end method

.method private handleEvent(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 840
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 841
    const-string v1, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 842
    const-string v0, "wifi_state"

    const/4 v1, 0x4

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/androie/settings/wifi/WifiSettings;->updateWifiState(I)V

    .line 883
    :cond_0
    :goto_0
    return-void

    .line 844
    :cond_1
    const-string v1, "android.net.wifi.SCAN_RESULTS"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "android.net.wifi.CONFIGURED_NETWORKS_CHANGE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "android.net.wifi.LINK_CONFIGURATION_CHANGED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 847
    :cond_2
    invoke-direct {p0}, Lcom/androie/settings/wifi/WifiSettings;->updateAccessPoints()V

    goto :goto_0

    .line 848
    :cond_3
    const-string v1, "android.net.wifi.supplicant.STATE_CHANGE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 855
    const-string v0, "newState"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/SupplicantState;

    .line 857
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_4

    invoke-static {v0}, Landroid/net/wifi/SupplicantState;->isHandshakeState(Landroid/net/wifi/SupplicantState;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 858
    invoke-static {v0}, Landroid/net/wifi/WifiInfo;->getDetailedStateOf(Landroid/net/wifi/SupplicantState;)Landroid/net/NetworkInfo$DetailedState;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/androie/settings/wifi/WifiSettings;->updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V

    goto :goto_0

    .line 863
    :cond_4
    invoke-direct {p0, v2}, Lcom/androie/settings/wifi/WifiSettings;->updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V

    goto :goto_0

    .line 865
    :cond_5
    const-string v1, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 866
    const-string v0, "networkInfo"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/NetworkInfo;

    .line 868
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 869
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    invoke-direct {p0, v1}, Lcom/androie/settings/wifi/WifiSettings;->changeNextButtonState(Z)V

    .line 870
    invoke-direct {p0}, Lcom/androie/settings/wifi/WifiSettings;->updateAccessPoints()V

    .line 871
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getDetailedState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/androie/settings/wifi/WifiSettings;->updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V

    .line 872
    iget-boolean v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mAutoFinishOnConnection:Z

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 873
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 874
    if-eqz v0, :cond_0

    .line 875
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setResult(I)V

    .line 876
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto/16 :goto_0

    .line 880
    :cond_6
    const-string v1, "android.net.wifi.RSSI_CHANGED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 881
    invoke-direct {p0, v2}, Lcom/androie/settings/wifi/WifiSettings;->updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V

    goto/16 :goto_0
.end method

.method private setOffMessage()V
    .locals 5

    .prologue
    .line 748
    iget-object v2, p0, Lcom/androie/settings/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    if-eqz v2, :cond_0

    .line 749
    iget-object v2, p0, Lcom/androie/settings/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    const v3, 0x7f080568

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 750
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "wifi_scan_always_enabled"

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 752
    iget-object v2, p0, Lcom/androie/settings/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    const-string v3, "\n\n"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    .line 754
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "network"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->isLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 756
    const v1, 0x7f080556

    .line 760
    .local v1, "resId":I
    :goto_0
    invoke-virtual {p0, v1}, Lcom/androie/settings/wifi/WifiSettings;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 761
    .local v0, "charSeq":Ljava/lang/CharSequence;
    iget-object v2, p0, Lcom/androie/settings/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    .line 764
    .end local v0    # "charSeq":Ljava/lang/CharSequence;
    .end local v1    # "resId":I
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    invoke-virtual {v2}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 765
    return-void

    .line 758
    :cond_1
    const v1, 0x7f080557

    .restart local v1    # "resId":I
    goto :goto_0
.end method

.method private showDialog(Lcom/androie/settings/wifi/AccessPoint;Z)V
    .locals 2
    .param p1, "accessPoint"    # Lcom/androie/settings/wifi/AccessPoint;
    .param p2, "edit"    # Z

    .prologue
    const/4 v1, 0x1

    .line 631
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mDialog:Lcom/androie/settings/wifi/WifiDialog;

    if-eqz v0, :cond_0

    .line 632
    invoke-virtual {p0, v1}, Lcom/androie/settings/wifi/WifiSettings;->removeDialog(I)V

    .line 633
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mDialog:Lcom/androie/settings/wifi/WifiDialog;

    .line 637
    :cond_0
    iput-object p1, p0, Lcom/androie/settings/wifi/WifiSettings;->mDlgAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    .line 638
    iput-boolean p2, p0, Lcom/androie/settings/wifi/WifiSettings;->mDlgEdit:Z

    .line 640
    invoke-virtual {p0, v1}, Lcom/androie/settings/wifi/WifiSettings;->showDialog(I)V

    .line 641
    return-void
.end method

.method private updateAccessPoints()V
    .locals 6

    .prologue
    .line 712
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    if-nez v4, :cond_1

    .line 745
    :cond_0
    :goto_0
    return-void

    .line 714
    :cond_1
    iget-object v4, p0, Lcom/androie/settings/wifi/WifiSettings;->mUserManager:Landroid/os/UserManager;

    const-string v5, "no_config_wifi"

    invoke-virtual {v4, v5}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 715
    const v4, 0x7f08056a

    invoke-direct {p0, v4}, Lcom/androie/settings/wifi/WifiSettings;->addMessagePreference(I)V

    goto :goto_0

    .line 718
    :cond_2
    iget-object v4, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v4}, Landroid/net/wifi/WifiManager;->getWifiState()I

    move-result v3

    .line 720
    .local v3, "wifiState":I
    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 738
    :pswitch_0
    const v4, 0x7f08054b

    invoke-direct {p0, v4}, Lcom/androie/settings/wifi/WifiSettings;->addMessagePreference(I)V

    goto :goto_0

    .line 723
    :pswitch_1
    invoke-direct {p0}, Lcom/androie/settings/wifi/WifiSettings;->constructAccessPoints()Ljava/util/List;

    move-result-object v1

    .line 724
    .local v1, "accessPoints":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/androie/settings/wifi/AccessPoint;>;"
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    invoke-virtual {v4}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 725
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v4

    if-nez v4, :cond_3

    .line 726
    const v4, 0x7f080569

    invoke-direct {p0, v4}, Lcom/androie/settings/wifi/WifiSettings;->addMessagePreference(I)V

    .line 728
    :cond_3
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/wifi/AccessPoint;

    .line 729
    .local v0, "accessPoint":Lcom/androie/settings/wifi/AccessPoint;
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    goto :goto_1

    .line 734
    .end local v0    # "accessPoint":Lcom/androie/settings/wifi/AccessPoint;
    .end local v1    # "accessPoints":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/androie/settings/wifi/AccessPoint;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    :pswitch_2
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    invoke-virtual {v4}, Landroid/preference/PreferenceScreen;->removeAll()V

    goto :goto_0

    .line 742
    :pswitch_3
    invoke-direct {p0}, Lcom/androie/settings/wifi/WifiSettings;->setOffMessage()V

    goto :goto_0

    .line 720
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V
    .locals 5
    .param p1, "state"    # Landroid/net/NetworkInfo$DetailedState;

    .prologue
    .line 887
    iget-object v3, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v3

    if-nez v3, :cond_1

    .line 888
    iget-object v3, p0, Lcom/androie/settings/wifi/WifiSettings;->mScanner:Lcom/androie/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v3}, Lcom/androie/settings/wifi/WifiSettings$Scanner;->pause()V

    .line 911
    :cond_0
    return-void

    .line 892
    :cond_1
    sget-object v3, Landroid/net/NetworkInfo$DetailedState;->OBTAINING_IPADDR:Landroid/net/NetworkInfo$DetailedState;

    if-ne p1, v3, :cond_4

    .line 893
    iget-object v3, p0, Lcom/androie/settings/wifi/WifiSettings;->mScanner:Lcom/androie/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v3}, Lcom/androie/settings/wifi/WifiSettings$Scanner;->pause()V

    .line 898
    :goto_0
    iget-object v3, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/wifi/WifiSettings;->mLastInfo:Landroid/net/wifi/WifiInfo;

    .line 899
    if-eqz p1, :cond_2

    .line 900
    iput-object p1, p0, Lcom/androie/settings/wifi/WifiSettings;->mLastState:Landroid/net/NetworkInfo$DetailedState;

    .line 903
    :cond_2
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    invoke-virtual {v3}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .local v1, "i":I
    :goto_1
    if-ltz v1, :cond_0

    .line 905
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    .line 906
    .local v2, "preference":Landroid/preference/Preference;
    instance-of v3, v2, Lcom/androie/settings/wifi/AccessPoint;

    if-eqz v3, :cond_3

    move-object v0, v2

    .line 907
    check-cast v0, Lcom/androie/settings/wifi/AccessPoint;

    .line 908
    .local v0, "accessPoint":Lcom/androie/settings/wifi/AccessPoint;
    iget-object v3, p0, Lcom/androie/settings/wifi/WifiSettings;->mLastInfo:Landroid/net/wifi/WifiInfo;

    iget-object v4, p0, Lcom/androie/settings/wifi/WifiSettings;->mLastState:Landroid/net/NetworkInfo$DetailedState;

    invoke-virtual {v0, v3, v4}, Lcom/androie/settings/wifi/AccessPoint;->update(Landroid/net/wifi/WifiInfo;Landroid/net/NetworkInfo$DetailedState;)V

    .line 903
    .end local v0    # "accessPoint":Lcom/androie/settings/wifi/AccessPoint;
    :cond_3
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 895
    .end local v1    # "i":I
    .end local v2    # "preference":Landroid/preference/Preference;
    :cond_4
    iget-object v3, p0, Lcom/androie/settings/wifi/WifiSettings;->mScanner:Lcom/androie/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v3}, Lcom/androie/settings/wifi/WifiSettings$Scanner;->resume()V

    goto :goto_0
.end method

.method private updateWifiState(I)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 914
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 915
    if-eqz v0, :cond_0

    .line 916
    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 919
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 937
    :goto_0
    iput-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mLastInfo:Landroid/net/wifi/WifiInfo;

    .line 938
    iput-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mLastState:Landroid/net/NetworkInfo$DetailedState;

    .line 939
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mScanner:Lcom/androie/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/androie/settings/wifi/WifiSettings$Scanner;->pause()V

    .line 940
    :goto_1
    return-void

    .line 922
    :pswitch_0
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mIbssSupported:Z

    .line 923
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mSupportedChannels:Ljava/util/List;

    .line 925
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mScanner:Lcom/androie/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/androie/settings/wifi/WifiSettings$Scanner;->resume()V

    goto :goto_1

    .line 929
    :pswitch_1
    const v0, 0x7f08054a

    invoke-direct {p0, v0}, Lcom/androie/settings/wifi/WifiSettings;->addMessagePreference(I)V

    goto :goto_0

    .line 933
    :pswitch_2
    invoke-direct {p0}, Lcom/androie/settings/wifi/WifiSettings;->setOffMessage()V

    goto :goto_0

    .line 919
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method forget()V
    .locals 3

    .prologue
    .line 1030
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    iget v0, v0, Lcom/androie/settings/wifi/AccessPoint;->networkId:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 1032
    const-string v0, "WifiSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to forget invalid network "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    invoke-virtual {v2}, Lcom/androie/settings/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1045
    :goto_0
    return-void

    .line 1036
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    iget v1, v1, Lcom/androie/settings/wifi/AccessPoint;->networkId:I

    iget-object v2, p0, Lcom/androie/settings/wifi/WifiSettings;->mForgetListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v0, v1, v2}, Landroid/net/wifi/WifiManager;->forget(ILandroid/net/wifi/WifiManager$ActionListener;)V

    .line 1038
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1039
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mScanner:Lcom/androie/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/androie/settings/wifi/WifiSettings$Scanner;->resume()V

    .line 1041
    :cond_1
    invoke-direct {p0}, Lcom/androie/settings/wifi/WifiSettings;->updateAccessPoints()V

    .line 1044
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/androie/settings/wifi/WifiSettings;->changeNextButtonState(Z)V

    goto :goto_0
.end method

.method protected getHelpResource()I
    .locals 1

    .prologue
    .line 1096
    iget-boolean v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mSetupWizardMode:Z

    if-eqz v0, :cond_0

    .line 1097
    const/4 v0, 0x0

    .line 1099
    :goto_0
    return v0

    :cond_0
    const v0, 0x7f080a5f

    goto :goto_0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 13
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v12, 0x10

    const/4 v11, -0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 294
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 296
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    const-string v8, "android.hardware.wifi.direct"

    invoke-virtual {v7, v8}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v7

    iput-boolean v7, p0, Lcom/androie/settings/wifi/WifiSettings;->mP2pSupported:Z

    .line 297
    const-string v7, "wifi"

    invoke-virtual {p0, v7}, Lcom/androie/settings/wifi/WifiSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/net/wifi/WifiManager;

    iput-object v7, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 298
    const-string v7, "user"

    invoke-virtual {p0, v7}, Lcom/androie/settings/wifi/WifiSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/os/UserManager;

    iput-object v7, p0, Lcom/androie/settings/wifi/WifiSettings;->mUserManager:Landroid/os/UserManager;

    .line 300
    new-instance v7, Lcom/androie/settings/wifi/WifiSettings$5;

    invoke-direct {v7, p0}, Lcom/androie/settings/wifi/WifiSettings$5;-><init>(Lcom/androie/settings/wifi/WifiSettings;)V

    iput-object v7, p0, Lcom/androie/settings/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    .line 315
    new-instance v7, Lcom/androie/settings/wifi/WifiSettings$6;

    invoke-direct {v7, p0}, Lcom/androie/settings/wifi/WifiSettings$6;-><init>(Lcom/androie/settings/wifi/WifiSettings;)V

    iput-object v7, p0, Lcom/androie/settings/wifi/WifiSettings;->mSaveListener:Landroid/net/wifi/WifiManager$ActionListener;

    .line 330
    new-instance v7, Lcom/androie/settings/wifi/WifiSettings$7;

    invoke-direct {v7, p0}, Lcom/androie/settings/wifi/WifiSettings$7;-><init>(Lcom/androie/settings/wifi/WifiSettings;)V

    iput-object v7, p0, Lcom/androie/settings/wifi/WifiSettings;->mForgetListener:Landroid/net/wifi/WifiManager$ActionListener;

    .line 345
    if-eqz p1, :cond_0

    const-string v7, "wifi_ap_state"

    invoke-virtual {p1, v7}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 347
    const-string v7, "edit_mode"

    invoke-virtual {p1, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v7

    iput-boolean v7, p0, Lcom/androie/settings/wifi/WifiSettings;->mDlgEdit:Z

    .line 348
    const-string v7, "wifi_ap_state"

    invoke-virtual {p1, v7}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v7

    iput-object v7, p0, Lcom/androie/settings/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    .line 351
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    .line 352
    .local v1, "activity":Landroid/app/Activity;
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    .line 355
    .local v4, "intent":Landroid/content/Intent;
    const-string v7, "wifi_auto_finish_on_connect"

    invoke-virtual {v4, v7, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v7

    iput-boolean v7, p0, Lcom/androie/settings/wifi/WifiSettings;->mAutoFinishOnConnection:Z

    .line 357
    iget-boolean v7, p0, Lcom/androie/settings/wifi/WifiSettings;->mAutoFinishOnConnection:Z

    if-eqz v7, :cond_2

    .line 359
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->hasNextButton()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 360
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getNextButton()Landroid/widget/Button;

    move-result-object v7

    const/16 v8, 0x8

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 363
    :cond_1
    const-string v7, "connectivity"

    invoke-virtual {v1, v7}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    .line 365
    .local v2, "connectivity":Landroid/net/ConnectivityManager;
    if-eqz v2, :cond_2

    invoke-virtual {v2, v10}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 367
    const/4 v7, -0x1

    invoke-virtual {v1, v7}, Landroid/app/Activity;->setResult(I)V

    .line 368
    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 429
    .end local v2    # "connectivity":Landroid/net/ConnectivityManager;
    :goto_0
    return-void

    .line 375
    :cond_2
    const-string v7, "wifi_enable_next_on_connect"

    invoke-virtual {v4, v7, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v7

    iput-boolean v7, p0, Lcom/androie/settings/wifi/WifiSettings;->mEnableNextOnConnection:Z

    .line 377
    iget-boolean v7, p0, Lcom/androie/settings/wifi/WifiSettings;->mEnableNextOnConnection:Z

    if-eqz v7, :cond_3

    .line 378
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->hasNextButton()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 379
    const-string v7, "connectivity"

    invoke-virtual {v1, v7}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    .line 381
    .restart local v2    # "connectivity":Landroid/net/ConnectivityManager;
    if-eqz v2, :cond_3

    .line 382
    invoke-virtual {v2, v10}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v3

    .line 384
    .local v3, "info":Landroid/net/NetworkInfo;
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v7

    invoke-direct {p0, v7}, Lcom/androie/settings/wifi/WifiSettings;->changeNextButtonState(Z)V

    .line 389
    .end local v2    # "connectivity":Landroid/net/ConnectivityManager;
    .end local v3    # "info":Landroid/net/NetworkInfo;
    :cond_3
    const v7, 0x7f05005c

    invoke-virtual {p0, v7}, Lcom/androie/settings/wifi/WifiSettings;->addPreferencesFromResource(I)V

    .line 391
    iget-boolean v7, p0, Lcom/androie/settings/wifi/WifiSettings;->mSetupWizardMode:Z

    if-eqz v7, :cond_4

    .line 392
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getView()Landroid/view/View;

    move-result-object v7

    const/high16 v8, 0x1a40000

    invoke-virtual {v7, v8}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 401
    :cond_4
    iget-boolean v7, p0, Lcom/androie/settings/wifi/WifiSettings;->mSetupWizardMode:Z

    if-nez v7, :cond_7

    .line 402
    new-instance v0, Landroid/widget/Switch;

    invoke-direct {v0, v1}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 404
    .local v0, "actionBarSwitch":Landroid/widget/Switch;
    instance-of v7, v1, Landroid/preference/PreferenceActivity;

    if-eqz v7, :cond_6

    move-object v6, v1

    .line 405
    check-cast v6, Landroid/preference/PreferenceActivity;

    .line 406
    .local v6, "preferenceActivity":Landroid/preference/PreferenceActivity;
    invoke-virtual {v6}, Landroid/preference/PreferenceActivity;->onIsHidingHeaders()Z

    move-result v7

    if-nez v7, :cond_5

    invoke-virtual {v6}, Landroid/preference/PreferenceActivity;->onIsMultiPane()Z

    move-result v7

    if-nez v7, :cond_6

    .line 407
    :cond_5
    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f070014

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    .line 409
    .local v5, "padding":I
    invoke-virtual {v0, v9, v9, v5, v9}, Landroid/widget/Switch;->setPaddingRelative(IIII)V

    .line 410
    invoke-virtual {v1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v7

    invoke-virtual {v7, v12, v12}, Landroid/app/ActionBar;->setDisplayOptions(II)V

    .line 412
    invoke-virtual {v1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v7

    new-instance v8, Landroid/app/ActionBar$LayoutParams;

    const v9, 0x800015

    invoke-direct {v8, v11, v11, v9}, Landroid/app/ActionBar$LayoutParams;-><init>(III)V

    invoke-virtual {v7, v0, v8}, Landroid/app/ActionBar;->setCustomView(Landroid/view/View;Landroid/app/ActionBar$LayoutParams;)V

    .line 419
    .end local v5    # "padding":I
    .end local v6    # "preferenceActivity":Landroid/preference/PreferenceActivity;
    :cond_6
    new-instance v7, Lcom/androie/settings/wifi/WifiEnabler;

    invoke-direct {v7, v1, v0}, Lcom/androie/settings/wifi/WifiEnabler;-><init>(Landroid/content/Context;Landroid/widget/Switch;)V

    iput-object v7, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiEnabler:Lcom/androie/settings/wifi/WifiEnabler;

    .line 422
    .end local v0    # "actionBarSwitch":Landroid/widget/Switch;
    :cond_7
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getView()Landroid/view/View;

    move-result-object v7

    const v8, 0x1020004

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/androie/settings/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    .line 423
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getListView()Landroid/widget/ListView;

    move-result-object v7

    iget-object v8, p0, Lcom/androie/settings/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    invoke-virtual {v7, v8}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 425
    iget-boolean v7, p0, Lcom/androie/settings/wifi/WifiSettings;->mSetupWizardMode:Z

    if-nez v7, :cond_8

    .line 426
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getListView()Landroid/widget/ListView;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/androie/settings/wifi/WifiSettings;->registerForContextMenu(Landroid/view/View;)V

    .line 428
    :cond_8
    invoke-virtual {p0, v10}, Lcom/androie/settings/wifi/WifiSettings;->setHasOptionsMenu(Z)V

    goto/16 :goto_0
.end method

.method onAddNetworkPressed()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1063
    iput-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    .line 1064
    const/4 v0, 0x1

    invoke-direct {p0, v1, v0}, Lcom/androie/settings/wifi/WifiSettings;->showDialog(Lcom/androie/settings/wifi/AccessPoint;Z)V

    .line 1065
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "button"    # I

    .prologue
    .line 992
    const/4 v0, -0x3

    if-ne p2, v0, :cond_1

    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    if-eqz v0, :cond_1

    .line 993
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->forget()V

    .line 999
    :cond_0
    :goto_0
    return-void

    .line 994
    :cond_1
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 995
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mDialog:Lcom/androie/settings/wifi/WifiDialog;

    if-eqz v0, :cond_0

    .line 996
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mDialog:Lcom/androie/settings/wifi/WifiDialog;

    invoke-virtual {v0}, Lcom/androie/settings/wifi/WifiDialog;->getController()Lcom/androie/settings/wifi/WifiConfigController;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/androie/settings/wifi/WifiSettings;->submit(Lcom/androie/settings/wifi/WifiConfigController;)V

    goto :goto_0
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v0, 0x1

    .line 581
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    if-nez v1, :cond_0

    .line 582
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    .line 608
    :goto_0
    return v0

    .line 584
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 608
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0

    .line 586
    :pswitch_0
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    iget v1, v1, Lcom/androie/settings/wifi/AccessPoint;->networkId:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 587
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    iget v2, v2, Lcom/androie/settings/wifi/AccessPoint;->networkId:I

    iget-object v3, p0, Lcom/androie/settings/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v1, v2, v3}, Landroid/net/wifi/WifiManager;->connect(ILandroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_0

    .line 589
    :cond_1
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    iget v1, v1, Lcom/androie/settings/wifi/AccessPoint;->security:I

    if-nez v1, :cond_2

    .line 591
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    invoke-virtual {v1}, Lcom/androie/settings/wifi/AccessPoint;->generateOpenNetworkConfig()V

    .line 592
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    invoke-virtual {v2}, Lcom/androie/settings/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v2

    iget-object v3, p0, Lcom/androie/settings/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v1, v2, v3}, Landroid/net/wifi/WifiManager;->connect(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_0

    .line 595
    :cond_2
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    invoke-direct {p0, v1, v0}, Lcom/androie/settings/wifi/WifiSettings;->showDialog(Lcom/androie/settings/wifi/AccessPoint;Z)V

    goto :goto_0

    .line 600
    :pswitch_1
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    iget v2, v2, Lcom/androie/settings/wifi/AccessPoint;->networkId:I

    iget-object v3, p0, Lcom/androie/settings/wifi/WifiSettings;->mForgetListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v1, v2, v3}, Landroid/net/wifi/WifiManager;->forget(ILandroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_0

    .line 604
    :pswitch_2
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    invoke-direct {p0, v1, v0}, Lcom/androie/settings/wifi/WifiSettings;->showDialog(Lcom/androie/settings/wifi/AccessPoint;Z)V

    goto :goto_0

    .line 584
    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 208
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "firstRun"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mSetupWizardMode:Z

    .line 210
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 211
    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 5
    .param p1, "menu"    # Landroid/view/ContextMenu;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "info"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .prologue
    const/4 v4, -0x1

    const/4 v3, 0x0

    .line 560
    instance-of v1, p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    if-eqz v1, :cond_1

    .line 561
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getListView()Landroid/widget/ListView;

    move-result-object v1

    check-cast p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .end local p3    # "info":Landroid/view/ContextMenu$ContextMenuInfo;
    iget v2, p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/preference/Preference;

    .line 564
    .local v0, "preference":Landroid/preference/Preference;
    instance-of v1, v0, Lcom/androie/settings/wifi/AccessPoint;

    if-eqz v1, :cond_1

    .line 565
    check-cast v0, Lcom/androie/settings/wifi/AccessPoint;

    .end local v0    # "preference":Landroid/preference/Preference;
    iput-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    .line 566
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    iget-object v1, v1, Lcom/androie/settings/wifi/AccessPoint;->ssid:Ljava/lang/String;

    invoke-interface {p1, v1}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 567
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    invoke-virtual {v1}, Lcom/androie/settings/wifi/AccessPoint;->getLevel()I

    move-result v1

    if-eq v1, v4, :cond_0

    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    invoke-virtual {v1}, Lcom/androie/settings/wifi/AccessPoint;->getState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v1

    if-nez v1, :cond_0

    .line 569
    const/4 v1, 0x7

    const v2, 0x7f080565

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 571
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    iget v1, v1, Lcom/androie/settings/wifi/AccessPoint;->networkId:I

    if-eq v1, v4, :cond_1

    .line 572
    const/16 v1, 0x8

    const v2, 0x7f080566

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 573
    const/16 v1, 0x9

    const v2, 0x7f080567

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 577
    :cond_1
    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 7
    .param p1, "dialogId"    # I

    .prologue
    const v5, 0x7f0805b0

    const v4, 0x7f0805af

    const/4 v2, 0x0

    .line 645
    packed-switch p1, :pswitch_data_0

    .line 703
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v0

    :goto_0
    return-object v0

    .line 647
    :pswitch_0
    iget-object v3, p0, Lcom/androie/settings/wifi/WifiSettings;->mDlgAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    .line 648
    .local v3, "ap":Lcom/androie/settings/wifi/AccessPoint;
    if-nez v3, :cond_0

    .line 649
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    if-eqz v0, :cond_0

    .line 650
    new-instance v3, Lcom/androie/settings/wifi/AccessPoint;

    .end local v3    # "ap":Lcom/androie/settings/wifi/AccessPoint;
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    invoke-direct {v3, v0, v1}, Lcom/androie/settings/wifi/AccessPoint;-><init>(Landroid/content/Context;Landroid/os/Bundle;)V

    .line 652
    .restart local v3    # "ap":Lcom/androie/settings/wifi/AccessPoint;
    iput-object v3, p0, Lcom/androie/settings/wifi/WifiSettings;->mDlgAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    .line 656
    :cond_0
    iput-object v3, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    .line 657
    new-instance v0, Lcom/androie/settings/wifi/WifiDialog;

    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-boolean v4, p0, Lcom/androie/settings/wifi/WifiSettings;->mDlgEdit:Z

    iget-boolean v5, p0, Lcom/androie/settings/wifi/WifiSettings;->mIbssSupported:Z

    iget-object v6, p0, Lcom/androie/settings/wifi/WifiSettings;->mSupportedChannels:Ljava/util/List;

    move-object v2, p0

    invoke-direct/range {v0 .. v6}, Lcom/androie/settings/wifi/WifiDialog;-><init>(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Lcom/androie/settings/wifi/AccessPoint;ZZLjava/util/List;)V

    iput-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mDialog:Lcom/androie/settings/wifi/WifiDialog;

    .line 658
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mDialog:Lcom/androie/settings/wifi/WifiDialog;

    goto :goto_0

    .line 660
    .end local v3    # "ap":Lcom/androie/settings/wifi/AccessPoint;
    :pswitch_1
    new-instance v0, Lcom/androie/settings/wifi/WpsDialog;

    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1, v2}, Lcom/androie/settings/wifi/WpsDialog;-><init>(Landroid/content/Context;I)V

    goto :goto_0

    .line 662
    :pswitch_2
    new-instance v0, Lcom/androie/settings/wifi/WpsDialog;

    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/androie/settings/wifi/WpsDialog;-><init>(Landroid/content/Context;I)V

    goto :goto_0

    .line 664
    :pswitch_3
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0805b1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/androie/settings/wifi/WifiSettings$9;

    invoke-direct {v1, p0}, Lcom/androie/settings/wifi/WifiSettings$9;-><init>(Lcom/androie/settings/wifi/WifiSettings;)V

    invoke-virtual {v0, v4, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/androie/settings/wifi/WifiSettings$8;

    invoke-direct {v1, p0}, Lcom/androie/settings/wifi/WifiSettings$8;-><init>(Lcom/androie/settings/wifi/WifiSettings;)V

    invoke-virtual {v0, v5, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto :goto_0

    .line 683
    :pswitch_4
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0805b2

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/androie/settings/wifi/WifiSettings$11;

    invoke-direct {v1, p0}, Lcom/androie/settings/wifi/WifiSettings$11;-><init>(Lcom/androie/settings/wifi/WifiSettings;)V

    invoke-virtual {v0, v4, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/androie/settings/wifi/WifiSettings$10;

    invoke-direct {v1, p0}, Lcom/androie/settings/wifi/WifiSettings$10;-><init>(Lcom/androie/settings/wifi/WifiSettings;)V

    invoke-virtual {v0, v5, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto/16 :goto_0

    .line 645
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 8
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const v7, 0x7f0200d4

    const/4 v6, 0x4

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 455
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mUserManager:Landroid/os/UserManager;

    const-string v2, "no_config_wifi"

    invoke-virtual {v1, v2}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 493
    :goto_0
    return-void

    .line 457
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    .line 458
    .local v0, "wifiIsEnabled":Z
    iget-boolean v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mSetupWizardMode:Z

    if-eqz v1, :cond_1

    .line 460
    const v1, 0x7f08055f

    invoke-interface {p1, v3, v4, v3, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v7}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v5}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 464
    const v1, 0x7f08055d

    invoke-interface {p1, v3, v6, v3, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v5}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 492
    :goto_1
    invoke-super {p0, p1, p2}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    goto :goto_0

    .line 468
    :cond_1
    const v1, 0x7f08055f

    invoke-interface {p1, v3, v4, v3, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v7}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v4}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 472
    const v1, 0x7f08055d

    invoke-interface {p1, v3, v6, v3, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    const v2, 0x7f020071

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v4}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 476
    const/4 v1, 0x6

    const v2, 0x7f080563

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 480
    const v1, 0x7f080561

    invoke-interface {p1, v3, v5, v3, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 483
    iget-boolean v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mP2pSupported:Z

    if-eqz v1, :cond_2

    .line 484
    const/4 v1, 0x3

    const v2, 0x7f080562

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 488
    :cond_2
    const/4 v1, 0x5

    const v2, 0x7f080564

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    goto :goto_1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 8
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x0

    .line 216
    iget-boolean v5, p0, Lcom/androie/settings/wifi/WifiSettings;->mSetupWizardMode:Z

    if-eqz v5, :cond_3

    .line 217
    const v5, 0x7f0400b8

    invoke-virtual {p1, v5, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 218
    .local v4, "view":Landroid/view/View;
    const v5, 0x7f0c01cb

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 219
    .local v3, "other":Landroid/view/View;
    new-instance v5, Lcom/androie/settings/wifi/WifiSettings$2;

    invoke-direct {v5, p0}, Lcom/androie/settings/wifi/WifiSettings$2;-><init>(Lcom/androie/settings/wifi/WifiSettings;)V

    invoke-virtual {v3, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 227
    const v5, 0x7f0c0099

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    .line 228
    .local v0, "b":Landroid/widget/ImageButton;
    if-eqz v0, :cond_0

    .line 229
    new-instance v5, Lcom/androie/settings/wifi/WifiSettings$3;

    invoke-direct {v5, p0, p1, v0}, Lcom/androie/settings/wifi/WifiSettings$3;-><init>(Lcom/androie/settings/wifi/WifiSettings;Landroid/view/LayoutInflater;Landroid/widget/ImageButton;)V

    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 251
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 252
    .local v2, "intent":Landroid/content/Intent;
    const-string v5, "wifi_show_custom_button"

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 253
    const v5, 0x7f0c01ce

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 254
    const v5, 0x7f0c01cf

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    .line 255
    const v5, 0x7f0c01d1

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    .line 256
    const v5, 0x7f0c0049

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    .line 258
    const v5, 0x7f0c01d0

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 259
    .local v1, "customButton":Landroid/widget/Button;
    invoke-virtual {v1, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 260
    new-instance v5, Lcom/androie/settings/wifi/WifiSettings$4;

    invoke-direct {v5, p0}, Lcom/androie/settings/wifi/WifiSettings$4;-><init>(Lcom/androie/settings/wifi/WifiSettings;)V

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 282
    .end local v1    # "customButton":Landroid/widget/Button;
    :cond_1
    const-string v5, "wifi_show_wifi_required_info"

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 283
    const v5, 0x7f0c01ca

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 288
    .end local v0    # "b":Landroid/widget/ImageButton;
    .end local v2    # "intent":Landroid/content/Intent;
    .end local v3    # "other":Landroid/view/View;
    .end local v4    # "view":Landroid/view/View;
    :cond_2
    :goto_0
    return-object v4

    :cond_3
    invoke-super {p0, p1, p2, p3}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v4

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 8

    .prologue
    const/4 v3, -0x1

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v7, 0x1

    .line 513
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mUserManager:Landroid/os/UserManager;

    const-string v1, "no_config_wifi"

    invoke-virtual {v0, v1}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 555
    :goto_0
    return v6

    .line 515
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 555
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v6

    goto :goto_0

    .line 517
    :pswitch_0
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/androie/settings/wifi/WifiSettings;->showDialog(I)V

    move v6, v7

    .line 518
    goto :goto_0

    .line 520
    :pswitch_1
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v0, v0, Landroid/preference/PreferenceActivity;

    if-eqz v0, :cond_1

    .line 521
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    const-class v1, Lcom/androie/settings/wifi/p2p/WifiP2pSettings;

    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    const v3, 0x7f0805c9

    move-object v4, v2

    move-object v5, p0

    invoke-virtual/range {v0 .. v6}, Landroid/preference/PreferenceActivity;->startPreferencePanel(Ljava/lang/String;Landroid/os/Bundle;ILjava/lang/CharSequence;Landroid/app/Fragment;I)V

    :goto_1
    move v6, v7

    .line 529
    goto :goto_0

    .line 527
    :cond_1
    const-class v0, Lcom/androie/settings/wifi/p2p/WifiP2pSettings;

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p0, v0, v3, v2}, Lcom/androie/settings/wifi/WifiSettings;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ILandroid/os/Bundle;)Z

    goto :goto_1

    .line 531
    :pswitch_2
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/androie/settings/wifi/WifiSettings;->showDialog(I)V

    move v6, v7

    .line 532
    goto :goto_0

    .line 534
    :pswitch_3
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 535
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mScanner:Lcom/androie/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/androie/settings/wifi/WifiSettings$Scanner;->forceScan()V

    :cond_2
    move v6, v7

    .line 537
    goto :goto_0

    .line 539
    :pswitch_4
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 540
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->onAddNetworkPressed()V

    :cond_3
    move v6, v7

    .line 542
    goto :goto_0

    .line 544
    :pswitch_5
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v0, v0, Landroid/preference/PreferenceActivity;

    if-eqz v0, :cond_4

    .line 545
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    const-class v1, Lcom/androie/settings/wifi/AdvancedWifiSettings;

    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    const v3, 0x7f0805b4

    move-object v4, v2

    move-object v5, p0

    invoke-virtual/range {v0 .. v6}, Landroid/preference/PreferenceActivity;->startPreferencePanel(Ljava/lang/String;Landroid/os/Bundle;ILjava/lang/CharSequence;Landroid/app/Fragment;I)V

    :goto_2
    move v6, v7

    .line 553
    goto :goto_0

    .line 551
    :cond_4
    const-class v0, Lcom/androie/settings/wifi/AdvancedWifiSettings;

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p0, v0, v3, v2}, Lcom/androie/settings/wifi/WifiSettings;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ILandroid/os/Bundle;)Z

    goto :goto_2

    .line 515
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_4
        :pswitch_5
        :pswitch_3
    .end packed-switch
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 444
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onPause()V

    .line 445
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiEnabler:Lcom/androie/settings/wifi/WifiEnabler;

    if-eqz v0, :cond_0

    .line 446
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiEnabler:Lcom/androie/settings/wifi/WifiEnabler;

    invoke-virtual {v0}, Lcom/androie/settings/wifi/WifiEnabler;->pause()V

    .line 448
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 449
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mScanner:Lcom/androie/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/androie/settings/wifi/WifiSettings$Scanner;->pause()V

    .line 450
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 3
    .param p1, "screen"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 613
    instance-of v0, p2, Lcom/androie/settings/wifi/AccessPoint;

    if-eqz v0, :cond_1

    .line 614
    check-cast p2, Lcom/androie/settings/wifi/AccessPoint;

    .end local p2    # "preference":Landroid/preference/Preference;
    iput-object p2, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    .line 616
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    iget v0, v0, Lcom/androie/settings/wifi/AccessPoint;->security:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    iget v0, v0, Lcom/androie/settings/wifi/AccessPoint;->networkId:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    iget-boolean v0, v0, Lcom/androie/settings/wifi/AccessPoint;->isIBSS:Z

    if-nez v0, :cond_0

    .line 619
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    invoke-virtual {v0}, Lcom/androie/settings/wifi/AccessPoint;->generateOpenNetworkConfig()V

    .line 620
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    invoke-virtual {v1}, Lcom/androie/settings/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v0, v1, v2}, Landroid/net/wifi/WifiManager;->connect(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiManager$ActionListener;)V

    .line 627
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0

    .line 622
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/androie/settings/wifi/WifiSettings;->showDialog(Lcom/androie/settings/wifi/AccessPoint;Z)V

    goto :goto_0

    .line 625
    .restart local p2    # "preference":Landroid/preference/Preference;
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/androie/settings/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v0

    goto :goto_1
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 433
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onResume()V

    .line 434
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiEnabler:Lcom/androie/settings/wifi/WifiEnabler;

    if-eqz v0, :cond_0

    .line 435
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiEnabler:Lcom/androie/settings/wifi/WifiEnabler;

    invoke-virtual {v0}, Lcom/androie/settings/wifi/WifiEnabler;->resume()V

    .line 438
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Lcom/androie/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 439
    invoke-direct {p0}, Lcom/androie/settings/wifi/WifiSettings;->updateAccessPoints()V

    .line 440
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 497
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 500
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mDialog:Lcom/androie/settings/wifi/WifiDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mDialog:Lcom/androie/settings/wifi/WifiDialog;

    invoke-virtual {v0}, Lcom/androie/settings/wifi/WifiDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 501
    const-string v0, "edit_mode"

    iget-boolean v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mDlgEdit:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 502
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mDlgAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    if-eqz v0, :cond_0

    .line 503
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    .line 504
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mDlgAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Lcom/androie/settings/wifi/AccessPoint;->saveWifiState(Landroid/os/Bundle;)V

    .line 505
    const-string v0, "wifi_ap_state"

    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 508
    :cond_0
    return-void
.end method

.method refreshAccessPoints()V
    .locals 1

    .prologue
    .line 1051
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1052
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mScanner:Lcom/androie/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/androie/settings/wifi/WifiSettings$Scanner;->resume()V

    .line 1055
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 1056
    return-void
.end method

.method resumeWifiScan()V
    .locals 1

    .prologue
    .line 1089
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1090
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings;->mScanner:Lcom/androie/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/androie/settings/wifi/WifiSettings$Scanner;->resume()V

    .line 1092
    :cond_0
    return-void
.end method

.method submit(Lcom/androie/settings/wifi/WifiConfigController;)V
    .locals 4
    .param p1, "configController"    # Lcom/androie/settings/wifi/WifiConfigController;

    .prologue
    const/4 v2, -0x1

    .line 1003
    invoke-virtual {p1}, Lcom/androie/settings/wifi/WifiConfigController;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    .line 1005
    .local v0, "config":Landroid/net/wifi/WifiConfiguration;
    if-nez v0, :cond_2

    .line 1006
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    iget v1, v1, Lcom/androie/settings/wifi/AccessPoint;->networkId:I

    if-eq v1, v2, :cond_0

    .line 1008
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    iget v2, v2, Lcom/androie/settings/wifi/AccessPoint;->networkId:I

    iget-object v3, p0, Lcom/androie/settings/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v1, v2, v3}, Landroid/net/wifi/WifiManager;->connect(ILandroid/net/wifi/WifiManager$ActionListener;)V

    .line 1023
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1024
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mScanner:Lcom/androie/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v1}, Lcom/androie/settings/wifi/WifiSettings$Scanner;->resume()V

    .line 1026
    :cond_1
    invoke-direct {p0}, Lcom/androie/settings/wifi/WifiSettings;->updateAccessPoints()V

    .line 1027
    return-void

    .line 1011
    :cond_2
    iget v1, v0, Landroid/net/wifi/WifiConfiguration;->networkId:I

    if-eq v1, v2, :cond_3

    .line 1012
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/androie/settings/wifi/AccessPoint;

    if-eqz v1, :cond_0

    .line 1013
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/androie/settings/wifi/WifiSettings;->mSaveListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v1, v0, v2}, Landroid/net/wifi/WifiManager;->save(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_0

    .line 1016
    :cond_3
    invoke-virtual {p1}, Lcom/androie/settings/wifi/WifiConfigController;->isEdit()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1017
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/androie/settings/wifi/WifiSettings;->mSaveListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v1, v0, v2}, Landroid/net/wifi/WifiManager;->save(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_0

    .line 1019
    :cond_4
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/androie/settings/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v1, v0, v2}, Landroid/net/wifi/WifiManager;->connect(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_0
.end method
