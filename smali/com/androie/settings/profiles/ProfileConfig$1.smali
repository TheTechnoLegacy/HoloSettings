.class Lcom/androie/settings/profiles/ProfileConfig$1;
.super Ljava/lang/Object;
.source "ProfileConfig.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/profiles/ProfileConfig;->deleteProfile()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/profiles/ProfileConfig;


# direct methods
.method constructor <init>(Lcom/androie/settings/profiles/ProfileConfig;)V
    .locals 0

    .prologue
    .line 410
    iput-object p1, p0, Lcom/androie/settings/profiles/ProfileConfig$1;->this$0:Lcom/androie/settings/profiles/ProfileConfig;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 412
    iget-object v0, p0, Lcom/androie/settings/profiles/ProfileConfig$1;->this$0:Lcom/androie/settings/profiles/ProfileConfig;

    invoke-static {v0}, Lcom/androie/settings/profiles/ProfileConfig;->access$000(Lcom/androie/settings/profiles/ProfileConfig;)V

    .line 413
    return-void
.end method
