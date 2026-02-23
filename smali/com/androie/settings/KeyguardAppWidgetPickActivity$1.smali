.class Lcom/androie/settings/KeyguardAppWidgetPickActivity$1;
.super Ljava/lang/Object;
.source "KeyguardAppWidgetPickActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/KeyguardAppWidgetPickActivity;->finishDelayedAndShowLockScreen(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/KeyguardAppWidgetPickActivity;


# direct methods
.method constructor <init>(Lcom/androie/settings/KeyguardAppWidgetPickActivity;)V
    .locals 0

    .prologue
    .line 614
    iput-object p1, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity$1;->this$0:Lcom/androie/settings/KeyguardAppWidgetPickActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 616
    iget-object v0, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity$1;->this$0:Lcom/androie/settings/KeyguardAppWidgetPickActivity;

    invoke-virtual {v0}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->finish()V

    .line 617
    return-void
.end method
