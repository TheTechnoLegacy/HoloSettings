.class Lcom/jellybyn/settings/deviceinfo/Memory$3;
.super Ljava/lang/Object;
.source "Memory.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/deviceinfo/Memory;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/deviceinfo/Memory;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/deviceinfo/Memory;)V
    .locals 0

    .prologue
    .line 273
    iput-object p1, p0, Lcom/jellybyn/settings/deviceinfo/Memory$3;->this$0:Lcom/jellybyn/settings/deviceinfo/Memory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 275
    iget-object v0, p0, Lcom/jellybyn/settings/deviceinfo/Memory$3;->this$0:Lcom/jellybyn/settings/deviceinfo/Memory;

    invoke-static {v0}, Lcom/jellybyn/settings/deviceinfo/Memory;->access$200(Lcom/jellybyn/settings/deviceinfo/Memory;)V

    .line 276
    return-void
.end method
