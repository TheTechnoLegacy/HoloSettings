.class public Lcom/androie/settings/cyanogenmod/IconPicker;
.super Ljava/lang/Object;
.source "IconPicker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/cyanogenmod/IconPicker$IconAdapter;,
        Lcom/androie/settings/cyanogenmod/IconPicker$OnIconPickListener;
    }
.end annotation


# instance fields
.field private mIconListener:Lcom/androie/settings/cyanogenmod/IconPicker$OnIconPickListener;

.field private mParent:Landroid/app/Activity;

.field private mResources:Landroid/content/res/Resources;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/androie/settings/cyanogenmod/IconPicker$OnIconPickListener;)V
    .locals 1
    .param p1, "parent"    # Landroid/app/Activity;
    .param p2, "listener"    # Lcom/androie/settings/cyanogenmod/IconPicker$OnIconPickListener;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/IconPicker;->mParent:Landroid/app/Activity;

    .line 64
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/IconPicker;->mResources:Landroid/content/res/Resources;

    .line 65
    iput-object p2, p0, Lcom/androie/settings/cyanogenmod/IconPicker;->mIconListener:Lcom/androie/settings/cyanogenmod/IconPicker$OnIconPickListener;

    .line 66
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/cyanogenmod/IconPicker;ILjava/io/File;I)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/IconPicker;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/io/File;
    .param p3, "x3"    # I

    .prologue
    .line 45
    invoke-direct {p0, p1, p2, p3}, Lcom/androie/settings/cyanogenmod/IconPicker;->showChosen(ILjava/io/File;I)V

    return-void
.end method

.method static synthetic access$100(Lcom/androie/settings/cyanogenmod/IconPicker;)Lcom/androie/settings/cyanogenmod/IconPicker$OnIconPickListener;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/IconPicker;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/IconPicker;->mIconListener:Lcom/androie/settings/cyanogenmod/IconPicker$OnIconPickListener;

    return-object v0
.end method

.method static synthetic access$200(Lcom/androie/settings/cyanogenmod/IconPicker;)Landroid/content/res/Resources;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/IconPicker;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/IconPicker;->mResources:Landroid/content/res/Resources;

    return-object v0
.end method

