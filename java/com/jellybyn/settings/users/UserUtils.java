package com.jellybyn.settings.users;

import android.content.pm.UserInfo;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.UserManager;

public class UserUtils {
    public static Drawable getUserIcon(UserManager userManager, UserInfo userInfo, Resources resources) {
        if (userInfo.iconPath == null) {
            return null;
        }
        Bitmap icon = userManager.getUserIcon(userInfo.id);
        return icon != null ? new BitmapDrawable(resources, icon) : null;
    }
}