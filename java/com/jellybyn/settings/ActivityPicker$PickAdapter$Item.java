package com.jellybyn.settings;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import com.jellybyn.settings.ActivityPicker.IconResizer;
import com.jellybyn.settings.AppWidgetLoader.LabelledItem;

public class ActivityPicker$PickAdapter$Item implements LabelledItem {
    protected static IconResizer sResizer;
    String className;
    Bundle extras;
    Drawable icon;
    CharSequence label;
    String packageName;

    ActivityPicker$PickAdapter$Item(Context context, PackageManager packageManager, ResolveInfo resolveInfo) {
        this.label = resolveInfo.loadLabel(packageManager);
        if (this.label == null && resolveInfo.activityInfo != null) {
            this.label = resolveInfo.activityInfo.name;
        }
        this.icon = getResizer(context).createIconThumbnail(resolveInfo.loadIcon(packageManager));
        this.packageName = resolveInfo.activityInfo.applicationInfo.packageName;
        this.className = resolveInfo.activityInfo.name;
    }

    Intent getIntent(Intent intent) {
        Intent intent2 = new Intent(intent);
        if (this.packageName == null || this.className == null) {
            intent2.setAction("android.intent.action.CREATE_SHORTCUT");
            intent2.putExtra("android.intent.extra.shortcut.NAME", this.label);
        } else {
            intent2.setClassName(this.packageName, this.className);
            if (this.extras != null) {
                intent2.putExtras(this.extras);
            }
        }
        return intent2;
    }

    protected IconResizer getResizer(Context context) {
        if (sResizer == null) {
            Resources resources = context.getResources();
            int dimension = (int) resources.getDimension(17104896);
            sResizer = new IconResizer(dimension, dimension, resources.getDisplayMetrics());
        }
        return sResizer;
    }

    ActivityPicker$PickAdapter$Item(Context context, CharSequence charSequence, Drawable drawable) {
        this.label = charSequence;
        this.icon = getResizer(context).createIconThumbnail(drawable);
    }

    public CharSequence getLabel() {
        return this.label;
    }
}