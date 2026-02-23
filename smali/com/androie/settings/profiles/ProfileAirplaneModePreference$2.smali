.class Lcom/androie/settings/profiles/ProfileAirplaneModePreference$2;
.super Ljava/lang/Object;
.source "ProfileAirplaneModePreference.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/profiles/ProfileAirplaneModePreference;->createAirplaneModeDialog()Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/profiles/ProfileAirplaneModePreference;

.field final synthetic val$AirplaneModeValues:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/androie/settings/profiles/ProfileAirplaneModePreference;[Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 139
    iput-object p1, p0, Lcom/androie/settings/profiles/ProfileAirplaneModePreference$2;->this$0:Lcom/androie/settings/profiles/ProfileAirplaneModePreference;

    iput-object p2, p0, Lcom/androie/settings/profiles/ProfileAirplaneModePreference$2;->val$AirplaneModeValues:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "item"    # I

    .prologue
    .line 142
    iget-object v1, p0, Lcom/androie/settings/profiles/ProfileAirplaneModePreference$2;->this$0:Lcom/androie/settings/profiles/ProfileAirplaneModePreference;

    invoke-static {v1}, Lcom/androie/settings/profiles/ProfileAirplaneModePreference;->access$000(Lcom/androie/settings/profiles/ProfileAirplaneModePreference;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 143
    iget-object v1, p0, Lcom/androie/settings/profiles/ProfileAirplaneModePreference$2;->val$AirplaneModeValues:[Ljava/lang/String;

    iget-object v2, p0, Lcom/androie/settings/profiles/ProfileAirplaneModePreference$2;->this$0:Lcom/androie/settings/profiles/ProfileAirplaneModePreference;

    invoke-static {v2}, Lcom/androie/settings/profiles/ProfileAirplaneModePreference;->access$000(Lcom/androie/settings/profiles/ProfileAirplaneModePreference;)I

    move-result v2

    aget-object v1, v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 144
    .local v0, "value":I
    iget-object v1, p0, Lcom/androie/settings/profiles/ProfileAirplaneModePreference$2;->this$0:Lcom/androie/settings/profiles/ProfileAirplaneModePreference;

    invoke-static {v1}, Lcom/androie/settings/profiles/ProfileAirplaneModePreference;->access$100(Lcom/androie/settings/profiles/ProfileAirplaneModePreference;)Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;

    move-result-object v1

    iget-object v1, v1, Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;->mSettings:Landroid/app/AirplaneModeSettings;

    iget-object v2, p0, Lcom/androie/settings/profiles/ProfileAirplaneModePreference$2;->this$0:Lcom/androie/settings/profiles/ProfileAirplaneModePreference;

    invoke-static {v2}, Lcom/androie/settings/profiles/ProfileAirplaneModePreference;->access$000(Lcom/androie/settings/profiles/ProfileAirplaneModePreference;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/app/AirplaneModeSettings;->setValue(I)V

    .line 145
    iget-object v2, p0, Lcom/androie/settings/profiles/ProfileAirplaneModePreference$2;->this$0:Lcom/androie/settings/profiles/ProfileAirplaneModePreference;

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    iget-object v1, p0, Lcom/androie/settings/profiles/ProfileAirplaneModePreference$2;->this$0:Lcom/androie/settings/profiles/ProfileAirplaneModePreference;

    invoke-virtual {v1}, Lcom/androie/settings/profiles/ProfileAirplaneModePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x7f0800d2

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v2, v1}, Lcom/androie/settings/profiles/ProfileAirplaneModePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 148
    .end local v0    # "value":I
    :cond_0
    return-void

    .line 145
    .restart local v0    # "value":I
    :cond_1
    iget-object v1, p0, Lcom/androie/settings/profiles/ProfileAirplaneModePreference$2;->this$0:Lcom/androie/settings/profiles/ProfileAirplaneModePreference;

    invoke-virtual {v1}, Lcom/androie/settings/profiles/ProfileAirplaneModePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x7f0800d1

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
