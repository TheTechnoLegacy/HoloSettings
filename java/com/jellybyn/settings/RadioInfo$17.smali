.class Lcom/jellybyn/settings/RadioInfo$17;
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
    .line 1027
    iput-object p1, p0, Lcom/jellybyn/settings/RadioInfo$17;->this$0:Lcom/jellybyn/settings/RadioInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1029
    iget-object v0, p0, Lcom/jellybyn/settings/RadioInfo$17;->this$0:Lcom/jellybyn/settings/RadioInfo;

    invoke-static {v0}, Lcom/jellybyn/settings/RadioInfo;->access$1800(Lcom/jellybyn/settings/RadioInfo;)Lcom/android/internal/telephony/Phone;

    move-result-object v1

    iget-object v0, p0, Lcom/jellybyn/settings/RadioInfo$17;->this$0:Lcom/jellybyn/settings/RadioInfo;

    invoke-static {v0}, Lcom/jellybyn/settings/RadioInfo;->access$1800(Lcom/jellybyn/settings/RadioInfo;)Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->isDnsCheckDisabled()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-interface {v1, v0}, Lcom/android/internal/telephony/Phone;->disableDnsCheck(Z)V

    .line 1030
    iget-object v0, p0, Lcom/jellybyn/settings/RadioInfo$17;->this$0:Lcom/jellybyn/settings/RadioInfo;

    invoke-static {v0}, Lcom/jellybyn/settings/RadioInfo;->access$4100(Lcom/jellybyn/settings/RadioInfo;)V

    .line 1031
    return-void

    .line 1029
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
