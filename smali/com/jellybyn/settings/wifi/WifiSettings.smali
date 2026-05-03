.class public Lcom/jellybyn/settings/wifi/WifiSettings;
.super Lcom/jellybyn/settings/SettingsPreferenceFragment;
.source "WifiSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jellybyn/settings/wifi/WifiSettings$ProportionalOuterFrame;,
        Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;,
        Lcom/jellybyn/settings/wifi/WifiSettings$Multimap;
    }
.end annotation


# instance fields
.field private mAccessPointSavedState:Landroid/os/Bundle;

.field private mAutoFinishOnConnection:Z

.field private mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

.field private mConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mDialog:Lcom/jellybyn/settings/wifi/WifiDialog;

.field private mDlgAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

.field private mDlgEdit:Z

.field private mEmptyView:Landroid/widget/TextView;

.field private mEnableNextOnConnection:Z

.field private final mFilter:Landroid/content/IntentFilter;

.field private mForgetListener:Landroid/net/wifi/WifiManager$ActionListener;

.field private mLastInfo:Landroid/net/wifi/WifiInfo;

.field private mLastState:Landroid/net/NetworkInfo$DetailedState;

.field private mP2pSupported:Z

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mSaveListener:Landroid/net/wifi/WifiManager$ActionListener;

.field private final mScanner:Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;

.field private mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

.field private mSetupWizardMode:Z

.field private mUserManager:Landroid/os/UserManager;

.field private mWifiEnabler:Lcom/jellybyn/settings/wifi/WifiEnabler;

