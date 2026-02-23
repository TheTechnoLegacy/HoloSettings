.class Lcom/androie/settings/ChooseLockPassword$ChooseLockPasswordFragment$1;
.super Landroid/os/Handler;
.source "ChooseLockPassword.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/ChooseLockPassword$ChooseLockPasswordFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/ChooseLockPassword$ChooseLockPasswordFragment;


# direct methods
.method constructor <init>(Lcom/androie/settings/ChooseLockPassword$ChooseLockPasswordFragment;)V
    .locals 0

    .prologue
    .line 107
    iput-object p1, p0, Lcom/androie/settings/ChooseLockPassword$ChooseLockPasswordFragment$1;->this$0:Lcom/androie/settings/ChooseLockPassword$ChooseLockPasswordFragment;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 110
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 111
    iget-object v1, p0, Lcom/androie/settings/ChooseLockPassword$ChooseLockPasswordFragment$1;->this$0:Lcom/androie/settings/ChooseLockPassword$ChooseLockPasswordFragment;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/androie/settings/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    invoke-virtual {v1, v0}, Lcom/androie/settings/ChooseLockPassword$ChooseLockPasswordFragment;->updateStage(Lcom/androie/settings/ChooseLockPassword$ChooseLockPasswordFragment$Stage;)V

    .line 113
    :cond_0
    return-void
.end method
