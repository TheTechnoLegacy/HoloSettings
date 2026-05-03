.class Lcom/jellybyn/settings/DataUsageSummary$LimitEditorFragment$1;
.super Ljava/lang/Object;
.source "DataUsageSummary.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/DataUsageSummary$LimitEditorFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/DataUsageSummary$LimitEditorFragment;

.field final synthetic val$bytesPicker:Landroid/widget/NumberPicker;

.field final synthetic val$editor:Lcom/jellybyn/settings/net/NetworkPolicyEditor;

.field final synthetic val$target:Lcom/jellybyn/settings/DataUsageSummary;

.field final synthetic val$template:Landroid/net/NetworkTemplate;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/DataUsageSummary$LimitEditorFragment;Landroid/widget/NumberPicker;Lcom/jellybyn/settings/net/NetworkPolicyEditor;Landroid/net/NetworkTemplate;Lcom/jellybyn/settings/DataUsageSummary;)V
    .locals 0

    .prologue
    .line 1872
    iput-object p1, p0, Lcom/jellybyn/settings/DataUsageSummary$LimitEditorFragment$1;->this$0:Lcom/jellybyn/settings/DataUsageSummary$LimitEditorFragment;

    iput-object p2, p0, Lcom/jellybyn/settings/DataUsageSummary$LimitEditorFragment$1;->val$bytesPicker:Landroid/widget/NumberPicker;

    iput-object p3, p0, Lcom/jellybyn/settings/DataUsageSummary$LimitEditorFragment$1;->val$editor:Lcom/jellybyn/settings/net/NetworkPolicyEditor;

    iput-object p4, p0, Lcom/jellybyn/settings/DataUsageSummary$LimitEditorFragment$1;->val$template:Landroid/net/NetworkTemplate;

    iput-object p5, p0, Lcom/jellybyn/settings/DataUsageSummary$LimitEditorFragment$1;->val$target:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1876
    iget-object v2, p0, Lcom/jellybyn/settings/DataUsageSummary$LimitEditorFragment$1;->val$bytesPicker:Landroid/widget/NumberPicker;

    invoke-virtual {v2}, Landroid/widget/NumberPicker;->clearFocus()V

    .line 1878
    iget-object v2, p0, Lcom/jellybyn/settings/DataUsageSummary$LimitEditorFragment$1;->val$bytesPicker:Landroid/widget/NumberPicker;

    invoke-virtual {v2}, Landroid/widget/NumberPicker;->getValue()I

    move-result v2

    int-to-long v2, v2

    const-wide/32 v4, 0x100000

    mul-long v0, v2, v4

    .line 1879
    .local v0, "bytes":J
    iget-object v2, p0, Lcom/jellybyn/settings/DataUsageSummary$LimitEditorFragment$1;->val$editor:Lcom/jellybyn/settings/net/NetworkPolicyEditor;

    iget-object v3, p0, Lcom/jellybyn/settings/DataUsageSummary$LimitEditorFragment$1;->val$template:Landroid/net/NetworkTemplate;

    invoke-virtual {v2, v3, v0, v1}, Lcom/jellybyn/settings/net/NetworkPolicyEditor;->setPolicyLimitBytes(Landroid/net/NetworkTemplate;J)V

    .line 1880
    iget-object v2, p0, Lcom/jellybyn/settings/DataUsageSummary$LimitEditorFragment$1;->val$target:Lcom/jellybyn/settings/DataUsageSummary;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/jellybyn/settings/DataUsageSummary;->access$600(Lcom/jellybyn/settings/DataUsageSummary;Z)V

    .line 1881
    return-void
.end method
