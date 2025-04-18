<script setup lang="ts">
import { ref, computed } from 'vue';

const avatars = ref([
    'https://i.pravatar.cc/150?img=1',
    'https://i.pravatar.cc/150?img=2',
    'https://i.pravatar.cc/150?img=3',
    'https://i.pravatar.cc/150?img=4',
    'https://i.pravatar.cc/150?img=5',
]);

const maxVisible = 3;
const totalAvatars = computed(() => avatars.value.length);
const remainingCount = computed(() => totalAvatars.value - maxVisible);
const visibleAvatars = computed(() => avatars.value.slice(0, maxVisible));
</script>

<template>
    <div class="flex -space-x-4">
        <div v-for="(avatar, index) in visibleAvatars" :key="index"
            class="relative inline-block">
            <img :src="avatar"
                class="w-10 h-10 rounded-full border-2 border-background hover:z-10 transition-transform hover:scale-110"
                :alt="`Avatar ${index + 1}`"
            />
        </div>
        <div v-if="remainingCount > 0"
            class="flex items-center justify-center w-10 h-10 rounded-full border-2 border-background bg-accent text-accent-foreground text-sm font-medium hover:z-10 transition-transform hover:scale-110">
            +{{ remainingCount }}
        </div>
    </div>
</template>

<style scoped>
.avatar-stack {
    display: flex;
    align-items: center;
}

.avatar-stack img {
    transition: transform 0.2s ease-in-out;
}

.avatar-stack img:hover {
    z-index: 10;
}
</style>
