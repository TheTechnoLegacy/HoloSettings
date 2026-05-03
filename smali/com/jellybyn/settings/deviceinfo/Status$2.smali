.class Lcom/jellybyn/settings/deviceinfo/Status$2;
.super Landroid/telephony/PhoneStateListener;
.source "Status.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/deviceinfo/Status;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/deviceinfo/Status;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/deviceinfo/Status;)V
    .locals 0

    .prologue
    .line 184
    iput-object p1, p0, Lcom/jellybyn/settings/deviceinfo/Status$2;->this$0:Lcom/jellybyn/settings/deviceinfo/Status;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDataConnectionStateChanged(I)V
    .locals 1
    .param p1, "state"    # I

    .prologue
    .line 187
    iget-object v0, p0, Lcom/jellybyn/settings/deviceinfo/Status$2;->this$0:Lcom/jellybyn/settings/deviceinfo/Status;

    invoke-static {v0}, Lcom/jellybyn/settings/deviceinfo/Status;->access$400(Lcom/jellybyn/settings/deviceinfo/Status;)V

    .line 188
    iget-object v0, p0, Lcom/jellybyn/settings/deviceinfo/Status$2;->this$0:Lcom/jellybyn/settings/deviceinfo/Status;

    invoke-static {v0}, Lcom/jellybyn/settings/deviceinfo/Status;->access$500(Lcom/jellybyn/settings/deviceinfo/Status;)V

    .line 189
    return-void
.end method
