package com.jellybyn.settings;

import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.widget.ImageView;
import com.jellybyn.settings.AppWidgetLoader.LabelledItem;

public class KeyguardAppWidgetPickActivity$Item implements LabelledItem {
    int appWidgetPreviewId;
    String className;
    Bundle extras;
    int iconId;
    CharSequence label;
    private Context mContext;
    private WidgetPreviewLoader mWidgetPreviewLoader;
    String packageName;

    Intent getIntent() {
        Intent intent = new Intent();
        if (this.packageName == null || this.className == null) {
            intent.setAction("android.intent.action.CREATE_SHORTCUT");
            intent.putExtra("android.intent.extra.shortcut.NAME", this.label);
        } else {
            intent.setClassName(this.packageName, this.className);
            if (this.extras != null) {
                intent.putExtras(this.extras);
            }
        }
        return intent;
    }

    KeyguardAppWidgetPickActivity$Item(Context context, CharSequence charSequence) {
        this.label = charSequence;
        this.mContext = context;
    }

    void cancelLoadingWidgetPreview() {
        if (this.mWidgetPreviewLoader != null) {
            this.mWidgetPreviewLoader.cancel(false);
            this.mWidgetPreviewLoader = null;
        }
    }

    void loadWidgetPreview(ImageView imageView) {
        this.mWidgetPreviewLoader = new WidgetPreviewLoader(this, this.mContext, imageView);
        this.mWidgetPreviewLoader.executeOnExecutor(AsyncTask.SERIAL_EXECUTOR, (Void[]) null);
    }

    public CharSequence getLabel() {
        return this.label;
    }
}