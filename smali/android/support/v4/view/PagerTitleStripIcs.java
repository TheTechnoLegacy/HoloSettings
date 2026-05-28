package android.support.v4.view;

import android.widget.TextView;

class PagerTitleStripIcs {
    PagerTitleStripIcs() {
    }

    public static void setSingleLineAllCaps(TextView textView) {
        textView.setTransformationMethod(new SingleLineAllCapsTransform(textView.getContext()));
    }
}