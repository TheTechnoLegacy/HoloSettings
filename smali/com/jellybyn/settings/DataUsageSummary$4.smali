.class Lcom/jellybyn/settings/DataUsageSummary$4;
.super Ljava/lang/Object;
.source "DataUsageSummary.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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
    .line 1025
    iput-object p1, p0, Lcom/jellybyn/settings/DataUsageSummary$4;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 4
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 1028
    iget-object v2, p0, Lcom/jellybyn/settings/DataUsageSummary$4;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v2}, Lcom/jellybyn/settings/DataUsageSummary;->access$300(Lcom/jellybyn/settings/DataUsageSummary;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1043
    :goto_0
    return-void

    .line 1030
    :cond_0
    move v1, p2

    .line 1031
    .local v1, "dataEnabled":Z
    iget-object v2, p0, Lcom/jellybyn/settings/DataUsageSummary$4;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v2}, Lcom/jellybyn/settings/DataUsageSummary;->access$400(Lcom/jellybyn/settings/DataUsageSummary;)Ljava/lang/String;

    move-result-object v0

    .line 1032
    .local v0, "currentTab":Ljava/lang/String;
    const-string v2, "mobile"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1033
    if-eqz v1, :cond_2

    .line 1034
    iget-object v2, p0, Lcom/jellybyn/settings/DataUsageSummary$4;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/jellybyn/settings/DataUsageSummary;->access$500(Lcom/jellybyn/settings/DataUsageSummary;Z)V

    .line 1042
    :cond_1
    :goto_1
    iget-object v2, p0, Lcom/jellybyn/settings/DataUsageSummary$4;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/jellybyn/settings/DataUsageSummary;->access$600(Lcom/jellybyn/settings/DataUsageSummary;Z)V

    goto :goto_0

    .line 1038
    :cond_2
    iget-object v2, p0, Lcom/jellybyn/settings/DataUsageSummary$4;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v2}, Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataDisableFragment;->show(Lcom/jellybyn/settings/DataUsageSummary;)V

    goto :goto_1
.end method
