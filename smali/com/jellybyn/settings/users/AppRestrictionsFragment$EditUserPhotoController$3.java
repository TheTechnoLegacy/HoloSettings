package com.jellybyn.settings.users;

import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListPopupWindow;
import com.jellybyn.settings.users.AppRestrictionsFragment.EditUserPhotoController;
import com.jellybyn.settings.users.AppRestrictionsFragment.EditUserPhotoController.AdapterItem;
import java.util.List;

class AppRestrictionsFragment$EditUserPhotoController$3 implements OnItemClickListener {
    final /* synthetic */ EditUserPhotoController this$0;
    final /* synthetic */ List val$items;
    final /* synthetic */ ListPopupWindow val$listPopupWindow;

    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        switch (((AdapterItem) this.val$items.get(i)).id) {
            case 1:
                EditUserPhotoController.access$2700(this.this$0);
                this.val$listPopupWindow.dismiss();
                return;
            case 2:
                EditUserPhotoController.access$2800(this.this$0);
                this.val$listPopupWindow.dismiss();
                return;
            default:
                return;
        }
    }

    AppRestrictionsFragment$EditUserPhotoController$3(EditUserPhotoController editUserPhotoController, List list, ListPopupWindow listPopupWindow) {
        this.this$0 = editUserPhotoController;
        this.val$items = list;
        this.val$listPopupWindow = listPopupWindow;
    }
}