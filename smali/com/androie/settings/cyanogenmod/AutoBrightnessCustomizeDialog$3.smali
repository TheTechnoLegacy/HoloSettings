.class Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$3;
.super Ljava/lang/Object;
.source "AutoBrightnessCustomizeDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->onStart()V
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
    .line 167
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$3;->this$0:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 170
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$3;->this$0:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;

    invoke-static {v0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->access$300(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;)V

    .line 171
    return-void
.end method
