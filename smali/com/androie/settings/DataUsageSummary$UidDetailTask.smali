.class Lcom/androie/settings/DataUsageSummary$UidDetailTask;
.super Landroid/os/AsyncTask;
.source "DataUsageSummary.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/DataUsageSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UidDetailTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/androie/settings/net/UidDetail;",
        ">;"
    }
.end annotation


# instance fields
.field private final mItem:Lcom/androie/settings/DataUsageSummary$AppItem;

.field private final mProvider:Lcom/androie/settings/net/UidDetailProvider;

.field private final mTarget:Landroid/view/View;


# direct methods
.method private constructor <init>(Lcom/androie/settings/net/UidDetailProvider;Lcom/androie/settings/DataUsageSummary$AppItem;Landroid/view/View;)V
    .locals 1
    .param p1, "provider"    # Lcom/androie/settings/net/UidDetailProvider;
    .param p2, "item"    # Lcom/androie/settings/DataUsageSummary$AppItem;
    .param p3, "target"    # Landroid/view/View;

    .prologue
    .line 2229
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2230
    invoke-static {p1}, Lcom/android/internal/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/net/UidDetailProvider;

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary$UidDetailTask;->mProvider:Lcom/androie/settings/net/UidDetailProvider;

    .line 2231
    invoke-static {p2}, Lcom/android/internal/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/DataUsageSummary$AppItem;

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary$UidDetailTask;->mItem:Lcom/androie/settings/DataUsageSummary$AppItem;

    .line 2232
    invoke-static {p3}, Lcom/android/internal/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary$UidDetailTask;->mTarget:Landroid/view/View;

    .line 2233
    return-void
.end method

.method private static bindView(Lcom/androie/settings/net/UidDetail;Landroid/view/View;)V
    .locals 4
    .param p0, "detail"    # Lcom/androie/settings/net/UidDetail;
    .param p1, "target"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    .line 2252
    const v2, 0x1020006

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 2253
    .local v0, "icon":Landroid/widget/ImageView;
    const v2, 0x1020016

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 2255
    .local v1, "title":Landroid/widget/TextView;
    if-eqz p0, :cond_0

    .line 2256
    iget-object v2, p0, Lcom/androie/settings/net/UidDetail;->icon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2257
    iget-object v2, p0, Lcom/androie/settings/net/UidDetail;->label:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2262
    :goto_0
    return-void

    .line 2259
    :cond_0
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2260
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public static bindView(Lcom/androie/settings/net/UidDetailProvider;Lcom/androie/settings/DataUsageSummary$AppItem;Landroid/view/View;)V
    .locals 5
    .param p0, "provider"    # Lcom/androie/settings/net/UidDetailProvider;
    .param p1, "item"    # Lcom/androie/settings/DataUsageSummary$AppItem;
    .param p2, "target"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x0

    .line 2237
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/DataUsageSummary$UidDetailTask;

    .line 2238
    .local v1, "existing":Lcom/androie/settings/DataUsageSummary$UidDetailTask;
    if-eqz v1, :cond_0

    .line 2239
    invoke-virtual {v1, v4}, Lcom/androie/settings/DataUsageSummary$UidDetailTask;->cancel(Z)Z

    .line 2242
    :cond_0
    iget v2, p1, Lcom/androie/settings/DataUsageSummary$AppItem;->key:I

    invoke-virtual {p0, v2, v4}, Lcom/androie/settings/net/UidDetailProvider;->getUidDetail(IZ)Lcom/androie/settings/net/UidDetail;

    move-result-object v0

    .line 2243
    .local v0, "cachedDetail":Lcom/androie/settings/net/UidDetail;
    if-eqz v0, :cond_1

    .line 2244
    invoke-static {v0, p2}, Lcom/androie/settings/DataUsageSummary$UidDetailTask;->bindView(Lcom/androie/settings/net/UidDetail;Landroid/view/View;)V

    .line 2249
    :goto_0
    return-void

    .line 2246
    :cond_1
    new-instance v2, Lcom/androie/settings/DataUsageSummary$UidDetailTask;

    invoke-direct {v2, p0, p1, p2}, Lcom/androie/settings/DataUsageSummary$UidDetailTask;-><init>(Lcom/androie/settings/net/UidDetailProvider;Lcom/androie/settings/DataUsageSummary$AppItem;Landroid/view/View;)V

    sget-object v3, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v4, v4, [Ljava/lang/Void;

    invoke-virtual {v2, v3, v4}, Lcom/androie/settings/DataUsageSummary$UidDetailTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v2

    invoke-virtual {p2, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/androie/settings/net/UidDetail;
    .locals 3
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 2271
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$UidDetailTask;->mProvider:Lcom/androie/settings/net/UidDetailProvider;

    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$UidDetailTask;->mItem:Lcom/androie/settings/DataUsageSummary$AppItem;

    iget v1, v1, Lcom/androie/settings/DataUsageSummary$AppItem;->key:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/androie/settings/net/UidDetailProvider;->getUidDetail(IZ)Lcom/androie/settings/net/UidDetail;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 2224
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/androie/settings/DataUsageSummary$UidDetailTask;->doInBackground([Ljava/lang/Void;)Lcom/androie/settings/net/UidDetail;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/androie/settings/net/UidDetail;)V
    .locals 1
    .param p1, "result"    # Lcom/androie/settings/net/UidDetail;

    .prologue
    .line 2276
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$UidDetailTask;->mTarget:Landroid/view/View;

    invoke-static {p1, v0}, Lcom/androie/settings/DataUsageSummary$UidDetailTask;->bindView(Lcom/androie/settings/net/UidDetail;Landroid/view/View;)V

    .line 2277
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 2224
    check-cast p1, Lcom/androie/settings/net/UidDetail;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/androie/settings/DataUsageSummary$UidDetailTask;->onPostExecute(Lcom/androie/settings/net/UidDetail;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    .prologue
    .line 2266
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$UidDetailTask;->mTarget:Landroid/view/View;

    invoke-static {v0, v1}, Lcom/androie/settings/DataUsageSummary$UidDetailTask;->bindView(Lcom/androie/settings/net/UidDetail;Landroid/view/View;)V

    .line 2267
    return-void
.end method
