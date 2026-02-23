.class Lcom/androie/settings/cyanogenmod/DisplayGamma$1;
.super Ljava/lang/Object;
.source "DisplayGamma.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/DisplayGamma;->onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/DisplayGamma;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/DisplayGamma;)V
    .locals 0

    .prologue
    .line 79
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/DisplayGamma$1;->this$0:Lcom/androie/settings/cyanogenmod/DisplayGamma;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 82
    return-void
.end method