.method static synthetic access$300(Lcom/androie/settings/cyanogenmod/IconPicker;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/IconPicker;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/IconPicker;->mParent:Landroid/app/Activity;

    return-object v0
.end method

.method private showChosen(ILjava/io/File;I)V
    .locals 11
    .param p1, "type"    # I
    .param p2, "image"    # Ljava/io/File;
    .param p3, "fragmentId"    # I

    .prologue
    const/16 v10, 0xa2

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 107
    if-nez p1, :cond_1

    .line 108
    new-instance v5, Landroid/widget/ListView;

    iget-object v6, p0, Lcom/androie/settings/cyanogenmod/IconPicker;->mParent:Landroid/app/Activity;

    invoke-direct {v5, v6}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 109
    .local v5, "list":Landroid/widget/ListView;
    new-instance v0, Lcom/androie/settings/cyanogenmod/IconPicker$IconAdapter;

    invoke-direct {v0, p0}, Lcom/androie/settings/cyanogenmod/IconPicker$IconAdapter;-><init>(Lcom/androie/settings/cyanogenmod/IconPicker;)V

    .line 111
    .local v0, "adapter":Lcom/androie/settings/cyanogenmod/IconPicker$IconAdapter;
    new-instance v1, Landroid/app/Dialog;

    iget-object v6, p0, Lcom/androie/settings/cyanogenmod/IconPicker;->mParent:Landroid/app/Activity;

    invoke-direct {v1, v6}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 112
    .local v1, "dialog":Landroid/app/Dialog;
    const v6, 0x7f08013d

    invoke-virtual {v1, v6}, Landroid/app/Dialog;->setTitle(I)V

    .line 113
    invoke-virtual {v1, v5}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 115
    invoke-virtual {v5, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 116
    new-instance v6, Lcom/androie/settings/cyanogenmod/IconPicker$2;

    invoke-direct {v6, p0, v0, p1, v1}, Lcom/androie/settings/cyanogenmod/IconPicker$2;-><init>(Lcom/androie/settings/cyanogenmod/IconPicker;Lcom/androie/settings/cyanogenmod/IconPicker$IconAdapter;ILandroid/app/Dialog;)V

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 125
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 148
    .end local v0    # "adapter":Lcom/androie/settings/cyanogenmod/IconPicker$IconAdapter;
    .end local v1    # "dialog":Landroid/app/Dialog;
    .end local v5    # "list":Landroid/widget/ListView;
    :cond_0
    :goto_0
    return-void

    .line 126
    :cond_1
    if-ne p1, v8, :cond_2

    .line 127
    new-instance v4, Landroid/content/Intent;

    const-string v6, "android.intent.action.GET_CONTENT"

    const/4 v7, 0x0

    invoke-direct {v4, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 128
    .local v4, "intent":Landroid/content/Intent;
    const-string v6, "image/*"

    invoke-virtual {v4, v6}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 129
    const-string v6, "crop"

    const-string v7, "true"

    invoke-virtual {v4, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 130
    const-string v6, "scale"

    invoke-virtual {v4, v6, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 131
    const-string v6, "scaleUpIfNeeded"

    invoke-virtual {v4, v6, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 132
    const-string v6, "outputFormat"

    sget-object v7, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v7}, Landroid/graphics/Bitmap$CompressFormat;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 133
    const-string v6, "aspectX"

    invoke-virtual {v4, v6, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 134
    const-string v6, "aspectY"

    invoke-virtual {v4, v6, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 135
    const-string v6, "outputX"

    invoke-virtual {v4, v6, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 136
    const-string v6, "outputY"

    invoke-virtual {v4, v6, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 138
    :try_start_0
    const-string v6, "output"

    invoke-static {p2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 139
    const-string v6, "return-data"

    const/4 v7, 0x0

    invoke-virtual {v4, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 140
    invoke-direct {p0, v4, p1, p3}, Lcom/androie/settings/cyanogenmod/IconPicker;->startFragmentOrActivityForResult(Landroid/content/Intent;II)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 141
    :catch_0
    move-exception v2

    .line 142
    .local v2, "e":Landroid/content/ActivityNotFoundException;
    invoke-virtual {v2}, Landroid/content/ActivityNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 144
    .end local v2    # "e":Landroid/content/ActivityNotFoundException;
    .end local v4    # "intent":Landroid/content/Intent;
    :cond_2
    const/4 v6, 0x2

    if-ne p1, v6, :cond_0

    .line 145
    new-instance v3, Landroid/content/Intent;

    const-string v6, "com.cyanogenmod.ACTION_PICK_ICON"

    invoke-direct {v3, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 146
    .local v3, "iconPackIntent":Landroid/content/Intent;
    invoke-direct {p0, v3, p1, p3}, Lcom/androie/settings/cyanogenmod/IconPicker;->startFragmentOrActivityForResult(Landroid/content/Intent;II)V

    goto :goto_0
.end method

.method private startFragmentOrActivityForResult(Landroid/content/Intent;II)V
    .locals 2
    .param p1, "pickIntent"    # Landroid/content/Intent;
    .param p2, "requestCode"    # I
    .param p3, "fragmentId"    # I

    .prologue
    .line 96
    if-nez p3, :cond_1

    .line 97
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/IconPicker;->mParent:Landroid/app/Activity;

    invoke-virtual {v1, p1, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 104
    :cond_0
    :goto_0
    return-void

    .line 99
    :cond_1
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/IconPicker;->mParent:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1, p3}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v0

    .line 100
    .local v0, "fragment":Landroid/app/Fragment;
    if-eqz v0, :cond_0

    .line 101
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/IconPicker;->mParent:Landroid/app/Activity;

    invoke-virtual {v1, v0, p1, p2}, Landroid/app/Activity;->startActivityFromFragment(Landroid/app/Fragment;Landroid/content/Intent;I)V

    goto :goto_0
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/IconPicker;->mIconListener:Lcom/androie/settings/cyanogenmod/IconPicker$OnIconPickListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/androie/settings/cyanogenmod/IconPicker$OnIconPickListener;->iconPicked(IILandroid/content/Intent;)V

    .line 70
    return-void
.end method

.method public pickIcon(ILjava/io/File;)V
    .locals 7
    .param p1, "fragmentId"    # I
    .param p2, "image"    # Ljava/io/File;

    .prologue
    const/4 v4, 0x2

    .line 73
    new-instance v1, Landroid/content/Intent;

    const-string v3, "com.cyanogenmod.ACTION_PICK_ICON"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 74
    .local v1, "iconPackIntent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/IconPicker;->mParent:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v0

    .line 76
    .local v0, "component":Landroid/content/ComponentName;
    if-eqz v0, :cond_1

    const/4 v3, 0x3

    :goto_0
    new-array v2, v3, [Ljava/lang/String;

    .line 77
    .local v2, "items":[Ljava/lang/String;
    const/4 v3, 0x0

    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/IconPicker;->mResources:Landroid/content/res/Resources;

    const v6, 0x7f080156

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v3

    .line 78
    const/4 v3, 0x1

    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/IconPicker;->mResources:Landroid/content/res/Resources;

    const v6, 0x7f080157

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v3

    .line 79
    if-eqz v0, :cond_0

    .line 80
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/IconPicker;->mResources:Landroid/content/res/Resources;

    const v5, 0x7f080158

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    .line 83
    :cond_0
    new-instance v3, Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/IconPicker;->mParent:Landroid/app/Activity;

    invoke-direct {v3, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f080155

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    new-instance v4, Lcom/androie/settings/cyanogenmod/IconPicker$1;

    invoke-direct {v4, p0, p2, p1}, Lcom/androie/settings/cyanogenmod/IconPicker$1;-><init>(Lcom/androie/settings/cyanogenmod/IconPicker;Ljava/io/File;I)V

    invoke-virtual {v3, v2, v4}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 92
    return-void

    .end local v2    # "items":[Ljava/lang/String;
    :cond_1
    move v3, v4

    .line 76
    goto :goto_0
.end method
