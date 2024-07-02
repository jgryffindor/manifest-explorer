<script lang="ts" setup>
import { Icon } from '@iconify/vue';
import {
  useDashboard,
  LoadingStatus,
  type ChainConfig,
} from '@/stores/useDashboard';
import ChainSummary from '@/components/ChainSummary.vue';
import AdBanner from '@/components/ad/AdBanner.vue';

import { computed, onMounted, ref } from 'vue';
import { useBlockchain } from '@/stores';

const dashboard = useDashboard();

const keywords = ref('');
const chains = computed(() => {
  if (keywords.value) {
    const lowercaseKeywords = keywords.value.toLowerCase();

    return Object.values(dashboard.chains).filter(
      (x: ChainConfig) =>
        x.chainName.toLowerCase().indexOf(lowercaseKeywords) > -1 ||
        x.prettyName.toLowerCase().indexOf(lowercaseKeywords) > -1
    );
  } else {
    return Object.values(dashboard.chains);
  }
});

const featured = computed(() => {
  const names = [
    'cosmos',
    'osmosis',
    'akash',
    'celestia',
    'evmos',
    'injective',
    'dydx',
    'noble',
  ];
  return chains.value
    .filter((x) => names.includes(x.chainName))
    .sort((a, b) => names.indexOf(a.chainName) - names.indexOf(b.chainName));
});
</script>
<template>
  <div class="landing-page">
    <!-- Hero Section -->
    <div
      class="hero-section bg-gradient-to-r from-[#38C7B4] to-[#217368] text-base-100 py-12 px-4 rounded-lg shadow-lg"
    >
      <div class="container mx-auto text-center">
        <h2 class="text-4xl font-bold mb-4 text-main">
          Manifest Network Explorer
        </h2>
        <p class="text-xl mb-8">
          Discover transactions, blocks, and validators in real-time
        </p>
        <a
          href="/manifest"
          class="btn btn-secondary dark:bg-[#202020] text-black dark:text-white"
          >Start Exploring</a
        >
      </div>
    </div>

    <!-- Features Section -->
    <div class="features-section py-16">
      <div class="container mx-auto">
        <div class="grid md:grid-cols-3 gap-8">
          <div
            class="card bg-[#ffffff] dark:bg-[#2B2B2B] shadow-xl cursor-pointer"
          >
            <div class="card-body">
              <Icon icon="mdi:magnify" class="text-4xl text-primary mb-4" />
              <h3 class="card-title text-main">Real-time Search</h3>
              <p>Instantly find transactions, blocks, and accounts</p>
            </div>
          </div>
          <div
            class="card bg-[#ffffff] dark:bg-[#2B2B2B] shadow-xl cursor-pointer"
            @click="$router.push('/manifest')"
          >
            <div class="card-body">
              <Icon icon="mdi:chart-line" class="text-4xl text-yes mb-4" />
              <h3 class="card-title text-main">Network Info</h3>
              <p>View comprehensive network information</p>
            </div>
          </div>
          <div
            class="card bg-[#ffffff] dark:bg-[#2B2B2B] shadow-xl cursor-pointer"
          >
            <div class="card-body">
              <Icon icon="mdi:account-group" class="text-4xl text-info mb-4" />
              <h3 class="card-title text-main">Validator Insights</h3>
              <p>
                Analyze
                <a
                  @click.stop="$router.push('/manifest/uptime')"
                  class="hover:underline text-primary"
                >
                  performance</a
                >
                and
                <a
                  @click.stop="$router.push('/manifest/staking')"
                  class="hover:underline text-primary"
                  >distribution</a
                >
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.logo path {
  fill: #171d30;
}

.card {
  transition: transform 0.3s ease;
}

.card:hover {
  transform: translateY(-5px);
}
</style>
