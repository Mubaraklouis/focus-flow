<script setup lang="ts">
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Link } from '@inertiajs/vue3';

defineProps<{
    title?: string;
    description?: string;
    class?: string;
}>();
</script>

<template>
    <div class="flex min-h-svh flex-col items-center justify-center gap-6 bg-background p-6 md:p-10" :class="class">
        <div class="flex w-full max-w-md flex-col gap-6">
            <Link :href="route('home')" class="group flex items-center gap-2 self-center font-medium transition-all duration-300 hover:scale-105">
                <div class="flex h-10 w-10 items-center justify-center bg-primary/10 p-2 transition-all duration-300 group-hover:bg-primary/20">
                    <span class="text-primary font-bold text-base">Focus</span>
                </div>
                <span class="text-primary font-bold text-xl">Flow</span>
            </Link>

            <div class="flex flex-col gap-6">
                <Card class="rounded-xl border border-border shadow-md transition-all duration-300 hover:shadow-xl">
                    <CardHeader class="px-10 pb-0 pt-8 text-center">
                        <CardTitle class="text-2xl font-semibold tracking-tight text-foreground">{{ title }}</CardTitle>
                        <CardDescription class="mt-2 text-base text-muted-foreground">
                            {{ description }}
                        </CardDescription>
                    </CardHeader>
                    <CardContent class="px-10 py-8">
                        <slot />
                    </CardContent>
                </Card>
            </div>
        </div>
    </div>
</template>
