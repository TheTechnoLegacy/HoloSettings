package com.jellybyn.settings;

import android.app.LauncherActivity;
import android.content.Intent;
import android.content.Intent.ShortcutIconResource;
import android.view.View;
import android.widget.ListView;

public class CreateShortcut extends LauncherActivity {
    protected void onListItemClick(ListView listView, View view, int i, long j) {
        Intent shortcutIntent = intentForPosition(i);
        shortcutIntent.setFlags(2097152);
        Intent intent = new Intent();
        intent.putExtra("android.intent.extra.shortcut.ICON_RESOURCE", ShortcutIconResource.fromContext(this, 2130903040));
        intent.putExtra("android.intent.extra.shortcut.INTENT", shortcutIntent);
        intent.putExtra("android.intent.extra.shortcut.NAME", itemForPosition(i).label);
        setResult(-1, intent);
        finish();
    }

    protected Intent getTargetIntent() {
        Intent targetIntent = new Intent("android.intent.action.MAIN", null);
        targetIntent.addCategory("com.jellybyn.settings.SHORTCUT");
        targetIntent.addFlags(268435456);
        return targetIntent;
    }

    protected boolean onEvaluateShowIcons() {
        return false;
    }
}