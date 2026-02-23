.class Lcom/androie/settings/bluetooth/DeviceProfilesSettings$RenameEditTextPreference;
.super Ljava/lang/Object;
.source "DeviceProfilesSettings.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/bluetooth/DeviceProfilesSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RenameEditTextPreference"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/bluetooth/DeviceProfilesSettings;


# direct methods
.method private constructor <init>(Lcom/androie/settings/bluetooth/DeviceProfilesSettings;)V
    .locals 0

    .prologue
    .line 72
    iput-object p1, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings$RenameEditTextPreference;->this$0:Lcom/androie/settings/bluetooth/DeviceProfilesSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/androie/settings/bluetooth/DeviceProfilesSettings;Lcom/androie/settings/bluetooth/DeviceProfilesSettings$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/androie/settings/bluetooth/DeviceProfilesSettings;
    .param p2, "x1"    # Lcom/androie/settings/bluetooth/DeviceProfilesSettings$1;

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings$RenameEditTextPreference;-><init>(Lcom/androie/settings/bluetooth/DeviceProfilesSettings;)V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 3
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 74
    iget-object v1, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings$RenameEditTextPreference;->this$0:Lcom/androie/settings/bluetooth/DeviceProfilesSettings;

    invoke-static {v1}, Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->access$000(Lcom/androie/settings/bluetooth/DeviceProfilesSettings;)Landroid/preference/EditTextPreference;

    move-result-object v1

    invoke-virtual {v1}, Landroid/preference/EditTextPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 75
    .local v0, "d":Landroid/app/Dialog;
    instance-of v1, v0, Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    .line 76
    check-cast v0, Landroid/app/AlertDialog;

    .end local v0    # "d":Landroid/app/Dialog;
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v2

    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v1

    if-lez v1, :cond_1

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v2, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 78
    :cond_0
    return-void

    .line 76
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 83
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 88
    return-void
.end method
