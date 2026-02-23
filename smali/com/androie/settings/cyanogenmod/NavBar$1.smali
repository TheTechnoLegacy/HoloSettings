.class Lcom/androie/settings/cyanogenmod/NavBar$1;
.super Ljava/lang/Object;
.source "NavBar.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/NavBar;->onOptionsItemSelected(Landroid/view/MenuItem;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/NavBar;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/NavBar;)V
    .locals 0

    .prologue
    .line 110
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/NavBar$1;->this$0:Lcom/androie/settings/cyanogenmod/NavBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 112
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/NavBar$1;->this$0:Lcom/androie/settings/cyanogenmod/NavBar;

    invoke-static {v0}, Lcom/androie/settings/cyanogenmod/NavBar;->access$000(Lcom/androie/settings/cyanogenmod/NavBar;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 113
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/NavBar$1;->this$0:Lcom/androie/settings/cyanogenmod/NavBar;

    invoke-static {v0, v3, v3}, Lcom/androie/settings/cyanogenmod/NavBar;->access$100(Lcom/androie/settings/cyanogenmod/NavBar;ZZ)V

    .line 115
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/NavBar$1;->this$0:Lcom/androie/settings/cyanogenmod/NavBar;

    invoke-virtual {v0}, Lcom/androie/settings/cyanogenmod/NavBar;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "nav_buttons"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 117
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/NavBar$1;->this$0:Lcom/androie/settings/cyanogenmod/NavBar;

    invoke-static {v0, v4, v3}, Lcom/androie/settings/cyanogenmod/NavBar;->access$100(Lcom/androie/settings/cyanogenmod/NavBar;ZZ)V

    .line 118
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/NavBar$1;->this$0:Lcom/androie/settings/cyanogenmod/NavBar;

    invoke-static {v0, v3, v3}, Lcom/androie/settings/cyanogenmod/NavBar;->access$100(Lcom/androie/settings/cyanogenmod/NavBar;ZZ)V

    .line 119
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/NavBar$1;->this$0:Lcom/androie/settings/cyanogenmod/NavBar;

    invoke-static {v0, v3}, Lcom/androie/settings/cyanogenmod/NavBar;->access$002(Lcom/androie/settings/cyanogenmod/NavBar;Z)Z

    .line 120
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/NavBar$1;->this$0:Lcom/androie/settings/cyanogenmod/NavBar;

    invoke-static {v0}, Lcom/androie/settings/cyanogenmod/NavBar;->access$200(Lcom/androie/settings/cyanogenmod/NavBar;)Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0801cf

    invoke-static {v0, v1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 121
    return-void
.end method
