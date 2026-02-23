.class Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;
.super Landroid/widget/BaseAdapter;
.source "WifiPriority.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/wifi/WifiPriority;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WifiPriorityAdapter"
.end annotation


# instance fields
.field private final mInflater:Landroid/view/LayoutInflater;

.field private mNetworks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/net/wifi/WifiConfiguration;",
            ">;"
        }
    .end annotation
.end field

.field private final mWifiManager:Landroid/net/wifi/WifiManager;

.field final synthetic this$0:Lcom/androie/settings/wifi/WifiPriority;


# direct methods
.method public constructor <init>(Lcom/androie/settings/wifi/WifiPriority;Landroid/content/Context;Landroid/net/wifi/WifiManager;)V
    .locals 1
    .param p2, "ctx"    # Landroid/content/Context;
    .param p3, "wifiManager"    # Landroid/net/wifi/WifiManager;

    .prologue
    .line 114
    iput-object p1, p0, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->this$0:Lcom/androie/settings/wifi/WifiPriority;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 115
    iput-object p3, p0, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 116
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 117
    invoke-direct {p0}, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->reloadNetworks()V

    .line 118
    return-void
.end method

.method static synthetic access$200(Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->reloadNetworks()V

    return-void
.end method

.method private filterSSID(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "ssid"    # Ljava/lang/String;

    .prologue
    .line 180
    if-eqz p1, :cond_0

    const-string v0, "\""

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "\""

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 183
    .end local p1    # "ssid":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p1

    .restart local p1    # "ssid":Ljava/lang/String;
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method private reloadNetworks()V
    .locals 2

    .prologue
    .line 121
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getConfiguredNetworks()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->mNetworks:Ljava/util/List;

    .line 122
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->mNetworks:Ljava/util/List;

    if-nez v0, :cond_0

    .line 123
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->mNetworks:Ljava/util/List;

    .line 127
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->mNetworks:Ljava/util/List;

    new-instance v1, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter$1;

    invoke-direct {v1, p0}, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter$1;-><init>(Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 139
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->mNetworks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 152
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->mNetworks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 157
    int-to-long v0, p1

    return-wide v0
.end method

.method getNetworks()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/net/wifi/WifiConfiguration;",
            ">;"
        }
    .end annotation

    .prologue
    .line 142
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->mNetworks:Ljava/util/List;

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 163
    if-nez p2, :cond_0

    .line 164
    iget-object v3, p0, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v4, 0x7f0400d8

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 169
    .local v2, "v":Landroid/view/View;
    :goto_0
    invoke-virtual {p0, p1}, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiConfiguration;

    .line 171
    .local v1, "network":Landroid/net/wifi/WifiConfiguration;
    const v3, 0x7f0c002c

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 173
    .local v0, "name":Landroid/widget/TextView;
    iget-object v3, v1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->filterSSID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 175
    return-object v2

    .line 166
    .end local v0    # "name":Landroid/widget/TextView;
    .end local v1    # "network":Landroid/net/wifi/WifiConfiguration;
    .end local v2    # "v":Landroid/view/View;
    :cond_0
    move-object v2, p2

    .restart local v2    # "v":Landroid/view/View;
    goto :goto_0
.end method
