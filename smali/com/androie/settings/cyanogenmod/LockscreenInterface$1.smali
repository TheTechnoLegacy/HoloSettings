.class Lcom/androie/settings/cyanogenmod/LockscreenInterface$1;
.super Ljava/lang/Object;
.source "LockscreenInterface.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/LockscreenInterface;->handleBackgroundSelection(I)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/LockscreenInterface;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/LockscreenInterface;)V
    .locals 0

    .prologue
    .line 267
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface$1;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenInterface;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 270
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 271
    return-void
.end method
