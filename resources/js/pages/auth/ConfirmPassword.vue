<script setup lang="ts">
import InputError from '@/components/InputError.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import AuthLayout from '@/layouts/AuthLayout.vue';
import { Head, useForm } from '@inertiajs/vue3';
import { LoaderCircle } from 'lucide-vue-next';

const form = useForm({
    password: '',
});

const submit = () => {
    form.post(route('password.confirm'), {
        onFinish: () => {
            form.reset();
        },
    });
};
</script>

<template>
    <AuthLayout
        title="Confirm your password"
        description="This is a secure area of the application. Please confirm your password before continuing."
        variant="card"
    >
        <Head title="Confirm password" />

        <form @submit.prevent="submit">
            <div class="space-y-6">
                <div class="grid gap-2">
                    <Label class="text-sm font-medium text-foreground" for="password">Password</Label>
                    <Input
                        id="password"
                        type="password"
                        v-model="form.password"
                        required
                        autocomplete="current-password"
                        autofocus
                        placeholder="••••••••"
                        class="w-full border border-input bg-background text-foreground focus:ring-2 focus:ring-primary/50 focus:border-primary"
                    />
                    <InputError :message="form.errors.password" />
                </div>

                <div class="flex items-center">
                    <Button
                        class="w-full bg-primary hover:bg-primary/90 text-primary-foreground py-2.5 transition-all shadow-sm hover:shadow-md"
                        :disabled="form.processing"
                    >
                        <LoaderCircle v-if="form.processing" class="h-4 w-4 mr-2 animate-spin" />
                        {{ form.processing ? 'Confirming...' : 'Confirm Password' }}
                    </Button>
                </div>
            </div>
        </form>
    </AuthLayout>
</template>
