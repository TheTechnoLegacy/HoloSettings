.class Lcom/androie/settings/CryptKeeper$DecryptTask;
.super Landroid/os/AsyncTask;
.source "CryptKeeper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/CryptKeeper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DecryptTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/CryptKeeper;


# direct methods
.method private constructor <init>(Lcom/androie/settings/CryptKeeper;)V
    .locals 0

    .prologue
    .line 145
    iput-object p1, p0, Lcom/androie/settings/CryptKeeper$DecryptTask;->this$0:Lcom/androie/settings/CryptKeeper;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/androie/settings/CryptKeeper;Lcom/androie/settings/CryptKeeper$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/androie/settings/CryptKeeper;
    .param p2, "x1"    # Lcom/androie/settings/CryptKeeper$1;

    .prologue
    .line 145
    invoke-direct {p0, p1}, Lcom/androie/settings/CryptKeeper$DecryptTask;-><init>(Lcom/androie/settings/CryptKeeper;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/Integer;
    .locals 4
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    .line 148
    iget-object v2, p0, Lcom/androie/settings/CryptKeeper$DecryptTask;->this$0:Lcom/androie/settings/CryptKeeper;

    invoke-static {v2}, Lcom/androie/settings/CryptKeeper;->access$000(Lcom/androie/settings/CryptKeeper;)Landroid/os/storage/IMountService;

    move-result-object v1

    .line 150
    .local v1, "service":Landroid/os/storage/IMountService;
    const/4 v2, 0x0

    :try_start_0
    aget-object v2, p1, v2

    invoke-interface {v1, v2}, Landroid/os/storage/IMountService;->decryptStorage(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 153
    :goto_0
    return-object v2

    .line 151
    :catch_0
    move-exception v0

    .line 152
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "CryptKeeper"

    const-string v3, "Error while decrypting..."

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 153
    const/4 v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 145
    check-cast p1, [Ljava/lang/String;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/androie/settings/CryptKeeper$DecryptTask;->doInBackground([Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Integer;)V
    .locals 3

    .prologue
    const/16 v1, 0x1e

    .line 159
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_0

    .line 164
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/androie/settings/CryptKeeper$DecryptTask;->this$0:Lcom/androie/settings/CryptKeeper;

    const-class v2, Lcom/androie/settings/CryptKeeper$FadeToBlack;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 165
    iget-object v1, p0, Lcom/androie/settings/CryptKeeper$DecryptTask;->this$0:Lcom/androie/settings/CryptKeeper;

    invoke-virtual {v1}, Lcom/androie/settings/CryptKeeper;->finish()V

    .line 166
    iget-object v1, p0, Lcom/androie/settings/CryptKeeper$DecryptTask;->this$0:Lcom/androie/settings/CryptKeeper;

    invoke-virtual {v1, v0}, Lcom/androie/settings/CryptKeeper;->startActivity(Landroid/content/Intent;)V

    .line 179
    :goto_0
    return-void

    .line 167
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v1, :cond_1

    .line 169
    iget-object v0, p0, Lcom/androie/settings/CryptKeeper$DecryptTask;->this$0:Lcom/androie/settings/CryptKeeper;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.MASTER_CLEAR"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/androie/settings/CryptKeeper;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0

    .line 170
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    rem-int/lit8 v0, v0, 0xa

    if-nez v0, :cond_2

    .line 171
    iget-object v0, p0, Lcom/androie/settings/CryptKeeper$DecryptTask;->this$0:Lcom/androie/settings/CryptKeeper;

    invoke-static {v0, v1}, Lcom/androie/settings/CryptKeeper;->access$102(Lcom/androie/settings/CryptKeeper;I)I

    .line 172
    iget-object v0, p0, Lcom/androie/settings/CryptKeeper$DecryptTask;->this$0:Lcom/androie/settings/CryptKeeper;

    invoke-static {v0}, Lcom/androie/settings/CryptKeeper;->access$200(Lcom/androie/settings/CryptKeeper;)V

    goto :goto_0

    .line 174
    :cond_2
    iget-object v0, p0, Lcom/androie/settings/CryptKeeper$DecryptTask;->this$0:Lcom/androie/settings/CryptKeeper;

    const v1, 0x7f0c0022

    invoke-virtual {v0, v1}, Lcom/androie/settings/CryptKeeper;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 175
    const v1, 0x7f08097e

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 177
    iget-object v0, p0, Lcom/androie/settings/CryptKeeper$DecryptTask;->this$0:Lcom/androie/settings/CryptKeeper;

    invoke-static {v0}, Lcom/androie/settings/CryptKeeper;->access$300(Lcom/androie/settings/CryptKeeper;)Landroid/widget/EditText;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setEnabled(Z)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 145
    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/androie/settings/CryptKeeper$DecryptTask;->onPostExecute(Ljava/lang/Integer;)V

    return-void
.end method
