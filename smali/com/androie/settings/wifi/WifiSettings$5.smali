.class Lcom/androie/settings/wifi/WifiSettings$5;
.super Ljava/lang/Object;
.source "WifiSettings.java"

# interfaces
.implements Landroid/net/wifi/WifiManager$ActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/wifi/WifiSettings;->onActivityCreated(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/wifi/WifiSettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/wifi/WifiSettings;)V
    .locals 0

    .prologue
    .line 300
    iput-object p1, p0, Lcom/androie/settings/wifi/WifiSettings$5;->this$0:Lcom/androie/settings/wifi/WifiSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(I)V
    .locals 3
    .param p1, "reason"    # I

    .prologue
    .line 306
    iget-object v1, p0, Lcom/androie/settings/wifi/WifiSettings$5;->this$0:Lcom/androie/settings/wifi/WifiSettings;

    invoke-virtual {v1}, Lcom/androie/settings/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 307
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 308
    const v1, 0x7f0805a9

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 312
    :cond_0
    return-void
.end method

.method public onSuccess()V
    .locals 0

    .prologue
    .line 303
    return-void
.end method
