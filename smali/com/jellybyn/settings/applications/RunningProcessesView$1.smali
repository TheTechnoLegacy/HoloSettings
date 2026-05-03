.class Lcom/jellybyn/settings/applications/RunningProcessesView$1;
.super Ljava/lang/Object;
.source "RunningProcessesView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/applications/RunningProcessesView;->doCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/applications/RunningProcessesView;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/applications/RunningProcessesView;)V
    .locals 0

    .prologue
    .line 429
    iput-object p1, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$1;->this$0:Lcom/jellybyn/settings/applications/RunningProcessesView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 432
    iget-object v0, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$1;->this$0:Lcom/jellybyn/settings/applications/RunningProcessesView;

    iget-object v0, v0, Lcom/jellybyn/settings/applications/RunningProcessesView;->mAdapter:Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->setShowBackground(Z)V

    .line 433
    return-void
.end method
