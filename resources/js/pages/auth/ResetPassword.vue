<script setup lang="ts">
import InputError from '@/components/InputError.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import AuthLayout from '@/layouts/AuthLayout.vue';
import { Head, useForm } from '@inertiajs/vue3';
import { LoaderCircle } from 'lucide-vue-next';

interface Props {
    token: string;
    email: string;
}

const props = defineProps<Props>();

const form = useForm({
    token: props.token,
    email: props.email,
    password: '',
    password_confirmation: '',
});

const submit = () => {
    form.post(route('password.store'), {
        onFinish: () => {
            form.reset('password', 'password_confirmation');
        },
    });
};
</script>

<template>
    <AuthLayout
        title="Reset password"
        description="Please enter your new password below"
        variant="card"
    >
        <Head title="Reset password" />

        <form @submit.prevent="submit">
            <div class="grid gap-6">
                <div class="grid gap-2">
                    <Label class="text-sm font-medium text-foreground" for="email">Email</Label>
                    <Input
                        id="email"
                        type="email"
                        name="email"
                        autocomplete="email"
                        v-model="form.email"
                        readonly
                        class="w-full border border-input bg-background/80 text-foreground/80 focus:ring-2 focus:ring-primary/50 focus:border-primary cursor-not-allowed"
                    />
                    <InputError :message="form.errors.email" />
                </div>

                <div class="grid gap-2">
                    <Label class="text-sm font-medium text-foreground" for="password">Password</Label>
                    <Input
                        id="password"
                        type="password"
                        name="password"
                        autocomplete="new-password"
                        v-model="form.password"
                        autofocus
                        placeholder="Password"
                        class="w-full border border-input bg-background text-foreground focus:ring-2 focus:ring-primary/50 focus:border-primary"
                    />
                    <InputError :message="form.errors.password" />
                </div>

                <div class="grid gap-2">
                    <Label class="text-sm font-medium text-foreground" for="password_confirmation">Confirm Password</Label>
                    <Input
                        id="password_confirmation"
                        type="password"
                        name="password_confirmation"
                        autocomplete="new-password"
                        v-model="form.password_confirmation"
                        placeholder="Confirm password"
                        class="w-full border border-input bg-background text-foreground focus:ring-2 focus:ring-primary/50 focus:border-primary"
                    />
                    <InputError :message="form.errors.password_confirmation" />
                </div>

                <Button
                    type="submit"
                    class="mt-4 w-full bg-primary hover:bg-primary/90 text-primary-foreground py-2.5 transition-all shadow-sm hover:shadow-md"
                    :disabled="form.processing"
                >
                    <LoaderCircle v-if="form.processing" class="h-4 w-4 mr-2 animate-spin" />
                    {{ form.processing ? 'Resetting password...' : 'Reset password' }}
                </Button>
            </div>
        </form>
    </AuthLayout>
</template>
