.class Lcom/androie/settings/profiles/StreamVolumePreference$2;
.super Ljava/lang/Object;
.source "StreamVolumePreference.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/profiles/StreamVolumePreference;->createVolumeDialog()Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/profiles/StreamVolumePreference;


# direct methods
.method constructor <init>(Lcom/androie/settings/profiles/StreamVolumePreference;)V
    .locals 0

    .prologue
    .line 140
    iput-object p1, p0, Lcom/androie/settings/profiles/StreamVolumePreference$2;->this$0:Lcom/androie/settings/profiles/StreamVolumePreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 143
    return-void
.end method
