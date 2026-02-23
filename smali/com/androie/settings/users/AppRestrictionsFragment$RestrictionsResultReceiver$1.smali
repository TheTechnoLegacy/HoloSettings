.class Lcom/androie/settings/users/AppRestrictionsFragment$RestrictionsResultReceiver$1;
.super Ljava/lang/Object;
.source "AppRestrictionsFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/users/AppRestrictionsFragment$RestrictionsResultReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/androie/settings/users/AppRestrictionsFragment$RestrictionsResultReceiver;

.field final synthetic val$customIntent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/androie/settings/users/AppRestrictionsFragment$RestrictionsResultReceiver;Landroid/content/Intent;)V
    .locals 0

    .prologue
    .line 839
    iput-object p1, p0, Lcom/androie/settings/users/AppRestrictionsFragment$RestrictionsResultReceiver$1;->this$1:Lcom/androie/settings/users/AppRestrictionsFragment$RestrictionsResultReceiver;

    iput-object p2, p0, Lcom/androie/settings/users/AppRestrictionsFragment$RestrictionsResultReceiver$1;->val$customIntent:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 3
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 842
    iget-object v1, p0, Lcom/androie/settings/users/AppRestrictionsFragment$RestrictionsResultReceiver$1;->this$1:Lcom/androie/settings/users/AppRestrictionsFragment$RestrictionsResultReceiver;

    iget-object v1, v1, Lcom/androie/settings/users/AppRestrictionsFragment$RestrictionsResultReceiver;->this$0:Lcom/androie/settings/users/AppRestrictionsFragment;

    iget-object v2, p0, Lcom/androie/settings/users/AppRestrictionsFragment$RestrictionsResultReceiver$1;->this$1:Lcom/androie/settings/users/AppRestrictionsFragment$RestrictionsResultReceiver;

    iget-object v2, v2, Lcom/androie/settings/users/AppRestrictionsFragment$RestrictionsResultReceiver;->preference:Lcom/androie/settings/users/AppRestrictionsFragment$AppRestrictionsPreference;

    invoke-static {v1, v2}, Lcom/androie/settings/users/AppRestrictionsFragment;->access$1300(Lcom/androie/settings/users/AppRestrictionsFragment;Lcom/androie/settings/users/AppRestrictionsFragment$AppRestrictionsPreference;)I

    move-result v0

    .line 844
    .local v0, "requestCode":I
    iget-object v1, p0, Lcom/androie/settings/users/AppRestrictionsFragment$RestrictionsResultReceiver$1;->this$1:Lcom/androie/settings/users/AppRestrictionsFragment$RestrictionsResultReceiver;

    iget-object v1, v1, Lcom/androie/settings/users/AppRestrictionsFragment$RestrictionsResultReceiver;->this$0:Lcom/androie/settings/users/AppRestrictionsFragment;

    iget-object v2, p0, Lcom/androie/settings/users/AppRestrictionsFragment$RestrictionsResultReceiver$1;->val$customIntent:Landroid/content/Intent;

    invoke-virtual {v1, v2, v0}, Lcom/androie/settings/users/AppRestrictionsFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 846
    const/4 v1, 0x0

    return v1
.end method
