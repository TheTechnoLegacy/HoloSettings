package com.jellybyn.settings.bluetooth;

import android.text.InputFilter;
import android.text.Spanned;

class Utf8ByteLengthFilter implements InputFilter {
    private final int mMaxBytes;

    public CharSequence filter(CharSequence charSequence, int i, int i2, Spanned spanned, int i3, int i4) {
        int i5;
        char charAt;
        int i6;
        int srcByteCount = 0;
        for (i5 = i; i5 < i2; i5++) {
            charAt = charSequence.charAt(i5);
            i6 = charAt < 128 ? 1 : charAt < 2048 ? 2 : 3;
            srcByteCount += i6;
        }
        int destLen = spanned.length();
        int destByteCount = 0;
        i5 = 0;
        while (i5 < destLen) {
            if (i5 < i3 || i5 >= i4) {
                charAt = spanned.charAt(i5);
                i6 = charAt < 128 ? 1 : charAt < 2048 ? 2 : 3;
                destByteCount += i6;
            }
            i5++;
        }
        int keepBytes = this.mMaxBytes - destByteCount;
        if (keepBytes <= 0) {
            return "";
        }
        if (keepBytes >= srcByteCount) {
            return null;
        }
        for (i5 = i; i5 < i2; i5++) {
            charAt = charSequence.charAt(i5);
            i6 = charAt < 128 ? 1 : charAt < 2048 ? 2 : 3;
            keepBytes -= i6;
            if (keepBytes < 0) {
                return charSequence.subSequence(i, i5);
            }
        }
        return null;
    }

    Utf8ByteLengthFilter(int i) {
        this.mMaxBytes = i;
    }
}