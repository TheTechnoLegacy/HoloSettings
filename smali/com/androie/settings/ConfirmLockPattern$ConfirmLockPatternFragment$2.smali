.class Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$2;
.super Ljava/lang/Object;
.source "ConfirmLockPattern.java"

# interfaces
.implements Lcom/android/internal/widget/LockPatternView$OnPatternListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;


# direct methods
.method constructor <init>(Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;)V
    .locals 0

    .prologue
    .line 247
    iput-object p1, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$2;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPatternCellAdded(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/widget/LockPatternView$Cell;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 259
    .local p1, "pattern":Ljava/util/List;, "Ljava/util/List<Lcom/android/internal/widget/LockPatternView$Cell;>;"
    return-void
.end method

.method public onPatternCleared()V
    .locals 2

    .prologue
    .line 254
    iget-object v0, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$2;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    invoke-static {v0}, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->access$000(Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;)Lcom/android/internal/widget/LockPatternView;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$2;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    invoke-static {v1}, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->access$100(Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/LockPatternView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 255
    return-void
.end method

.method public onPatternDetected(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/widget/LockPatternView$Cell;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 262
    .local p1, "pattern":Ljava/util/List;, "Ljava/util/List<Lcom/android/internal/widget/LockPatternView$Cell;>;"
    iget-object v3, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$2;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    invoke-static {v3}, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->access$200(Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;)Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/android/internal/widget/LockPatternUtils;->checkPattern(Ljava/util/List;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 264
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 265
    .local v2, "intent":Landroid/content/Intent;
    const-string v3, "password"

    iget-object v4, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$2;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    invoke-static {v4}, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->access$200(Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;)Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/android/internal/widget/LockPatternUtils;->patternToString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 268
    iget-object v3, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$2;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    invoke-virtual {v3}, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const/4 v4, -0x1

    invoke-virtual {v3, v4, v2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 269
    iget-object v3, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$2;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    invoke-virtual {v3}, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->finish()V

    .line 281
    .end local v2    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 271
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x4

    if-lt v3, v4, :cond_1

    iget-object v3, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$2;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    invoke-static {v3}, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->access$304(Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;)I

    move-result v3

    const/4 v4, 0x5

    if-lt v3, v4, :cond_1

    .line 274
    iget-object v3, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$2;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    invoke-static {v3}, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->access$200(Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;)Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/widget/LockPatternUtils;->setLockoutAttemptDeadline()J

    move-result-wide v0

    .line 275
    .local v0, "deadline":J
    iget-object v3, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$2;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    invoke-static {v3, v0, v1}, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->access$400(Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;J)V

    goto :goto_0

    .line 277
    .end local v0    # "deadline":J
    :cond_1
    iget-object v3, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$2;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    sget-object v4, Lcom/androie/settings/ConfirmLockPattern$Stage;->NeedToUnlockWrong:Lcom/androie/settings/ConfirmLockPattern$Stage;

    invoke-static {v3, v4}, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->access$500(Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;Lcom/androie/settings/ConfirmLockPattern$Stage;)V

    .line 278
    iget-object v3, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$2;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    invoke-static {v3}, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->access$600(Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;)V

    goto :goto_0
.end method

.method public onPatternStart()V
    .locals 2

    .prologue
    .line 250
    iget-object v0, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$2;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    invoke-static {v0}, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->access$000(Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;)Lcom/android/internal/widget/LockPatternView;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment$2;->this$0:Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;

    invoke-static {v1}, Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;->access$100(Lcom/androie/settings/ConfirmLockPattern$ConfirmLockPatternFragment;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/LockPatternView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 251
    return-void
.end method
