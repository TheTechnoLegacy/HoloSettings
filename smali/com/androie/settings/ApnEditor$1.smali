.class Lcom/androie/settings/ApnEditor$1;
.super Ljava/lang/Object;
.source "ApnEditor.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/ApnEditor;->deleteApn()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/ApnEditor;


# direct methods
.method constructor <init>(Lcom/androie/settings/ApnEditor;)V
    .locals 0

    .prologue
    .line 639
    iput-object p1, p0, Lcom/androie/settings/ApnEditor$1;->this$0:Lcom/androie/settings/ApnEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    const/4 v2, 0x0

    .line 641
    iget-object v0, p0, Lcom/androie/settings/ApnEditor$1;->this$0:Lcom/androie/settings/ApnEditor;

    invoke-virtual {v0}, Lcom/androie/settings/ApnEditor;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/ApnEditor$1;->this$0:Lcom/androie/settings/ApnEditor;

    invoke-static {v1}, Lcom/androie/settings/ApnEditor;->access$000(Lcom/androie/settings/ApnEditor;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 642
    iget-object v0, p0, Lcom/androie/settings/ApnEditor$1;->this$0:Lcom/androie/settings/ApnEditor;

    invoke-virtual {v0}, Lcom/androie/settings/ApnEditor;->finish()V

    .line 643
    return-void
.end method
