<script setup lang="ts">
import InputError from '@/components/InputError.vue';
import TextLink from '@/components/TextLink.vue';
import { Button } from '@/components/ui/button';
import { Checkbox } from '@/components/ui/checkbox';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import AuthBase from '@/layouts/AuthLayout.vue';
import { Head, useForm } from '@inertiajs/vue3';
import { LoaderCircle } from 'lucide-vue-next';

defineProps<{
    status?: string;
    canResetPassword: boolean;
}>();

const form = useForm({
    email: '',
    password: '',
    remember: false,
});

const submit = () => {
    form.post(route('login'), {
        onFinish: () => form.reset('password'),
    });
};
</script>

<template>
    <AuthBase
        title="Welcome Back"
        description="Continue your learning journey"
        variant="card"
    >
        <Head title="Log in" />

        <!-- Social Log-in Buttons -->
        <div class="flex flex-col gap-3 mb-8">
            <a :href="route('google.auth.redirect')" class="w-full">
                <Button class="w-full bg-primary hover:bg-primary/90 text-primary-foreground transition-colors">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-3" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M21.35 11.1h-9.17v2.72h5.27c-.23 1.3-.92 2.4-1.95 3.14v2.6h3.14c1.84-1.7 2.9-4.2 2.9-6.86 0-.46-.04-.92-.1-1.36z" fill="#4285F4"/>
                        <path d="M12.18 21.82c2.64 0 4.86-.88 6.48-2.4l-3.14-2.6c-.88.6-2 1-3.34 1-2.56 0-4.72-1.72-5.5-4.04H3.42v2.54c1.6 3.18 4.9 5.5 8.76 5.5z" fill="#34A853"/>
                        <path d="M6.68 13.78c-.2-.6-.3-1.24-.3-1.88s.1-1.28.3-1.88V7.48H3.42C2.72 8.92 2.36 10.44 2.36 12s.36 3.08 1.06 4.52l3.26-2.74z" fill="#FBBC05"/>
                        <path d="M12.18 5.5c1.44 0 2.74.5 3.76 1.48l2.8-2.8C16.98 2.8 14.76 2 12.18 2 8.32 2 5.02 4.32 3.42 7.5l3.26 2.54c.78-2.32 2.94-4.04 5.5-4.04z" fill="#EA4335"/>
                    </svg>
                    Continue with Google
                </Button>
            </a>

            <a :href="route('github.auth.redirect')" class="w-full">
                <Button
                    class="w-full bg-gray-800 text-white hover:bg-gray-700 dark:bg-neutral-800 dark:text-neutral-100 dark:hover:bg-neutral-700"
                    variant="secondary"
                >
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-3" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M12 2.04c-5.5 0-9.96 4.46-9.96 9.96 0 4.4 2.86 8.14 6.84 9.46.5.1.68-.22.68-.48v-1.7c-2.78.6-3.36-1.34-3.36-1.34-.46-1.16-1.12-1.48-1.12-1.48-.92-.64.06-.64.06-.64 1.02.06 1.56 1.04 1.56 1.04.92 1.56 2.4 1.1 3 .84.1-.66.36-1.1.66-1.34-2.22-.26-4.56-1.12-4.56-5 0-1.1.4-2.02 1.02-2.74-.1-.26-.46-1.34.1-2.8 0 0 .86-.26 2.8 1.02.8-.22 1.66-.32 2.52-.32.86 0 1.72.1 2.52.32 1.94-1.28 2.8-1.02 2.8-1.02.56 1.46.2 2.54.1 2.8.62.72 1.02 1.64 1.02 2.74 0 3.88-2.34 4.74-4.56 5 .36.32.7.92.7 1.86v2.76c0 .26.18.58.7.48 3.98-1.32 6.84-5.06 6.84-9.46 0-5.5-4.46-9.96-9.96-9.96z"/>
                    </svg>
                    Continue with Github
                </Button>
            </a>
        </div>

        <div class="relative my-8">
            <div class="absolute inset-0 flex items-center">
                <div class="w-full border-t border-border"></div>
            </div>
            <div class="relative flex justify-center text-xs uppercase">
                <span class="bg-card px-2 text-muted-foreground">Or continue with</span>
            </div>
        </div>

        <form @submit.prevent="submit" class="space-y-6">
            <div v-if="status" class="p-4 rounded-lg bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-200 text-sm">
                {{ status }}
            </div>

            <div class="space-y-4">
                <div class="space-y-2">
                    <Label class="text-sm font-medium text-foreground" for="email">Email</Label>
                    <Input
                        id="email"
                        type="email"
                        required
                        autofocus
                        autocomplete="email"
                        v-model="form.email"
                        placeholder="you@example.com"
                        class="w-full border border-input bg-background text-foreground focus:ring-2 focus:ring-primary/50 focus:border-primary"
                    />
                    <InputError :message="form.errors.email" />
                </div>

                <div class="space-y-2">
                    <div class="flex items-center justify-between">
                        <Label class="text-sm font-medium text-foreground" for="password">Password</Label>
                        <TextLink
                            v-if="canResetPassword"
                            :href="route('password.request')"
                            class="text-sm text-muted-foreground hover:text-primary"
                        >
                            Forgot password?
                        </TextLink>
                    </div>
                    <Input
                        id="password"
                        type="password"
                        required
                        autocomplete="current-password"
                        v-model="form.password"
                        placeholder="password"
                        class="w-full border border-input bg-background text-foreground focus:ring-2 focus:ring-primary/50 focus:border-primary"
                    />
                    <InputError :message="form.errors.password" />
                </div>

                <div class="flex items-center space-x-2">
                    <Checkbox
                        id="remember"
                        v-model="form.remember"
                        class="text-primary border-gray-300 dark:border-neutral-700 data-[state=checked]:bg-primary data-[state=checked]:border-primary"
                    />
                    <Label
                        for="remember"
                        class="text-sm font-medium text-foreground leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                    >
                        Remember me
                    </Label>
                </div>
            </div>

            <Button
                type="submit"
                class="w-full bg-primary hover:bg-primary/90 text-primary-foreground py-2.5 transition-all shadow-sm hover:shadow-md"
                :disabled="form.processing"
            >
                <LoaderCircle v-if="form.processing" class="h-4 w-4 mr-2 animate-spin" />
                {{ form.processing ? 'Signing in...' : 'Sign in' }}
            </Button>

            <p class="text-center text-sm text-muted-foreground">
                Don't have an account?
                <TextLink
                    :href="route('register')"
                    class="font-medium text-primary hover:text-primary/80"
                >
                    Create account
                </TextLink>
            </p>
        </form>
    </AuthBase>
</template>
