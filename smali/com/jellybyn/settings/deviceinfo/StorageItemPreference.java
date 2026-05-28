package com.jellybyn.settings.deviceinfo;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RectShape;
import android.preference.Preference;

public class StorageItemPreference extends Preference {
    public final int color;
    public final int userHandle;

    public StorageItemPreference(Context context, CharSequence charSequence, int i, int i2) {
        super(context);
        if (i != 0) {
            this.color = context.getResources().getColor(i);
            Resources resources = context.getResources();
            setIcon(createRectShape(resources.getDimensionPixelSize(2131558400), resources.getDimensionPixelSize(2131558401), this.color));
        } else {
            this.color = -65281;
        }
        setTitle(charSequence);
        setSummary(2131428119);
        this.userHandle = i2;
    }

    private static ShapeDrawable createRectShape(int i, int i2, int i3) {
        ShapeDrawable shape = new ShapeDrawable(new RectShape());
        shape.setIntrinsicHeight(i2);
        shape.setIntrinsicWidth(i);
        shape.getPaint().setColor(i3);
        return shape;
    }

    public StorageItemPreference(Context context, int i, int i2) {
        this(context, context.getText(i), i2, -10000);
    }
}