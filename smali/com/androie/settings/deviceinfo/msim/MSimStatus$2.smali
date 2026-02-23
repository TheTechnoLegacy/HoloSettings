.class Lcom/androie/settings/deviceinfo/msim/MSimStatus$2;
.super Landroid/telephony/PhoneStateListener;
.source "MSimStatus.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/deviceinfo/msim/MSimStatus;->getPhoneStateListener(I)Landroid/telephony/PhoneStateListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/deviceinfo/msim/MSimStatus;


# direct methods
.method constructor <init>(Lcom/androie/settings/deviceinfo/msim/MSimStatus;I)V
    .locals 0
    .param p2, "x0"    # I

    .prologue
    .line 224
    iput-object p1, p0, Lcom/androie/settings/deviceinfo/msim/MSimStatus$2;->this$0:Lcom/androie/settings/deviceinfo/msim/MSimStatus;

    invoke-direct {p0, p2}, Landroid/telephony/PhoneStateListener;-><init>(I)V

    return-void
.end method


# virtual methods
.method public onDataConnectionStateChanged(I)V
    .locals 2
    .param p1, "state"    # I

    .prologue
    .line 227
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/msim/MSimStatus$2;->this$0:Lcom/androie/settings/deviceinfo/msim/MSimStatus;

    invoke-static {v0, p1}, Lcom/androie/settings/deviceinfo/msim/MSimStatus;->access$202(Lcom/androie/settings/deviceinfo/msim/MSimStatus;I)I

    .line 228
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/msim/MSimStatus$2;->this$0:Lcom/androie/settings/deviceinfo/msim/MSimStatus;

    invoke-static {v0}, Lcom/androie/settings/deviceinfo/msim/MSimStatus;->access$300(Lcom/androie/settings/deviceinfo/msim/MSimStatus;)V

    .line 229
    iget v0, p0, Lcom/androie/settings/deviceinfo/msim/MSimStatus$2;->mSubscription:I

    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/telephony/MSimTelephonyManager;->getPreferredDataSubscription()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 231
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/msim/MSimStatus$2;->this$0:Lcom/androie/settings/deviceinfo/msim/MSimStatus;

    iget v1, p0, Lcom/androie/settings/deviceinfo/msim/MSimStatus$2;->mSubscription:I

    invoke-static {v0, v1}, Lcom/androie/settings/deviceinfo/msim/MSimStatus;->access$400(Lcom/androie/settings/deviceinfo/msim/MSimStatus;I)V

    .line 233
    :cond_0
    return-void
.end method
