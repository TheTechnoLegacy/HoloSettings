.class Lcom/jellybyn/settings/Settings$1;
.super Ljava/lang/Object;
.source "Settings.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/Settings;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/Settings;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/Settings;)V
    .locals 0

    .prologue
    .line 175
    iput-object p1, p0, Lcom/jellybyn/settings/Settings$1;->this$0:Lcom/jellybyn/settings/Settings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 178
    iget-object v0, p0, Lcom/jellybyn/settings/Settings$1;->this$0:Lcom/jellybyn/settings/Settings;

    iget-object v1, p0, Lcom/jellybyn/settings/Settings$1;->this$0:Lcom/jellybyn/settings/Settings;

    invoke-static {v1}, Lcom/jellybyn/settings/Settings;->access$000(Lcom/jellybyn/settings/Settings;)Landroid/preference/PreferenceActivity$Header;

    move-result-object v1

    iget-object v1, v1, Landroid/preference/PreferenceActivity$Header;->fragment:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/jellybyn/settings/Settings;->access$100(Lcom/jellybyn/settings/Settings;Ljava/lang/String;)V

    .line 179
    return-void
.end method
