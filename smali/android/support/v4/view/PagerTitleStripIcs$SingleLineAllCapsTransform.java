package android.support.v4.view;

import android.content.Context;
import android.text.method.SingleLineTransformationMethod;
import android.view.View;
import java.util.Locale;

class PagerTitleStripIcs$SingleLineAllCapsTransform extends SingleLineTransformationMethod {
    private Locale mLocale;

    public PagerTitleStripIcs$SingleLineAllCapsTransform(Context context) {
        this.mLocale = context.getResources().getConfiguration().locale;
    }

    public CharSequence getTransformation(CharSequence charSequence, View view) {
        charSequence = super.getTransformation(charSequence, view);
        return charSequence != null ? charSequence.toString().toUpperCase(this.mLocale) : null;
    }
}