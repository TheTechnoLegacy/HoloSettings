package com.jellybyn.settings.net;

import android.net.NetworkPolicy;
import android.net.NetworkPolicyManager;
import android.net.NetworkTemplate;
import android.net.wifi.WifiInfo;
import android.os.AsyncTask;
import android.text.TextUtils;
import android.text.format.Time;
import com.android.internal.util.Objects;
import com.android.internal.util.Preconditions;
import com.google.android.collect.Lists;
import com.google.android.collect.Sets;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

public class NetworkPolicyEditor {
    private ArrayList<NetworkPolicy> mPolicies = Lists.newArrayList();
    private NetworkPolicyManager mPolicyManager;

    public void setPolicyMetered(NetworkTemplate networkTemplate, boolean z) {
        boolean modified = false;
        NetworkPolicy policy = getPolicy(networkTemplate);
        if (z) {
            if (policy == null) {
                policy = buildDefaultPolicy(networkTemplate);
                policy.metered = true;
                policy.inferred = false;
                this.mPolicies.add(policy);
                modified = true;
            } else if (!policy.metered) {
                policy.metered = true;
                policy.inferred = false;
                modified = true;
            }
        } else if (policy != null && policy.metered) {
            policy.metered = false;
            policy.inferred = false;
            modified = true;
        }
        NetworkPolicy policy2 = getPolicy(buildUnquotedNetworkTemplate(networkTemplate));
        if (policy2 != null) {
            this.mPolicies.remove(policy2);
            modified = true;
        }
        if (modified) {
            writeAsync();
        }
    }

    @Deprecated
    private boolean setMobilePolicySplitInternal(String str, boolean z) {
        boolean beforeSplit = isMobilePolicySplit(str);
        NetworkTemplate template3g = NetworkTemplate.buildTemplateMobile3gLower(str);
        NetworkTemplate template4g = NetworkTemplate.buildTemplateMobile4g(str);
        NetworkTemplate templateAll = NetworkTemplate.buildTemplateMobileAll(str);
        if (z == beforeSplit) {
            return false;
        }
        if (beforeSplit && !z) {
            NetworkPolicy policy = getPolicy(template3g);
            NetworkPolicy policy2 = getPolicy(template4g);
            NetworkPolicy networkPolicy = policy.compareTo(policy2) < 0 ? policy : policy2;
            this.mPolicies.remove(policy);
            this.mPolicies.remove(policy2);
            this.mPolicies.add(new NetworkPolicy(templateAll, networkPolicy.cycleDay, networkPolicy.cycleTimezone, networkPolicy.warningBytes, networkPolicy.limitBytes, -1, -1, networkPolicy.metered, networkPolicy.inferred));
            return true;
        } else if (beforeSplit || !z) {
            return false;
        } else {
            NetworkPolicy policy3 = getPolicy(templateAll);
            this.mPolicies.remove(policy3);
            this.mPolicies.add(new NetworkPolicy(template3g, policy3.cycleDay, policy3.cycleTimezone, policy3.warningBytes, policy3.limitBytes, -1, -1, policy3.metered, policy3.inferred));
            this.mPolicies.add(new NetworkPolicy(template4g, policy3.cycleDay, policy3.cycleTimezone, policy3.warningBytes, policy3.limitBytes, -1, -1, policy3.metered, policy3.inferred));
            return true;
        }
    }

    public void read() {
        NetworkPolicy[] policies = this.mPolicyManager.getNetworkPolicies();
        boolean modified = false;
        this.mPolicies.clear();
        for (NetworkPolicy networkPolicy : policies) {
            if (networkPolicy.limitBytes < -1) {
                networkPolicy.limitBytes = -1;
                modified = true;
            }
            if (networkPolicy.warningBytes < -1) {
                networkPolicy.warningBytes = -1;
                modified = true;
            }
            this.mPolicies.add(networkPolicy);
        }
        if (modified | forceMobilePolicyCombined()) {
            writeAsync();
        }
    }

    @Deprecated
    public boolean isMobilePolicySplit(String str) {
        boolean has3g = false;
        boolean has4g = false;
        Iterator i$ = this.mPolicies.iterator();
        while (i$.hasNext()) {
            NetworkTemplate networkTemplate = ((NetworkPolicy) i$.next()).template;
            if (Objects.equal(str, networkTemplate.getSubscriberId())) {
                switch (networkTemplate.getMatchRule()) {
                    case 2:
                        has3g = true;
                        break;
                    case 3:
                        has4g = true;
                        break;
                    default:
                        break;
                }
            }
        }
        return has3g && has4g;
    }

