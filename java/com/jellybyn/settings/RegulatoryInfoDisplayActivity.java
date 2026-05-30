package com.jellybyn.settings;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.widget.TextView;

public class RegulatoryInfoDisplayActivity extends Activity implements OnDismissListener {
    protected void onCreate(Bundle bundle) {
        boolean regulatoryInfoDrawableExists;
        super.onCreate(bundle);
        Resources resources = getResources();
        if (!resources.getBoolean(2131296261)) {
            finish();
        }
        Builder builder = new Builder(this).setTitle(2131428269).setOnDismissListener(this);
        try {
            Drawable drawable = resources.getDrawable(2130837670);
            regulatoryInfoDrawableExists = drawable.getIntrinsicWidth() > 2 && drawable.getIntrinsicHeight() > 2;
        } catch (NotFoundException e) {
            regulatoryInfoDrawableExists = false;
        }
        CharSequence regulatoryText = resources.getText(2131429152);
        if (regulatoryInfoDrawableExists) {
            builder.setView(getLayoutInflater().inflate(2130968682, null));
            builder.show();
        } else if (regulatoryText.length() > 0) {
            builder.setMessage(regulatoryText);
            ((TextView) builder.show().findViewById(16908299)).setGravity(17);
        } else {
            finish();
        }
    }

    public void onDismiss(DialogInterface dialogInterface) {
        finish();
    }
}