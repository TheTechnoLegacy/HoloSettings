.class Lcom/androie/settings/NotificationStation$PackageReceiver;
.super Landroid/content/BroadcastReceiver;
.source "NotificationStation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/NotificationStation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PackageReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/NotificationStation;


# direct methods
.method private constructor <init>(Lcom/androie/settings/NotificationStation;)V
    .locals 0

    .prologue
    .line 394
    iput-object p1, p0, Lcom/androie/settings/NotificationStation$PackageReceiver;->this$0:Lcom/androie/settings/NotificationStation;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/androie/settings/NotificationStation;Lcom/androie/settings/NotificationStation$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/androie/settings/NotificationStation;
    .param p2, "x1"    # Lcom/androie/settings/NotificationStation$1;

    .prologue
    .line 394
    invoke-direct {p0, p1}, Lcom/androie/settings/NotificationStation$PackageReceiver;-><init>(Lcom/androie/settings/NotificationStation;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 397
    const-string v0, "PackageReceiver.onReceive"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/androie/settings/NotificationStation;->access$500(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 399
    return-void
.end method
