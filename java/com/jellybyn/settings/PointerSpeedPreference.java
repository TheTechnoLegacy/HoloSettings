package com.jellybyn.settings;

import android.content.ContentResolver;
import android.content.Context;
import android.database.ContentObserver;
import android.hardware.input.InputManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Parcelable;
import android.preference.SeekBarDialogPreference;
import android.provider.Settings.System;
import android.util.AttributeSet;
import android.view.View;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;

public class PointerSpeedPreference extends SeekBarDialogPreference implements OnSeekBarChangeListener {
    private final InputManager mIm = ((InputManager) getContext().getSystemService("input"));
    private int mOldSpeed;
    private boolean mRestoredOldState;
    private SeekBar mSeekBar;
    private ContentObserver mSpeedObserver = new 1(this, new Handler());
    private boolean mTouchInProgress;

    protected void onRestoreInstanceState(Parcelable parcelable) {
        if (parcelable == null || !parcelable.getClass().equals(SavedState.class)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        this.mOldSpeed = savedState.oldSpeed;
        this.mSeekBar.setProgress(savedState.progress);
        this.mIm.tryPointerSpeed(savedState.progress - 7);
    }

    protected void onBindDialogView(View view) {
        super.onBindDialogView(view);
        this.mSeekBar = getSeekBar(view);
        this.mSeekBar.setMax(14);
        this.mOldSpeed = this.mIm.getPointerSpeed(getContext());
        this.mSeekBar.setProgress(this.mOldSpeed + 7);
        this.mSeekBar.setOnSeekBarChangeListener(this);
    }

    protected void onDialogClosed(boolean z) {
        super.onDialogClosed(z);
        ContentResolver resolver = getContext().getContentResolver();
        if (z) {
            this.mIm.setPointerSpeed(getContext(), this.mSeekBar.getProgress() - 7);
        } else {
            restoreOldState();
        }
        resolver.unregisterContentObserver(this.mSpeedObserver);
    }

    protected Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        if (getDialog() == null || !getDialog().isShowing()) {
            return superState;
        }
        SavedState myState = new SavedState(superState);
        myState.progress = this.mSeekBar.getProgress();
        myState.oldSpeed = this.mOldSpeed;
        restoreOldState();
        return myState;
    }

    public PointerSpeedPreference(Context context, AttributeSet attributeSet) {
    }

    private void restoreOldState() {
        if (!this.mRestoredOldState) {
            this.mIm.tryPointerSpeed(this.mOldSpeed);
            this.mRestoredOldState = true;
        }
    }

    protected void showDialog(Bundle bundle) {
        super.showDialog(bundle);
        getContext().getContentResolver().registerContentObserver(System.getUriFor("pointer_speed"), true, this.mSpeedObserver);
        this.mRestoredOldState = false;
    }

    private void onSpeedChanged() {
        this.mSeekBar.setProgress(this.mIm.getPointerSpeed(getContext()) + 7);
    }

    public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
        if (!this.mTouchInProgress) {
            this.mIm.tryPointerSpeed(i - 7);
        }
    }

    public void onStopTrackingTouch(SeekBar seekBar) {
        this.mTouchInProgress = false;
        this.mIm.tryPointerSpeed(seekBar.getProgress() - 7);
    }

    public void onStartTrackingTouch(SeekBar seekBar) {
        this.mTouchInProgress = true;
    }
}