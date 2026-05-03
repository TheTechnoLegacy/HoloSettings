.class final enum Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;
.super Ljava/lang/Enum;
.source "TrustedCredentialsSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/TrustedCredentialsSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "Tab"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

.field public static final enum SYSTEM:Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

.field public static final enum USER:Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;


# instance fields
.field private final mCheckbox:Z

.field private final mLabel:I

.field private final mList:I

.field private final mProgress:I

.field private final mTag:Ljava/lang/String;

.field private final mView:I


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .prologue
    const/4 v8, 0x1

    const/4 v2, 0x0

    .line 55
    new-instance v0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    const-string v1, "SYSTEM"

    const-string v3, "system"

    const v4, 0x7f0b06b9

    const v5, 0x7f080149

    const v6, 0x7f08014a

    const v7, 0x7f08014b

    invoke-direct/range {v0 .. v8}, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;-><init>(Ljava/lang/String;ILjava/lang/String;IIIIZ)V

    sput-object v0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->SYSTEM:Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    .line 61
    new-instance v6, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    const-string v7, "USER"

    const-string v9, "user"

    const v10, 0x7f0b06ba

    const v11, 0x7f08014c

    const v12, 0x7f08014d

    const v13, 0x7f08014e

    move v14, v2

    invoke-direct/range {v6 .. v14}, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;-><init>(Ljava/lang/String;ILjava/lang/String;IIIIZ)V

    sput-object v6, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->USER:Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    .line 54
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    sget-object v1, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->SYSTEM:Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    aput-object v1, v0, v2

    sget-object v1, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->USER:Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    aput-object v1, v0, v8

    sput-object v0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->$VALUES:[Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;IIIIZ)V
    .locals 0
    .param p3, "tag"    # Ljava/lang/String;
    .param p4, "label"    # I
    .param p5, "view"    # I
    .param p6, "progress"    # I
    .param p7, "list"    # I
    .param p8, "checkbox"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "IIIIZ)V"
        }
    .end annotation

    .prologue
    .line 74
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 75
    iput-object p3, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->mTag:Ljava/lang/String;

    .line 76
    iput p4, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->mLabel:I

    .line 77
    iput p5, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->mView:I

    .line 78
    iput p6, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->mProgress:I

    .line 79
    iput p7, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->mList:I

    .line 80
    iput-boolean p8, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->mCheckbox:Z

    .line 81
    return-void
.end method

.method static synthetic access$1800(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;)Z
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    .prologue
    .line 54
    iget-boolean v0, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->mCheckbox:Z

    return v0
.end method

.method static synthetic access$2100(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;)I
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    .prologue
    .line 54
    iget v0, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->mProgress:I

    return v0
.end method

