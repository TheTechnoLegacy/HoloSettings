.class Lcom/androie/settings/deviceinfo/Status$MyHandler;
.super Landroid/os/Handler;
.source "Status.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/deviceinfo/Status;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MyHandler"
.end annotation


# instance fields
.field private mStatus:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/androie/settings/deviceinfo/Status;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/androie/settings/deviceinfo/Status;)V
    .locals 1
    .param p1, "activity"    # Lcom/androie/settings/deviceinfo/Status;

    .prologue
    .line 145
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 146
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/androie/settings/deviceinfo/Status$MyHandler;->mStatus:Ljava/lang/ref/WeakReference;

    .line 147
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 151
    iget-object v2, p0, Lcom/androie/settings/deviceinfo/Status$MyHandler;->mStatus:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/deviceinfo/Status;

    .line 152
    .local v1, "status":Lcom/androie/settings/deviceinfo/Status;
    if-nez v1, :cond_0

    .line 171
    :goto_0
    return-void

    .line 156
    :cond_0
    iget v2, p1, Landroid/os/Message;->what:I

    sparse-switch v2, :sswitch_data_0

    goto :goto_0

    .line 158
    :sswitch_0
    invoke-virtual {v1}, Lcom/androie/settings/deviceinfo/Status;->updateSignalStrength()V

    goto :goto_0

    .line 162
    :sswitch_1
    invoke-static {v1}, Lcom/androie/settings/deviceinfo/Status;->access$000(Lcom/androie/settings/deviceinfo/Status;)Lcom/android/internal/telephony/PhoneStateIntentReceiver;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v0

    .line 163
    .local v0, "serviceState":Landroid/telephony/ServiceState;
    invoke-static {v1, v0}, Lcom/androie/settings/deviceinfo/Status;->access$100(Lcom/androie/settings/deviceinfo/Status;Landroid/telephony/ServiceState;)V

    goto :goto_0

    .line 167
    .end local v0    # "serviceState":Landroid/telephony/ServiceState;
    :sswitch_2
    invoke-virtual {v1}, Lcom/androie/settings/deviceinfo/Status;->updateTimes()V

    .line 168
    const/16 v2, 0x1f4

    const-wide/16 v3, 0x3e8

    invoke-virtual {p0, v2, v3, v4}, Lcom/androie/settings/deviceinfo/Status$MyHandler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 156
    :sswitch_data_0
    .sparse-switch
        0xc8 -> :sswitch_0
        0x12c -> :sswitch_1
        0x1f4 -> :sswitch_2
    .end sparse-switch
.end method
