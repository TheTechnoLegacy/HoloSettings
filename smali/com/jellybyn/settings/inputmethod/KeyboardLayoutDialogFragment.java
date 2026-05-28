package com.jellybyn.settings.inputmethod;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.app.LoaderManager.LoaderCallbacks;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.Loader;
import android.hardware.input.InputManager;
import android.hardware.input.InputManager.InputDeviceListener;
import android.hardware.input.KeyboardLayout;
import android.os.Bundle;
import android.view.InputDevice;
import android.view.LayoutInflater;

public class KeyboardLayoutDialogFragment extends DialogFragment implements InputDeviceListener, LoaderCallbacks<Keyboards> {
    private KeyboardLayoutAdapter mAdapter;
    private InputManager mIm;
    private String mInputDeviceDescriptor;
    private int mInputDeviceId = -1;

    public void onLoadFinished(Loader<Keyboards> loader, Keyboards keyboards) {
        this.mAdapter.clear();
        this.mAdapter.addAll(keyboards.keyboardLayouts);
        this.mAdapter.setCheckedItem(keyboards.current);
        AlertDialog dialog = (AlertDialog) getDialog();
        if (dialog != null) {
            dialog.getListView().setItemChecked(keyboards.current, true);
        }
        updateSwitchHintVisibility();
    }

    public void onResume() {
        super.onResume();
        this.mIm.registerInputDeviceListener(this, null);
        InputDevice inputDevice = this.mIm.getInputDeviceByDescriptor(this.mInputDeviceDescriptor);
        if (inputDevice == null) {
            dismiss();
        } else {
            this.mInputDeviceId = inputDevice.getId();
        }
    }

    private void onKeyboardLayoutClicked(int i) {
        if (i >= 0 && i < this.mAdapter.getCount()) {
            KeyboardLayout keyboardLayout = (KeyboardLayout) this.mAdapter.getItem(i);
            if (keyboardLayout != null) {
                this.mIm.setCurrentKeyboardLayoutForInputDevice(this.mInputDeviceDescriptor, keyboardLayout.getDescriptor());
            }
            dismiss();
        }
    }

    private void updateSwitchHintVisibility() {
        AlertDialog dialog = (AlertDialog) getDialog();
        if (dialog != null) {
            dialog.findViewById(16908908).setVisibility(this.mAdapter.getCount() > 1 ? 0 : 8);
        }
    }

    public void onAttach(Activity activity) {
        super.onAttach(activity);
        Context context = activity.getBaseContext();
        this.mIm = (InputManager) context.getSystemService("input");
        this.mAdapter = new KeyboardLayoutAdapter(context);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle != null) {
            this.mInputDeviceDescriptor = bundle.getString("inputDeviceDescriptor");
        }
        getLoaderManager().initLoader(0, null, this);
    }

    public Dialog onCreateDialog(Bundle bundle) {
        Context context = getActivity();
        Builder builder = new Builder(context).setTitle(2131428492).setPositiveButton(2131428493, new 2(this)).setSingleChoiceItems(this.mAdapter, -1, new 2(this)).setView(LayoutInflater.from(context).inflate(2130968633, null));
        updateSwitchHintVisibility();
        return builder.create();
    }

    public KeyboardLayoutDialogFragment(String str) {
        this.mInputDeviceDescriptor = str;
    }

    public void onPause() {
        this.mIm.unregisterInputDeviceListener(this);
        this.mInputDeviceId = -1;
        super.onPause();
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        show(getActivity().getFragmentManager(), "layout");
    }

    public void onCancel(DialogInterface dialogInterface) {
        super.onCancel(dialogInterface);
        dismiss();
    }

    public void onInputDeviceChanged(int i) {
        if (this.mInputDeviceId >= 0 && i == this.mInputDeviceId) {
            getLoaderManager().restartLoader(0, null, this);
        }
    }

    public void onInputDeviceRemoved(int i) {
        if (this.mInputDeviceId >= 0 && i == this.mInputDeviceId) {
            dismiss();
        }
    }

    public void onLoaderReset(Loader<Keyboards> loader) {
        this.mAdapter.clear();
        updateSwitchHintVisibility();
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putString("inputDeviceDescriptor", this.mInputDeviceDescriptor);
    }

    private void onSetupLayoutsButtonClicked() {
        ((OnSetupKeyboardLayoutsListener) getTargetFragment()).onSetupKeyboardLayouts(this.mInputDeviceDescriptor);
    }

    public Loader<Keyboards> onCreateLoader(int i, Bundle bundle) {
        return new KeyboardLayoutLoader(getActivity().getBaseContext(), this.mInputDeviceDescriptor);
    }

    public void onInputDeviceAdded(int i) {
    }
}