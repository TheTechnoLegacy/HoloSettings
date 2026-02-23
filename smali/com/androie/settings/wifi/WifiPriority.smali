.class public Lcom/androie/settings/wifi/WifiPriority;
.super Landroid/app/ListFragment;
.source "WifiPriority.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;

.field private final mDropListener:Lcom/androie/settings/cyanogenmod/TouchInterceptor$DropListener;

.field private mNetworksListView:Lcom/androie/settings/cyanogenmod/TouchInterceptor;

.field private mWifiManager:Landroid/net/wifi/WifiManager;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/app/ListFragment;-><init>()V

    .line 40
    new-instance v0, Lcom/androie/settings/wifi/WifiPriority$1;

    invoke-direct {v0, p0}, Lcom/androie/settings/wifi/WifiPriority$1;-><init>(Lcom/androie/settings/wifi/WifiPriority;)V

    iput-object v0, p0, Lcom/androie/settings/wifi/WifiPriority;->mDropListener:Lcom/androie/settings/cyanogenmod/TouchInterceptor$DropListener;

    .line 108
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/wifi/WifiPriority;)Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/wifi/WifiPriority;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiPriority;->mAdapter:Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;

    return-object v0
.end method

.method static synthetic access$100(Lcom/androie/settings/wifi/WifiPriority;)Landroid/net/wifi/WifiManager;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/wifi/WifiPriority;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiPriority;->mWifiManager:Landroid/net/wifi/WifiManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/androie/settings/wifi/WifiPriority;)Lcom/androie/settings/cyanogenmod/TouchInterceptor;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/wifi/WifiPriority;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiPriority;->mNetworksListView:Lcom/androie/settings/cyanogenmod/TouchInterceptor;

    return-object v0
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 81
    invoke-super {p0, p1}, Landroid/app/ListFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 82
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiPriority;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 83
    .local v0, "context":Landroid/content/Context;
    const-string v1, "wifi"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiManager;

    iput-object v1, p0, Lcom/androie/settings/wifi/WifiPriority;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 86
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiPriority;->getListView()Landroid/widget/ListView;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/cyanogenmod/TouchInterceptor;

    iput-object v1, p0, Lcom/androie/settings/wifi/WifiPriority;->mNetworksListView:Lcom/androie/settings/cyanogenmod/TouchInterceptor;

    .line 87
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiPriority;->mNetworksListView:Lcom/androie/settings/cyanogenmod/TouchInterceptor;

    iget-object v2, p0, Lcom/androie/settings/wifi/WifiPriority;->mDropListener:Lcom/androie/settings/cyanogenmod/TouchInterceptor$DropListener;

    invoke-virtual {v1, v2}, Lcom/androie/settings/cyanogenmod/TouchInterceptor;->setDropListener(Lcom/androie/settings/cyanogenmod/TouchInterceptor$DropListener;)V

    .line 88
    new-instance v1, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;

    iget-object v2, p0, Lcom/androie/settings/wifi/WifiPriority;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-direct {v1, p0, v0, v2}, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;-><init>(Lcom/androie/settings/wifi/WifiPriority;Landroid/content/Context;Landroid/net/wifi/WifiManager;)V

    iput-object v1, p0, Lcom/androie/settings/wifi/WifiPriority;->mAdapter:Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;

    .line 89
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiPriority;->mAdapter:Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;

    invoke-virtual {p0, v1}, Lcom/androie/settings/wifi/WifiPriority;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 90
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 76
    const v0, 0x7f0400d7

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 94
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiPriority;->mNetworksListView:Lcom/androie/settings/cyanogenmod/TouchInterceptor;

    invoke-virtual {v0, v1}, Lcom/androie/settings/cyanogenmod/TouchInterceptor;->setDropListener(Lcom/androie/settings/cyanogenmod/TouchInterceptor$DropListener;)V

    .line 95
    invoke-virtual {p0, v1}, Lcom/androie/settings/wifi/WifiPriority;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 96
    invoke-super {p0}, Landroid/app/ListFragment;->onDestroy()V

    .line 97
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 101
    invoke-super {p0}, Landroid/app/ListFragment;->onResume()V

    .line 104
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiPriority;->mAdapter:Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;

    invoke-static {v0}, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->access$200(Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;)V

    .line 105
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiPriority;->mNetworksListView:Lcom/androie/settings/cyanogenmod/TouchInterceptor;

    invoke-virtual {v0}, Lcom/androie/settings/cyanogenmod/TouchInterceptor;->invalidateViews()V

    .line 106
    return-void
.end method
