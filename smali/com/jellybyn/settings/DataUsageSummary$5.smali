.class Lcom/jellybyn/settings/DataUsageSummary$5;
.super Ljava/lang/Object;
.source "DataUsageSummary.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/DataUsageSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/DataUsageSummary;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/DataUsageSummary;)V
    .locals 0

    .prologue
    .line 1046
    iput-object p1, p0, Lcom/jellybyn/settings/DataUsageSummary$5;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1049
    iget-object v1, p0, Lcom/jellybyn/settings/DataUsageSummary$5;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/jellybyn/settings/DataUsageSummary;->access$700(Lcom/jellybyn/settings/DataUsageSummary;)Landroid/widget/CheckBox;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    .line 1050
    .local v0, "disableAtLimit":Z
    :goto_0
    if-eqz v0, :cond_1

    .line 1053
    iget-object v1, p0, Lcom/jellybyn/settings/DataUsageSummary$5;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/jellybyn/settings/DataUsageSummary$ConfirmLimitFragment;->show(Lcom/jellybyn/settings/DataUsageSummary;)V

    .line 1057
    :goto_1
    return-void

    .line 1049
    .end local v0    # "disableAtLimit":Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 1055
    .restart local v0    # "disableAtLimit":Z
    :cond_1
    iget-object v1, p0, Lcom/jellybyn/settings/DataUsageSummary$5;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    const-wide/16 v2, -0x1

    invoke-static {v1, v2, v3}, Lcom/jellybyn/settings/DataUsageSummary;->access$800(Lcom/jellybyn/settings/DataUsageSummary;J)V

    goto :goto_1
.end method
