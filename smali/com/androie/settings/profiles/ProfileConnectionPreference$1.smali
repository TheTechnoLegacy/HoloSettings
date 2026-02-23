.class Lcom/androie/settings/profiles/ProfileConnectionPreference$1;
.super Ljava/lang/Object;
.source "ProfileConnectionPreference.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/profiles/ProfileConnectionPreference;->createConnectionDialog()Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/profiles/ProfileConnectionPreference;


# direct methods
.method constructor <init>(Lcom/androie/settings/profiles/ProfileConnectionPreference;)V
    .locals 0

    .prologue
    .line 131
    iput-object p1, p0, Lcom/androie/settings/profiles/ProfileConnectionPreference$1;->this$0:Lcom/androie/settings/profiles/ProfileConnectionPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "item"    # I

    .prologue
    .line 134
    iget-object v0, p0, Lcom/androie/settings/profiles/ProfileConnectionPreference$1;->this$0:Lcom/androie/settings/profiles/ProfileConnectionPreference;

    invoke-static {v0, p2}, Lcom/androie/settings/profiles/ProfileConnectionPreference;->access$002(Lcom/androie/settings/profiles/ProfileConnectionPreference;I)I

    .line 135
    return-void
.end method
