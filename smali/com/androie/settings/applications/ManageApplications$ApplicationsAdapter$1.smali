.class Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter$1;
.super Landroid/widget/Filter;
.source "ManageApplications.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;


# direct methods
.method constructor <init>(Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;)V
    .locals 0

    .prologue
    .line 550
    iput-object p1, p0, Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter$1;->this$0:Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;

    invoke-direct {p0}, Landroid/widget/Filter;-><init>()V

    return-void
.end method


# virtual methods
.method protected performFiltering(Ljava/lang/CharSequence;)Landroid/widget/Filter$FilterResults;
    .locals 4
    .param p1, "constraint"    # Ljava/lang/CharSequence;

    .prologue
    .line 553
    iget-object v2, p0, Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter$1;->this$0:Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;

    iget-object v3, p0, Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter$1;->this$0:Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;

    invoke-static {v3}, Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;->access$500(Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v2, p1, v3}, Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;->applyPrefixFilter(Ljava/lang/CharSequence;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    .line 555
    .local v0, "entries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/ApplicationsState$AppEntry;>;"
    new-instance v1, Landroid/widget/Filter$FilterResults;

    invoke-direct {v1}, Landroid/widget/Filter$FilterResults;-><init>()V

    .line 556
    .local v1, "fr":Landroid/widget/Filter$FilterResults;
    iput-object v0, v1, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    .line 557
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    iput v2, v1, Landroid/widget/Filter$FilterResults;->count:I

    .line 558
    return-object v1
.end method

.method protected publishResults(Ljava/lang/CharSequence;Landroid/widget/Filter$FilterResults;)V
    .locals 2
    .param p1, "constraint"    # Ljava/lang/CharSequence;
    .param p2, "results"    # Landroid/widget/Filter$FilterResults;

    .prologue
    .line 563
    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter$1;->this$0:Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;

    iput-object p1, v0, Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;->mCurFilterPrefix:Ljava/lang/CharSequence;

    .line 564
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter$1;->this$0:Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;

    iget-object v0, p2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-static {v1, v0}, Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;->access$602(Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 565
    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter$1;->this$0:Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;

    invoke-virtual {v0}, Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;->notifyDataSetChanged()V

    .line 566
    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter$1;->this$0:Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;

    invoke-static {v0}, Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;->access$700(Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;)Lcom/androie/settings/applications/ManageApplications$TabInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/androie/settings/applications/ManageApplications$TabInfo;->updateStorageUsage()V

    .line 567
    return-void
.end method
