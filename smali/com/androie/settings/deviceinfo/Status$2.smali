.class Lcom/androie/settings/deviceinfo/Status$2;
.super Landroid/telephony/PhoneStateListener;
.source "Status.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/deviceinfo/Status;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/deviceinfo/Status;


# direct methods
.method constructor <init>(Lcom/androie/settings/deviceinfo/Status;)V
    .locals 0

    .prologue
    .line 186
    iput-object p1, p0, Lcom/androie/settings/deviceinfo/Status$2;->this$0:Lcom/androie/settings/deviceinfo/Status;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDataConnectionStateChanged(I)V
    .locals 1
    .param p1, "state"    # I

    .prologue
    .line 189
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/Status$2;->this$0:Lcom/androie/settings/deviceinfo/Status;

    invoke-static {v0}, Lcom/androie/settings/deviceinfo/Status;->access$400(Lcom/androie/settings/deviceinfo/Status;)V

    .line 190
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/Status$2;->this$0:Lcom/androie/settings/deviceinfo/Status;

    invoke-static {v0}, Lcom/androie/settings/deviceinfo/Status;->access$500(Lcom/androie/settings/deviceinfo/Status;)V

    .line 191
    return-void
.end method
