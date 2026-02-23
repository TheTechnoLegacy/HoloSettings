.class public Lcom/androie/settings/DebugIntentSender;
.super Landroid/app/Activity;
.source "DebugIntentSender.java"


# instance fields
.field private mAccountField:Landroid/widget/EditText;

.field private mClicked:Landroid/view/View$OnClickListener;

.field private mDataField:Landroid/widget/EditText;

.field private mIntentField:Landroid/widget/EditText;

.field private mResourceField:Landroid/widget/EditText;

.field private mSendBroadcastButton:Landroid/widget/Button;

.field private mStartActivityButton:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 40
    new-instance v0, Lcom/androie/settings/DebugIntentSender$1;

    invoke-direct {v0, p0}, Lcom/androie/settings/DebugIntentSender$1;-><init>(Lcom/androie/settings/DebugIntentSender;)V

    iput-object v0, p0, Lcom/androie/settings/DebugIntentSender;->mClicked:Landroid/view/View$OnClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/DebugIntentSender;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DebugIntentSender;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/androie/settings/DebugIntentSender;->mSendBroadcastButton:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$100(Lcom/androie/settings/DebugIntentSender;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DebugIntentSender;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/androie/settings/DebugIntentSender;->mStartActivityButton:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$200(Lcom/androie/settings/DebugIntentSender;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DebugIntentSender;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/androie/settings/DebugIntentSender;->mIntentField:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$300(Lcom/androie/settings/DebugIntentSender;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DebugIntentSender;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/androie/settings/DebugIntentSender;->mDataField:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$400(Lcom/androie/settings/DebugIntentSender;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DebugIntentSender;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/androie/settings/DebugIntentSender;->mAccountField:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$500(Lcom/androie/settings/DebugIntentSender;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DebugIntentSender;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/androie/settings/DebugIntentSender;->mResourceField:Landroid/widget/EditText;

    return-object v0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 69
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 70
    const v0, 0x7f04004c

    invoke-virtual {p0, v0}, Lcom/androie/settings/DebugIntentSender;->setContentView(I)V

    .line 72
    const v0, 0x7f0c00e1

    invoke-virtual {p0, v0}, Lcom/androie/settings/DebugIntentSender;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/androie/settings/DebugIntentSender;->mIntentField:Landroid/widget/EditText;

    .line 73
    iget-object v0, p0, Lcom/androie/settings/DebugIntentSender;->mIntentField:Landroid/widget/EditText;

    const-string v1, "android.intent.action.SYNC"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 74
    iget-object v0, p0, Lcom/androie/settings/DebugIntentSender;->mIntentField:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Selection;->selectAll(Landroid/text/Spannable;)V

    .line 76
    const v0, 0x7f0c00e2

    invoke-virtual {p0, v0}, Lcom/androie/settings/DebugIntentSender;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/androie/settings/DebugIntentSender;->mDataField:Landroid/widget/EditText;

    .line 77
    iget-object v0, p0, Lcom/androie/settings/DebugIntentSender;->mDataField:Landroid/widget/EditText;

    const v1, 0x1080018

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackgroundResource(I)V

    .line 79
    const v0, 0x7f0c00e3

    invoke-virtual {p0, v0}, Lcom/androie/settings/DebugIntentSender;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/androie/settings/DebugIntentSender;->mAccountField:Landroid/widget/EditText;

    .line 80
    const v0, 0x7f0c00e4

    invoke-virtual {p0, v0}, Lcom/androie/settings/DebugIntentSender;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/androie/settings/DebugIntentSender;->mResourceField:Landroid/widget/EditText;

    .line 82
    const v0, 0x7f0c00e5

    invoke-virtual {p0, v0}, Lcom/androie/settings/DebugIntentSender;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/androie/settings/DebugIntentSender;->mSendBroadcastButton:Landroid/widget/Button;

    .line 83
    iget-object v0, p0, Lcom/androie/settings/DebugIntentSender;->mSendBroadcastButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/androie/settings/DebugIntentSender;->mClicked:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 85
    const v0, 0x7f0c00e6

    invoke-virtual {p0, v0}, Lcom/androie/settings/DebugIntentSender;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/androie/settings/DebugIntentSender;->mStartActivityButton:Landroid/widget/Button;

    .line 86
    iget-object v0, p0, Lcom/androie/settings/DebugIntentSender;->mStartActivityButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/androie/settings/DebugIntentSender;->mClicked:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    return-void
.end method
