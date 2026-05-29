package com.jellybyn.settings.users;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import com.jellybyn.settings.users.AppRestrictionsFragment.EditUserPhotoController;
import java.io.File;

class AppRestrictionsFragment$EditUserPhotoController$2 extends AsyncTask<Void, Void, Bitmap> {
    final /* synthetic */ EditUserPhotoController this$0;

    protected void onPostExecute(Bitmap bitmap) {
        EditUserPhotoController.access$2302(this.this$0, bitmap);
        EditUserPhotoController.access$2402(this.this$0, CircleFramedDrawable.getInstance(EditUserPhotoController.access$2500(this.this$0).getContext(), EditUserPhotoController.access$2300(this.this$0)));
        EditUserPhotoController.access$2500(this.this$0).setImageDrawable(EditUserPhotoController.access$2400(this.this$0));
        new File(EditUserPhotoController.access$2200(this.this$0).getPath()).delete();
        new File(EditUserPhotoController.access$2600(this.this$0).getPath()).delete();
    }

    AppRestrictionsFragment$EditUserPhotoController$2(EditUserPhotoController editUserPhotoController) {
        this.this$0 = editUserPhotoController;
    }

    protected Bitmap doInBackground(Void... voidArr) {
        return BitmapFactory.decodeFile(EditUserPhotoController.access$2200(this.this$0).getPath());
    }
}