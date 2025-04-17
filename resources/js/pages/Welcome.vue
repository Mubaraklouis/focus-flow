
<script setup lang="ts">
import HeroSection from '@/components/heroSection/heroSection.vue';
import GuestLayout from '@/layouts/guest/GuestLayout.vue';
import Features from '@/components/features/features.vue';
import Pricing from '@/components/pricing/pricing.vue';
</script>

<template>

    <div>
        <GuestLayout>
            <HeroSection/>
            <Features/>
            <Pricing/>
        </GuestLayout>
    </div>

</template>