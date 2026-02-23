.class Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$3;
.super Landroid/os/CountDownTimer;
.source "ConfirmLockPattern.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->handleAttemptLockout(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;


# direct methods
.method constructor <init>(Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;JJ)V
    .locals 0
    .param p2, "x0"    # J
    .param p4, "x1"    # J

    .prologue
    .line 290
    iput-object p1, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$3;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 2

    .prologue
    .line 303
    iget-object v0, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$3;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->access$302(Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;I)I

    .line 304
    iget-object v0, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$3;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    sget-object v1, Lcom/androie/settings/ConfirmLockPattern$Stage;->NeedToUnlock:Lcom/androie/settings/ConfirmLockPattern$Stage;

    invoke-static {v0, v1}, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->access$500(Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;Lcom/androie/settings/ConfirmLockPattern$Stage;)V

    .line 305
    return-void
.end method

.method public onTick(J)V
    .locals 7
    .param p1, "millisUntilFinished"    # J

    .prologue
    .line 294
    iget-object v1, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$3;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    invoke-static {v1}, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->access$700(Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;)Landroid/widget/TextView;

    move-result-object v1

    const v2, 0x7f080749

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 295
    const-wide/16 v1, 0x3e8

    div-long v1, p1, v1

    long-to-int v0, v1

    .line 296
    .local v0, "secondsCountdown":I
    iget-object v1, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$3;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    invoke-static {v1}, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->access$800(Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;)Landroid/widget/TextView;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$3;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    const v3, 0x7f08074a

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 299
    return-void
.end method
