.class Lcom/androie/settings/profiles/ProfileConfig$StreamItem;
.super Ljava/lang/Object;
.source "ProfileConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/profiles/ProfileConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "StreamItem"
.end annotation


# instance fields
.field mCheckbox:Lcom/androie/settings/profiles/StreamVolumePreference;

.field mLabel:Ljava/lang/String;

.field mSettings:Landroid/app/StreamSettings;

.field mStreamId:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "streamId"    # I
    .param p2, "label"    # Ljava/lang/String;

    .prologue
    .line 436
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 437
    iput p1, p0, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;->mStreamId:I

    .line 438
    iput-object p2, p0, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;->mLabel:Ljava/lang/String;

    .line 439
    return-void
.end method
