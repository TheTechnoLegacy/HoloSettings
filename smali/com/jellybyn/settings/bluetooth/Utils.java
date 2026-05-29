package com.jellybyn.settings.bluetooth;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface.OnClickListener;
import android.widget.Toast;

final class Utils {
    static AlertDialog showDisconnectDialog(Context context, AlertDialog alertDialog, OnClickListener onClickListener, CharSequence charSequence, CharSequence charSequence2) {
        if (alertDialog == null) {
            alertDialog = new Builder(context).setPositiveButton(17039370, onClickListener).setNegativeButton(17039360, null).create();
        } else {
            if (alertDialog.isShowing()) {
                alertDialog.dismiss();
            }
            alertDialog.setButton(-1, context.getText(17039370), onClickListener);
        }
        alertDialog.setTitle(charSequence);
        alertDialog.setMessage(charSequence2);
        alertDialog.show();
        return alertDialog;
    }

    public static int getConnectionStateSummary(int i) {
        switch (i) {
            case 0:
                return 2131427445;
            case 1:
                return 2131427447;
            case 2:
                return 2131427441;
            case 3:
                return 2131427446;
            default:
                return 0;
        }
    }

    static void showError(Context context, String str, int i) {
        String message = context.getString(i, new Object[]{str});
        LocalBluetoothManager manager = LocalBluetoothManager.getInstance(context);
        Context activity = manager.getForegroundActivity();
        if (manager.isForegroundActivity()) {
            new Builder(activity).setIconAttribute(16843605).setTitle(2131427711).setMessage(message).setPositiveButton(17039370, null).show();
        } else {
            Toast.makeText(context, message, 0).show();
        }
    }

    private Utils() {
    }
}