.class final Lcom/androie/settings/RingerVolumePreference$SavedState$1;
.super Ljava/lang/Object;
.source "RingerVolumePreference.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/RingerVolumePreference$SavedState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/androie/settings/RingerVolumePreference$SavedState;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 528
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/androie/settings/RingerVolumePreference$SavedState;
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 530
    new-instance v0, Lcom/androie/settings/RingerVolumePreference$SavedState;

    invoke-direct {v0, p1}, Lcom/androie/settings/RingerVolumePreference$SavedState;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 528
    invoke-virtual {p0, p1}, Lcom/androie/settings/RingerVolumePreference$SavedState$1;->createFromParcel(Landroid/os/Parcel;)Lcom/androie/settings/RingerVolumePreference$SavedState;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/androie/settings/RingerVolumePreference$SavedState;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 534
    new-array v0, p1, [Lcom/androie/settings/RingerVolumePreference$SavedState;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 528
    invoke-virtual {p0, p1}, Lcom/androie/settings/RingerVolumePreference$SavedState$1;->newArray(I)[Lcom/androie/settings/RingerVolumePreference$SavedState;

    move-result-object v0

    return-object v0
.end method
