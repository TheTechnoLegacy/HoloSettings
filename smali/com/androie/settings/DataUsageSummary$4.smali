.class Lcom/androie/settings/DataUsageSummary$4;
.super Ljava/lang/Object;
.source "DataUsageSummary.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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
    .line 1100
    iput-object p1, p0, Lcom/androie/settings/DataUsageSummary$4;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 4
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 1103
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary$4;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v2}, Lcom/androie/settings/DataUsageSummary;->access$300(Lcom/androie/settings/DataUsageSummary;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1118
    :goto_0
    return-void

    .line 1105
    :cond_0
    move v1, p2

    .line 1106
    .local v1, "dataEnabled":Z
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary$4;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v2}, Lcom/androie/settings/DataUsageSummary;->access$400(Lcom/androie/settings/DataUsageSummary;)Ljava/lang/String;

    move-result-object v0

    .line 1107
    .local v0, "currentTab":Ljava/lang/String;
    const-string v2, "mobile"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "SIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1108
    :cond_1
    if-eqz v1, :cond_3

    .line 1109
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary$4;->this$0:Lcom/androie/settings/DataUsageSummary;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/androie/settings/DataUsageSummary;->access$500(Lcom/androie/settings/DataUsageSummary;Z)V

    .line 1117
    :cond_2
    :goto_1
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary$4;->this$0:Lcom/androie/settings/DataUsageSummary;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/androie/settings/DataUsageSummary;->access$600(Lcom/androie/settings/DataUsageSummary;Z)V

    goto :goto_0

    .line 1113
    :cond_3
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary$4;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v2}, Lcom/androie/settings/DataUsageSummary$ConfirmDataDisableFragment;->show(Lcom/androie/settings/DataUsageSummary;)V

    goto :goto_1
.end method
