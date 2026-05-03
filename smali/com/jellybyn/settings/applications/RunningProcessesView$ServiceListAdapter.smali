.class Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;
.super Landroid/widget/BaseAdapter;
.source "RunningProcessesView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/applications/RunningProcessesView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ServiceListAdapter"
.end annotation


# instance fields
.field final mInflater:Landroid/view/LayoutInflater;

.field final mItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/jellybyn/settings/applications/RunningState$MergedItem;",
            ">;"
        }
    .end annotation
.end field

.field mOrigItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/jellybyn/settings/applications/RunningState$MergedItem;",
            ">;"
        }
    .end annotation
.end field

.field mShowBackground:Z

.field final mState:Lcom/jellybyn/settings/applications/RunningState;

.field final synthetic this$0:Lcom/jellybyn/settings/applications/RunningProcessesView;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/applications/RunningProcessesView;Lcom/jellybyn/settings/applications/RunningState;)V
    .locals 2
    .param p2, "state"    # Lcom/jellybyn/settings/applications/RunningState;

    .prologue
    .line 215
    iput-object p1, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->this$0:Lcom/jellybyn/settings/applications/RunningProcessesView;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 212
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mItems:Ljava/util/ArrayList;

    .line 216
    iput-object p2, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mState:Lcom/jellybyn/settings/applications/RunningState;

    .line 217
    invoke-virtual {p1}, Lcom/jellybyn/settings/applications/RunningProcessesView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "layout_inflater"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 219
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->refreshItems()V

    .line 220
    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .locals 1

    .prologue
    .line 276
    const/4 v0, 0x0

    return v0
.end method

