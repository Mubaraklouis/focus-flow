<script setup lang="ts">
import InputError from '@/components/InputError.vue';
import TextLink from '@/components/TextLink.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import AuthLayout from '@/layouts/AuthLayout.vue';
import { Head, useForm } from '@inertiajs/vue3';
import { LoaderCircle } from 'lucide-vue-next';

defineProps<{
    status?: string;
}>();

const form = useForm({
    email: '',
});

const submit = () => {
    form.post(route('password.email'));
};
</script>

<template>
    <AuthLayout
        title="Forgot password"
        description="Enter your email to receive a password reset link"
        variant="card"
    >
        <Head title="Forgot password" />

        <div v-if="status" class="mb-4 p-4 rounded-lg bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-200 text-sm">
            {{ status }}
        </div>

        <div class="space-y-6">
            <form @submit.prevent="submit">
                <div class="grid gap-2">
                    <Label class="text-sm font-medium text-foreground" for="email">Email address</Label>
                    <Input
                        id="email"
                        type="email"
                        name="email"
                        autocomplete="off"
                        v-model="form.email"
                        autofocus
                        placeholder="email@example.com"
                        class="w-full border border-input bg-background text-foreground focus:ring-2 focus:ring-primary/50 focus:border-primary"
                    />
                    <InputError :message="form.errors.email" />
                </div>

                <div class="my-6 flex items-center justify-start">
                    <Button
                        class="w-full bg-primary hover:bg-primary/90 text-primary-foreground py-2.5 transition-all shadow-sm hover:shadow-md"
                        :disabled="form.processing"
                    >
                        <LoaderCircle v-if="form.processing" class="h-4 w-4 mr-2 animate-spin" />
                        {{ form.processing ? 'Sending link...' : 'Email password reset link' }}
                    </Button>
                </div>
            </form>

            <div class="text-center text-sm text-muted-foreground">
                <span>Or, return to </span>
                <TextLink :href="route('login')" class="font-medium text-primary hover:text-primary/80">log in</TextLink>
            </div>
        </div>
    </AuthLayout>
</template>