.field private mWifiManager:Landroid/net/wifi/WifiManager;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 181
    invoke-direct {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;-><init>()V

    .line 142
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 182
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    iput-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    .line 183
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 184
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.SCAN_RESULTS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 185
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.NETWORK_IDS_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 186
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.supplicant.STATE_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 187
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.CONFIGURED_NETWORKS_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 188
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.LINK_CONFIGURATION_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 189
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 190
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.RSSI_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 192
    new-instance v0, Lcom/jellybyn/settings/wifi/WifiSettings$1;

    invoke-direct {v0, p0}, Lcom/jellybyn/settings/wifi/WifiSettings$1;-><init>(Lcom/jellybyn/settings/wifi/WifiSettings;)V

    iput-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 199
    new-instance v0, Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;-><init>(Lcom/jellybyn/settings/wifi/WifiSettings;Lcom/jellybyn/settings/wifi/WifiSettings$1;)V

    iput-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mScanner:Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;

    .line 200
    return-void
.end method

.method static synthetic access$000(Lcom/jellybyn/settings/wifi/WifiSettings;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/wifi/WifiSettings;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Landroid/content/Intent;

    .prologue
    .line 93
    invoke-direct {p0, p1, p2}, Lcom/jellybyn/settings/wifi/WifiSettings;->handleEvent(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$200(Lcom/jellybyn/settings/wifi/WifiSettings;)Landroid/net/wifi/WifiManager;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/wifi/WifiSettings;

    .prologue
    .line 93
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/jellybyn/settings/wifi/WifiSettings;I)V
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/wifi/WifiSettings;
    .param p1, "x1"    # I

    .prologue
    .line 93
    invoke-virtual {p0, p1}, Lcom/jellybyn/settings/wifi/WifiSettings;->showDialog(I)V

    return-void
.end method

.method static synthetic access$400(Lcom/jellybyn/settings/wifi/WifiSettings;I)V
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/wifi/WifiSettings;
    .param p1, "x1"    # I

    .prologue
    .line 93
    invoke-virtual {p0, p1}, Lcom/jellybyn/settings/wifi/WifiSettings;->showDialog(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/jellybyn/settings/wifi/WifiSettings;I)V
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/wifi/WifiSettings;
    .param p1, "x1"    # I

    .prologue
    .line 93
    invoke-virtual {p0, p1}, Lcom/jellybyn/settings/wifi/WifiSettings;->showDialog(I)V

    return-void
.end method

.method private addMessagePreference(I)V
    .locals 1
    .param p1, "messageId"    # I

    .prologue
    .line 764
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 765
    :cond_0
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 766
    return-void
.end method

.method private changeNextButtonState(Z)V
    .locals 1
    .param p1, "connected"    # Z

    .prologue
    .line 973
    iget-boolean v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mEnableNextOnConnection:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->hasNextButton()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 974
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getNextButton()Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 976
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
            "Lcom/jellybyn/settings/wifi/AccessPoint;",
            ">;"
        }
    .end annotation

    .prologue
    .line 770
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 773
    new-instance v4, Lcom/jellybyn/settings/wifi/WifiSettings$Multimap;

    const/4 v0, 0x0

    invoke-direct {v4, p0, v0}, Lcom/jellybyn/settings/wifi/WifiSettings$Multimap;-><init>(Lcom/jellybyn/settings/wifi/WifiSettings;Lcom/jellybyn/settings/wifi/WifiSettings$1;)V

    .line 775
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getConfiguredNetworks()Ljava/util/List;

    move-result-object v0

    .line 776
    if-eqz v0, :cond_0

    .line 777
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiConfiguration;

    .line 778
    new-instance v2, Lcom/jellybyn/settings/wifi/AccessPoint;

    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v2, v5, v0}, Lcom/jellybyn/settings/wifi/AccessPoint;-><init>(Landroid/content/Context;Landroid/net/wifi/WifiConfiguration;)V

    .line 779
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mLastInfo:Landroid/net/wifi/WifiInfo;

    iget-object v5, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mLastState:Landroid/net/NetworkInfo$DetailedState;

    invoke-virtual {v2, v0, v5}, Lcom/jellybyn/settings/wifi/AccessPoint;->update(Landroid/net/wifi/WifiInfo;Landroid/net/NetworkInfo$DetailedState;)V

    .line 780
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 781
    iget-object v0, v2, Lcom/jellybyn/settings/wifi/AccessPoint;->ssid:Ljava/lang/String;

    invoke-virtual {v4, v0, v2}, Lcom/jellybyn/settings/wifi/WifiSettings$Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 785
    :cond_0
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getScanResults()Ljava/util/List;

    move-result-object v0

    .line 786
    if-eqz v0, :cond_3

    .line 787
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/ScanResult;

    .line 789
    iget-object v1, v0, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, v0, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, v0, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    const-string v2, "[IBSS]"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 794
    const/4 v1, 0x0

    .line 795
    iget-object v2, v0, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    invoke-virtual {v4, v2}, Lcom/jellybyn/settings/wifi/WifiSettings$Multimap;->getAll(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move v2, v1

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jellybyn/settings/wifi/AccessPoint;

    .line 796
    invoke-virtual {v1, v0}, Lcom/jellybyn/settings/wifi/AccessPoint;->update(Landroid/net/wifi/ScanResult;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 797
    const/4 v1, 0x1

    :goto_3
    move v2, v1

    goto :goto_2

    .line 799
    :cond_2
    if-nez v2, :cond_1

    .line 800
    new-instance v1, Lcom/jellybyn/settings/wifi/AccessPoint;

    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/jellybyn/settings/wifi/AccessPoint;-><init>(Landroid/content/Context;Landroid/net/wifi/ScanResult;)V

    .line 801
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 802
    iget-object v0, v1, Lcom/jellybyn/settings/wifi/AccessPoint;->ssid:Ljava/lang/String;

    invoke-virtual {v4, v0, v1}, Lcom/jellybyn/settings/wifi/WifiSettings$Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1

    .line 808
    :cond_3
    invoke-static {v3}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 809
    return-object v3

    :cond_4
    move v1, v2

    goto :goto_3
.end method

.method private handleEvent(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 832
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 833
    const-string v1, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 834
    const-string v0, "wifi_state"

    const/4 v1, 0x4

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/jellybyn/settings/wifi/WifiSettings;->updateWifiState(I)V

    .line 875
    :cond_0
    :goto_0
    return-void

    .line 836
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

    .line 839
    :cond_2
    invoke-direct {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->updateAccessPoints()V

    goto :goto_0

    .line 840
    :cond_3
    const-string v1, "android.net.wifi.supplicant.STATE_CHANGE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 847
    const-string v0, "newState"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/SupplicantState;

    .line 849
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_4

    invoke-static {v0}, Landroid/net/wifi/SupplicantState;->isHandshakeState(Landroid/net/wifi/SupplicantState;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 850
    invoke-static {v0}, Landroid/net/wifi/WifiInfo;->getDetailedStateOf(Landroid/net/wifi/SupplicantState;)Landroid/net/NetworkInfo$DetailedState;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/jellybyn/settings/wifi/WifiSettings;->updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V

    goto :goto_0

    .line 855
    :cond_4
    invoke-direct {p0, v2}, Lcom/jellybyn/settings/wifi/WifiSettings;->updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V

    goto :goto_0

    .line 857
    :cond_5
    const-string v1, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 858
    const-string v0, "networkInfo"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/NetworkInfo;

    .line 860
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 861
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    invoke-direct {p0, v1}, Lcom/jellybyn/settings/wifi/WifiSettings;->changeNextButtonState(Z)V

    .line 862
    invoke-direct {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->updateAccessPoints()V

    .line 863
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getDetailedState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/jellybyn/settings/wifi/WifiSettings;->updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V

    .line 864
    iget-boolean v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mAutoFinishOnConnection:Z

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 865
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 866
    if-eqz v0, :cond_0

    .line 867
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setResult(I)V

    .line 868
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto/16 :goto_0

    .line 872
    :cond_6
    const-string v1, "android.net.wifi.RSSI_CHANGED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 873
    invoke-direct {p0, v2}, Lcom/jellybyn/settings/wifi/WifiSettings;->updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V

    goto/16 :goto_0
.end method

.method private setOffMessage()V
    .locals 5

    .prologue
    .line 744
    iget-object v2, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    if-eqz v2, :cond_0

    .line 745
    iget-object v2, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    const v3, 0x7f0b01fb

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 746
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "wifi_scan_always_enabled"

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 748
    iget-object v2, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    const-string v3, "\n\n"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    .line 750
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "network"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->isLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 752
    const v1, 0x7f0b01e9

    .line 756
    .local v1, "resId":I
    :goto_0
    invoke-virtual {p0, v1}, Lcom/jellybyn/settings/wifi/WifiSettings;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 757
    .local v0, "charSeq":Ljava/lang/CharSequence;
    iget-object v2, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    .line 760
    .end local v0    # "charSeq":Ljava/lang/CharSequence;
    .end local v1    # "resId":I
    :cond_0
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    invoke-virtual {v2}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 761
    return-void

    .line 754
    :cond_1
    const v1, 0x7f0b01ea

    .restart local v1    # "resId":I
    goto :goto_0
.end method

.method private showDialog(Lcom/jellybyn/settings/wifi/AccessPoint;Z)V
    .locals 2
    .param p1, "accessPoint"    # Lcom/jellybyn/settings/wifi/AccessPoint;
    .param p2, "edit"    # Z

    .prologue
    const/4 v1, 0x1

    .line 627
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mDialog:Lcom/jellybyn/settings/wifi/WifiDialog;

    if-eqz v0, :cond_0

    .line 628
    invoke-virtual {p0, v1}, Lcom/jellybyn/settings/wifi/WifiSettings;->removeDialog(I)V

    .line 629
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mDialog:Lcom/jellybyn/settings/wifi/WifiDialog;

    .line 633
    :cond_0
    iput-object p1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mDlgAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    .line 634
    iput-boolean p2, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mDlgEdit:Z

    .line 636
    invoke-virtual {p0, v1}, Lcom/jellybyn/settings/wifi/WifiSettings;->showDialog(I)V

    .line 637
    return-void
.end method

.method private updateAccessPoints()V
    .locals 6

    .prologue
    .line 708
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    if-nez v4, :cond_1

    .line 741
    :cond_0
    :goto_0
    return-void

    .line 710
    :cond_1
    iget-object v4, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mUserManager:Landroid/os/UserManager;

    const-string v5, "no_config_wifi"

    invoke-virtual {v4, v5}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 711
    const v4, 0x7f0b01fd

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/wifi/WifiSettings;->addMessagePreference(I)V

    goto :goto_0

    .line 714
    :cond_2
    iget-object v4, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v4}, Landroid/net/wifi/WifiManager;->getWifiState()I

    move-result v3

    .line 716
    .local v3, "wifiState":I
    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 734
    :pswitch_0
    const v4, 0x7f0b01de

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/wifi/WifiSettings;->addMessagePreference(I)V

    goto :goto_0

    .line 719
    :pswitch_1
    invoke-direct {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->constructAccessPoints()Ljava/util/List;

    move-result-object v1

    .line 720
    .local v1, "accessPoints":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/jellybyn/settings/wifi/AccessPoint;>;"
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    invoke-virtual {v4}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 721
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v4

    if-nez v4, :cond_3

    .line 722
    const v4, 0x7f0b01fc

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/wifi/WifiSettings;->addMessagePreference(I)V

    .line 724
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

    check-cast v0, Lcom/jellybyn/settings/wifi/AccessPoint;

    .line 725
    .local v0, "accessPoint":Lcom/jellybyn/settings/wifi/AccessPoint;
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    goto :goto_1

    .line 730
    .end local v0    # "accessPoint":Lcom/jellybyn/settings/wifi/AccessPoint;
    .end local v1    # "accessPoints":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/jellybyn/settings/wifi/AccessPoint;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    :pswitch_2
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    invoke-virtual {v4}, Landroid/preference/PreferenceScreen;->removeAll()V

    goto :goto_0

    .line 738
    :pswitch_3
    invoke-direct {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->setOffMessage()V

    goto :goto_0

    .line 716
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
    .line 879
    iget-object v3, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v3

    if-nez v3, :cond_1

    .line 880
    iget-object v3, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mScanner:Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v3}, Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;->pause()V

    .line 903
    :cond_0
    return-void

    .line 884
    :cond_1
    sget-object v3, Landroid/net/NetworkInfo$DetailedState;->OBTAINING_IPADDR:Landroid/net/NetworkInfo$DetailedState;

    if-ne p1, v3, :cond_4

    .line 885
    iget-object v3, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mScanner:Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v3}, Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;->pause()V

    .line 890
    :goto_0
    iget-object v3, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v3

    iput-object v3, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mLastInfo:Landroid/net/wifi/WifiInfo;

    .line 891
    if-eqz p1, :cond_2

    .line 892
    iput-object p1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mLastState:Landroid/net/NetworkInfo$DetailedState;

    .line 895
    :cond_2
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    invoke-virtual {v3}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .local v1, "i":I
    :goto_1
    if-ltz v1, :cond_0

    .line 897
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    .line 898
    .local v2, "preference":Landroid/preference/Preference;
    instance-of v3, v2, Lcom/jellybyn/settings/wifi/AccessPoint;

    if-eqz v3, :cond_3

    move-object v0, v2

    .line 899
    check-cast v0, Lcom/jellybyn/settings/wifi/AccessPoint;

    .line 900
    .local v0, "accessPoint":Lcom/jellybyn/settings/wifi/AccessPoint;
    iget-object v3, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mLastInfo:Landroid/net/wifi/WifiInfo;

    iget-object v4, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mLastState:Landroid/net/NetworkInfo$DetailedState;

    invoke-virtual {v0, v3, v4}, Lcom/jellybyn/settings/wifi/AccessPoint;->update(Landroid/net/wifi/WifiInfo;Landroid/net/NetworkInfo$DetailedState;)V

    .line 895
    .end local v0    # "accessPoint":Lcom/jellybyn/settings/wifi/AccessPoint;
    :cond_3
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 887
    .end local v1    # "i":I
    .end local v2    # "preference":Landroid/preference/Preference;
    :cond_4
    iget-object v3, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mScanner:Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v3}, Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;->resume()V

    goto :goto_0
.end method

.method private updateWifiState(I)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 906
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 907
    if-eqz v0, :cond_0

    .line 908
    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 911
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 925
    :goto_0
    iput-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mLastInfo:Landroid/net/wifi/WifiInfo;

    .line 926
    iput-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mLastState:Landroid/net/NetworkInfo$DetailedState;

    .line 927
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mScanner:Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;->pause()V

    .line 928
    :goto_1
    return-void

    .line 913
    :pswitch_0
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mScanner:Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;->resume()V

    goto :goto_1

    .line 917
    :pswitch_1
    const v0, 0x7f0b01dd

    invoke-direct {p0, v0}, Lcom/jellybyn/settings/wifi/WifiSettings;->addMessagePreference(I)V

    goto :goto_0

    .line 921
    :pswitch_2
    invoke-direct {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->setOffMessage()V

    goto :goto_0

    .line 911
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
    .line 1018
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    iget v0, v0, Lcom/jellybyn/settings/wifi/AccessPoint;->networkId:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 1020
    const-string v0, "WifiSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to forget invalid network "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    invoke-virtual {v2}, Lcom/jellybyn/settings/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1033
    :goto_0
    return-void

    .line 1024
    :cond_0
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    iget v1, v1, Lcom/jellybyn/settings/wifi/AccessPoint;->networkId:I

    iget-object v2, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mForgetListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v0, v1, v2}, Landroid/net/wifi/WifiManager;->forget(ILandroid/net/wifi/WifiManager$ActionListener;)V

    .line 1026
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1027
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mScanner:Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;->resume()V

    .line 1029
    :cond_1
    invoke-direct {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->updateAccessPoints()V

    .line 1032
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/jellybyn/settings/wifi/WifiSettings;->changeNextButtonState(Z)V

    goto :goto_0
.end method

.method protected getHelpResource()I
    .locals 1

    .prologue
    .line 1084
    iget-boolean v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSetupWizardMode:Z

    if-eqz v0, :cond_0

    .line 1085
    const/4 v0, 0x0

    .line 1087
    :goto_0
    return v0

    :cond_0
    const v0, 0x7f0b06fa

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

    .line 291
    invoke-super {p0, p1}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 293
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    const-string v8, "android.hardware.wifi.direct"

    invoke-virtual {v7, v8}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v7

    iput-boolean v7, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mP2pSupported:Z

    .line 294
    const-string v7, "wifi"

    invoke-virtual {p0, v7}, Lcom/jellybyn/settings/wifi/WifiSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/net/wifi/WifiManager;

    iput-object v7, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 295
    const-string v7, "user"

    invoke-virtual {p0, v7}, Lcom/jellybyn/settings/wifi/WifiSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/os/UserManager;

    iput-object v7, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mUserManager:Landroid/os/UserManager;

    .line 297
    new-instance v7, Lcom/jellybyn/settings/wifi/WifiSettings$5;

    invoke-direct {v7, p0}, Lcom/jellybyn/settings/wifi/WifiSettings$5;-><init>(Lcom/jellybyn/settings/wifi/WifiSettings;)V

    iput-object v7, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    .line 312
    new-instance v7, Lcom/jellybyn/settings/wifi/WifiSettings$6;

    invoke-direct {v7, p0}, Lcom/jellybyn/settings/wifi/WifiSettings$6;-><init>(Lcom/jellybyn/settings/wifi/WifiSettings;)V

    iput-object v7, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSaveListener:Landroid/net/wifi/WifiManager$ActionListener;

    .line 327
    new-instance v7, Lcom/jellybyn/settings/wifi/WifiSettings$7;

    invoke-direct {v7, p0}, Lcom/jellybyn/settings/wifi/WifiSettings$7;-><init>(Lcom/jellybyn/settings/wifi/WifiSettings;)V

    iput-object v7, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mForgetListener:Landroid/net/wifi/WifiManager$ActionListener;

    .line 342
    if-eqz p1, :cond_0

    const-string v7, "wifi_ap_state"

    invoke-virtual {p1, v7}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 344
    const-string v7, "edit_mode"

    invoke-virtual {p1, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v7

    iput-boolean v7, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mDlgEdit:Z

    .line 345
    const-string v7, "wifi_ap_state"

    invoke-virtual {p1, v7}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v7

    iput-object v7, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    .line 348
    :cond_0
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    .line 349
    .local v1, "activity":Landroid/app/Activity;
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    .line 352
    .local v4, "intent":Landroid/content/Intent;
    const-string v7, "wifi_auto_finish_on_connect"

    invoke-virtual {v4, v7, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v7

    iput-boolean v7, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mAutoFinishOnConnection:Z

    .line 354
    iget-boolean v7, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mAutoFinishOnConnection:Z

    if-eqz v7, :cond_2

    .line 356
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->hasNextButton()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 357
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getNextButton()Landroid/widget/Button;

    move-result-object v7

    const/16 v8, 0x8

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 360
    :cond_1
    const-string v7, "connectivity"

    invoke-virtual {v1, v7}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    .line 362
    .local v2, "connectivity":Landroid/net/ConnectivityManager;
    if-eqz v2, :cond_2

    invoke-virtual {v2, v10}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 364
    const/4 v7, -0x1

    invoke-virtual {v1, v7}, Landroid/app/Activity;->setResult(I)V

    .line 365
    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 426
    .end local v2    # "connectivity":Landroid/net/ConnectivityManager;
    :goto_0
    return-void

    .line 372
    :cond_2
    const-string v7, "wifi_enable_next_on_connect"

    invoke-virtual {v4, v7, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v7

    iput-boolean v7, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mEnableNextOnConnection:Z

    .line 374
    iget-boolean v7, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mEnableNextOnConnection:Z

    if-eqz v7, :cond_3

    .line 375
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->hasNextButton()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 376
    const-string v7, "connectivity"

    invoke-virtual {v1, v7}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    .line 378
    .restart local v2    # "connectivity":Landroid/net/ConnectivityManager;
    if-eqz v2, :cond_3

    .line 379
    invoke-virtual {v2, v10}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v3

    .line 381
    .local v3, "info":Landroid/net/NetworkInfo;
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v7

    invoke-direct {p0, v7}, Lcom/jellybyn/settings/wifi/WifiSettings;->changeNextButtonState(Z)V

    .line 386
    .end local v2    # "connectivity":Landroid/net/ConnectivityManager;
    .end local v3    # "info":Landroid/net/NetworkInfo;
    :cond_3
    const v7, 0x7f050038

    invoke-virtual {p0, v7}, Lcom/jellybyn/settings/wifi/WifiSettings;->addPreferencesFromResource(I)V

    .line 388
    iget-boolean v7, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSetupWizardMode:Z

    if-eqz v7, :cond_4

    .line 389
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getView()Landroid/view/View;

    move-result-object v7

    const/high16 v8, 0x1a40000

    invoke-virtual {v7, v8}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 398
    :cond_4
    iget-boolean v7, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSetupWizardMode:Z

    if-nez v7, :cond_7

    .line 399
    new-instance v0, Landroid/widget/Switch;

    invoke-direct {v0, v1}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 401
    .local v0, "actionBarSwitch":Landroid/widget/Switch;
    instance-of v7, v1, Landroid/preference/PreferenceActivity;

    if-eqz v7, :cond_6

    move-object v6, v1

    .line 402
    check-cast v6, Landroid/preference/PreferenceActivity;

    .line 403
    .local v6, "preferenceActivity":Landroid/preference/PreferenceActivity;
    invoke-virtual {v6}, Landroid/preference/PreferenceActivity;->onIsHidingHeaders()Z

    move-result v7

    if-nez v7, :cond_5

    invoke-virtual {v6}, Landroid/preference/PreferenceActivity;->onIsMultiPane()Z

    move-result v7

    if-nez v7, :cond_6

    .line 404
    :cond_5
    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0d0002

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    .line 406
    .local v5, "padding":I
    invoke-virtual {v0, v9, v9, v5, v9}, Landroid/widget/Switch;->setPaddingRelative(IIII)V

    .line 407
    invoke-virtual {v1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v7

    invoke-virtual {v7, v12, v12}, Landroid/app/ActionBar;->setDisplayOptions(II)V

    .line 409
    invoke-virtual {v1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v7

    new-instance v8, Landroid/app/ActionBar$LayoutParams;

    const v9, 0x800015

    invoke-direct {v8, v11, v11, v9}, Landroid/app/ActionBar$LayoutParams;-><init>(III)V

    invoke-virtual {v7, v0, v8}, Landroid/app/ActionBar;->setCustomView(Landroid/view/View;Landroid/app/ActionBar$LayoutParams;)V

    .line 416
    .end local v5    # "padding":I
    .end local v6    # "preferenceActivity":Landroid/preference/PreferenceActivity;
    :cond_6
    new-instance v7, Lcom/jellybyn/settings/wifi/WifiEnabler;

    invoke-direct {v7, v1, v0}, Lcom/jellybyn/settings/wifi/WifiEnabler;-><init>(Landroid/content/Context;Landroid/widget/Switch;)V

    iput-object v7, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiEnabler:Lcom/jellybyn/settings/wifi/WifiEnabler;

    .line 419
    .end local v0    # "actionBarSwitch":Landroid/widget/Switch;
    :cond_7
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getView()Landroid/view/View;

    move-result-object v7

    const v8, 0x1020004

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    .line 420
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getListView()Landroid/widget/ListView;

    move-result-object v7

    iget-object v8, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    invoke-virtual {v7, v8}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 422
    iget-boolean v7, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSetupWizardMode:Z

    if-nez v7, :cond_8

    .line 423
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getListView()Landroid/widget/ListView;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/jellybyn/settings/wifi/WifiSettings;->registerForContextMenu(Landroid/view/View;)V

    .line 425
    :cond_8
    invoke-virtual {p0, v10}, Lcom/jellybyn/settings/wifi/WifiSettings;->setHasOptionsMenu(Z)V

    goto/16 :goto_0
.end method

.method onAddNetworkPressed()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1051
    iput-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    .line 1052
    const/4 v0, 0x1

    invoke-direct {p0, v1, v0}, Lcom/jellybyn/settings/wifi/WifiSettings;->showDialog(Lcom/jellybyn/settings/wifi/AccessPoint;Z)V

    .line 1053
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "button"    # I

    .prologue
    .line 980
    const/4 v0, -0x3

    if-ne p2, v0, :cond_1

    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    if-eqz v0, :cond_1

    .line 981
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->forget()V

    .line 987
    :cond_0
    :goto_0
    return-void

    .line 982
    :cond_1
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 983
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mDialog:Lcom/jellybyn/settings/wifi/WifiDialog;

    if-eqz v0, :cond_0

    .line 984
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mDialog:Lcom/jellybyn/settings/wifi/WifiDialog;

    invoke-virtual {v0}, Lcom/jellybyn/settings/wifi/WifiDialog;->getController()Lcom/jellybyn/settings/wifi/WifiConfigController;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jellybyn/settings/wifi/WifiSettings;->submit(Lcom/jellybyn/settings/wifi/WifiConfigController;)V

    goto :goto_0
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v0, 0x1

    .line 578
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    if-nez v1, :cond_0

    .line 579
    invoke-super {p0, p1}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    .line 605
    :goto_0
    return v0

    .line 581
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 605
    invoke-super {p0, p1}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0

    .line 583
    :pswitch_0
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    iget v1, v1, Lcom/jellybyn/settings/wifi/AccessPoint;->networkId:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 584
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    iget v2, v2, Lcom/jellybyn/settings/wifi/AccessPoint;->networkId:I

    iget-object v3, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v1, v2, v3}, Landroid/net/wifi/WifiManager;->connect(ILandroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_0

    .line 586
    :cond_1
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    iget v1, v1, Lcom/jellybyn/settings/wifi/AccessPoint;->security:I

    if-nez v1, :cond_2

    .line 588
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    invoke-virtual {v1}, Lcom/jellybyn/settings/wifi/AccessPoint;->generateOpenNetworkConfig()V

    .line 589
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    invoke-virtual {v2}, Lcom/jellybyn/settings/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v2

    iget-object v3, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v1, v2, v3}, Landroid/net/wifi/WifiManager;->connect(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_0

    .line 592
    :cond_2
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    invoke-direct {p0, v1, v0}, Lcom/jellybyn/settings/wifi/WifiSettings;->showDialog(Lcom/jellybyn/settings/wifi/AccessPoint;Z)V

    goto :goto_0

    .line 597
    :pswitch_1
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    iget v2, v2, Lcom/jellybyn/settings/wifi/AccessPoint;->networkId:I

    iget-object v3, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mForgetListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v1, v2, v3}, Landroid/net/wifi/WifiManager;->forget(ILandroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_0

    .line 601
    :pswitch_2
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    invoke-direct {p0, v1, v0}, Lcom/jellybyn/settings/wifi/WifiSettings;->showDialog(Lcom/jellybyn/settings/wifi/AccessPoint;Z)V

    goto :goto_0

    .line 581
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
    .line 205
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "firstRun"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSetupWizardMode:Z

    .line 207
    invoke-super {p0, p1}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 208
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

    .line 557
    instance-of v1, p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    if-eqz v1, :cond_1

    .line 558
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getListView()Landroid/widget/ListView;

    move-result-object v1

    check-cast p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .end local p3    # "info":Landroid/view/ContextMenu$ContextMenuInfo;
    iget v2, p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/preference/Preference;

    .line 561
    .local v0, "preference":Landroid/preference/Preference;
    instance-of v1, v0, Lcom/jellybyn/settings/wifi/AccessPoint;

    if-eqz v1, :cond_1

    .line 562
    check-cast v0, Lcom/jellybyn/settings/wifi/AccessPoint;

    .end local v0    # "preference":Landroid/preference/Preference;
    iput-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    .line 563
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    iget-object v1, v1, Lcom/jellybyn/settings/wifi/AccessPoint;->ssid:Ljava/lang/String;

    invoke-interface {p1, v1}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 564
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    invoke-virtual {v1}, Lcom/jellybyn/settings/wifi/AccessPoint;->getLevel()I

    move-result v1

    if-eq v1, v4, :cond_0

    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    invoke-virtual {v1}, Lcom/jellybyn/settings/wifi/AccessPoint;->getState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v1

    if-nez v1, :cond_0

    .line 566
    const/4 v1, 0x7

    const v2, 0x7f0b01f8

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 568
    :cond_0
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    iget v1, v1, Lcom/jellybyn/settings/wifi/AccessPoint;->networkId:I

    if-eq v1, v4, :cond_1

    .line 569
    const/16 v1, 0x8

    const v2, 0x7f0b01f9

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 570
    const/16 v1, 0x9

    const v2, 0x7f0b01fa

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 574
    :cond_1
    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 6
    .param p1, "dialogId"    # I

    .prologue
    const v5, 0x7f0b0243

    const v4, 0x7f0b0242

    const/4 v3, 0x0

    .line 641
    packed-switch p1, :pswitch_data_0

    .line 699
    invoke-super {p0, p1}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v1

    :goto_0
    return-object v1

    .line 643
    :pswitch_0
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mDlgAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    .line 644
    .local v0, "ap":Lcom/jellybyn/settings/wifi/AccessPoint;
    if-nez v0, :cond_0

    .line 645
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    if-eqz v1, :cond_0

    .line 646
    new-instance v0, Lcom/jellybyn/settings/wifi/AccessPoint;

    .end local v0    # "ap":Lcom/jellybyn/settings/wifi/AccessPoint;
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    invoke-direct {v0, v1, v2}, Lcom/jellybyn/settings/wifi/AccessPoint;-><init>(Landroid/content/Context;Landroid/os/Bundle;)V

    .line 648
    .restart local v0    # "ap":Lcom/jellybyn/settings/wifi/AccessPoint;
    iput-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mDlgAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    .line 652
    :cond_0
    iput-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    .line 653
    new-instance v1, Lcom/jellybyn/settings/wifi/WifiDialog;

    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-boolean v3, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mDlgEdit:Z

    invoke-direct {v1, v2, p0, v0, v3}, Lcom/jellybyn/settings/wifi/WifiDialog;-><init>(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Lcom/jellybyn/settings/wifi/AccessPoint;Z)V

    iput-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mDialog:Lcom/jellybyn/settings/wifi/WifiDialog;

    .line 654
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mDialog:Lcom/jellybyn/settings/wifi/WifiDialog;

    goto :goto_0

    .line 656
    .end local v0    # "ap":Lcom/jellybyn/settings/wifi/AccessPoint;
    :pswitch_1
    new-instance v1, Lcom/jellybyn/settings/wifi/WpsDialog;

    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2, v3}, Lcom/jellybyn/settings/wifi/WpsDialog;-><init>(Landroid/content/Context;I)V

    goto :goto_0

    .line 658
    :pswitch_2
    new-instance v1, Lcom/jellybyn/settings/wifi/WpsDialog;

    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/jellybyn/settings/wifi/WpsDialog;-><init>(Landroid/content/Context;I)V

    goto :goto_0

    .line 660
    :pswitch_3
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0b0244

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/jellybyn/settings/wifi/WifiSettings$9;

    invoke-direct {v2, p0}, Lcom/jellybyn/settings/wifi/WifiSettings$9;-><init>(Lcom/jellybyn/settings/wifi/WifiSettings;)V

    invoke-virtual {v1, v4, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/jellybyn/settings/wifi/WifiSettings$8;

    invoke-direct {v2, p0}, Lcom/jellybyn/settings/wifi/WifiSettings$8;-><init>(Lcom/jellybyn/settings/wifi/WifiSettings;)V

    invoke-virtual {v1, v5, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    goto :goto_0

    .line 679
    :pswitch_4
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0b0245

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/jellybyn/settings/wifi/WifiSettings$11;

    invoke-direct {v2, p0}, Lcom/jellybyn/settings/wifi/WifiSettings$11;-><init>(Lcom/jellybyn/settings/wifi/WifiSettings;)V

    invoke-virtual {v1, v4, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/jellybyn/settings/wifi/WifiSettings$10;

    invoke-direct {v2, p0}, Lcom/jellybyn/settings/wifi/WifiSettings$10;-><init>(Lcom/jellybyn/settings/wifi/WifiSettings;)V

    invoke-virtual {v1, v5, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    goto/16 :goto_0

    .line 641
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
    const v7, 0x7f020092

    const/4 v6, 0x4

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 452
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mUserManager:Landroid/os/UserManager;

    const-string v2, "no_config_wifi"

    invoke-virtual {v1, v2}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 490
    :goto_0
    return-void

    .line 454
    :cond_0
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    .line 455
    .local v0, "wifiIsEnabled":Z
    iget-boolean v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSetupWizardMode:Z

    if-eqz v1, :cond_1

    .line 457
    const v1, 0x7f0b01f2

    invoke-interface {p1, v3, v4, v3, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v7}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v5}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 461
    const v1, 0x7f0b01f0

    invoke-interface {p1, v3, v6, v3, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v5}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 489
    :goto_1
    invoke-super {p0, p1, p2}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    goto :goto_0

    .line 465
    :cond_1
    const v1, 0x7f0b01f2

    invoke-interface {p1, v3, v4, v3, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v7}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v4}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 469
    const v1, 0x7f0b01f0

    invoke-interface {p1, v3, v6, v3, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    const v2, 0x7f020052

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v4}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 473
    const/4 v1, 0x6

    const v2, 0x7f0b01f6

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 477
    const v1, 0x7f0b01f4

    invoke-interface {p1, v3, v5, v3, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 480
    iget-boolean v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mP2pSupported:Z

    if-eqz v1, :cond_2

    .line 481
    const/4 v1, 0x3

    const v2, 0x7f0b01f5

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 485
    :cond_2
    const/4 v1, 0x5

    const v2, 0x7f0b01f7

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

    .line 213
    iget-boolean v5, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSetupWizardMode:Z

    if-eqz v5, :cond_3

    .line 214
    const v5, 0x7f040076

    invoke-virtual {p1, v5, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 215
    .local v4, "view":Landroid/view/View;
    const v5, 0x7f08013b

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 216
    .local v3, "other":Landroid/view/View;
    new-instance v5, Lcom/jellybyn/settings/wifi/WifiSettings$2;

    invoke-direct {v5, p0}, Lcom/jellybyn/settings/wifi/WifiSettings$2;-><init>(Lcom/jellybyn/settings/wifi/WifiSettings;)V

    invoke-virtual {v3, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 224
    const v5, 0x7f080139

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    .line 225
    .local v0, "b":Landroid/widget/ImageButton;
    if-eqz v0, :cond_0

    .line 226
    new-instance v5, Lcom/jellybyn/settings/wifi/WifiSettings$3;

    invoke-direct {v5, p0, p1, v0}, Lcom/jellybyn/settings/wifi/WifiSettings$3;-><init>(Lcom/jellybyn/settings/wifi/WifiSettings;Landroid/view/LayoutInflater;Landroid/widget/ImageButton;)V

    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 248
    :cond_0
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 249
    .local v2, "intent":Landroid/content/Intent;
    const-string v5, "wifi_show_custom_button"

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 250
    const v5, 0x7f08013e

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 251
    const v5, 0x7f08013f

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    .line 252
    const v5, 0x7f080141

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    .line 253
    const v5, 0x7f08002a

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    .line 255
    const v5, 0x7f080140

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 256
    .local v1, "customButton":Landroid/widget/Button;
    invoke-virtual {v1, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 257
    new-instance v5, Lcom/jellybyn/settings/wifi/WifiSettings$4;

    invoke-direct {v5, p0}, Lcom/jellybyn/settings/wifi/WifiSettings$4;-><init>(Lcom/jellybyn/settings/wifi/WifiSettings;)V

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 279
    .end local v1    # "customButton":Landroid/widget/Button;
    :cond_1
    const-string v5, "wifi_show_wifi_required_info"

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 280
    const v5, 0x7f08013a

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 285
    .end local v0    # "b":Landroid/widget/ImageButton;
    .end local v2    # "intent":Landroid/content/Intent;
    .end local v3    # "other":Landroid/view/View;
    .end local v4    # "view":Landroid/view/View;
    :cond_2
    :goto_0
    return-object v4

    :cond_3
    invoke-super {p0, p1, p2, p3}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

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

    .line 510
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mUserManager:Landroid/os/UserManager;

    const-string v1, "no_config_wifi"

    invoke-virtual {v0, v1}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 552
    :goto_0
    return v6

    .line 512
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 552
    invoke-super {p0, p1}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v6

    goto :goto_0

    .line 514
    :pswitch_0
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/jellybyn/settings/wifi/WifiSettings;->showDialog(I)V

    move v6, v7

    .line 515
    goto :goto_0

    .line 517
    :pswitch_1
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v0, v0, Landroid/preference/PreferenceActivity;

    if-eqz v0, :cond_1

    .line 518
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    const-class v1, Lcom/jellybyn/settings/wifi/p2p/WifiP2pSettings;

    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    const v3, 0x7f0b025c

    move-object v4, v2

    move-object v5, p0

    invoke-virtual/range {v0 .. v6}, Landroid/preference/PreferenceActivity;->startPreferencePanel(Ljava/lang/String;Landroid/os/Bundle;ILjava/lang/CharSequence;Landroid/app/Fragment;I)V

    :goto_1
    move v6, v7

    .line 526
    goto :goto_0

    .line 524
    :cond_1
    const-class v0, Lcom/jellybyn/settings/wifi/p2p/WifiP2pSettings;

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p0, v0, v3, v2}, Lcom/jellybyn/settings/wifi/WifiSettings;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ILandroid/os/Bundle;)Z

    goto :goto_1

    .line 528
    :pswitch_2
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/jellybyn/settings/wifi/WifiSettings;->showDialog(I)V

    move v6, v7

    .line 529
    goto :goto_0

    .line 531
    :pswitch_3
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 532
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mScanner:Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;->forceScan()V

    :cond_2
    move v6, v7

    .line 534
    goto :goto_0

    .line 536
    :pswitch_4
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 537
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->onAddNetworkPressed()V

    :cond_3
    move v6, v7

    .line 539
    goto :goto_0

    .line 541
    :pswitch_5
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v0, v0, Landroid/preference/PreferenceActivity;

    if-eqz v0, :cond_4

    .line 542
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    const-class v1, Lcom/jellybyn/settings/wifi/AdvancedWifiSettings;

    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    const v3, 0x7f0b0247

    move-object v4, v2

    move-object v5, p0

    invoke-virtual/range {v0 .. v6}, Landroid/preference/PreferenceActivity;->startPreferencePanel(Ljava/lang/String;Landroid/os/Bundle;ILjava/lang/CharSequence;Landroid/app/Fragment;I)V

    :goto_2
    move v6, v7

    .line 550
    goto :goto_0

    .line 548
    :cond_4
    const-class v0, Lcom/jellybyn/settings/wifi/AdvancedWifiSettings;

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p0, v0, v3, v2}, Lcom/jellybyn/settings/wifi/WifiSettings;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ILandroid/os/Bundle;)Z

    goto :goto_2

    .line 512
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
    .line 441
    invoke-super {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onPause()V

    .line 442
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiEnabler:Lcom/jellybyn/settings/wifi/WifiEnabler;

    if-eqz v0, :cond_0

    .line 443
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiEnabler:Lcom/jellybyn/settings/wifi/WifiEnabler;

    invoke-virtual {v0}, Lcom/jellybyn/settings/wifi/WifiEnabler;->pause()V

    .line 445
    :cond_0
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 446
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mScanner:Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;->pause()V

    .line 447
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 3
    .param p1, "screen"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 610
    instance-of v0, p2, Lcom/jellybyn/settings/wifi/AccessPoint;

    if-eqz v0, :cond_1

    .line 611
    check-cast p2, Lcom/jellybyn/settings/wifi/AccessPoint;

    .end local p2    # "preference":Landroid/preference/Preference;
    iput-object p2, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    .line 613
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    iget v0, v0, Lcom/jellybyn/settings/wifi/AccessPoint;->security:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    iget v0, v0, Lcom/jellybyn/settings/wifi/AccessPoint;->networkId:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 615
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    invoke-virtual {v0}, Lcom/jellybyn/settings/wifi/AccessPoint;->generateOpenNetworkConfig()V

    .line 616
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    invoke-virtual {v1}, Lcom/jellybyn/settings/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v1

    iget-object v2, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v0, v1, v2}, Landroid/net/wifi/WifiManager;->connect(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiManager$ActionListener;)V

    .line 623
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0

    .line 618
    :cond_0
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/jellybyn/settings/wifi/WifiSettings;->showDialog(Lcom/jellybyn/settings/wifi/AccessPoint;Z)V

    goto :goto_0

    .line 621
    .restart local p2    # "preference":Landroid/preference/Preference;
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v0

    goto :goto_1
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 430
    invoke-super {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onResume()V

    .line 431
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiEnabler:Lcom/jellybyn/settings/wifi/WifiEnabler;

    if-eqz v0, :cond_0

    .line 432
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiEnabler:Lcom/jellybyn/settings/wifi/WifiEnabler;

    invoke-virtual {v0}, Lcom/jellybyn/settings/wifi/WifiEnabler;->resume()V

    .line 435
    :cond_0
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 436
    invoke-direct {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->updateAccessPoints()V

    .line 437
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 494
    invoke-super {p0, p1}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 497
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mDialog:Lcom/jellybyn/settings/wifi/WifiDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mDialog:Lcom/jellybyn/settings/wifi/WifiDialog;

    invoke-virtual {v0}, Lcom/jellybyn/settings/wifi/WifiDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 498
    const-string v0, "edit_mode"

    iget-boolean v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mDlgEdit:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 499
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mDlgAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    if-eqz v0, :cond_0

    .line 500
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    .line 501
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mDlgAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/wifi/AccessPoint;->saveWifiState(Landroid/os/Bundle;)V

    .line 502
    const-string v0, "wifi_ap_state"

    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 505
    :cond_0
    return-void
.end method

.method refreshAccessPoints()V
    .locals 1

    .prologue
    .line 1039
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1040
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mScanner:Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;->resume()V

    .line 1043
    :cond_0
    invoke-virtual {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 1044
    return-void
.end method

.method resumeWifiScan()V
    .locals 1

    .prologue
    .line 1077
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1078
    iget-object v0, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mScanner:Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;->resume()V

    .line 1080
    :cond_0
    return-void
.end method

.method submit(Lcom/jellybyn/settings/wifi/WifiConfigController;)V
    .locals 4
    .param p1, "configController"    # Lcom/jellybyn/settings/wifi/WifiConfigController;

    .prologue
    const/4 v2, -0x1

    .line 991
    invoke-virtual {p1}, Lcom/jellybyn/settings/wifi/WifiConfigController;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    .line 993
    .local v0, "config":Landroid/net/wifi/WifiConfiguration;
    if-nez v0, :cond_2

    .line 994
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    iget v1, v1, Lcom/jellybyn/settings/wifi/AccessPoint;->networkId:I

    if-eq v1, v2, :cond_0

    .line 996
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    iget v2, v2, Lcom/jellybyn/settings/wifi/AccessPoint;->networkId:I

    iget-object v3, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v1, v2, v3}, Landroid/net/wifi/WifiManager;->connect(ILandroid/net/wifi/WifiManager$ActionListener;)V

    .line 1011
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1012
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mScanner:Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v1}, Lcom/jellybyn/settings/wifi/WifiSettings$Scanner;->resume()V

    .line 1014
    :cond_1
    invoke-direct {p0}, Lcom/jellybyn/settings/wifi/WifiSettings;->updateAccessPoints()V

    .line 1015
    return-void

    .line 999
    :cond_2
    iget v1, v0, Landroid/net/wifi/WifiConfiguration;->networkId:I

    if-eq v1, v2, :cond_3

    .line 1000
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/jellybyn/settings/wifi/AccessPoint;

    if-eqz v1, :cond_0

    .line 1001
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSaveListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v1, v0, v2}, Landroid/net/wifi/WifiManager;->save(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_0

    .line 1004
    :cond_3
    invoke-virtual {p1}, Lcom/jellybyn/settings/wifi/WifiConfigController;->isEdit()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1005
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mSaveListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v1, v0, v2}, Landroid/net/wifi/WifiManager;->save(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_0

    .line 1007
    :cond_4
    iget-object v1, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/jellybyn/settings/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v1, v0, v2}, Landroid/net/wifi/WifiManager;->connect(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_0
.end method
