.class Lcom/androie/settings/tts/TextToSpeechSettings$1;
.super Ljava/lang/Object;
.source "TextToSpeechSettings.java"

# interfaces
.implements Landroid/speech/tts/TextToSpeech$OnInitListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/tts/TextToSpeechSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/tts/TextToSpeechSettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/tts/TextToSpeechSettings;)V
    .locals 0

    .prologue
    .line 106
    iput-object p1, p0, Lcom/androie/settings/tts/TextToSpeechSettings$1;->this$0:Lcom/androie/settings/tts/TextToSpeechSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInit(I)V
    .locals 1
    .param p1, "status"    # I

    .prologue
    .line 109
    iget-object v0, p0, Lcom/androie/settings/tts/TextToSpeechSettings$1;->this$0:Lcom/androie/settings/tts/TextToSpeechSettings;

    invoke-virtual {v0, p1}, Lcom/androie/settings/tts/TextToSpeechSettings;->onInitEngine(I)V

    .line 110
    return-void
.end method
