.class Lcom/jellybyn/settings/DataUsageSummary$3;
.super Ljava/lang/Object;
.source "DataUsageSummary.java"

# interfaces
.implements Landroid/widget/TabHost$OnTabChangeListener;


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
    .line 668
    iput-object p1, p0, Lcom/jellybyn/settings/DataUsageSummary$3;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTabChanged(Ljava/lang/String;)V
    .locals 1
    .param p1, "tabId"    # Ljava/lang/String;

    .prologue
    .line 672
    iget-object v0, p0, Lcom/jellybyn/settings/DataUsageSummary$3;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/jellybyn/settings/DataUsageSummary;->access$100(Lcom/jellybyn/settings/DataUsageSummary;)V

    .line 673
    return-void
.end method
