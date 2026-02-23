.class Lcom/androie/settings/CryptKeeper$5;
.super Ljava/lang/Object;
.source "CryptKeeper.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/CryptKeeper;->updateEmergencyCallButtonState()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/CryptKeeper;


# direct methods
.method constructor <init>(Lcom/androie/settings/CryptKeeper;)V
    .locals 0

    .prologue
    .line 684
    iput-object p1, p0, Lcom/androie/settings/CryptKeeper$5;->this$0:Lcom/androie/settings/CryptKeeper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 688
    iget-object v0, p0, Lcom/androie/settings/CryptKeeper$5;->this$0:Lcom/androie/settings/CryptKeeper;

    invoke-static {v0}, Lcom/androie/settings/CryptKeeper;->access$1100(Lcom/androie/settings/CryptKeeper;)V

    .line 689
    return-void
.end method