.method public bindView(Landroid/view/View;I)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 301
    iget-object v3, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mState:Lcom/jellybyn/settings/applications/RunningState;

    iget-object v4, v3, Lcom/jellybyn/settings/applications/RunningState;->mLock:Ljava/lang/Object;

    monitor-enter v4

    .line 302
    :try_start_0
    iget-object v3, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt p2, v3, :cond_0

    .line 306
    monitor-exit v4

    .line 313
    :goto_0
    return-void

    .line 308
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jellybyn/settings/applications/RunningProcessesView$ViewHolder;

    .line 309
    .local v2, "vh":Lcom/jellybyn/settings/applications/RunningProcessesView$ViewHolder;
    iget-object v3, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jellybyn/settings/applications/RunningState$MergedItem;

    .line 310
    .local v1, "item":Lcom/jellybyn/settings/applications/RunningState$MergedItem;
    iget-object v3, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mState:Lcom/jellybyn/settings/applications/RunningState;

    iget-object v5, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->this$0:Lcom/jellybyn/settings/applications/RunningProcessesView;

    iget-object v5, v5, Lcom/jellybyn/settings/applications/RunningProcessesView;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3, v1, v5}, Lcom/jellybyn/settings/applications/RunningProcessesView$ViewHolder;->bind(Lcom/jellybyn/settings/applications/RunningState;Lcom/jellybyn/settings/applications/RunningState$BaseItem;Ljava/lang/StringBuilder;)Lcom/jellybyn/settings/applications/RunningProcessesView$ActiveItem;

    move-result-object v0

    .line 311
    .local v0, "ai":Lcom/jellybyn/settings/applications/RunningProcessesView$ActiveItem;
    iget-object v3, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->this$0:Lcom/jellybyn/settings/applications/RunningProcessesView;

    iget-object v3, v3, Lcom/jellybyn/settings/applications/RunningProcessesView;->mActiveItems:Ljava/util/HashMap;

    invoke-virtual {v3, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    monitor-exit v4

    goto :goto_0

    .end local v0    # "ai":Lcom/jellybyn/settings/applications/RunningProcessesView$ActiveItem;
    .end local v1    # "item":Lcom/jellybyn/settings/applications/RunningState$MergedItem;
    .end local v2    # "vh":Lcom/jellybyn/settings/applications/RunningProcessesView$ViewHolder;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 259
    iget-object v0, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 268
    iget-object v0, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 272
    iget-object v0, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jellybyn/settings/applications/RunningState$MergedItem;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method getShowBackground()Z
    .locals 1

    .prologue
    .line 233
    iget-boolean v0, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mShowBackground:Z

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 285
    if-nez p2, :cond_0

    .line 286
    invoke-virtual {p0, p3}, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->newView(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 290
    .local v0, "v":Landroid/view/View;
    :goto_0
    invoke-virtual {p0, v0, p1}, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->bindView(Landroid/view/View;I)V

    .line 291
    return-object v0

    .line 288
    .end local v0    # "v":Landroid/view/View;
    :cond_0
    move-object v0, p2

    .restart local v0    # "v":Landroid/view/View;
    goto :goto_0
.end method

.method public hasStableIds()Z
    .locals 1

    .prologue
    .line 255
    const/4 v0, 0x1

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 264
    iget-object v0, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mState:Lcom/jellybyn/settings/applications/RunningState;

    invoke-virtual {v0}, Lcom/jellybyn/settings/applications/RunningState;->hasData()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isEnabled(I)Z
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 280
    iget-object v0, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jellybyn/settings/applications/RunningState$MergedItem;

    iget-boolean v0, v0, Lcom/jellybyn/settings/applications/RunningState$MergedItem;->mIsProcess:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public newView(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 295
    iget-object v1, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v2, 0x7f04006c

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 296
    .local v0, "v":Landroid/view/View;
    new-instance v1, Lcom/jellybyn/settings/applications/RunningProcessesView$ViewHolder;

    invoke-direct {v1, v0}, Lcom/jellybyn/settings/applications/RunningProcessesView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 297
    return-object v0
.end method

.method refreshItems()V
    .locals 3

    .prologue
    .line 237
    iget-boolean v1, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mShowBackground:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mState:Lcom/jellybyn/settings/applications/RunningState;

    invoke-virtual {v1}, Lcom/jellybyn/settings/applications/RunningState;->getCurrentBackgroundItems()Ljava/util/ArrayList;

    move-result-object v0

    .line 240
    .local v0, "newItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/jellybyn/settings/applications/RunningState$MergedItem;>;"
    :goto_0
    iget-object v1, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mOrigItems:Ljava/util/ArrayList;

    if-eq v1, v0, :cond_0

    .line 241
    iput-object v0, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mOrigItems:Ljava/util/ArrayList;

    .line 242
    if-nez v0, :cond_2

    .line 243
    iget-object v1, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 252
    :cond_0
    :goto_1
    return-void

    .line 237
    .end local v0    # "newItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/jellybyn/settings/applications/RunningState$MergedItem;>;"
    :cond_1
    iget-object v1, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mState:Lcom/jellybyn/settings/applications/RunningState;

    invoke-virtual {v1}, Lcom/jellybyn/settings/applications/RunningState;->getCurrentMergedItems()Ljava/util/ArrayList;

    move-result-object v0

    goto :goto_0

    .line 245
    .restart local v0    # "newItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/jellybyn/settings/applications/RunningState$MergedItem;>;"
    :cond_2
    iget-object v1, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 246
    iget-object v1, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 247
    iget-boolean v1, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mShowBackground:Z

    if-eqz v1, :cond_0

    .line 248
    iget-object v1, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mItems:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mState:Lcom/jellybyn/settings/applications/RunningState;

    iget-object v2, v2, Lcom/jellybyn/settings/applications/RunningState;->mBackgroundComparator:Ljava/util/Comparator;

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    goto :goto_1
.end method

.method setShowBackground(Z)V
    .locals 2
    .param p1, "showBackground"    # Z

    .prologue
    .line 223
    iget-boolean v0, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mShowBackground:Z

    if-eq v0, p1, :cond_0

    .line 224
    iput-boolean p1, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mShowBackground:Z

    .line 225
    iget-object v0, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mState:Lcom/jellybyn/settings/applications/RunningState;

    invoke-virtual {v0, p1}, Lcom/jellybyn/settings/applications/RunningState;->setWatchingBackgroundItems(Z)V

    .line 226
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->refreshItems()V

    .line 227
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->notifyDataSetChanged()V

    .line 228
    iget-object v0, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->this$0:Lcom/jellybyn/settings/applications/RunningProcessesView;

    iget-object v0, v0, Lcom/jellybyn/settings/applications/RunningProcessesView;->mColorBar:Lcom/jellybyn/settings/applications/LinearColorBar;

    iget-boolean v1, p0, Lcom/jellybyn/settings/applications/RunningProcessesView$ServiceListAdapter;->mShowBackground:Z

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/applications/LinearColorBar;->setShowingGreen(Z)V

    .line 230
    :cond_0
    return-void
.end method
