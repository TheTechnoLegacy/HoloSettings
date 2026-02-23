.class Lcom/androie/settings/DataUsageSummary$9;
.super Ljava/lang/Object;
.source "DataUsageSummary.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


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
    .line 1175
    iput-object p1, p0, Lcom/androie/settings/DataUsageSummary$9;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 1178
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/DataUsageSummary$CycleItem;

    .line 1179
    .local v0, "cycle":Lcom/androie/settings/DataUsageSummary$CycleItem;
    instance-of v1, v0, Lcom/androie/settings/DataUsageSummary$CycleChangeItem;

    if-eqz v1, :cond_0

    .line 1182
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$9;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary$CycleEditorFragment;->show(Lcom/androie/settings/DataUsageSummary;)V

    .line 1185
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$9;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->access$1300(Lcom/androie/settings/DataUsageSummary;)Landroid/widget/Spinner;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 1199
    :goto_0
    return-void

    .line 1195
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$9;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->access$1400(Lcom/androie/settings/DataUsageSummary;)Lcom/androie/settings/widget/ChartDataUsageView;

    move-result-object v1

    iget-wide v2, v0, Lcom/androie/settings/DataUsageSummary$CycleItem;->start:J

    iget-wide v4, v0, Lcom/androie/settings/DataUsageSummary$CycleItem;->end:J

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/androie/settings/widget/ChartDataUsageView;->setVisibleRange(JJ)V

    .line 1197
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$9;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->access$1500(Lcom/androie/settings/DataUsageSummary;)V

    goto :goto_0
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 1204
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method
