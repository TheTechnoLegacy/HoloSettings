.class Lcom/androie/settings/DataUsageSummary$5;
.super Ljava/lang/Object;
.source "DataUsageSummary.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/DataUsageSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/DataUsageSummary;


# direct methods
.method constructor <init>(Lcom/androie/settings/DataUsageSummary;)V
    .locals 0

    .prologue
    .line 1121
    iput-object p1, p0, Lcom/androie/settings/DataUsageSummary$5;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1124
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$5;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->access$700(Lcom/androie/settings/DataUsageSummary;)Landroid/widget/CheckBox;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    .line 1125
    .local v0, "disableAtLimit":Z
    :goto_0
    if-eqz v0, :cond_1

    .line 1128
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$5;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary$ConfirmLimitFragment;->show(Lcom/androie/settings/DataUsageSummary;)V

    .line 1132
    :goto_1
    return-void

    .line 1124
    .end local v0    # "disableAtLimit":Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 1130
    .restart local v0    # "disableAtLimit":Z
    :cond_1
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$5;->this$0:Lcom/androie/settings/DataUsageSummary;

    const-wide/16 v2, -0x1

    invoke-static {v1, v2, v3}, Lcom/androie/settings/DataUsageSummary;->access$800(Lcom/androie/settings/DataUsageSummary;J)V

    goto :goto_1
.end method
