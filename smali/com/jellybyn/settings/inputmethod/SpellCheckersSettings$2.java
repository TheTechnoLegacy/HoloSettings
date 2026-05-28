package com.jellybyn.settings.inputmethod;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;

class SpellCheckersSettings$2 implements OnClickListener {
    final /* synthetic */ SpellCheckersSettings this$0;
    final /* synthetic */ SingleSpellCheckerPreference val$scp;

    public void onClick(DialogInterface dialogInterface, int i) {
        SpellCheckersSettings.access$000(this.this$0, this.val$scp);
    }

    SpellCheckersSettings$2(SpellCheckersSettings spellCheckersSettings, SingleSpellCheckerPreference singleSpellCheckerPreference) {
        this.this$0 = spellCheckersSettings;
        this.val$scp = singleSpellCheckerPreference;
    }
}