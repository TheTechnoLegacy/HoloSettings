.class Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;
.super Ljava/lang/Object;
.source "MiscFilesHandler.java"

# interfaces
.implements Landroid/widget/AbsListView$MultiChoiceModeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/deviceinfo/MiscFilesHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ModeCallback"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mDataCount:I

.field final synthetic this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;


# direct methods
.method public constructor <init>(Lcom/androie/settings/deviceinfo/MiscFilesHandler;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iput-object p2, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->mContext:Landroid/content/Context;

    .line 87
    invoke-static {p1}, Lcom/androie/settings/deviceinfo/MiscFilesHandler;->access$000(Lcom/androie/settings/deviceinfo/MiscFilesHandler;)Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;->getCount()I

    move-result v0

    iput v0, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->mDataCount:I

    .line 88
    return-void
.end method


# virtual methods
.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .locals 11
    .param p1, "mode"    # Landroid/view/ActionMode;
    .param p2, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v2, 0x1

    .line 101
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    invoke-virtual {v0}, Lcom/androie/settings/deviceinfo/MiscFilesHandler;->getListView()Landroid/widget/ListView;

    move-result-object v9

    .line 102
    .local v9, "lv":Landroid/widget/ListView;
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 141
    :goto_0
    return v2

    .line 105
    :pswitch_0
    invoke-virtual {v9}, Landroid/widget/ListView;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v7

    .line 106
    .local v7, "checkedItems":Landroid/util/SparseBooleanArray;
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    invoke-virtual {v0}, Lcom/androie/settings/deviceinfo/MiscFilesHandler;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ListView;->getCheckedItemCount()I

    move-result v6

    .line 107
    .local v6, "checkedCount":I
    iget v0, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->mDataCount:I

    if-le v6, v0, :cond_0

    .line 108
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "checked item counts do not match. checkedCount: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", dataSize: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->mDataCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 111
    :cond_0
    iget v0, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->mDataCount:I

    if-lez v0, :cond_4

    .line 112
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 113
    .local v10, "toRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    iget v0, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->mDataCount:I

    if-ge v8, v0, :cond_3

    .line 114
    invoke-virtual {v7, v8}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 113
    :goto_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 118
    :cond_1
    sget-boolean v0, Lcom/androie/settings/deviceinfo/StorageMeasurement;->LOGV:Z

    if-eqz v0, :cond_2

    .line 119
    const-string v0, "MemorySettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "deleting: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    invoke-static {v3}, Lcom/androie/settings/deviceinfo/MiscFilesHandler;->access$000(Lcom/androie/settings/deviceinfo/MiscFilesHandler;)Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;

    move-result-object v3

    invoke-virtual {v3, v8}, Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;->getItem(I)Lcom/androie/settings/deviceinfo/StorageMeasurement$FileInfo;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    :cond_2
    new-instance v0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;

    iget-object v1, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    invoke-static {v1}, Lcom/androie/settings/deviceinfo/MiscFilesHandler;->access$000(Lcom/androie/settings/deviceinfo/MiscFilesHandler;)Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;

    move-result-object v1

    invoke-virtual {v1, v8}, Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;->getItem(I)Lcom/androie/settings/deviceinfo/StorageMeasurement$FileInfo;

    move-result-object v1

    iget-object v1, v1, Lcom/androie/settings/deviceinfo/StorageMeasurement$FileInfo;->mFileName:Ljava/lang/String;

    invoke-direct {v0, p0, v1}, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback$DeleteHandler;-><init>(Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;Ljava/lang/String;)V

    .line 123
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    invoke-static {v0}, Lcom/androie/settings/deviceinfo/MiscFilesHandler;->access$000(Lcom/androie/settings/deviceinfo/MiscFilesHandler;)Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;

    move-result-object v0

    invoke-virtual {v0, v8}, Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;->getItem(I)Lcom/androie/settings/deviceinfo/StorageMeasurement$FileInfo;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 125
    :cond_3
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    invoke-static {v0}, Lcom/androie/settings/deviceinfo/MiscFilesHandler;->access$000(Lcom/androie/settings/deviceinfo/MiscFilesHandler;)Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;

    move-result-object v0

    invoke-virtual {v0, v10}, Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;->removeAll(Ljava/util/List;)V

    .line 126
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    invoke-static {v0}, Lcom/androie/settings/deviceinfo/MiscFilesHandler;->access$000(Lcom/androie/settings/deviceinfo/MiscFilesHandler;)Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;->notifyDataSetChanged()V

    .line 127
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    invoke-static {v0}, Lcom/androie/settings/deviceinfo/MiscFilesHandler;->access$000(Lcom/androie/settings/deviceinfo/MiscFilesHandler;)Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;->getCount()I

    move-result v0

    iput v0, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->mDataCount:I

    .line 129
    .end local v8    # "i":I
    .end local v10    # "toRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_4
    invoke-virtual {p1}, Landroid/view/ActionMode;->finish()V

    goto/16 :goto_0

    .line 134
    .end local v6    # "checkedCount":I
    .end local v7    # "checkedItems":Landroid/util/SparseBooleanArray;
    :pswitch_1
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_3
    iget v0, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->mDataCount:I

    if-ge v8, v0, :cond_5

    .line 135
    invoke-virtual {v9, v8, v2}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 134
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 138
    :cond_5
    const-wide/16 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move v5, v2

    invoke-virtual/range {v0 .. v5}, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->onItemCheckedStateChanged(Landroid/view/ActionMode;IJZ)V

    goto/16 :goto_0

    .line 102
    :pswitch_data_0
    .packed-switch 0x7f0c02b2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 2
    .param p1, "mode"    # Landroid/view/ActionMode;
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 91
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    invoke-virtual {v1}, Lcom/androie/settings/deviceinfo/MiscFilesHandler;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 92
    .local v0, "inflater":Landroid/view/MenuInflater;
    const v1, 0x7f100006

    invoke-virtual {v0, v1, p2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 93
    const/4 v1, 0x1

    return v1
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .locals 0
    .param p1, "mode"    # Landroid/view/ActionMode;

    .prologue
    .line 176
    return-void
.end method

.method public onItemCheckedStateChanged(Landroid/view/ActionMode;IJZ)V
    .locals 12
    .param p1, "mode"    # Landroid/view/ActionMode;
    .param p2, "position"    # I
    .param p3, "id"    # J
    .param p5, "checked"    # Z

    .prologue
    .line 180
    iget-object v6, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    invoke-virtual {v6}, Lcom/androie/settings/deviceinfo/MiscFilesHandler;->getListView()Landroid/widget/ListView;

    move-result-object v2

    .line 181
    .local v2, "lv":Landroid/widget/ListView;
    invoke-virtual {v2}, Landroid/widget/ListView;->getCheckedItemCount()I

    move-result v3

    .line 182
    .local v3, "numChecked":I
    iget-object v6, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    invoke-static {v6}, Lcom/androie/settings/deviceinfo/MiscFilesHandler;->access$300(Lcom/androie/settings/deviceinfo/MiscFilesHandler;)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    iget-object v9, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    invoke-static {v9}, Lcom/androie/settings/deviceinfo/MiscFilesHandler;->access$000(Lcom/androie/settings/deviceinfo/MiscFilesHandler;)Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;

    move-result-object v9

    invoke-virtual {v9}, Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;->getCount()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Landroid/view/ActionMode;->setTitle(Ljava/lang/CharSequence;)V

    .line 185
    invoke-virtual {v2}, Landroid/widget/ListView;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v0

    .line 186
    .local v0, "checkedItems":Landroid/util/SparseBooleanArray;
    const-wide/16 v4, 0x0

    .line 187
    .local v4, "selectedDataSize":J
    if-lez v3, :cond_1

    .line 188
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v6, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->mDataCount:I

    if-ge v1, v6, :cond_1

    .line 189
    invoke-virtual {v0, v1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 191
    iget-object v6, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    invoke-static {v6}, Lcom/androie/settings/deviceinfo/MiscFilesHandler;->access$000(Lcom/androie/settings/deviceinfo/MiscFilesHandler;)Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;

    move-result-object v6

    invoke-virtual {v6, v1}, Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;->getItem(I)Lcom/androie/settings/deviceinfo/StorageMeasurement$FileInfo;

    move-result-object v6

    iget-wide v6, v6, Lcom/androie/settings/deviceinfo/StorageMeasurement$FileInfo;->mSize:J

    add-long/2addr v4, v6

    .line 188
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 195
    .end local v1    # "i":I
    :cond_1
    iget-object v6, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    invoke-static {v6}, Lcom/androie/settings/deviceinfo/MiscFilesHandler;->access$400(Lcom/androie/settings/deviceinfo/MiscFilesHandler;)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->mContext:Landroid/content/Context;

    invoke-static {v9, v4, v5}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    iget-object v9, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->mContext:Landroid/content/Context;

    iget-object v10, p0, Lcom/androie/settings/deviceinfo/MiscFilesHandler$ModeCallback;->this$0:Lcom/androie/settings/deviceinfo/MiscFilesHandler;

    invoke-static {v10}, Lcom/androie/settings/deviceinfo/MiscFilesHandler;->access$000(Lcom/androie/settings/deviceinfo/MiscFilesHandler;)Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;

    move-result-object v10

    invoke-virtual {v10}, Lcom/androie/settings/deviceinfo/MiscFilesHandler$MemoryMearurementAdapter;->getDataSize()J

    move-result-wide v10

    invoke-static {v9, v10, v11}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Landroid/view/ActionMode;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 198
    return-void
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 1
    .param p1, "mode"    # Landroid/view/ActionMode;
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 97
    const/4 v0, 0x1

    return v0
.end method
