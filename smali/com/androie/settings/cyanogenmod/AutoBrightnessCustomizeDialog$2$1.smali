.class Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$2$1;
.super Ljava/lang/Object;
.source "AutoBrightnessCustomizeDialog.java"

# interfaces
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$2;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$2;)V
    .locals 0

    .prologue
    .line 131
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$2$1;->this$1:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v0, 0x1

    .line 134
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 142
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 136
    :pswitch_0
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$2$1;->this$1:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$2;

    iget-object v1, v1, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$2;->this$0:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;

    invoke-static {v1}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->access$100(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;)V

    goto :goto_0

    .line 139
    :pswitch_1
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$2$1;->this$1:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$2;

    iget-object v1, v1, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$2;->this$0:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;

    invoke-static {v1}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->access$200(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;)V

    goto :goto_0

    .line 134
    :pswitch_data_0
    .packed-switch 0x7f0c02a4
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