.method static synthetic access$2300(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;
    .param p1, "x1"    # Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->getAliases(Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2500(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;
    .param p1, "x1"    # Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-direct {p0, p1, p2}, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->deleted(Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$2700(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)I
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;
    .param p1, "x1"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->getButtonLabel(Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)I

    move-result v0

    return v0
.end method

.method static synthetic access$2800(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)I
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;
    .param p1, "x1"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->getButtonConfirmation(Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)I

    move-result v0

    return v0
.end method

.method static synthetic access$3200(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;ZLcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)V
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;

    .prologue
    .line 54
    invoke-direct {p0, p1, p2}, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->postOperationUpdate(ZLcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)V

    return-void
.end method

.method static synthetic access$500(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;)I
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    .prologue
    .line 54
    iget v0, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->mView:I

    return v0
.end method

.method static synthetic access$600(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;)I
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    .prologue
    .line 54
    iget v0, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->mLabel:I

    return v0
.end method

.method static synthetic access$700(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->mTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$800(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;)I
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    .prologue
    .line 54
    iget v0, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->mList:I

    return v0
.end method

.method private deleted(Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;Ljava/lang/String;)Z
    .locals 3
    .param p1, "store"    # Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;
    .param p2, "alias"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 92
    sget-object v1, Lcom/jellybyn/settings/TrustedCredentialsSettings$4;->$SwitchMap$com$android$settings$TrustedCredentialsSettings$Tab:[I

    invoke-virtual {p0}, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 98
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 94
    :pswitch_0
    invoke-virtual {p1, p2}, Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;->containsAlias(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    .line 96
    :cond_0
    :pswitch_1
    return v0

    .line 92
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private getAliases(Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;)Ljava/util/Set;
    .locals 2
    .param p1, "store"    # Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 83
    sget-object v0, Lcom/jellybyn/settings/TrustedCredentialsSettings$4;->$SwitchMap$com$android$settings$TrustedCredentialsSettings$Tab:[I

    invoke-virtual {p0}, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 89
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 85
    :pswitch_0
    invoke-virtual {p1}, Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;->allSystemAliases()Ljava/util/Set;

    move-result-object v0

    .line 87
    :goto_0
    return-object v0

    :pswitch_1
    invoke-virtual {p1}, Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;->userAliases()Ljava/util/Set;

    move-result-object v0

    goto :goto_0

    .line 83
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private getButtonConfirmation(Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)I
    .locals 2
    .param p1, "certHolder"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;

    .prologue
    .line 113
    sget-object v0, Lcom/jellybyn/settings/TrustedCredentialsSettings$4;->$SwitchMap$com$android$settings$TrustedCredentialsSettings$Tab:[I

    invoke-virtual {p0}, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 122
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 115
    :pswitch_0
    invoke-static {p1}, Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;->access$000(Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 116
    const v0, 0x7f0b06be

    .line 120
    :goto_0
    return v0

    .line 118
    :cond_0
    const v0, 0x7f0b06bf

    goto :goto_0

    .line 120
    :pswitch_1
    const v0, 0x7f0b06c0

    goto :goto_0

    .line 113
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private getButtonLabel(Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)I
    .locals 2
    .param p1, "certHolder"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;

    .prologue
    .line 101
    sget-object v0, Lcom/jellybyn/settings/TrustedCredentialsSettings$4;->$SwitchMap$com$android$settings$TrustedCredentialsSettings$Tab:[I

    invoke-virtual {p0}, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 110
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 103
    :pswitch_0
    invoke-static {p1}, Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;->access$000(Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 104
    const v0, 0x7f0b06bc

    .line 108
    :goto_0
    return v0

    .line 106
    :cond_0
    const v0, 0x7f0b06bb

    goto :goto_0

    .line 108
    :pswitch_1
    const v0, 0x7f0b06bd

    goto :goto_0

    .line 101
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private postOperationUpdate(ZLcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)V
    .locals 1
    .param p1, "ok"    # Z
    .param p2, "certHolder"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;

    .prologue
    .line 125
    if-eqz p1, :cond_2

    .line 126
    invoke-static {p2}, Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;->access$100(Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    move-result-object v0

    iget-boolean v0, v0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->mCheckbox:Z

    if-eqz v0, :cond_1

    .line 127
    invoke-static {p2}, Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;->access$000(Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {p2, v0}, Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;->access$002(Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;Z)Z

    .line 131
    :goto_1
    invoke-static {p2}, Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;->access$200(Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)Lcom/jellybyn/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/jellybyn/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;->notifyDataSetChanged()V

    .line 136
    :goto_2
    return-void

    .line 127
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 129
    :cond_1
    invoke-static {p2}, Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;->access$200(Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)Lcom/jellybyn/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;

    move-result-object v0

    invoke-static {v0}, Lcom/jellybyn/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;->access$300(Lcom/jellybyn/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    .line 134
    :cond_2
    invoke-static {p2}, Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;->access$200(Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)Lcom/jellybyn/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;

    move-result-object v0

    invoke-static {v0}, Lcom/jellybyn/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;->access$400(Lcom/jellybyn/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;)V

    goto :goto_2
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;
    .locals 1

    .prologue
    .line 54
    const-class v0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    return-object v0
.end method

.method public static values()[Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;
    .locals 1

    .prologue
    .line 54
    sget-object v0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->$VALUES:[Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    invoke-virtual {v0}, [Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    return-object v0
.end method
