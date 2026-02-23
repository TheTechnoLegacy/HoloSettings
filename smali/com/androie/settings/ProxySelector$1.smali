.class Lcom/androie/settings/ProxySelector$1;
.super Ljava/lang/Object;
.source "ProxySelector.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/ProxySelector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/ProxySelector;


# direct methods
.method constructor <init>(Lcom/androie/settings/ProxySelector;)V
    .locals 0

    .prologue
    .line 275
    iput-object p1, p0, Lcom/androie/settings/ProxySelector$1;->this$0:Lcom/androie/settings/ProxySelector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 277
    iget-object v0, p0, Lcom/androie/settings/ProxySelector$1;->this$0:Lcom/androie/settings/ProxySelector;

    invoke-virtual {v0}, Lcom/androie/settings/ProxySelector;->saveToDb()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 278
    iget-object v0, p0, Lcom/androie/settings/ProxySelector$1;->this$0:Lcom/androie/settings/ProxySelector;

    invoke-virtual {v0}, Lcom/androie/settings/ProxySelector;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->onBackPressed()V

    .line 280
    :cond_0
    return-void
.end method
