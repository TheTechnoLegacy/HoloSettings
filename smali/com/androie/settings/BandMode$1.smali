.class Lcom/androie/settings/BandMode$1;
.super Ljava/lang/Object;
.source "BandMode.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/BandMode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/BandMode;


# direct methods
.method constructor <init>(Lcom/androie/settings/BandMode;)V
    .locals 0

    .prologue
    .line 95
    iput-object p1, p0, Lcom/androie/settings/BandMode$1;->this$0:Lcom/androie/settings/BandMode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .param p1, "parent"    # Landroid/widget/AdapterView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 99
    iget-object v1, p0, Lcom/androie/settings/BandMode$1;->this$0:Lcom/androie/settings/BandMode;

    invoke-virtual {v1}, Lcom/androie/settings/BandMode;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, 0x5

    const/4 v3, -0x1

    invoke-virtual {v1, v2, v3}, Landroid/view/Window;->setFeatureInt(II)V

    .line 103
    iget-object v2, p0, Lcom/androie/settings/BandMode$1;->this$0:Lcom/androie/settings/BandMode;

    invoke-virtual {p1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v1

    invoke-interface {v1, p3}, Landroid/widget/Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/BandMode$BandListItem;

    invoke-static {v2, v1}, Lcom/androie/settings/BandMode;->access$002(Lcom/androie/settings/BandMode;Lcom/androie/settings/BandMode$BandListItem;)Lcom/androie/settings/BandMode$BandListItem;

    .line 107
    iget-object v1, p0, Lcom/androie/settings/BandMode$1;->this$0:Lcom/androie/settings/BandMode;

    invoke-static {v1}, Lcom/androie/settings/BandMode;->access$100(Lcom/androie/settings/BandMode;)Landroid/os/Handler;

    move-result-object v1

    const/16 v2, 0xc8

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 109
    .local v0, "msg":Landroid/os/Message;
    iget-object v1, p0, Lcom/androie/settings/BandMode$1;->this$0:Lcom/androie/settings/BandMode;

    invoke-static {v1}, Lcom/androie/settings/BandMode;->access$200(Lcom/androie/settings/BandMode;)Lcom/android/internal/telephony/Phone;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/BandMode$1;->this$0:Lcom/androie/settings/BandMode;

    invoke-static {v2}, Lcom/androie/settings/BandMode;->access$000(Lcom/androie/settings/BandMode;)Lcom/androie/settings/BandMode$BandListItem;

    move-result-object v2

    invoke-virtual {v2}, Lcom/androie/settings/BandMode$BandListItem;->getBand()I

    move-result v2

    invoke-interface {v1, v2, v0}, Lcom/android/internal/telephony/Phone;->setBandMode(ILandroid/os/Message;)V

    .line 110
    return-void
.end method
