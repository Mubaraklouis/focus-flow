<script setup lang="ts">
import { ref } from 'vue';
import Button from '@/components/ui/button/Button.vue';
import ThemeToggle from '@/components/ThemeToggle.vue';

const isMobileMenuOpen = ref(false);

const toggleMobileMenu = () => {
    isMobileMenuOpen.value = !isMobileMenuOpen.value;
};
</script>

<template>
    <nav class="border-gray-200 bg-white py-2.5 dark:bg-gray-900">
        <div class="mx-auto flex max-w-screen-xl flex-wrap items-center justify-between px-4">
            <a href="#" class="flex items-center">
                <span
                    class="self-center whitespace-nowrap text-xl font-extrabold text-[#F25A2C] dark:text-white">FocusFlow</span>
            </a>
            <div class="flex items-center lg:order-2">
                <div class="mr-4 mt-2 hidden sm:inline-block">
                    <span></span>
                </div>

                <!-- Desktop Buttons -->
                <div class="hidden lg:flex items-center gap-5">
                    <ThemeToggle />
                    <Button variant="outline">
                        Sign Up
                    </Button>
                    <Button>
                        Get started
                    </Button>
                </div>

                <button @click="toggleMobileMenu" type="button"
                    class="ml-1 inline-flex items-center rounded-lg p-2 text-sm text-gray-500 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600 lg:hidden"
                    aria-controls="mobile-menu-2" :aria-expanded="isMobileMenuOpen">
                    <span class="sr-only">Open main menu</span>
                    <svg v-if="!isMobileMenuOpen" class="h-6 w-6" fill="currentColor" viewBox="0 0 20 20"
                        xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                            d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                            clip-rule="evenodd"></path>
                    </svg>
                    <svg v-else class="h-6 w-6" fill="currentColor" viewBox="0 0 20 20"
                        xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                            d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                            clip-rule="evenodd"></path>
                    </svg>
                </button>
            </div>
            <div class="w-full items-center justify-between lg:order-1 lg:flex lg:w-auto"
                :class="{ hidden: !isMobileMenuOpen }" id="mobile-menu-2">
                <ul class="mt-4 flex flex-col font-medium lg:mt-0 lg:flex-row lg:space-x-8">
                    <li>
                        <a href="#"
                            class="bg-purple-[#F25A2C] block rounded py-2 pl-3 pr-4 text-white dark:text-white lg:bg-transparent lg:p-0 lg:text-purple-700"
                            aria-current="page">Features</a>
                    </li>
                    <li>
                        <a href="#"
                            class="block border-b border-gray-100 py-2 pl-3 pr-4 text-gray-700 hover:bg-gray-50 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white lg:border-0 lg:p-0 lg:hover:bg-transparent lg:hover:text-purple-700 lg:dark:hover:bg-transparent lg:dark:hover:text-white">Blog</a>
                    </li>
                    <li>
                        <a href="#"
                            class="block border-b border-gray-100 py-2 pl-3 pr-4 text-gray-700 hover:bg-gray-50 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white lg:border-0 lg:p-0 lg:hover:bg-transparent lg:hover:text-purple-700 lg:dark:hover:bg-transparent lg:dark:hover:text-white">Pricing</a>
                    </li>
                    <li>
                        <a href="#"
                            class="block border-b border-gray-100 py-2 pl-3 pr-4 text-gray-700 hover:bg-gray-50 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white lg:border-0 lg:p-0 lg:hover:bg-transparent lg:hover:text-purple-700 lg:dark:hover:bg-transparent lg:dark:hover:text-white">Contact</a>
                    </li>
                    <li>
                        <a href="#"
                            class="block border-b border-gray-100 py-2 pl-3 pr-4 text-gray-700 hover:bg-gray-50 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white lg:border-0 lg:p-0 lg:hover:bg-transparent lg:hover:text-purple-700 lg:dark:hover:bg-transparent lg:dark:hover:text-white">Team</a>
                    </li>
                    <!-- Mobile Buttons -->
                    <li class="lg:hidden">
                        <div class="flex flex-col gap-3 px-3 py-2">
                            <ThemeToggle />
                            <Button variant="outline" class="w-full">
                                Sign Up
                            </Button>
                            <Button class="w-full">
                                Get started
                            </Button>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</template>
