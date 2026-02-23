.class Lcom/androie/settings/LocalePicker$1;
.super Ljava/lang/Object;
.source "LocalePicker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/LocalePicker;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/LocalePicker;

.field final synthetic val$dialogId:I


# direct methods
.method constructor <init>(Lcom/androie/settings/LocalePicker;I)V
    .locals 0

    .prologue
    .line 107
    iput-object p1, p0, Lcom/androie/settings/LocalePicker$1;->this$0:Lcom/androie/settings/LocalePicker;

    iput p2, p0, Lcom/androie/settings/LocalePicker$1;->val$dialogId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/androie/settings/LocalePicker$1;->this$0:Lcom/androie/settings/LocalePicker;

    iget v1, p0, Lcom/androie/settings/LocalePicker$1;->val$dialogId:I

    invoke-virtual {v0, v1}, Lcom/androie/settings/LocalePicker;->removeDialog(I)V

    .line 110
    iget-object v0, p0, Lcom/androie/settings/LocalePicker$1;->this$0:Lcom/androie/settings/LocalePicker;

    invoke-virtual {v0}, Lcom/androie/settings/LocalePicker;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->onBackPressed()V

    .line 111
    iget-object v0, p0, Lcom/androie/settings/LocalePicker$1;->this$0:Lcom/androie/settings/LocalePicker;

    invoke-static {v0}, Lcom/androie/settings/LocalePicker;->access$000(Lcom/androie/settings/LocalePicker;)Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Lcom/androie/settings/LocalePicker;->updateLocale(Ljava/util/Locale;)V

    .line 112
    return-void
.end method
