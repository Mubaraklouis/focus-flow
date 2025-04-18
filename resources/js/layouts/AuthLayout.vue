<script setup lang="ts">
import AuthSimpleLayout from '@/layouts/auth/AuthSimpleLayout.vue';
import AuthCardLayout from '@/layouts/auth/AuthCardLayout.vue';
import AuthSplitLayout from '@/layouts/auth/AuthSplitLayout.vue';

defineProps<{
    title?: string;
    description?: string;
    variant?: 'simple' | 'card' | 'split';
    class?: string;
}>();
</script>

<template>
    <component
        :is="variant === 'card' ? AuthCardLayout : variant === 'split' ? AuthSplitLayout : AuthSimpleLayout"
        :title="title"
        :description="description"
        :class="class"
    >
        <slot />
    </component>
</template>
