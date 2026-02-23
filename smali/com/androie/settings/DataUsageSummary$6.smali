.class Lcom/androie/settings/DataUsageSummary$6;
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
    .line 1135
    iput-object p1, p0, Lcom/androie/settings/DataUsageSummary$6;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 1138
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary$6;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v2}, Lcom/androie/settings/DataUsageSummary;->access$900(Lcom/androie/settings/DataUsageSummary;)Landroid/widget/CheckBox;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v0, 0x1

    .line 1140
    .local v0, "restrictBackground":Z
    :goto_0
    if-eqz v0, :cond_1

    .line 1144
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$6;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary$ConfirmAppRestrictFragment;->show(Lcom/androie/settings/DataUsageSummary;)V

    .line 1148
    :goto_1
    return-void

    .end local v0    # "restrictBackground":Z
    :cond_0
    move v0, v1

    .line 1138
    goto :goto_0

    .line 1146
    .restart local v0    # "restrictBackground":Z
    :cond_1
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary$6;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v2, v1}, Lcom/androie/settings/DataUsageSummary;->access$1000(Lcom/androie/settings/DataUsageSummary;Z)V

    goto :goto_1
.end method
