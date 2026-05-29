package com.jellybyn.settings.users;

import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.provider.ContactsContract.DisplayPhoto;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListPopupWindow;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

class AppRestrictionsFragment$EditUserPhotoController {
    private final Context mContext;
    private final Uri mCropPictureUri = createTempImageUri(this.mContext, "CropEditUserPhoto.jpg");
    private final Fragment mFragment;
    private final ImageView mImageView;
    private Bitmap mNewUserPhotoBitmap;
    private Drawable mNewUserPhotoDrawable;
    private final int mPhotoSize = getPhotoSize(this.mContext);
    private final Uri mTakePictureUri = createTempImageUri(this.mContext, "TakeEditUserPhoto2.jpg");

    private void showUpdatePhotoPopup() {
        boolean canTakePhoto = canTakePhoto();
        boolean canChoosePhoto = canChoosePhoto();
        if (canTakePhoto || canChoosePhoto) {
            Context context = this.mImageView.getContext();
            List<AdapterItem> items = new ArrayList();
            if (canTakePhoto()) {
                items.add(new AdapterItem(this.mImageView.getContext().getString(2131429150), 2));
            }
            if (canChoosePhoto) {
                items.add(new AdapterItem(context.getString(2131429151), 1));
            }
            ListPopupWindow listPopupWindow = new ListPopupWindow(context);
            listPopupWindow.setAnchorView(this.mImageView);
            listPopupWindow.setModal(true);
            listPopupWindow.setInputMethodMode(2);
            listPopupWindow.setAdapter(new ArrayAdapter(context, 2130968629, items));
            listPopupWindow.setWidth(Math.max(this.mImageView.getWidth(), context.getResources().getDimensionPixelSize(2131558437)));
            listPopupWindow.setOnItemClickListener(new 3(this, items, listPopupWindow));
            listPopupWindow.show();
        }
    }

    public AppRestrictionsFragment$EditUserPhotoController(Fragment fragment, ImageView imageView, Bitmap bitmap, Drawable drawable) {
        this.mContext = imageView.getContext();
        this.mFragment = fragment;
        this.mImageView = imageView;
        this.mImageView.setOnClickListener(new 1(this));
        this.mNewUserPhotoBitmap = bitmap;
        this.mNewUserPhotoDrawable = drawable;
    }

    private void appendCropExtras(Intent intent) {
        intent.putExtra("crop", "true");
        intent.putExtra("scale", true);
        intent.putExtra("scaleUpIfNeeded", true);
        intent.putExtra("aspectX", 1);
        intent.putExtra("aspectY", 1);
        intent.putExtra("outputX", this.mPhotoSize);
        intent.putExtra("outputY", this.mPhotoSize);
    }

    public boolean onActivityResult(int i, int i2, Intent intent) {
        if (i2 != -1) {
            return false;
        }
        switch (i) {
            case 2147483645:
            case Integer.MAX_VALUE:
                new 1(this).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, (Void[]) null);
                return true;
            case 2147483646:
                cropPhoto();
                return false;
            default:
                return false;
        }
    }

    private void choosePhoto() {
        Intent intent = new Intent("android.intent.action.GET_CONTENT", null);
        intent.setType("image/*");
        intent.putExtra("output", this.mCropPictureUri);
        appendCropExtras(intent);
        this.mFragment.startActivityForResult(intent, Integer.MAX_VALUE);
    }

    private void cropPhoto() {
        Intent intent = new Intent("com.android.camera.action.CROP");
        intent.setDataAndType(this.mTakePictureUri, "image/*");
        intent.putExtra("output", this.mCropPictureUri);
        appendCropExtras(intent);
        this.mFragment.startActivityForResult(intent, 2147483645);
    }

    private static Uri createTempImageUri(Context context, String str) {
        File folder = context.getExternalCacheDir();
        folder.mkdirs();
        File fullPath = new File(folder, str);
        fullPath.delete();
        return Uri.fromFile(fullPath.getAbsoluteFile());
    }

    private static int getPhotoSize(Context context) {
        Cursor cursor = context.getContentResolver().query(DisplayPhoto.CONTENT_MAX_DIMENSIONS_URI, new String[]{"display_max_dim"}, null, null, null);
        try {
            cursor.moveToFirst();
            int i = cursor.getInt(0);
            return i;
        } finally {
            cursor.close();
        }
    }

    private void takePhoto() {
        Intent intent = new Intent("android.media.action.IMAGE_CAPTURE");
        intent.putExtra("output", this.mTakePictureUri);
        this.mFragment.startActivityForResult(intent, 2147483646);
    }

    private boolean canChoosePhoto() {
        Intent intent = new Intent("android.intent.action.GET_CONTENT");
        intent.setType("image/*");
        return this.mImageView.getContext().getPackageManager().queryIntentActivities(intent, 0).size() > 0;
    }

    private boolean canTakePhoto() {
        return this.mImageView.getContext().getPackageManager().queryIntentActivities(new Intent("android.media.action.IMAGE_CAPTURE"), 65536).size() > 0;
    }

    public Bitmap getNewUserPhotoBitmap() {
        return this.mNewUserPhotoBitmap;
    }

    public Drawable getNewUserPhotoDrawable() {
        return this.mNewUserPhotoDrawable;
    }
}