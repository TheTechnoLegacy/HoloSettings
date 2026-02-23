.class Lcom/androie/settings/wifi/WpsDialog$2;
.super Ljava/lang/Object;
.source "WpsDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/wifi/WpsDialog;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/wifi/WpsDialog;


# direct methods
.method constructor <init>(Lcom/androie/settings/wifi/WpsDialog;)V
    .locals 0

    .prologue
    .line 149
    iput-object p1, p0, Lcom/androie/settings/wifi/WpsDialog$2;->this$0:Lcom/androie/settings/wifi/WpsDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 152
    iget-object v0, p0, Lcom/androie/settings/wifi/WpsDialog$2;->this$0:Lcom/androie/settings/wifi/WpsDialog;

    invoke-virtual {v0}, Lcom/androie/settings/wifi/WpsDialog;->dismiss()V

    .line 153
    return-void
.end method
