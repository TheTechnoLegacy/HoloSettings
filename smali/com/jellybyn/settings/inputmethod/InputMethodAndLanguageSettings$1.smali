.class Lcom/jellybyn/settings/inputmethod/InputMethodAndLanguageSettings$1;
.super Ljava/lang/Object;
.source "InputMethodAndLanguageSettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/inputmethod/InputMethodAndLanguageSettings;->updateHardKeyboards()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/inputmethod/InputMethodAndLanguageSettings;

.field final synthetic val$inputDeviceDescriptor:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/inputmethod/InputMethodAndLanguageSettings;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 463
    iput-object p1, p0, Lcom/jellybyn/settings/inputmethod/InputMethodAndLanguageSettings$1;->this$0:Lcom/jellybyn/settings/inputmethod/InputMethodAndLanguageSettings;

    iput-object p2, p0, Lcom/jellybyn/settings/inputmethod/InputMethodAndLanguageSettings$1;->val$inputDeviceDescriptor:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 2
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 466
    iget-object v0, p0, Lcom/jellybyn/settings/inputmethod/InputMethodAndLanguageSettings$1;->this$0:Lcom/jellybyn/settings/inputmethod/InputMethodAndLanguageSettings;

    iget-object v1, p0, Lcom/jellybyn/settings/inputmethod/InputMethodAndLanguageSettings$1;->val$inputDeviceDescriptor:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/jellybyn/settings/inputmethod/InputMethodAndLanguageSettings;->access$000(Lcom/jellybyn/settings/inputmethod/InputMethodAndLanguageSettings;Ljava/lang/String;)V

    .line 467
    const/4 v0, 0x1

    return v0
.end method
