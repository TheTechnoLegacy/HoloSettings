.class Lcom/androie/settings/IccLockSettings$1;
.super Landroid/os/Handler;
.source "IccLockSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/IccLockSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/IccLockSettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/IccLockSettings;)V
    .locals 0

    .prologue
    .line 102
    iput-object p1, p0, Lcom/androie/settings/IccLockSettings$1;->this$0:Lcom/androie/settings/IccLockSettings;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 104
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 105
    .local v0, "ar":Landroid/os/AsyncResult;
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 117
    :goto_0
    return-void

    .line 107
    :pswitch_0
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings$1;->this$0:Lcom/androie/settings/IccLockSettings;

    invoke-static {v1, v0}, Lcom/androie/settings/IccLockSettings;->access$000(Lcom/androie/settings/IccLockSettings;Landroid/os/AsyncResult;)V

    goto :goto_0

    .line 110
    :pswitch_1
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings$1;->this$0:Lcom/androie/settings/IccLockSettings;

    invoke-static {v1, v0}, Lcom/androie/settings/IccLockSettings;->access$100(Lcom/androie/settings/IccLockSettings;Landroid/os/AsyncResult;)V

    goto :goto_0

    .line 113
    :pswitch_2
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings$1;->this$0:Lcom/androie/settings/IccLockSettings;

    invoke-static {v1}, Lcom/androie/settings/IccLockSettings;->access$200(Lcom/androie/settings/IccLockSettings;)V

    goto :goto_0

    .line 105
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
