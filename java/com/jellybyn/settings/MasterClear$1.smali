.class Lcom/jellybyn/settings/MasterClear$1;
.super Ljava/lang/Object;
.source "MasterClear.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/MasterClear;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/MasterClear;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/MasterClear;)V
    .locals 0

    .prologue
    .line 123
    iput-object p1, p0, Lcom/jellybyn/settings/MasterClear$1;->this$0:Lcom/jellybyn/settings/MasterClear;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 126
    iget-object v0, p0, Lcom/jellybyn/settings/MasterClear$1;->this$0:Lcom/jellybyn/settings/MasterClear;

    const/16 v1, 0x37

    invoke-static {v0, v1}, Lcom/jellybyn/settings/MasterClear;->access$000(Lcom/jellybyn/settings/MasterClear;I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 127
    iget-object v0, p0, Lcom/jellybyn/settings/MasterClear$1;->this$0:Lcom/jellybyn/settings/MasterClear;

    invoke-static {v0}, Lcom/jellybyn/settings/MasterClear;->access$100(Lcom/jellybyn/settings/MasterClear;)V

    .line 129
    :cond_0
    return-void
.end method
