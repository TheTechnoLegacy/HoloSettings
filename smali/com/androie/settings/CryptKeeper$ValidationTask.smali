.class Lcom/androie/settings/CryptKeeper$ValidationTask;
.super Landroid/os/AsyncTask;
.source "CryptKeeper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/CryptKeeper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ValidationTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/CryptKeeper;


# direct methods
.method private constructor <init>(Lcom/androie/settings/CryptKeeper;)V
    .locals 0

    .prologue
    .line 182
    iput-object p1, p0, Lcom/androie/settings/CryptKeeper$ValidationTask;->this$0:Lcom/androie/settings/CryptKeeper;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/androie/settings/CryptKeeper;Lcom/androie/settings/CryptKeeper$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/androie/settings/CryptKeeper;
    .param p2, "x1"    # Lcom/androie/settings/CryptKeeper$1;

    .prologue
    .line 182
    invoke-direct {p0, p1}, Lcom/androie/settings/CryptKeeper$ValidationTask;-><init>(Lcom/androie/settings/CryptKeeper;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 6
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    const/4 v4, 0x1

    .line 185
    iget-object v3, p0, Lcom/androie/settings/CryptKeeper$ValidationTask;->this$0:Lcom/androie/settings/CryptKeeper;

    invoke-static {v3}, Lcom/androie/settings/CryptKeeper;->access$000(Lcom/androie/settings/CryptKeeper;)Landroid/os/storage/IMountService;

    move-result-object v1

    .line 187
    .local v1, "service":Landroid/os/storage/IMountService;
    :try_start_0
    const-string v3, "CryptKeeper"

    const-string v5, "Validating encryption state."

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    invoke-interface {v1}, Landroid/os/storage/IMountService;->getEncryptionState()I

    move-result v2

    .line 189
    .local v2, "state":I
    if-ne v2, v4, :cond_0

    .line 190
    const-string v3, "CryptKeeper"

    const-string v5, "Unexpectedly in CryptKeeper even though there is no encryption."

    invoke-static {v3, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 196
    .end local v2    # "state":I
    :goto_0
    return-object v3

    .line 193
    .restart local v2    # "state":I
    :cond_0
    if-nez v2, :cond_1

    move v3, v4

    :goto_1
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    goto :goto_1

    .line 194
    .end local v2    # "state":I
    :catch_0
    move-exception v0

    .line 195
    .local v0, "e":Landroid/os/RemoteException;
    const-string v3, "CryptKeeper"

    const-string v5, "Unable to get encryption state properly"

    invoke-static {v3, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 182
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/androie/settings/CryptKeeper$ValidationTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    const/4 v2, 0x1

    .line 202
    iget-object v0, p0, Lcom/androie/settings/CryptKeeper$ValidationTask;->this$0:Lcom/androie/settings/CryptKeeper;

    invoke-static {v0, v2}, Lcom/androie/settings/CryptKeeper;->access$402(Lcom/androie/settings/CryptKeeper;Z)Z

    .line 203
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 204
    const-string v0, "CryptKeeper"

    const-string v1, "Incomplete, or corrupted encryption detected. Prompting user to wipe."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    iget-object v0, p0, Lcom/androie/settings/CryptKeeper$ValidationTask;->this$0:Lcom/androie/settings/CryptKeeper;

    invoke-static {v0, v2}, Lcom/androie/settings/CryptKeeper;->access$502(Lcom/androie/settings/CryptKeeper;Z)Z

    .line 209
    :goto_0
    iget-object v0, p0, Lcom/androie/settings/CryptKeeper$ValidationTask;->this$0:Lcom/androie/settings/CryptKeeper;

    invoke-static {v0}, Lcom/androie/settings/CryptKeeper;->access$600(Lcom/androie/settings/CryptKeeper;)V

    .line 210
    return-void

    .line 207
    :cond_0
    const-string v0, "CryptKeeper"

    const-string v1, "Encryption state validated. Proceeding to configure UI"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 182
    check-cast p1, Ljava/lang/Boolean;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/androie/settings/CryptKeeper$ValidationTask;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method
