.class Lcom/jellybyn/settings/WirelessSettings$1;
.super Ljava/lang/Object;
.source "WirelessSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/WirelessSettings;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/WirelessSettings;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/WirelessSettings;)V
    .locals 0

    .prologue
    .line 157
    iput-object p1, p0, Lcom/jellybyn/settings/WirelessSettings$1;->this$0:Lcom/jellybyn/settings/WirelessSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 160
    iget-object v0, p0, Lcom/jellybyn/settings/WirelessSettings$1;->this$0:Lcom/jellybyn/settings/WirelessSettings;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MANAGE_MOBILE_PLAN_DIALOG.onClickListener id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->access$000(Lcom/jellybyn/settings/WirelessSettings;Ljava/lang/String;)V

    .line 161
    iget-object v0, p0, Lcom/jellybyn/settings/WirelessSettings$1;->this$0:Lcom/jellybyn/settings/WirelessSettings;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/jellybyn/settings/WirelessSettings;->access$102(Lcom/jellybyn/settings/WirelessSettings;Ljava/lang/String;)Ljava/lang/String;

    .line 162
    return-void
.end method
