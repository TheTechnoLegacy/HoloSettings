.class final Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState$1;
.super Ljava/lang/Object;
.source "PieSizePreference.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState;
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
        "Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState;
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 129
    new-instance v0, Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState;

    invoke-direct {v0, p1}, Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 126
    invoke-virtual {p0, p1}, Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState$1;->createFromParcel(Landroid/os/Parcel;)Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 133
    new-array v0, p1, [Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 126
    invoke-virtual {p0, p1}, Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState$1;->newArray(I)[Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState;

    move-result-object v0

    return-object v0
.end method
