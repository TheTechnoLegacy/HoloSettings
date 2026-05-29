.class Lcom/jellybyn/settings/MasterClear$2;
.super Ljava/lang/Object;
.source "MasterClear.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/MasterClear;->establishInitialState()V
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
    .line 172
    iput-object p1, p0, Lcom/jellybyn/settings/MasterClear$2;->this$0:Lcom/jellybyn/settings/MasterClear;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 176
    iget-object v0, p0, Lcom/jellybyn/settings/MasterClear$2;->this$0:Lcom/jellybyn/settings/MasterClear;

    invoke-static {v0}, Lcom/jellybyn/settings/MasterClear;->access$200(Lcom/jellybyn/settings/MasterClear;)Landroid/widget/CheckBox;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/CheckBox;->toggle()V

    .line 177
    return-void
.end method
