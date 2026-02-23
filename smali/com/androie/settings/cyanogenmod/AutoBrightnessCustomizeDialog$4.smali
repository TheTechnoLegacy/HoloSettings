.class Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$4;
.super Ljava/lang/Object;
.source "AutoBrightnessCustomizeDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->showResetConfirmation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;)V
    .locals 0

    .prologue
    .line 422
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$4;->this$0:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "d"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 425
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$4;->this$0:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->access$500(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;Z)V

    .line 426
    return-void
.end method
