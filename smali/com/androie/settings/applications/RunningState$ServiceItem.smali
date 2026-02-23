.class Lcom/androie/settings/applications/RunningState$ServiceItem;
.super Lcom/androie/settings/applications/RunningState$BaseItem;
.source "RunningState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/applications/RunningState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ServiceItem"
.end annotation


# instance fields
.field mMergedItem:Lcom/androie/settings/applications/RunningState$MergedItem;

.field mRunningService:Landroid/app/ActivityManager$RunningServiceInfo;

.field mServiceInfo:Landroid/content/pm/ServiceInfo;

.field mShownAsStarted:Z


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "userId"    # I

    .prologue
    .line 339
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/androie/settings/applications/RunningState$BaseItem;-><init>(ZI)V

    .line 340
    return-void
.end method
