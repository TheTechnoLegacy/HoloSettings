.class Lcom/jellybyn/settings/RadioInfo$21;
.super Ljava/lang/Object;
.source "RadioInfo.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/RadioInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/RadioInfo;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/RadioInfo;)V
    .locals 0

    .prologue
    .line 1061
    iput-object p1, p0, Lcom/jellybyn/settings/RadioInfo$21;->this$0:Lcom/jellybyn/settings/RadioInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1063
    iget-object v0, p0, Lcom/jellybyn/settings/RadioInfo$21;->this$0:Lcom/jellybyn/settings/RadioInfo;

    invoke-static {v0}, Lcom/jellybyn/settings/RadioInfo;->access$4400(Lcom/jellybyn/settings/RadioInfo;)V

    .line 1064
    return-void
.end method
