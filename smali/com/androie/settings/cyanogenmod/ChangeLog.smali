.class public Lcom/androie/settings/cyanogenmod/ChangeLog;
.super Landroid/app/Fragment;
.source "ChangeLog.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 11
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 50
    const/4 v3, 0x0

    .line 51
    .local v3, "inputReader":Ljava/io/InputStreamReader;
    const/4 v0, 0x0

    .line 53
    .local v0, "data":Ljava/lang/StringBuilder;
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v9, 0x800

    invoke-direct {v1, v9}, Ljava/lang/StringBuilder;-><init>(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    .end local v0    # "data":Ljava/lang/StringBuilder;
    .local v1, "data":Ljava/lang/StringBuilder;
    const/16 v9, 0x800

    :try_start_1
    new-array v8, v9, [C

    .line 56
    .local v8, "tmp":[C
    new-instance v4, Ljava/io/FileReader;

    const-string v9, "/system/etc/CHANGELOG-CM.txt"

    invoke-direct {v4, v9}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 57
    .end local v3    # "inputReader":Ljava/io/InputStreamReader;
    .local v4, "inputReader":Ljava/io/InputStreamReader;
    :goto_0
    :try_start_2
    invoke-virtual {v4, v8}, Ljava/io/InputStreamReader;->read([C)I

    move-result v5

    .local v5, "numRead":I
    if-ltz v5, :cond_1

    .line 58
    const/4 v9, 0x0

    invoke-virtual {v1, v8, v9, v5}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_0

    .line 60
    .end local v5    # "numRead":I
    :catch_0
    move-exception v2

    move-object v0, v1

    .end local v1    # "data":Ljava/lang/StringBuilder;
    .restart local v0    # "data":Ljava/lang/StringBuilder;
    move-object v3, v4

    .line 61
    .end local v4    # "inputReader":Ljava/io/InputStreamReader;
    .end local v8    # "tmp":[C
    .local v2, "e":Ljava/io/IOException;
    .restart local v3    # "inputReader":Ljava/io/InputStreamReader;
    :goto_1
    const v9, 0x7f0801d6

    :try_start_3
    invoke-virtual {p0, v9}, Lcom/androie/settings/cyanogenmod/ChangeLog;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 64
    if-eqz v3, :cond_0

    .line 65
    :try_start_4
    invoke-virtual {v3}, Ljava/io/InputStreamReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 71
    .end local v2    # "e":Ljava/io/IOException;
    :cond_0
    :goto_2
    new-instance v7, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/ChangeLog;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-direct {v7, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 72
    .local v7, "textView":Landroid/widget/TextView;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    new-instance v6, Landroid/widget/ScrollView;

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/ChangeLog;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-direct {v6, v9}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 75
    .local v6, "scrollView":Landroid/widget/ScrollView;
    invoke-virtual {v6, v7}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 77
    return-object v6

    .line 64
    .end local v0    # "data":Ljava/lang/StringBuilder;
    .end local v3    # "inputReader":Ljava/io/InputStreamReader;
    .end local v6    # "scrollView":Landroid/widget/ScrollView;
    .end local v7    # "textView":Landroid/widget/TextView;
    .restart local v1    # "data":Ljava/lang/StringBuilder;
    .restart local v4    # "inputReader":Ljava/io/InputStreamReader;
    .restart local v5    # "numRead":I
    .restart local v8    # "tmp":[C
    :cond_1
    if-eqz v4, :cond_2

    .line 65
    :try_start_5
    invoke-virtual {v4}, Ljava/io/InputStreamReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    :cond_2
    move-object v0, v1

    .end local v1    # "data":Ljava/lang/StringBuilder;
    .restart local v0    # "data":Ljava/lang/StringBuilder;
    move-object v3, v4

    .line 68
    .end local v4    # "inputReader":Ljava/io/InputStreamReader;
    .restart local v3    # "inputReader":Ljava/io/InputStreamReader;
    goto :goto_2

    .line 67
    .end local v0    # "data":Ljava/lang/StringBuilder;
    .end local v3    # "inputReader":Ljava/io/InputStreamReader;
    .restart local v1    # "data":Ljava/lang/StringBuilder;
    .restart local v4    # "inputReader":Ljava/io/InputStreamReader;
    :catch_1
    move-exception v9

    move-object v0, v1

    .end local v1    # "data":Ljava/lang/StringBuilder;
    .restart local v0    # "data":Ljava/lang/StringBuilder;
    move-object v3, v4

    .line 69
    .end local v4    # "inputReader":Ljava/io/InputStreamReader;
    .restart local v3    # "inputReader":Ljava/io/InputStreamReader;
    goto :goto_2

    .line 63
    .end local v5    # "numRead":I
    .end local v8    # "tmp":[C
    :catchall_0
    move-exception v9

    .line 64
    :goto_3
    if-eqz v3, :cond_3

    .line 65
    :try_start_6
    invoke-virtual {v3}, Ljava/io/InputStreamReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 68
    :cond_3
    :goto_4
    throw v9

    .line 67
    .restart local v2    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v9

    goto :goto_2

    .end local v2    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v10

    goto :goto_4

    .line 63
    .end local v0    # "data":Ljava/lang/StringBuilder;
    .restart local v1    # "data":Ljava/lang/StringBuilder;
    :catchall_1
    move-exception v9

    move-object v0, v1

    .end local v1    # "data":Ljava/lang/StringBuilder;
    .restart local v0    # "data":Ljava/lang/StringBuilder;
    goto :goto_3

    .end local v0    # "data":Ljava/lang/StringBuilder;
    .end local v3    # "inputReader":Ljava/io/InputStreamReader;
    .restart local v1    # "data":Ljava/lang/StringBuilder;
    .restart local v4    # "inputReader":Ljava/io/InputStreamReader;
    .restart local v8    # "tmp":[C
    :catchall_2
    move-exception v9

    move-object v0, v1

    .end local v1    # "data":Ljava/lang/StringBuilder;
    .restart local v0    # "data":Ljava/lang/StringBuilder;
    move-object v3, v4

    .end local v4    # "inputReader":Ljava/io/InputStreamReader;
    .restart local v3    # "inputReader":Ljava/io/InputStreamReader;
    goto :goto_3

    .line 60
    .end local v8    # "tmp":[C
    :catch_4
    move-exception v2

    goto :goto_1

    .end local v0    # "data":Ljava/lang/StringBuilder;
    .restart local v1    # "data":Ljava/lang/StringBuilder;
    :catch_5
    move-exception v2

    move-object v0, v1

    .end local v1    # "data":Ljava/lang/StringBuilder;
    .restart local v0    # "data":Ljava/lang/StringBuilder;
    goto :goto_1
.end method
