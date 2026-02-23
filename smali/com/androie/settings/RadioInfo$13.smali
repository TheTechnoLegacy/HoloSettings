.class Lcom/androie/settings/RadioInfo$13;
.super Ljava/lang/Object;
.source "RadioInfo.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/RadioInfo;
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
    .line 924
    iput-object p1, p0, Lcom/androie/settings/RadioInfo$13;->this$0:Lcom/androie/settings/RadioInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 927
    iget-object v0, p0, Lcom/androie/settings/RadioInfo$13;->this$0:Lcom/androie/settings/RadioInfo;

    invoke-static {v0}, Lcom/androie/settings/RadioInfo;->access$1800(Lcom/androie/settings/RadioInfo;)Lcom/android/internal/telephony/Phone;

    move-result-object v1

    iget-object v0, p0, Lcom/androie/settings/RadioInfo$13;->this$0:Lcom/androie/settings/RadioInfo;

    invoke-static {v0}, Lcom/androie/settings/RadioInfo;->access$3300(Lcom/androie/settings/RadioInfo;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-interface {v1, v0}, Lcom/android/internal/telephony/Phone;->setRadioPower(Z)V

    .line 928
    return-void

    .line 927
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
