.class Lcom/androie/settings/DeviceAdminAdd$1;
.super Ljava/lang/Object;
.source "DeviceAdminAdd.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/DeviceAdminAdd;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/DeviceAdminAdd;


# direct methods
.method constructor <init>(Lcom/androie/settings/DeviceAdminAdd;)V
    .locals 0

    .prologue
    .line 199
    iput-object p1, p0, Lcom/androie/settings/DeviceAdminAdd$1;->this$0:Lcom/androie/settings/DeviceAdminAdd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 201
    iget-object v0, p0, Lcom/androie/settings/DeviceAdminAdd$1;->this$0:Lcom/androie/settings/DeviceAdminAdd;

    invoke-virtual {v0, p1}, Lcom/androie/settings/DeviceAdminAdd;->toggleMessageEllipsis(Landroid/view/View;)V

    .line 202
    return-void
.end method
