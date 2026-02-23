.class Lcom/androie/settings/applications/AppOpsSummary$1;
.super Ljava/lang/Object;
.source "AppOpsSummary.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/applications/AppOpsSummary;->resetCountersConfirm()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/applications/AppOpsSummary;


# direct methods
.method constructor <init>(Lcom/androie/settings/applications/AppOpsSummary;)V
    .locals 0

    .prologue
    .line 187
    iput-object p1, p0, Lcom/androie/settings/applications/AppOpsSummary$1;->this$0:Lcom/androie/settings/applications/AppOpsSummary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 190
    iget-object v0, p0, Lcom/androie/settings/applications/AppOpsSummary$1;->this$0:Lcom/androie/settings/applications/AppOpsSummary;

    invoke-static {v0}, Lcom/androie/settings/applications/AppOpsSummary;->access$000(Lcom/androie/settings/applications/AppOpsSummary;)V

    .line 191
    return-void
.end method
