package com.jellybyn.settings;

import android.app.Dialog;
import android.app.DialogFragment;
import android.app.Fragment;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnDismissListener;
import android.os.Bundle;

public class SettingsPreferenceFragment$SettingsDialogFragment extends DialogFragment {
    private int mDialogId;
    private OnCancelListener mOnCancelListener;
    private OnDismissListener mOnDismissListener;
    private Fragment mParentFragment;

    public Dialog onCreateDialog(Bundle bundle) {
        if (bundle != null) {
            this.mDialogId = bundle.getInt("key_dialog_id", 0);
            int i = bundle.getInt("key_parent_fragment_id", -1);
            if (i > -1) {
                this.mParentFragment = getFragmentManager().findFragmentById(i);
                if (!(this.mParentFragment instanceof DialogCreatable)) {
                    throw new IllegalArgumentException((this.mParentFragment != null ? this.mParentFragment.getClass().getName() : Integer.valueOf(i)) + " must implement " + DialogCreatable.class.getName());
                }
            }
            if (this.mParentFragment instanceof SettingsPreferenceFragment) {
                SettingsPreferenceFragment.access$202((SettingsPreferenceFragment) this.mParentFragment, this);
            }
        }
        return ((DialogCreatable) this.mParentFragment).onCreateDialog(this.mDialogId);
    }

    public SettingsPreferenceFragment$SettingsDialogFragment(DialogCreatable dialogCreatable, int i) {
        this.mDialogId = i;
        if (dialogCreatable instanceof Fragment) {
            this.mParentFragment = (Fragment) dialogCreatable;
            return;
        }
        throw new IllegalArgumentException("fragment argument must be an instance of " + Fragment.class.getName());
    }

    public void onDetach() {
        super.onDetach();
        if ((this.mParentFragment instanceof SettingsPreferenceFragment) && SettingsPreferenceFragment.access$200((SettingsPreferenceFragment) this.mParentFragment) == this) {
            SettingsPreferenceFragment.access$202((SettingsPreferenceFragment) this.mParentFragment, null);
        }
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        if (this.mParentFragment != null) {
            bundle.putInt("key_dialog_id", this.mDialogId);
            bundle.putInt("key_parent_fragment_id", this.mParentFragment.getId());
        }
    }

    public void onCancel(DialogInterface dialogInterface) {
        super.onCancel(dialogInterface);
        if (this.mOnCancelListener != null) {
            this.mOnCancelListener.onCancel(dialogInterface);
        }
    }

    public void onDismiss(DialogInterface dialogInterface) {
        super.onDismiss(dialogInterface);
        if (this.mOnDismissListener != null) {
            this.mOnDismissListener.onDismiss(dialogInterface);
        }
    }

    public void onStart() {
        super.onStart();
        if (this.mParentFragment != null && (this.mParentFragment instanceof SettingsPreferenceFragment)) {
            ((SettingsPreferenceFragment) this.mParentFragment).onDialogShowing();
        }
    }

    public int getDialogId() {
        return this.mDialogId;
    }
}