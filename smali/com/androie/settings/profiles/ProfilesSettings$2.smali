.class Lcom/androie/settings/profiles/ProfilesSettings$2;
.super Ljava/lang/Object;
.source "ProfilesSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/profiles/ProfilesSettings;->addProfile()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/profiles/ProfilesSettings;

.field final synthetic val$entry:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/androie/settings/profiles/ProfilesSettings;Landroid/widget/EditText;)V
    .locals 0

    .prologue
    .line 226
    iput-object p1, p0, Lcom/androie/settings/profiles/ProfilesSettings$2;->this$0:Lcom/androie/settings/profiles/ProfilesSettings;

    iput-object p2, p0, Lcom/androie/settings/profiles/ProfilesSettings$2;->val$entry:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 229
    iget-object v2, p0, Lcom/androie/settings/profiles/ProfilesSettings$2;->val$entry:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 230
    .local v0, "name":Ljava/lang/String;
    iget-object v2, p0, Lcom/androie/settings/profiles/ProfilesSettings$2;->this$0:Lcom/androie/settings/profiles/ProfilesSettings;

    invoke-static {v2}, Lcom/androie/settings/profiles/ProfilesSettings;->access$100(Lcom/androie/settings/profiles/ProfilesSettings;)Landroid/app/ProfileManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/app/ProfileManager;->profileExists(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 231
    new-instance v1, Landroid/app/Profile;

    invoke-direct {v1, v0}, Landroid/app/Profile;-><init>(Ljava/lang/String;)V

    .line 232
    .local v1, "profile":Landroid/app/Profile;
    iget-object v2, p0, Lcom/androie/settings/profiles/ProfilesSettings$2;->this$0:Lcom/androie/settings/profiles/ProfilesSettings;

    invoke-static {v2}, Lcom/androie/settings/profiles/ProfilesSettings;->access$100(Lcom/androie/settings/profiles/ProfilesSettings;)Landroid/app/ProfileManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/ProfileManager;->addProfile(Landroid/app/Profile;)V

    .line 233
    iget-object v2, p0, Lcom/androie/settings/profiles/ProfilesSettings$2;->this$0:Lcom/androie/settings/profiles/ProfilesSettings;

    invoke-static {v2}, Lcom/androie/settings/profiles/ProfilesSettings;->access$200(Lcom/androie/settings/profiles/ProfilesSettings;)Lcom/androie/settings/profiles/ProfilesSettings$ProfilesPagerAdapter;

    move-result-object v2

    invoke-virtual {v2}, Lcom/androie/settings/profiles/ProfilesSettings$ProfilesPagerAdapter;->refreshProfiles()V

    .line 238
    .end local v1    # "profile":Landroid/app/Profile;
    :goto_0
    return-void

    .line 235
    :cond_0
    iget-object v2, p0, Lcom/androie/settings/profiles/ProfilesSettings$2;->this$0:Lcom/androie/settings/profiles/ProfilesSettings;

    invoke-virtual {v2}, Lcom/androie/settings/profiles/ProfilesSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f0800c5

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
