.class public Lcom/koushikdutta/superuser/PolicyFragmentInternal;
.super Lcom/koushikdutta/widgets/ListContentFragmentInternal;
.source "PolicyFragmentInternal.java"


# instance fields
.field mContent:Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;

.field mWrapper:Landroid/view/ContextThemeWrapper;


# direct methods
.method public constructor <init>(Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;)V
    .locals 0
    .param p1, "fragment"    # Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/koushikdutta/widgets/ListContentFragmentInternal;-><init>(Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;)V

    .line 49
    return-void
.end method


# virtual methods
.method addPolicy(Lcom/koushikdutta/superuser/db/UidPolicy;I)V
    .locals 10
    .param p1, "up"    # Lcom/koushikdutta/superuser/db/UidPolicy;
    .param p2, "last"    # I

    .prologue
    .line 118
    invoke-virtual {p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/text/format/DateFormat;->getLongDateFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v6

    .line 120
    .local v6, "df":Ljava/text/DateFormat;
    if-nez p2, :cond_0

    .line 121
    const/4 v4, 0x0

    .line 124
    .local v4, "date":Ljava/lang/String;
    :goto_0
    invoke-virtual {p1}, Lcom/koushikdutta/superuser/db/UidPolicy;->getPolicyResource()I

    move-result v9

    new-instance v0, Lcom/koushikdutta/superuser/PolicyFragmentInternal$1;

    iget-object v3, p1, Lcom/koushikdutta/superuser/db/UidPolicy;->name:Ljava/lang/String;

    move-object v1, p0

    move-object v2, p0

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/koushikdutta/superuser/PolicyFragmentInternal$1;-><init>(Lcom/koushikdutta/superuser/PolicyFragmentInternal;Lcom/koushikdutta/widgets/BetterListFragmentInternal;Ljava/lang/String;Ljava/lang/String;Lcom/koushikdutta/superuser/db/UidPolicy;)V

    invoke-virtual {p0, v9, v0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->addItem(ILcom/koushikdutta/widgets/ListItem;)Lcom/koushikdutta/widgets/ListItem;

    move-result-object v8

    .line 132
    .local v8, "li":Lcom/koushikdutta/widgets/ListItem;
    invoke-virtual {p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p1, Lcom/koushikdutta/superuser/db/UidPolicy;->packageName:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/koushikdutta/superuser/Helper;->loadPackageIcon(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 133
    .local v7, "icon":Landroid/graphics/drawable/Drawable;
    if-nez v7, :cond_1

    .line 134
    const v0, 0x7f020069

    invoke-virtual {v8, v0}, Lcom/koushikdutta/widgets/ListItem;->setIcon(I)Lcom/koushikdutta/widgets/ListItem;

    .line 137
    :goto_1
    return-void

    .line 123
    .end local v4    # "date":Ljava/lang/String;
    .end local v7    # "icon":Landroid/graphics/drawable/Drawable;
    .end local v8    # "li":Lcom/koushikdutta/widgets/ListItem;
    :cond_0
    invoke-virtual {p0, p2}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->getLastDate(I)Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    .restart local v4    # "date":Ljava/lang/String;
    goto :goto_0

    .line 136
    .restart local v7    # "icon":Landroid/graphics/drawable/Drawable;
    .restart local v8    # "li":Lcom/koushikdutta/widgets/ListItem;
    :cond_1
    invoke-virtual {v8, v7}, Lcom/koushikdutta/widgets/ListItem;->setDrawable(Landroid/graphics/drawable/Drawable;)Lcom/koushikdutta/widgets/ListItem;

    goto :goto_1
.end method

.method protected createLogNativeFragment()Lcom/koushikdutta/superuser/LogNativeFragment;
    .locals 1

    .prologue
    .line 143
    new-instance v0, Lcom/koushikdutta/superuser/LogNativeFragment;

    invoke-direct {v0}, Lcom/koushikdutta/superuser/LogNativeFragment;-><init>()V

    return-object v0
.end method

.method protected createSettingsNativeFragment()Lcom/koushikdutta/superuser/SettingsNativeFragment;
    .locals 1

    .prologue
    .line 147
    new-instance v0, Lcom/koushikdutta/superuser/SettingsNativeFragment;

    invoke-direct {v0}, Lcom/koushikdutta/superuser/SettingsNativeFragment;-><init>()V

    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .locals 4

    .prologue
    .line 54
    iget-object v1, p0, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->mWrapper:Landroid/view/ContextThemeWrapper;

    if-eqz v1, :cond_0

    .line 55
    iget-object v1, p0, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->mWrapper:Landroid/view/ContextThemeWrapper;

    .line 59
    :goto_0
    return-object v1

    .line 56
    :cond_0
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 57
    .local v0, "value":Landroid/util/TypedValue;
    invoke-super {p0}, Lcom/koushikdutta/widgets/ListContentFragmentInternal;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x7f01000b

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 58
    new-instance v1, Landroid/view/ContextThemeWrapper;

    invoke-super {p0}, Lcom/koushikdutta/widgets/ListContentFragmentInternal;->getContext()Landroid/content/Context;

    move-result-object v2

    iget v3, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-direct {v1, v2, v3}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v1, p0, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->mWrapper:Landroid/view/ContextThemeWrapper;

    .line 59
    iget-object v1, p0, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->mWrapper:Landroid/view/ContextThemeWrapper;

    goto :goto_0
.end method

.method public getLastDate(I)Ljava/util/Date;
    .locals 5
    .param p1, "last"    # I

    .prologue
    .line 114
    new-instance v0, Ljava/util/Date;

    int-to-long v1, p1

    const-wide/16 v3, 0x3e8

    mul-long/2addr v1, v3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method load()V
    .locals 8

    .prologue
    .line 68
    invoke-virtual {p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->clear()V

    .line 69
    invoke-virtual {p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-static {v6}, Lcom/koushikdutta/superuser/db/SuDatabaseHelper;->getPolicies(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v4

    .line 71
    .local v4, "policies":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/superuser/db/UidPolicy;>;"
    new-instance v6, Lcom/koushikdutta/superuser/db/SuperuserDatabaseHelper;

    invoke-virtual {p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/koushikdutta/superuser/db/SuperuserDatabaseHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v6}, Lcom/koushikdutta/superuser/db/SuperuserDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 73
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/koushikdutta/superuser/db/UidPolicy;

    .line 74
    .local v5, "up":Lcom/koushikdutta/superuser/db/UidPolicy;
    const/4 v2, 0x0

    .line 75
    .local v2, "last":I
    const/4 v6, 0x1

    invoke-static {v0, v5, v6}, Lcom/koushikdutta/superuser/db/SuperuserDatabaseHelper;->getLogs(Landroid/database/sqlite/SQLiteDatabase;Lcom/koushikdutta/superuser/db/UidPolicy;I)Ljava/util/ArrayList;

    move-result-object v3

    .line 76
    .local v3, "logs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/superuser/db/LogEntry;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lez v6, :cond_0

    .line 77
    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/koushikdutta/superuser/db/LogEntry;

    iget v2, v6, Lcom/koushikdutta/superuser/db/LogEntry;->date:I

    .line 78
    :cond_0
    invoke-virtual {p0, v5, v2}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->addPolicy(Lcom/koushikdutta/superuser/db/UidPolicy;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 82
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "last":I
    .end local v3    # "logs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/superuser/db/LogEntry;>;"
    .end local v5    # "up":Lcom/koushikdutta/superuser/db/UidPolicy;
    :catchall_0
    move-exception v6

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    throw v6

    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 84
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 140
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;Landroid/view/View;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .param p2, "view"    # Landroid/view/View;

    .prologue
    .line 96
    invoke-super {p0, p1, p2}, Lcom/koushikdutta/widgets/ListContentFragmentInternal;->onCreate(Landroid/os/Bundle;Landroid/view/View;)V

    .line 98
    invoke-virtual {p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->getFragment()Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;->setHasOptionsMenu(Z)V

    .line 100
    const v1, 0x7f080014

    invoke-virtual {p0, v1}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->setEmpty(I)V

    .line 102
    invoke-virtual {p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->load()V

    .line 104
    const-string v1, "com.koushikdutta.superuser"

    invoke-virtual {p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 105
    const v1, 0x7f0c00eb

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 106
    .local v0, "watermark":Landroid/widget/ImageView;
    if-eqz v0, :cond_0

    .line 107
    const v1, 0x7f020021

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 109
    .end local v0    # "watermark":Landroid/widget/ImageView;
    :cond_0
    invoke-virtual {p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->isPaged()Z

    move-result v1

    if-nez v1, :cond_1

    .line 110
    invoke-virtual {p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->showAllLogs()V

    .line 111
    :cond_1
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 4
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 181
    invoke-super {p0, p1, p2}, Lcom/koushikdutta/widgets/ListContentFragmentInternal;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 182
    new-instance v1, Landroid/view/MenuInflater;

    invoke-virtual {p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/view/MenuInflater;-><init>(Landroid/content/Context;)V

    .line 183
    .local v1, "mi":Landroid/view/MenuInflater;
    const v3, 0x7f100005

    invoke-virtual {v1, v3, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 184
    const v3, 0x7f0c02b0

    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 185
    .local v0, "log":Landroid/view/MenuItem;
    new-instance v3, Lcom/koushikdutta/superuser/PolicyFragmentInternal$2;

    invoke-direct {v3, p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal$2;-><init>(Lcom/koushikdutta/superuser/PolicyFragmentInternal;)V

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 193
    const v3, 0x7f0c02b1

    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    .line 194
    .local v2, "settings":Landroid/view/MenuItem;
    new-instance v3, Lcom/koushikdutta/superuser/PolicyFragmentInternal$3;

    invoke-direct {v3, p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal$3;-><init>(Lcom/koushikdutta/superuser/PolicyFragmentInternal;)V

    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 210
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 87
    invoke-super {p0}, Lcom/koushikdutta/widgets/ListContentFragmentInternal;->onResume()V

    .line 88
    invoke-virtual {p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->load()V

    .line 89
    return-void
.end method

.method setContent(Lcom/koushikdutta/widgets/ListItem;Lcom/koushikdutta/superuser/db/UidPolicy;)V
    .locals 4
    .param p1, "li"    # Lcom/koushikdutta/widgets/ListItem;
    .param p2, "up"    # Lcom/koushikdutta/superuser/db/UidPolicy;

    .prologue
    .line 165
    invoke-virtual {p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->getActivity()Landroid/app/Activity;

    move-result-object v1

    instance-of v1, v1, Landroid/support/v4/app/FragmentActivity;

    if-eqz v1, :cond_0

    .line 166
    new-instance v0, Lcom/koushikdutta/superuser/LogFragment;

    invoke-direct {v0}, Lcom/koushikdutta/superuser/LogFragment;-><init>()V

    .line 167
    .local v0, "l":Lcom/koushikdutta/superuser/LogFragment;
    invoke-virtual {v0}, Lcom/koushikdutta/superuser/LogFragment;->getInternal()Lcom/koushikdutta/widgets/FragmentInterface;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/superuser/LogFragmentInternal;

    invoke-virtual {v1, p2}, Lcom/koushikdutta/superuser/LogFragmentInternal;->setUidPolicy(Lcom/koushikdutta/superuser/db/UidPolicy;)Lcom/koushikdutta/superuser/LogFragmentInternal;

    .line 168
    invoke-virtual {v0}, Lcom/koushikdutta/superuser/LogFragment;->getInternal()Lcom/koushikdutta/widgets/FragmentInterface;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/superuser/LogFragmentInternal;

    invoke-virtual {p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->getFragment()Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;

    move-result-object v2

    invoke-interface {v2}, Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/koushikdutta/superuser/LogFragmentInternal;->setListContentId(I)V

    .line 169
    iput-object v0, p0, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->mContent:Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;

    .line 175
    .end local v0    # "l":Lcom/koushikdutta/superuser/LogFragment;
    :goto_0
    iget-object v3, p0, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->mContent:Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;

    if-nez p2, :cond_1

    const/4 v1, 0x1

    move v2, v1

    :goto_1
    if-nez p2, :cond_2

    const v1, 0x7f080010

    invoke-virtual {p0, v1}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_2
    invoke-virtual {p0, v3, v2, v1}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->setContent(Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;ZLjava/lang/String;)V

    .line 176
    return-void

    .line 172
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->setContentNative(Lcom/koushikdutta/widgets/ListItem;Lcom/koushikdutta/superuser/db/UidPolicy;)Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;

    move-result-object v1

    iput-object v1, p0, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->mContent:Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;

    goto :goto_0

    .line 175
    :cond_1
    const/4 v1, 0x0

    move v2, v1

    goto :goto_1

    :cond_2
    invoke-virtual {p2}, Lcom/koushikdutta/superuser/db/UidPolicy;->getName()Ljava/lang/String;

    move-result-object v1

    goto :goto_2
.end method

.method setContentNative(Lcom/koushikdutta/widgets/ListItem;Lcom/koushikdutta/superuser/db/UidPolicy;)Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;
    .locals 4
    .param p1, "li"    # Lcom/koushikdutta/widgets/ListItem;
    .param p2, "up"    # Lcom/koushikdutta/superuser/db/UidPolicy;

    .prologue
    .line 151
    invoke-virtual {p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->createLogNativeFragment()Lcom/koushikdutta/superuser/LogNativeFragment;

    move-result-object v1

    .line 152
    .local v1, "l":Lcom/koushikdutta/superuser/LogNativeFragment;
    invoke-virtual {v1}, Lcom/koushikdutta/superuser/LogNativeFragment;->getInternal()Lcom/koushikdutta/widgets/FragmentInterface;

    move-result-object v2

    check-cast v2, Lcom/koushikdutta/superuser/LogFragmentInternal;

    invoke-virtual {v2, p2}, Lcom/koushikdutta/superuser/LogFragmentInternal;->setUidPolicy(Lcom/koushikdutta/superuser/db/UidPolicy;)Lcom/koushikdutta/superuser/LogFragmentInternal;

    .line 153
    if-eqz p2, :cond_0

    .line 154
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 155
    .local v0, "args":Landroid/os/Bundle;
    const-string v2, "command"

    iget-object v3, p2, Lcom/koushikdutta/superuser/db/UidPolicy;->command:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    const-string v2, "uid"

    iget v3, p2, Lcom/koushikdutta/superuser/db/UidPolicy;->uid:I

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 157
    const-string v2, "desiredUid"

    iget v3, p2, Lcom/koushikdutta/superuser/db/UidPolicy;->desiredUid:I

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 158
    invoke-virtual {v1, v0}, Lcom/koushikdutta/superuser/LogNativeFragment;->setArguments(Landroid/os/Bundle;)V

    .line 160
    .end local v0    # "args":Landroid/os/Bundle;
    :cond_0
    invoke-virtual {v1}, Lcom/koushikdutta/superuser/LogNativeFragment;->getInternal()Lcom/koushikdutta/widgets/FragmentInterface;

    move-result-object v2

    check-cast v2, Lcom/koushikdutta/superuser/LogFragmentInternal;

    invoke-virtual {p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->getFragment()Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;

    move-result-object v3

    invoke-interface {v3}, Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;->getId()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/koushikdutta/superuser/LogFragmentInternal;->setListContentId(I)V

    .line 161
    return-object v1
.end method

.method showAllLogs()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 63
    invoke-virtual {p0, v0, v0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->setContent(Lcom/koushikdutta/widgets/ListItem;Lcom/koushikdutta/superuser/db/UidPolicy;)V

    .line 64
    invoke-virtual {p0}, Lcom/koushikdutta/superuser/PolicyFragmentInternal;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ListView;->clearChoices()V

    .line 65
    return-void
.end method
