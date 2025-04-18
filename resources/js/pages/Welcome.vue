
<script setup lang="ts">
import HeroSection from '@/components/heroSection/heroSection.vue';
import GuestLayout from '@/layouts/guest/GuestLayout.vue';
import Features from '@/components/features/features.vue';
import Pricing from '@/components/pricing/pricing.vue';
import Testimonial from '@/components/testimonial/testimonial.vue';
import Footer from '@/components/Footer.vue';
import Contact from '@/components/contact/contact.vue';
</script>

<template>

    <div>
        <GuestLayout>
            <HeroSection/>
            <Features/>
            <Pricing/>
            <Testimonial/>
            <Contact/>
            <Footer/>
        </GuestLayout>
    </div>

</template>