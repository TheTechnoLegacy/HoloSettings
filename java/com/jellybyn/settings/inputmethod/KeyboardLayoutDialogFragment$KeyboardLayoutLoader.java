package com.jellybyn.settings.inputmethod;

import android.content.AsyncTaskLoader;
import android.content.Context;
import android.hardware.input.InputManager;
import android.hardware.input.KeyboardLayout;
import com.jellybyn.settings.inputmethod.KeyboardLayoutDialogFragment.Keyboards;
import java.util.Collections;

final class KeyboardLayoutDialogFragment$KeyboardLayoutLoader extends AsyncTaskLoader<Keyboards> {
    private final String mInputDeviceDescriptor;

    public Keyboards loadInBackground() {
        Keyboards keyboards = new Keyboards();
        InputManager im = (InputManager) getContext().getSystemService("input");
        for (String keyboardLayout : im.getKeyboardLayoutsForInputDevice(this.mInputDeviceDescriptor)) {
            KeyboardLayout keyboardLayout2 = im.getKeyboardLayout(keyboardLayout);
            if (keyboardLayout2 != null) {
                keyboards.keyboardLayouts.add(keyboardLayout2);
            }
        }
        Collections.sort(keyboards.keyboardLayouts);
        String currentKeyboardLayoutDescriptor = im.getCurrentKeyboardLayoutForInputDevice(this.mInputDeviceDescriptor);
        if (currentKeyboardLayoutDescriptor != null) {
            int numKeyboardLayouts = keyboards.keyboardLayouts.size();
            for (int i = 0; i < numKeyboardLayouts; i++) {
                if (((KeyboardLayout) keyboards.keyboardLayouts.get(i)).getDescriptor().equals(currentKeyboardLayoutDescriptor)) {
                    keyboards.current = i;
                    break;
                }
            }
        }
        if (keyboards.keyboardLayouts.isEmpty()) {
            keyboards.keyboardLayouts.add(null);
            keyboards.current = 0;
        }
        return keyboards;
    }

    public KeyboardLayoutDialogFragment$KeyboardLayoutLoader(Context context, String str) {
        super(context);
        this.mInputDeviceDescriptor = str;
    }

    protected void onStartLoading() {
        super.onStartLoading();
        forceLoad();
    }

    protected void onStopLoading() {
        super.onStopLoading();
        cancelLoad();
    }
}