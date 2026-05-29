package com.jellybyn.settings.users;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.text.Editable;
import android.text.TextUtils;
import android.widget.EditText;
import android.widget.TextView;

class AppRestrictionsFragment$4 implements OnClickListener {
    final /* synthetic */ AppRestrictionsFragment this$0;
    final /* synthetic */ EditText val$userNameView;

    public void onClick(DialogInterface dialogInterface, int i) {
        if (i == -1) {
            Editable text = this.val$userNameView.getText();
            if (!TextUtils.isEmpty(text)) {
                CharSequence text2 = AppRestrictionsFragment.access$1600(this.this$0).getText();
                if (text2 == null || !text.toString().equals(text2.toString())) {
                    ((TextView) AppRestrictionsFragment.access$1700(this.this$0).findViewById(16908310)).setText(text.toString());
                    AppRestrictionsFragment.access$1200(this.this$0).setUserName(AppRestrictionsFragment.access$1100(this.this$0).getIdentifier(), text.toString());
                }
            }
            Drawable newUserPhotoDrawable = AppRestrictionsFragment.access$1800(this.this$0).getNewUserPhotoDrawable();
            Bitmap newUserPhotoBitmap = AppRestrictionsFragment.access$1800(this.this$0).getNewUserPhotoBitmap();
            if (!(newUserPhotoDrawable == null || newUserPhotoBitmap == null || newUserPhotoDrawable.equals(AppRestrictionsFragment.access$1900(this.this$0).getDrawable()))) {
                AppRestrictionsFragment.access$1900(this.this$0).setImageDrawable(newUserPhotoDrawable);
                new 1(this).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, (Void[]) null);
            }
            AppRestrictionsFragment.access$2000(this.this$0, 1);
        }
        AppRestrictionsFragment.access$1500(this.this$0);
    }

    AppRestrictionsFragment$4(AppRestrictionsFragment appRestrictionsFragment, EditText editText) {
        this.this$0 = appRestrictionsFragment;
        this.val$userNameView = editText;
    }
}