.class Lcom/androie/settings/DataUsageSummary$7;
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
    .line 1151
    iput-object p1, p0, Lcom/androie/settings/DataUsageSummary$7;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1154
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$7;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-virtual {v0}, Lcom/androie/settings/DataUsageSummary;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1158
    :goto_0
    return-void

    .line 1157
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$7;->this$0:Lcom/androie/settings/DataUsageSummary;

    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$7;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->access$1100(Lcom/androie/settings/DataUsageSummary;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/androie/settings/DataUsageSummary;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
