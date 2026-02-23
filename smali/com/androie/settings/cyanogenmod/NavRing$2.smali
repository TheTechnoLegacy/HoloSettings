.class Lcom/androie/settings/cyanogenmod/NavRing$2;
.super Ljava/lang/Object;
.source "NavRing.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/NavRing;->onTrigger(Landroid/view/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/NavRing;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/NavRing;)V
    .locals 0

    .prologue
    .line 276
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/NavRing$2;->this$0:Lcom/androie/settings/cyanogenmod/NavRing;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "item"    # I

    .prologue
    .line 279
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/NavRing$2;->this$0:Lcom/androie/settings/cyanogenmod/NavRing;

    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/NavRing$2;->this$0:Lcom/androie/settings/cyanogenmod/NavRing;

    invoke-static {v1}, Lcom/androie/settings/cyanogenmod/NavRing;->access$200(Lcom/androie/settings/cyanogenmod/NavRing;)Lcom/androie/settings/cyanogenmod/NavRing$ActionHolder;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/androie/settings/cyanogenmod/NavRing$ActionHolder;->getAction(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/androie/settings/cyanogenmod/NavRing;->access$300(Lcom/androie/settings/cyanogenmod/NavRing;Ljava/lang/String;)V

    .line 280
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 281
    return-void
.end method