    @Deprecated
    private static NetworkPolicy buildDefaultPolicy(NetworkTemplate networkTemplate) {
        int cycleDay;
        String cycleTimezone;
        boolean metered;
        if (networkTemplate.getMatchRule() == 4) {
            cycleDay = -1;
            cycleTimezone = "UTC";
            metered = false;
        } else {
            Time time = new Time();
            time.setToNow();
            cycleDay = time.monthDay;
            cycleTimezone = time.timezone;
            metered = true;
        }
        return new NetworkPolicy(networkTemplate, cycleDay, cycleTimezone, -1, -1, -1, -1, metered, true);
    }

    private boolean forceMobilePolicyCombined() {
        HashSet<String> subscriberIds = Sets.newHashSet();
        Iterator i$ = this.mPolicies.iterator();
        while (i$.hasNext()) {
            subscriberIds.add(((NetworkPolicy) i$.next()).template.getSubscriberId());
        }
        boolean modified = false;
        i$ = subscriberIds.iterator();
        while (i$.hasNext()) {
            modified |= setMobilePolicySplitInternal((String) i$.next(), false);
        }
        return modified;
    }

    public void setPolicyCycleDay(NetworkTemplate networkTemplate, int i, String str) {
        NetworkPolicy policy = getOrCreatePolicy(networkTemplate);
        policy.cycleDay = i;
        policy.cycleTimezone = str;
        policy.inferred = false;
        policy.clearSnooze();
        writeAsync();
    }

    private static NetworkTemplate buildUnquotedNetworkTemplate(NetworkTemplate networkTemplate) {
        if (networkTemplate == null) {
            return null;
        }
        String networkId = networkTemplate.getNetworkId();
        String strippedNetworkId = WifiInfo.removeDoubleQuotes(networkId);
        return !TextUtils.equals(strippedNetworkId, networkId) ? new NetworkTemplate(networkTemplate.getMatchRule(), networkTemplate.getSubscriberId(), strippedNetworkId) : null;
    }

    public void setPolicyLimitBytes(NetworkTemplate networkTemplate, long j) {
        NetworkPolicy policy = getOrCreatePolicy(networkTemplate);
        policy.limitBytes = j;
        policy.inferred = false;
        policy.clearSnooze();
        writeAsync();
    }

    public void setPolicyWarningBytes(NetworkTemplate networkTemplate, long j) {
        NetworkPolicy policy = getOrCreatePolicy(networkTemplate);
        policy.warningBytes = j;
        policy.inferred = false;
        policy.clearSnooze();
        writeAsync();
    }

    public NetworkPolicy getOrCreatePolicy(NetworkTemplate networkTemplate) {
        NetworkPolicy policy = getPolicy(networkTemplate);
        if (policy != null) {
            return policy;
        }
        policy = buildDefaultPolicy(networkTemplate);
        this.mPolicies.add(policy);
        return policy;
    }

    public NetworkPolicyEditor(NetworkPolicyManager networkPolicyManager) {
        this.mPolicyManager = (NetworkPolicyManager) Preconditions.checkNotNull(networkPolicyManager);
    }

    public NetworkPolicy getPolicy(NetworkTemplate networkTemplate) {
        Iterator i$ = this.mPolicies.iterator();
        while (i$.hasNext()) {
            NetworkPolicy networkPolicy = (NetworkPolicy) i$.next();
            if (networkPolicy.template.equals(networkTemplate)) {
                return networkPolicy;
            }
        }
        return null;
    }

    public NetworkPolicy getPolicyMaybeUnquoted(NetworkTemplate networkTemplate) {
        NetworkPolicy policy = getPolicy(networkTemplate);
        return policy != null ? policy : getPolicy(buildUnquotedNetworkTemplate(networkTemplate));
    }

    @Deprecated
    public void setMobilePolicySplit(String str, boolean z) {
        if (setMobilePolicySplitInternal(str, z)) {
            writeAsync();
        }
    }

    public void writeAsync() {
        final NetworkPolicy[] policies = (NetworkPolicy[]) this.mPolicies.toArray(new NetworkPolicy[this.mPolicies.size()]);
        new AsyncTask<Void, Void, Void>() {
            protected Void doInBackground(Void... voidArr) {
                NetworkPolicyEditor.this.write(policies);
                return null;
            }
        }.execute(new Void[0]);
    }

    public void write(NetworkPolicy[] networkPolicyArr) {
        this.mPolicyManager.setNetworkPolicies(networkPolicyArr);
    }

    public int getPolicyCycleDay(NetworkTemplate networkTemplate) {
        return getPolicy(networkTemplate).cycleDay;
    }

    public long getPolicyLimitBytes(NetworkTemplate networkTemplate) {
        return getPolicy(networkTemplate).limitBytes;
    }

    public long getPolicyWarningBytes(NetworkTemplate networkTemplate) {
        return getPolicy(networkTemplate).warningBytes;
    }
}