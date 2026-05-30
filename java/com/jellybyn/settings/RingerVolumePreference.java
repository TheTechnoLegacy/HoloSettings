package com.jellybyn.settings;

import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Handler;
import android.os.Parcelable;
import android.preference.VolumePreference;
import android.preference.VolumePreference.SeekBarVolumizer;
import android.preference.VolumePreference.VolumeStore;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.widget.ImageView;
import android.widget.SeekBar;

public class RingerVolumePreference extends VolumePreference {
    private static final int[] CHECKBOX_VIEW_ID = new int[]{2131230931, 2131230935, 2131230939, 2131230941};
    private static final int[] SEEKBAR_ID = new int[]{2131230932, 2131230936, 2131230940, 2131230942};
    private static final int[] SEEKBAR_MUTED_RES_ID = new int[]{17302179, 17302176, 17302173, 17302169};
    private static final int[] SEEKBAR_TYPE = new int[]{3, 2, 5, 4};
    private static final int[] SEEKBAR_UNMUTED_RES_ID = new int[]{17302178, 17302175, 17302172, 17302168};
    private AudioManager mAudioManager;
    private ImageView[] mCheckBoxes = new ImageView[SEEKBAR_MUTED_RES_ID.length];
    private Handler mHandler = new 1(this);
    private BroadcastReceiver mRingModeChangedReceiver;
    private SeekBarVolumizer[] mSeekBarVolumizer;
    private SeekBar[] mSeekBars = new SeekBar[SEEKBAR_ID.length];

    protected void onBindDialogView(View view) {
        int i;
        super.onBindDialogView(view);
        for (i = 0; i < SEEKBAR_ID.length; i++) {
            SeekBar seekBar = (SeekBar) view.findViewById(SEEKBAR_ID[i]);
            this.mSeekBars[i] = seekBar;
            if (SEEKBAR_TYPE[i] == 3) {
                this.mSeekBarVolumizer[i] = new SeekBarVolumizer(this, getContext(), seekBar, SEEKBAR_TYPE[i], getMediaVolumeUri(getContext()));
            } else {
                this.mSeekBarVolumizer[i] = new SeekBarVolumizer(this, getContext(), seekBar, SEEKBAR_TYPE[i]);
            }
        }
        for (i = 0; i < this.mCheckBoxes.length; i++) {
            this.mCheckBoxes[i] = (ImageView) view.findViewById(CHECKBOX_VIEW_ID[i]);
        }
        updateSlidersAndMutedStates();
        if (this.mRingModeChangedReceiver == null) {
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction("android.media.RINGER_MODE_CHANGED");
            this.mRingModeChangedReceiver = new 2(this);
            getContext().registerReceiver(this.mRingModeChangedReceiver, intentFilter);
        }
        view.findViewById(!Utils.isVoiceCapable(getContext()) ? 2131230933 : 2131230937).setVisibility(8);
    }

    private void updateSlidersAndMutedStates() {
        int i = 0;
        while (i < SEEKBAR_TYPE.length) {
            int i2 = SEEKBAR_TYPE[i];
            boolean isStreamMute = this.mAudioManager.isStreamMute(i2);
            if (this.mCheckBoxes[i] != null) {
                if ((i2 == 2 || i2 == 5) && this.mAudioManager.getRingerMode() == 1) {
                    this.mCheckBoxes[i].setImageResource(17302177);
                } else {
                    this.mCheckBoxes[i].setImageResource(isStreamMute ? SEEKBAR_MUTED_RES_ID[i] : SEEKBAR_UNMUTED_RES_ID[i]);
                }
            }
            if (this.mSeekBars[i] != null) {
                this.mSeekBars[i].setProgress(this.mAudioManager.getStreamVolume(i2));
                if (i2 == this.mAudioManager.getMasterStreamType() || !isStreamMute) {
                    this.mSeekBars[i].setEnabled(true);
                } else {
                    this.mSeekBars[i].setEnabled(false);
                }
            }
            i++;
        }
    }

    private void cleanup() {
        for (int i = 0; i < SEEKBAR_ID.length; i++) {
            if (this.mSeekBarVolumizer[i] != null) {
                Dialog dialog = getDialog();
                if (dialog != null && dialog.isShowing()) {
                    this.mSeekBarVolumizer[i].revertVolume();
                }
                this.mSeekBarVolumizer[i].stop();
                this.mSeekBarVolumizer[i] = null;
            }
        }
        if (this.mRingModeChangedReceiver != null) {
            getContext().unregisterReceiver(this.mRingModeChangedReceiver);
            this.mRingModeChangedReceiver = null;
        }
    }

    protected void onRestoreInstanceState(Parcelable parcelable) {
        if (parcelable == null || !parcelable.getClass().equals(SavedState.class)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        VolumeStore[] volumeStore = savedState.getVolumeStore(SEEKBAR_ID.length);
        for (int i = 0; i < SEEKBAR_ID.length; i++) {
            SeekBarVolumizer seekBarVolumizer = this.mSeekBarVolumizer[i];
            if (seekBarVolumizer != null) {
                seekBarVolumizer.onRestoreInstanceState(volumeStore[i]);
            }
        }
    }

    protected Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        if (isPersistent()) {
            return superState;
        }
        SavedState myState = new SavedState(superState);
        VolumeStore[] volumeStore = myState.getVolumeStore(SEEKBAR_ID.length);
        for (int i = 0; i < SEEKBAR_ID.length; i++) {
            SeekBarVolumizer seekBarVolumizer = this.mSeekBarVolumizer[i];
            if (seekBarVolumizer != null) {
                seekBarVolumizer.onSaveInstanceState(volumeStore[i]);
            }
        }
        return myState;
    }

    public RingerVolumePreference(Context context, AttributeSet attributeSet) {
        setStreamType(2);
        setDialogLayoutResource(2130968662);
        this.mSeekBarVolumizer = new SeekBarVolumizer[4];
        this.mAudioManager = (AudioManager) context.getSystemService("audio");
    }

    protected void onDialogClosed(boolean z) {
        super.onDialogClosed(z);
        if (!z) {
            for (SeekBarVolumizer seekBarVolumizer : this.mSeekBarVolumizer) {
                if (seekBarVolumizer != null) {
                    seekBarVolumizer.revertVolume();
                }
            }
        }
        cleanup();
    }

    public void onActivityStop() {
        super.onActivityStop();
        for (SeekBarVolumizer seekBarVolumizer : this.mSeekBarVolumizer) {
            if (seekBarVolumizer != null) {
                seekBarVolumizer.stopSample();
            }
        }
    }

    public boolean onKey(View view, int i, KeyEvent keyEvent) {
        if (keyEvent.getAction() == 0) {
            boolean z = true;
        } else {
            Object obj = null;
        }
        switch (i) {
            case 24:
            case 25:
            case 164:
                return true;
            default:
                return false;
        }
    }

    protected void onSampleStarting(SeekBarVolumizer seekBarVolumizer) {
        super.onSampleStarting(seekBarVolumizer);
        for (SeekBarVolumizer seekBarVolumizer2 : this.mSeekBarVolumizer) {
            if (!(seekBarVolumizer2 == null || seekBarVolumizer2 == seekBarVolumizer)) {
                seekBarVolumizer2.stopSample();
            }
        }
    }

    public void createActionButtons() {
        setPositiveButtonText(17039370);
        setNegativeButtonText(null);
    }

    private Uri getMediaVolumeUri(Context context) {
        return Uri.parse("android.resource://" + context.getPackageName() + "/" + 2131099648);
    }
}