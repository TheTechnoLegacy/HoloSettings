package com.jellybyn.settings;

import com.jellybyn.settings.TrustedCredentialsSettings.4;
import com.jellybyn.settings.TrustedCredentialsSettings.CertHolder;
import com.jellybyn.settings.TrustedCredentialsSettings.TrustedCertificateAdapter;
import java.util.Set;
import org.apache.harmony.xnet.provider.jsse.TrustedCertificateStore;

enum TrustedCredentialsSettings$Tab {
    SYSTEM("system", 2131429049, 2131231049, 2131231050, 2131231051, true),
    USER("user", 2131429050, 2131231052, 2131231053, 2131231054, false);
    
    private final boolean mCheckbox;
    private final int mLabel;
    private final int mList;
    private final int mProgress;
    private final String mTag;
    private final int mView;

    private TrustedCredentialsSettings$Tab(String str, int i, int i2, int i3, int i4, boolean z) {
        this.mTag = str;
        this.mLabel = i;
        this.mView = i2;
        this.mProgress = i3;
        this.mList = i4;
        this.mCheckbox = z;
    }

    private int getButtonConfirmation(CertHolder certHolder) {
        switch (4.$SwitchMap$com$android$settings$TrustedCredentialsSettings$Tab[ordinal()]) {
            case 1:
                return CertHolder.access$000(certHolder) ? 2131429054 : 2131429055;
            case 2:
                return 2131429056;
            default:
                throw new AssertionError();
        }
    }

    private int getButtonLabel(CertHolder certHolder) {
        switch (4.$SwitchMap$com$android$settings$TrustedCredentialsSettings$Tab[ordinal()]) {
            case 1:
                return CertHolder.access$000(certHolder) ? 2131429052 : 2131429051;
            case 2:
                return 2131429053;
            default:
                throw new AssertionError();
        }
    }

    private void postOperationUpdate(boolean z, CertHolder certHolder) {
        if (z) {
            if (CertHolder.access$100(certHolder).mCheckbox) {
                CertHolder.access$002(certHolder, !CertHolder.access$000(certHolder));
            } else {
                TrustedCertificateAdapter.access$300(CertHolder.access$200(certHolder)).remove(certHolder);
            }
            CertHolder.access$200(certHolder).notifyDataSetChanged();
            return;
        }
        TrustedCertificateAdapter.access$400(CertHolder.access$200(certHolder));
    }

    private boolean deleted(TrustedCertificateStore trustedCertificateStore, String str) {
        switch (4.$SwitchMap$com$android$settings$TrustedCredentialsSettings$Tab[ordinal()]) {
            case 1:
                return !trustedCertificateStore.containsAlias(str);
            case 2:
                return false;
            default:
                throw new AssertionError();
        }
    }

    private Set<String> getAliases(TrustedCertificateStore trustedCertificateStore) {
        switch (4.$SwitchMap$com$android$settings$TrustedCredentialsSettings$Tab[ordinal()]) {
            case 1:
                return trustedCertificateStore.allSystemAliases();
            case 2:
                return trustedCertificateStore.userAliases();
            default:
                throw new AssertionError();
        }
    }
}