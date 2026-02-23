.class Lcom/androie/settings/WirelessSettings$1;
.super Ljava/lang/Object;
.source "WirelessSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/WirelessSettings;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/WirelessSettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/WirelessSettings;)V
    .locals 0

    .prologue
    .line 165
    iput-object p1, p0, Lcom/androie/settings/WirelessSettings$1;->this$0:Lcom/androie/settings/WirelessSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 168
    iget-object v0, p0, Lcom/androie/settings/WirelessSettings$1;->this$0:Lcom/androie/settings/WirelessSettings;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MANAGE_MOBILE_PLAN_DIALOG.onClickListener id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/androie/settings/WirelessSettings;->access$000(Lcom/androie/settings/WirelessSettings;Ljava/lang/String;)V

    .line 169
    iget-object v0, p0, Lcom/androie/settings/WirelessSettings$1;->this$0:Lcom/androie/settings/WirelessSettings;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/androie/settings/WirelessSettings;->access$102(Lcom/androie/settings/WirelessSettings;Ljava/lang/String;)Ljava/lang/String;

    .line 170
    return-void
.end method
