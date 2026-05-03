.class Lcom/jellybyn/settings/inputmethod/InputMethodPreference$1;
.super Ljava/lang/Object;
.source "InputMethodPreference.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/inputmethod/InputMethodPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/inputmethod/InputMethodPreference;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/inputmethod/InputMethodPreference;)V
    .locals 0

    .prologue
    .line 66
    iput-object p1, p0, Lcom/jellybyn/settings/inputmethod/InputMethodPreference$1;->this$0:Lcom/jellybyn/settings/inputmethod/InputMethodPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x1

    .line 69
    iget-object v0, p0, Lcom/jellybyn/settings/inputmethod/InputMethodPreference$1;->this$0:Lcom/jellybyn/settings/inputmethod/InputMethodPreference;

    invoke-virtual {v0}, Lcom/jellybyn/settings/inputmethod/InputMethodPreference;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 81
    :goto_0
    return-void

    .line 72
    :cond_0
    iget-object v0, p0, Lcom/jellybyn/settings/inputmethod/InputMethodPreference$1;->this$0:Lcom/jellybyn/settings/inputmethod/InputMethodPreference;

    invoke-virtual {v0}, Lcom/jellybyn/settings/inputmethod/InputMethodPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 73
    iget-object v0, p0, Lcom/jellybyn/settings/inputmethod/InputMethodPreference$1;->this$0:Lcom/jellybyn/settings/inputmethod/InputMethodPreference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/jellybyn/settings/inputmethod/InputMethodPreference;->setChecked(ZZ)V

    goto :goto_0

    .line 75
    :cond_1
    iget-object v0, p0, Lcom/jellybyn/settings/inputmethod/InputMethodPreference$1;->this$0:Lcom/jellybyn/settings/inputmethod/InputMethodPreference;

    invoke-static {v0}, Lcom/jellybyn/settings/inputmethod/InputMethodPreference;->access$000(Lcom/jellybyn/settings/inputmethod/InputMethodPreference;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 76
    iget-object v0, p0, Lcom/jellybyn/settings/inputmethod/InputMethodPreference$1;->this$0:Lcom/jellybyn/settings/inputmethod/InputMethodPreference;

    invoke-virtual {v0, v2, v2}, Lcom/jellybyn/settings/inputmethod/InputMethodPreference;->setChecked(ZZ)V

    goto :goto_0

    .line 78
    :cond_2
    iget-object v0, p0, Lcom/jellybyn/settings/inputmethod/InputMethodPreference$1;->this$0:Lcom/jellybyn/settings/inputmethod/InputMethodPreference;

    iget-object v1, p0, Lcom/jellybyn/settings/inputmethod/InputMethodPreference$1;->this$0:Lcom/jellybyn/settings/inputmethod/InputMethodPreference;

    invoke-static {v1}, Lcom/jellybyn/settings/inputmethod/InputMethodPreference;->access$100(Lcom/jellybyn/settings/inputmethod/InputMethodPreference;)Landroid/view/inputmethod/InputMethodInfo;

    move-result-object v1

    iget-object v2, p0, Lcom/jellybyn/settings/inputmethod/InputMethodPreference$1;->this$0:Lcom/jellybyn/settings/inputmethod/InputMethodPreference;

    invoke-static {v0, v1, v2}, Lcom/jellybyn/settings/inputmethod/InputMethodPreference;->access$200(Lcom/jellybyn/settings/inputmethod/InputMethodPreference;Landroid/view/inputmethod/InputMethodInfo;Lcom/jellybyn/settings/inputmethod/InputMethodPreference;)V

    goto :goto_0
.end method
