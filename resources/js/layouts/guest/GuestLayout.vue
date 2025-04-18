<script setup lang="ts">
import Navbar from '@/components/navbar/navbar.vue';
import ChatWidget from '@/components/ChatWidget.vue';
</script>

<template>

    <Navbar/>
    <slot/>
    <ChatWidget />



</template>
