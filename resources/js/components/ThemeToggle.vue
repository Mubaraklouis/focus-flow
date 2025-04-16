<script setup lang="ts">
import { ref, onMounted, watch } from 'vue';
import { Moon, Sun } from 'lucide-vue-next';

const isDark = ref(false);

const toggleTheme = () => {
    isDark.value = !isDark.value;
    document.documentElement.classList.toggle('dark');
    localStorage.setItem('theme', isDark.value ? 'dark' : 'light');
};

onMounted(() => {
    // Check for saved theme preference or system preference
    const savedTheme = localStorage.getItem('theme');
    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;

    isDark.value = savedTheme === 'dark' || (!savedTheme && prefersDark);
    if (isDark.value) {
        document.documentElement.classList.add('dark');
    }
});

// Watch for system theme changes
watch(isDark, (newValue) => {
    document.documentElement.classList.toggle('dark', newValue);
});
</script>

<template>
    <button
        @click="toggleTheme"
        class="inline-flex items-center justify-center rounded-md p-2 text-sm font-medium transition-colors hover:bg-accent hover:text-accent-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2"
        :aria-label="isDark ? 'Switch to light mode' : 'Switch to dark mode'"
    >
        <Sun v-if="isDark" class="h-5 w-5 rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0" />
        <Moon v-else class="absolute h-5 w-5 rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100" />
        <Sun v-if="isDark" class="absolute h-5 w-5 rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100" />
        <Moon v-else class="h-5 w-5 rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0" />
        <span class="sr-only">Toggle theme</span>
    </button>
</template>
