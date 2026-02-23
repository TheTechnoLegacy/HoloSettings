.class Lcom/androie/settings/RadioInfo$3;
.super Ljava/lang/Object;
.source "RadioInfo.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/RadioInfo;->updatePingState()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/RadioInfo;


# direct methods
.method constructor <init>(Lcom/androie/settings/RadioInfo;)V
    .locals 0

    .prologue
    .line 765
    iput-object p1, p0, Lcom/androie/settings/RadioInfo$3;->this$0:Lcom/androie/settings/RadioInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 767
    iget-object v0, p0, Lcom/androie/settings/RadioInfo$3;->this$0:Lcom/androie/settings/RadioInfo;

    invoke-static {v0}, Lcom/androie/settings/RadioInfo;->access$2400(Lcom/androie/settings/RadioInfo;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/RadioInfo$3;->this$0:Lcom/androie/settings/RadioInfo;

    invoke-static {v1}, Lcom/androie/settings/RadioInfo;->access$2300(Lcom/androie/settings/RadioInfo;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 768
    iget-object v0, p0, Lcom/androie/settings/RadioInfo$3;->this$0:Lcom/androie/settings/RadioInfo;

    invoke-static {v0}, Lcom/androie/settings/RadioInfo;->access$2600(Lcom/androie/settings/RadioInfo;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/RadioInfo$3;->this$0:Lcom/androie/settings/RadioInfo;

    invoke-static {v1}, Lcom/androie/settings/RadioInfo;->access$2500(Lcom/androie/settings/RadioInfo;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 769
    iget-object v0, p0, Lcom/androie/settings/RadioInfo$3;->this$0:Lcom/androie/settings/RadioInfo;

    invoke-static {v0}, Lcom/androie/settings/RadioInfo;->access$2800(Lcom/androie/settings/RadioInfo;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/RadioInfo$3;->this$0:Lcom/androie/settings/RadioInfo;

    invoke-static {v1}, Lcom/androie/settings/RadioInfo;->access$2700(Lcom/androie/settings/RadioInfo;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 770
    return-void
.end method
