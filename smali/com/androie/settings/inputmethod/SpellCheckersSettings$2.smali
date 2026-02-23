.class Lcom/androie/settings/inputmethod/SpellCheckersSettings$2;
.super Ljava/lang/Object;
.source "SpellCheckersSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/inputmethod/SpellCheckersSettings;->showSecurityWarnDialog(Lcom/androie/settings/inputmethod/SingleSpellCheckerPreference;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/inputmethod/SpellCheckersSettings;

.field final synthetic val$scp:Lcom/androie/settings/inputmethod/SingleSpellCheckerPreference;


# direct methods
.method constructor <init>(Lcom/androie/settings/inputmethod/SpellCheckersSettings;Lcom/androie/settings/inputmethod/SingleSpellCheckerPreference;)V
    .locals 0

    .prologue
    .line 128
    iput-object p1, p0, Lcom/androie/settings/inputmethod/SpellCheckersSettings$2;->this$0:Lcom/androie/settings/inputmethod/SpellCheckersSettings;

    iput-object p2, p0, Lcom/androie/settings/inputmethod/SpellCheckersSettings$2;->val$scp:Lcom/androie/settings/inputmethod/SingleSpellCheckerPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 131
    iget-object v0, p0, Lcom/androie/settings/inputmethod/SpellCheckersSettings$2;->this$0:Lcom/androie/settings/inputmethod/SpellCheckersSettings;

    iget-object v1, p0, Lcom/androie/settings/inputmethod/SpellCheckersSettings$2;->val$scp:Lcom/androie/settings/inputmethod/SingleSpellCheckerPreference;

    invoke-static {v0, v1}, Lcom/androie/settings/inputmethod/SpellCheckersSettings;->access$000(Lcom/androie/settings/inputmethod/SpellCheckersSettings;Lcom/androie/settings/inputmethod/SingleSpellCheckerPreference;)V

    .line 132
    return-void
.end method
