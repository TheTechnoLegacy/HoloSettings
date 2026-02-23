.class Lcom/androie/settings/MasterClear$2;
.super Ljava/lang/Object;
.source "MasterClear.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/MasterClear;->establishInitialState()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/MasterClear;


# direct methods
.method constructor <init>(Lcom/androie/settings/MasterClear;)V
    .locals 0

    .prologue
    .line 158
    iput-object p1, p0, Lcom/androie/settings/MasterClear$2;->this$0:Lcom/androie/settings/MasterClear;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 162
    iget-object v0, p0, Lcom/androie/settings/MasterClear$2;->this$0:Lcom/androie/settings/MasterClear;

    invoke-static {v0}, Lcom/androie/settings/MasterClear;->access$200(Lcom/androie/settings/MasterClear;)Landroid/widget/CheckBox;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/CheckBox;->toggle()V

    .line 163
    return-void
.end method
