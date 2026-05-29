.class Lcom/jellybyn/settings/DreamSettings$1;
.super Ljava/lang/Object;
.source "DreamSettings.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/DreamSettings;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/DreamSettings;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/DreamSettings;)V
    .locals 0

    .prologue
    .line 90
    iput-object p1, p0, Lcom/jellybyn/settings/DreamSettings$1;->this$0:Lcom/jellybyn/settings/DreamSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 93
    iget-object v0, p0, Lcom/jellybyn/settings/DreamSettings$1;->this$0:Lcom/jellybyn/settings/DreamSettings;

    invoke-static {v0}, Lcom/jellybyn/settings/DreamSettings;->access$100(Lcom/jellybyn/settings/DreamSettings;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/jellybyn/settings/DreamSettings$1;->this$0:Lcom/jellybyn/settings/DreamSettings;

    invoke-static {v0}, Lcom/jellybyn/settings/DreamSettings;->access$200(Lcom/jellybyn/settings/DreamSettings;)Lcom/jellybyn/settings/DreamBackend;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/jellybyn/settings/DreamBackend;->setEnabled(Z)V

    .line 95
    iget-object v0, p0, Lcom/jellybyn/settings/DreamSettings$1;->this$0:Lcom/jellybyn/settings/DreamSettings;

    invoke-static {v0}, Lcom/jellybyn/settings/DreamSettings;->access$300(Lcom/jellybyn/settings/DreamSettings;)V

    .line 97
    :cond_0
    return-void
.end method
