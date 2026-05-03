.class Lcom/jellybyn/settings/CryptKeeper$5;
.super Ljava/lang/Object;
.source "CryptKeeper.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/CryptKeeper;->updateEmergencyCallButtonState()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/CryptKeeper;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/CryptKeeper;)V
    .locals 0

    .prologue
    .line 684
    iput-object p1, p0, Lcom/jellybyn/settings/CryptKeeper$5;->this$0:Lcom/jellybyn/settings/CryptKeeper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 688
    iget-object v0, p0, Lcom/jellybyn/settings/CryptKeeper$5;->this$0:Lcom/jellybyn/settings/CryptKeeper;

    invoke-static {v0}, Lcom/jellybyn/settings/CryptKeeper;->access$1100(Lcom/jellybyn/settings/CryptKeeper;)V

    .line 689
    return-void
.end method
