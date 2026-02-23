.class Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter$1;
.super Ljava/lang/Object;
.source "WifiPriority.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->reloadNetworks()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Landroid/net/wifi/WifiConfiguration;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;


# direct methods
.method constructor <init>(Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;)V
    .locals 0

    .prologue
    .line 127
    iput-object p1, p0, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter$1;->this$1:Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiConfiguration;)I
    .locals 4
    .param p1, "lhs"    # Landroid/net/wifi/WifiConfiguration;
    .param p2, "rhs"    # Landroid/net/wifi/WifiConfiguration;

    .prologue
    const/4 v0, 0x1

    const/4 v1, -0x1

    .line 131
    iget v2, p1, Landroid/net/wifi/WifiConfiguration;->priority:I

    iget v3, p2, Landroid/net/wifi/WifiConfiguration;->priority:I

    if-ge v2, v3, :cond_1

    .line 136
    :cond_0
    :goto_0
    return v0

    .line 132
    :cond_1
    iget v2, p1, Landroid/net/wifi/WifiConfiguration;->priority:I

    iget v3, p2, Landroid/net/wifi/WifiConfiguration;->priority:I

    if-le v2, v3, :cond_2

    move v0, v1

    goto :goto_0

    .line 134
    :cond_2
    iget v2, p1, Landroid/net/wifi/WifiConfiguration;->networkId:I

    iget v3, p2, Landroid/net/wifi/WifiConfiguration;->networkId:I

    if-ge v2, v3, :cond_3

    move v0, v1

    goto :goto_0

    .line 135
    :cond_3
    iget v1, p1, Landroid/net/wifi/WifiConfiguration;->networkId:I

    iget v2, p2, Landroid/net/wifi/WifiConfiguration;->networkId:I

    if-gt v1, v2, :cond_0

    .line 136
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 127
    check-cast p1, Landroid/net/wifi/WifiConfiguration;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Landroid/net/wifi/WifiConfiguration;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter$1;->compare(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiConfiguration;)I

    move-result v0

    return v0
.end method
