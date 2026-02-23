.class Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus$2;
.super Landroid/telephony/PhoneStateListener;
.source "MSimSubscriptionStatus.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus;->getPhoneStateListener(I)Landroid/telephony/PhoneStateListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus;


# direct methods
.method constructor <init>(Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus;I)V
    .locals 0
    .param p2, "x0"    # I

    .prologue
    .line 268
    iput-object p1, p0, Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus$2;->this$0:Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus;

    invoke-direct {p0, p2}, Landroid/telephony/PhoneStateListener;-><init>(I)V

    return-void
.end method


# virtual methods
.method public onServiceStateChanged(Landroid/telephony/ServiceState;)V
    .locals 1
    .param p1, "state"    # Landroid/telephony/ServiceState;

    .prologue
    .line 276
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus$2;->this$0:Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus;

    iput-object p1, v0, Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus;->mServiceState:Landroid/telephony/ServiceState;

    .line 277
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus$2;->this$0:Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus;

    invoke-static {v0}, Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus;->access$100(Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus;)V

    .line 278
    return-void
.end method

.method public onSignalStrengthsChanged(Landroid/telephony/SignalStrength;)V
    .locals 1
    .param p1, "signalStrength"    # Landroid/telephony/SignalStrength;

    .prologue
    .line 271
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus$2;->this$0:Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus;

    iput-object p1, v0, Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus;->mSignalStrength:Landroid/telephony/SignalStrength;

    .line 272
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus$2;->this$0:Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus;

    invoke-virtual {v0}, Lcom/androie/settings/deviceinfo/msim/MSimSubscriptionStatus;->updateSignalStrength()V

    .line 273
    return-void
.end method
