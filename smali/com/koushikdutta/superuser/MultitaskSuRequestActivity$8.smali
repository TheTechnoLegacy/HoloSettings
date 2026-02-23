.class Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8;
.super Ljava/lang/Thread;
.source "MultitaskSuRequestActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;->manageSocket()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;


# direct methods
.method constructor <init>(Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;)V
    .locals 0

    .prologue
    .line 301
    iput-object p1, p0, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8;->this$0:Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 17

    .prologue
    .line 305
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8;->this$0:Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;

    new-instance v14, Landroid/net/LocalSocket;

    invoke-direct {v14}, Landroid/net/LocalSocket;-><init>()V

    iput-object v14, v13, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;->mSocket:Landroid/net/LocalSocket;

    .line 306
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8;->this$0:Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;

    iget-object v13, v13, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;->mSocket:Landroid/net/LocalSocket;

    new-instance v14, Landroid/net/LocalSocketAddress;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8;->this$0:Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;

    iget-object v15, v15, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;->mSocketPath:Ljava/lang/String;

    sget-object v16, Landroid/net/LocalSocketAddress$Namespace;->FILESYSTEM:Landroid/net/LocalSocketAddress$Namespace;

    invoke-direct/range {v14 .. v16}, Landroid/net/LocalSocketAddress;-><init>(Ljava/lang/String;Landroid/net/LocalSocketAddress$Namespace;)V

    invoke-virtual {v13, v14}, Landroid/net/LocalSocket;->connect(Landroid/net/LocalSocketAddress;)V

    .line 308
    new-instance v7, Ljava/io/DataInputStream;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8;->this$0:Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;

    iget-object v13, v13, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v13}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v13

    invoke-direct {v7, v13}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 310
    .local v7, "is":Ljava/io/DataInputStream;
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 313
    .local v11, "payload":Landroid/content/ContentValues;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    const/16 v13, 0x14

    if-ge v6, v13, :cond_3

    .line 314
    invoke-virtual {v7}, Ljava/io/DataInputStream;->readInt()I

    move-result v10

    .line 315
    .local v10, "nameLen":I
    const/16 v13, 0x14

    if-le v10, v13, :cond_1

    .line 316
    new-instance v13, Ljava/lang/IllegalArgumentException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "name length too long: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v13
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 352
    .end local v6    # "i":I
    .end local v7    # "is":Ljava/io/DataInputStream;
    .end local v10    # "nameLen":I
    .end local v11    # "payload":Landroid/content/ContentValues;
    :catch_0
    move-exception v5

    .line 353
    .local v5, "ex":Ljava/lang/Exception;
    const-string v13, "Superuser"

    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 355
    :try_start_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8;->this$0:Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;

    iget-object v13, v13, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v13}, Landroid/net/LocalSocket;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 359
    :goto_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8;->this$0:Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;

    new-instance v14, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8$2;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8$2;-><init>(Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8;)V

    invoke-virtual {v13, v14}, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 366
    .end local v5    # "ex":Ljava/lang/Exception;
    :cond_0
    :goto_2
    return-void

    .line 317
    .restart local v6    # "i":I
    .restart local v7    # "is":Ljava/io/DataInputStream;
    .restart local v10    # "nameLen":I
    .restart local v11    # "payload":Landroid/content/ContentValues;
    :cond_1
    :try_start_2
    new-array v9, v10, [B

    .line 318
    .local v9, "nameBytes":[B
    invoke-virtual {v7, v9}, Ljava/io/DataInputStream;->readFully([B)V

    .line 319
    new-instance v8, Ljava/lang/String;

    invoke-direct {v8, v9}, Ljava/lang/String;-><init>([B)V

    .line 320
    .local v8, "name":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    .line 321
    .local v4, "dataLen":I
    invoke-static {v8}, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;->access$000(Ljava/lang/String;)I

    move-result v13

    if-le v4, v13, :cond_2

    .line 322
    new-instance v13, Ljava/lang/IllegalArgumentException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " data length too long: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 323
    :cond_2
    new-array v3, v4, [B

    .line 324
    .local v3, "dataBytes":[B
    invoke-virtual {v7, v3}, Ljava/io/DataInputStream;->readFully([B)V

    .line 325
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>([B)V

    .line 326
    .local v2, "data":Ljava/lang/String;
    invoke-virtual {v11, v8, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 329
    const-string v13, "eof"

    invoke-virtual {v13, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 333
    .end local v2    # "data":Ljava/lang/String;
    .end local v3    # "dataBytes":[B
    .end local v4    # "dataLen":I
    .end local v8    # "name":Ljava/lang/String;
    .end local v9    # "nameBytes":[B
    .end local v10    # "nameLen":I
    :cond_3
    const-string v13, "version"

    invoke-virtual {v11, v13}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v12

    .line 334
    .local v12, "protocolVersion":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8;->this$0:Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;

    const-string v14, "from.uid"

    invoke-virtual {v11, v14}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    iput v14, v13, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;->mCallerUid:I

    .line 335
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8;->this$0:Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;

    const-string v14, "to.uid"

    invoke-virtual {v11, v14}, Landroid/content/ContentValues;->getAsByte(Ljava/lang/String;)Ljava/lang/Byte;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Byte;->byteValue()B

    move-result v14

    iput v14, v13, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;->mDesiredUid:I

    .line 336
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8;->this$0:Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;

    const-string v14, "command"

    invoke-virtual {v11, v14}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v13, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;->mDesiredCmd:Ljava/lang/String;

    .line 337
    const-string v13, "from.bin"

    invoke-virtual {v11, v13}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 338
    .local v1, "calledBin":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8;->this$0:Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;

    const-string v14, "pid"

    invoke-virtual {v11, v14}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    iput v14, v13, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;->mPid:I

    .line 339
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8;->this$0:Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;

    new-instance v14, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8$1;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8$1;-><init>(Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8;)V

    invoke-virtual {v13, v14}, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 347
    const-string v13, "com.koushikdutta.superuser"

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8;->this$0:Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;

    invoke-virtual {v14}, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 348
    sget-object v13, Lcom/koushikdutta/superuser/util/SuHelper;->CURRENT_VERSION:Ljava/lang/String;

    const-string v14, "binary.version"

    invoke-virtual {v11, v14}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_0

    .line 349
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/koushikdutta/superuser/MultitaskSuRequestActivity$8;->this$0:Lcom/koushikdutta/superuser/MultitaskSuRequestActivity;

    invoke-static {v13}, Lcom/koushikdutta/superuser/SuCheckerReceiver;->doNotification(Landroid/content/Context;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_2

    .line 313
    .end local v1    # "calledBin":Ljava/lang/String;
    .end local v12    # "protocolVersion":I
    .restart local v2    # "data":Ljava/lang/String;
    .restart local v3    # "dataBytes":[B
    .restart local v4    # "dataLen":I
    .restart local v8    # "name":Ljava/lang/String;
    .restart local v9    # "nameBytes":[B
    .restart local v10    # "nameLen":I
    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_0

    .line 357
    .end local v2    # "data":Ljava/lang/String;
    .end local v3    # "dataBytes":[B
    .end local v4    # "dataLen":I
    .end local v6    # "i":I
    .end local v7    # "is":Ljava/io/DataInputStream;
    .end local v8    # "name":Ljava/lang/String;
    .end local v9    # "nameBytes":[B
    .end local v10    # "nameLen":I
    .end local v11    # "payload":Landroid/content/ContentValues;
    .restart local v5    # "ex":Ljava/lang/Exception;
    :catch_1
    move-exception v13

    goto/16 :goto_1
.end method
