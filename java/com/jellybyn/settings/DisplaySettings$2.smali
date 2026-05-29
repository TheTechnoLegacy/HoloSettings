.class Lcom/jellybyn/settings/DisplaySettings$2;
.super Ljava/lang/Object;
.source "DisplaySettings.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/DisplaySettings;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/DisplaySettings;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/DisplaySettings;)V
    .locals 0

    .prologue
    .line 274
    iput-object p1, p0, Lcom/jellybyn/settings/DisplaySettings$2;->this$0:Lcom/jellybyn/settings/DisplaySettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 276
    iget-object v0, p0, Lcom/jellybyn/settings/DisplaySettings$2;->this$0:Lcom/jellybyn/settings/DisplaySettings;

    invoke-static {v0}, Lcom/jellybyn/settings/DisplaySettings;->access$100(Lcom/jellybyn/settings/DisplaySettings;)Lcom/jellybyn/settings/WarnedListPreference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/jellybyn/settings/WarnedListPreference;->click()V

    .line 277
    return-void
.end method
