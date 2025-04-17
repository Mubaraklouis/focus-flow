
<script setup lang="ts">
import HeroSection from '@/components/heroSection/heroSection.vue';
import GuestLayout from '@/layouts/guest/GuestLayout.vue';
import Features from '@/components/features/features.vue';

</script>

<template>

    <div>
        <GuestLayout>
            <HeroSection/>
            <Features/>
        </GuestLayout>
    </div>

</template>