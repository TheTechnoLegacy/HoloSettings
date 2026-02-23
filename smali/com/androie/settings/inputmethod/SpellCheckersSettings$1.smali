.class Lcom/androie/settings/inputmethod/SpellCheckersSettings$1;
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


# direct methods
.method constructor <init>(Lcom/androie/settings/inputmethod/SpellCheckersSettings;)V
    .locals 0

    .prologue
    .line 135
    iput-object p1, p0, Lcom/androie/settings/inputmethod/SpellCheckersSettings$1;->this$0:Lcom/androie/settings/inputmethod/SpellCheckersSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 138
    return-void
.end method
