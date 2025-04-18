<script setup lang="ts">
import { useTheme } from '../../composables/useTheme';

const { isDark } = useTheme();
</script>

<template>
    <div>
        <section id="testimonies" class="py-20" :class="isDark ? 'bg-[#0F1729]' : 'bg-[#FBF2E5]'">
            <div class="max-w-6xl mx-8 md:mx-10 lg:mx-20 xl:mx-auto">
                <div class="transition duration-500 ease-in-out transform scale-100 translate-x-0 translate-y-0 opacity-100">
                    <div class="mb-12 space-y-5 md:mb-16 md:text-center">
                        <div class="inline-block px-3 py-1 text-sm font-semibold rounded-lg md:text-center text-cn hover:cursor-pointer bg-accent text-accent-foreground hover:bg-accent/80">
                            Words from Others
                        </div>
                        <h1 class="mb-5 text-3xl font-semibold md:text-center md:text-5xl" :class="isDark ? 'text-primary' : 'text-primary'">
                            It's not just us.
                        </h1>
                        <p class="text-xl md:text-center md:text-2xl" :class="isDark ? 'text-gray-100' : 'text-foreground/80'">
                            Here's what others have to say about us.
                        </p>
                    </div>
                </div>

                <div class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3 lg:gap-8">
                    <ul class="space-y-8">
                        <li class="text-sm leading-6">
                            <div class="relative group">
                                <div class="absolute transition rounded-lg opacity-15 -inset-1 bg-gradient-to-r from-purple-600 to-pink-600 blur duration-400 group-hover:opacity-80 group-hover:duration-200"></div>
                                <a href="https://twitter.com/kanyewest" class="cursor-pointer">
                                    <div class="relative p-6 space-y-6 leading-none rounded-lg" :class="isDark ? 'bg-[#1E293B] ring-1 ring-gray-900/5' : 'bg-[#F5EDE2] border border-primary/30'">
                                        <div class="flex items-center space-x-4">
                                            <img src="https://pbs.twimg.com/profile_images/1276461929934942210/cqNhNk6v_400x400.jpg" class="w-12 h-12 bg-center bg-cover border rounded-full" alt="Kanye West">
                                            <div>
                                                <h3 class="text-lg font-semibold" :class="isDark ? 'text-white' : 'text-foreground'">Kanye West</h3>
                                                <p class="text-md" :class="isDark ? 'text-gray-400' : 'text-muted-foreground'">Rapper &amp; Entrepreneur</p>
                                            </div>
                                        </div>
                                        <p class="leading-normal text-md" :class="isDark ? 'text-gray-300' : 'text-foreground/80'">Find God.</p>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li class="text-sm leading-6">
                            <div class="relative group">
                                <div class="absolute transition rounded-lg opacity-15 -inset-1 bg-gradient-to-r from-purple-600 to-pink-600 blur duration-400 group-hover:opacity-80 group-hover:duration-200"></div>
                                <a href="https://twitter.com/tim_cook" class="cursor-pointer">
                                    <div class="relative p-6 space-y-6 leading-none rounded-lg" :class="isDark ? 'bg-[#1E293B] ring-1 ring-gray-900/5' : 'bg-[#F5EDE2] border border-primary/30'">
                                        <div class="flex items-center space-x-4">
                                            <img src="https://pbs.twimg.com/profile_images/1535420431766671360/Pwq-1eJc_400x400.jpg" class="w-12 h-12 bg-center bg-cover border rounded-full" alt="Tim Cook">
                                            <div>
                                                <h3 class="text-lg font-semibold" :class="isDark ? 'text-white' : 'text-foreground'">Tim Cook</h3>
                                                <p class="text-md" :class="isDark ? 'text-gray-400' : 'text-muted-foreground'">CEO of Apple</p>
                                            </div>
                                        </div>
                                        <p class="leading-normal text-md" :class="isDark ? 'text-gray-300' : 'text-foreground/80'">Diam quis enim lobortis scelerisque fermentum dui faucibus in ornare. Donec pretium vulputate sapien nec sagittis aliquam malesuada bibendum.</p>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li class="text-sm leading-6">
                            <div class="relative group">
                                <div class="absolute transition rounded-lg opacity-15 -inset-1 bg-gradient-to-r from-purple-600 to-pink-600 blur duration-400 group-hover:opacity-80 group-hover:duration-200"></div>
                                <a href="https://twitter.com/kanyewest" class="cursor-pointer">
                                    <div class="relative p-6 space-y-6 leading-none rounded-lg" :class="isDark ? 'bg-[#1E293B] ring-1 ring-gray-900/5' : 'bg-[#F5EDE2] border border-primary/30'">
                                        <div class="flex items-center space-x-4">
                                            <img src="https://pbs.twimg.com/profile_images/1276461929934942210/cqNhNk6v_400x400.jpg" class="w-12 h-12 bg-center bg-cover border rounded-full" alt="Kanye West">
                                            <div>
                                                <h3 class="text-lg font-semibold" :class="isDark ? 'text-white' : 'text-foreground'">Kanye West</h3>
                                                <p class="text-md" :class="isDark ? 'text-gray-400' : 'text-muted-foreground'">Rapper &amp; Entrepreneur</p>
                                            </div>
                                        </div>
                                        <p class="leading-normal text-md" :class="isDark ? 'text-gray-300' : 'text-foreground/80'">Find God.</p>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li class="text-sm leading-6">
                            <div class="relative group">
                                <div class="absolute transition rounded-lg opacity-15 -inset-1 bg-gradient-to-r from-purple-600 to-pink-600 blur duration-400 group-hover:opacity-80 group-hover:duration-200"></div>
                                <a href="https://twitter.com/tim_cook" class="cursor-pointer">
                                    <div class="relative p-6 space-y-6 leading-none rounded-lg" :class="isDark ? 'bg-[#1E293B] ring-1 ring-gray-900/5' : 'bg-[#F5EDE2] border border-primary/30'">
                                        <div class="flex items-center space-x-4">
                                            <img src="https://pbs.twimg.com/profile_images/1535420431766671360/Pwq-1eJc_400x400.jpg" class="w-12 h-12 bg-center bg-cover border rounded-full" alt="Tim Cook">
                                            <div>
                                                <h3 class="text-lg font-semibold" :class="isDark ? 'text-white' : 'text-foreground'">Tim Cook</h3>
                                                <p class="text-md" :class="isDark ? 'text-gray-400' : 'text-muted-foreground'">CEO of Apple</p>
                                            </div>
                                        </div>
                                        <p class="leading-normal text-md" :class="isDark ? 'text-gray-300' : 'text-foreground/80'">Diam quis enim lobortis scelerisque fermentum dui faucibus in ornare. Donec pretium vulputate sapien nec sagittis aliquam malesuada bibendum.</p>
                                    </div>
                                </a>
                            </div>
                        </li>
                    </ul>

                    <ul class="hidden space-y-8 sm:block">
                        <li class="text-sm leading-6">
                            <div class="relative group">
                                <div class="absolute transition rounded-lg opacity-15 -inset-1 bg-gradient-to-r from-purple-600 to-pink-600 blur duration-400 group-hover:opacity-80 group-hover:duration-200"></div>
                                <a href="https://twitter.com/paraga" class="cursor-pointer">
                                    <div class="relative p-6 space-y-6 leading-none rounded-lg" :class="isDark ? 'bg-[#1E293B] ring-1 ring-gray-900/5' : 'bg-[#F5EDE2] border border-primary/30'">
                                        <div class="flex items-center space-x-4">
                                            <img src="https://pbs.twimg.com/profile_images/1375285353146327052/y6jeByyD_400x400.jpg" class="w-12 h-12 bg-center bg-cover border rounded-full" alt="Parag Agrawal">
                                            <div>
                                                <h3 class="text-lg font-semibold" :class="isDark ? 'text-white' : 'text-foreground'">Parag Agrawal</h3>
                                                <p class="text-md" :class="isDark ? 'text-gray-400' : 'text-muted-foreground'">CEO of Twitter</p>
                                            </div>
                                        </div>
                                        <p class="leading-normal text-md" :class="isDark ? 'text-gray-300' : 'text-foreground/80'">Enim neque volutpat ac tincidunt vitae semper. Mattis aliquam faucibus purus in massa tempor. Neque vitae tempus quam pellentesque nec. Turpis cursus in hac habitasse platea dictumst.</p>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li class="text-sm leading-6">
                            <div class="relative group">
                                <div class="absolute transition rounded-lg opacity-15 -inset-1 bg-gradient-to-r from-purple-600 to-pink-600 blur duration-400 group-hover:opacity-80 group-hover:duration-200"></div>
                                <a href="https://twitter.com/tim_cook" class="cursor-pointer">
                                    <div class="relative p-6 space-y-6 leading-none rounded-lg" :class="isDark ? 'bg-[#1E293B] ring-1 ring-gray-900/5' : 'bg-[#F5EDE2] border border-primary/30'">
                                        <div class="flex items-center space-x-4">
                                            <img src="https://pbs.twimg.com/profile_images/1535420431766671360/Pwq-1eJc_400x400.jpg" class="w-12 h-12 bg-center bg-cover border rounded-full" alt="Tim Cook">
                                            <div>
                                                <h3 class="text-lg font-semibold" :class="isDark ? 'text-white' : 'text-foreground'">Tim Cook</h3>
                                                <p class="text-md" :class="isDark ? 'text-gray-400' : 'text-muted-foreground'">CEO of Apple</p>
                                            </div>
                                        </div>
                                        <p class="leading-normal text-md" :class="isDark ? 'text-gray-300' : 'text-foreground/80'">Diam quis enim lobortis scelerisque fermentum dui faucibus in ornare. Donec pretium vulputate sapien nec sagittis aliquam malesuada bibendum.</p>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li class="text-sm leading-6">
                            <div class="relative group">
                                <div class="absolute transition rounded-lg opacity-15 -inset-1 bg-gradient-to-r from-purple-600 to-pink-600 blur duration-400 group-hover:opacity-80 group-hover:duration-200"></div>
                                <a href="https://twitter.com/paraga" class="cursor-pointer">
                                    <div class="relative p-6 space-y-6 leading-none rounded-lg" :class="isDark ? 'bg-[#1E293B] ring-1 ring-gray-900/5' : 'bg-[#F5EDE2] border border-primary/30'">
                                        <div class="flex items-center space-x-4">
                                            <img src="https://pbs.twimg.com/profile_images/1375285353146327052/y6jeByyD_400x400.jpg" class="w-12 h-12 bg-center bg-cover border rounded-full" alt="Parag Agrawal">
                                            <div>
                                                <h3 class="text-lg font-semibold" :class="isDark ? 'text-white' : 'text-foreground'">Parag Agrawal</h3>
                                                <p class="text-md" :class="isDark ? 'text-gray-400' : 'text-muted-foreground'">CEO of Twitter</p>
                                            </div>
                                        </div>
                                        <p class="leading-normal text-md" :class="isDark ? 'text-gray-300' : 'text-foreground/80'">Enim neque volutpat ac tincidunt vitae semper. Mattis aliquam faucibus purus in massa tempor. Neque vitae tempus quam pellentesque nec. Turpis cursus in hac habitasse platea dictumst.</p>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li class="text-sm leading-6">
                            <div class="relative group">
                                <div class="absolute transition rounded-lg opacity-15 -inset-1 bg-gradient-to-r from-purple-600 to-pink-600 blur duration-400 group-hover:opacity-80 group-hover:duration-200"></div>
                                <a href="https://twitter.com/tim_cook" class="cursor-pointer">
                                    <div class="relative p-6 space-y-6 leading-none rounded-lg" :class="isDark ? 'bg-[#1E293B] ring-1 ring-gray-900/5' : 'bg-[#F5EDE2] border border-primary/30'">
                                        <div class="flex items-center space-x-4">
                                            <img src="https://pbs.twimg.com/profile_images/1535420431766671360/Pwq-1eJc_400x400.jpg" class="w-12 h-12 bg-center bg-cover border rounded-full" alt="Tim Cook">
                                            <div>
                                                <h3 class="text-lg font-semibold" :class="isDark ? 'text-white' : 'text-foreground'">Tim Cook</h3>
                                                <p class="text-md" :class="isDark ? 'text-gray-400' : 'text-muted-foreground'">CEO of Apple</p>
                                            </div>
                                        </div>
                                        <p class="leading-normal text-md" :class="isDark ? 'text-gray-300' : 'text-foreground/80'">Diam quis enim lobortis scelerisque fermentum dui faucibus in ornare. Donec pretium vulputate sapien nec sagittis aliquam malesuada bibendum.</p>
                                    </div>
                                </a>
                            </div>
                        </li>
                    </ul>

                    <ul class="hidden space-y-8 lg:block">
                        <li class="text-sm leading-6">
                            <div class="relative group">
                                <div class="absolute transition rounded-lg opacity-15 -inset-1 bg-gradient-to-r from-purple-600 to-pink-600 blur duration-400 group-hover:opacity-80 group-hover:duration-200"></div>
                                <a href="https://twitter.com/satyanadella" class="cursor-pointer">
                                    <div class="relative p-6 space-y-6 leading-none rounded-lg" :class="isDark ? 'bg-[#1E293B] ring-1 ring-gray-900/5' : 'bg-[#F5EDE2] border border-primary/30'">
                                        <div class="flex items-center space-x-4">
                                            <img src="https://pbs.twimg.com/profile_images/1221837516816306177/_Ld4un5A_400x400.jpg" class="w-12 h-12 bg-center bg-cover border rounded-full" alt="Satya Nadella">
                                            <div>
                                                <h3 class="text-lg font-semibold" :class="isDark ? 'text-white' : 'text-foreground'">Satya Nadella</h3>
                                                <p class="text-md" :class="isDark ? 'text-gray-400' : 'text-muted-foreground'">CEO of Microsoft</p>
                                            </div>
                                        </div>
                                        <p class="leading-normal text-md" :class="isDark ? 'text-gray-300' : 'text-foreground/80'">Tortor dignissim convallis aenean et tortor at. At ultrices mi tempus imperdiet nulla malesuada. Id cursus metus aliquam eleifend mi. Quis ipsum suspendisse ultrices gravida dictum fusce ut.</p>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li class="text-sm leading-6">
                            <div class="relative group">
                                <div class="absolute transition rounded-lg opacity-15 -inset-1 bg-gradient-to-r from-purple-600 to-pink-600 blur duration-400 group-hover:opacity-80 group-hover:duration-200"></div>
                                <a href="https://twitter.com/dan_schulman" class="cursor-pointer">
                                    <div class="relative p-6 space-y-6 leading-none rounded-lg" :class="isDark ? 'bg-[#1E293B] ring-1 ring-gray-900/5' : 'bg-[#F5EDE2] border border-primary/30'">
                                        <div class="flex items-center space-x-4">
                                            <img src="https://pbs.twimg.com/profile_images/516916920482672641/3jCeLgFb_400x400.jpeg" class="w-12 h-12 bg-center bg-cover border rounded-full" alt="Dan Schulman">
                                            <div>
                                                <h3 class="text-lg font-semibold" :class="isDark ? 'text-white' : 'text-foreground'">Dan Schulman</h3>
                                                <p class="text-md" :class="isDark ? 'text-gray-400' : 'text-muted-foreground'">CEO of PayPal</p>
                                            </div>
                                        </div>
                                        <p class="leading-normal text-md" :class="isDark ? 'text-gray-300' : 'text-foreground/80'">Quam pellentesque nec nam aliquam sem et tortor consequat id. Enim sit amet venenatis urna cursus.</p>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li class="text-sm leading-6">
                            <div class="relative group">
                                <div class="absolute transition rounded-lg opacity-15 -inset-1 bg-gradient-to-r from-purple-600 to-pink-600 blur duration-400 group-hover:opacity-80 group-hover:duration-200"></div>
                                <a href="https://twitter.com/satyanadella" class="cursor-pointer">
                                    <div class="relative p-6 space-y-6 leading-none rounded-lg" :class="isDark ? 'bg-[#1E293B] ring-1 ring-gray-900/5' : 'bg-[#F5EDE2] border border-primary/30'">
                                        <div class="flex items-center space-x-4">
                                            <img src="https://pbs.twimg.com/profile_images/1221837516816306177/_Ld4un5A_400x400.jpg" class="w-12 h-12 bg-center bg-cover border rounded-full" alt="Satya Nadella">
                                            <div>
                                                <h3 class="text-lg font-semibold" :class="isDark ? 'text-white' : 'text-foreground'">Satya Nadella</h3>
                                                <p class="text-md" :class="isDark ? 'text-gray-400' : 'text-muted-foreground'">CEO of Microsoft</p>
                                            </div>
                                        </div>
                                        <p class="leading-normal text-md" :class="isDark ? 'text-gray-300' : 'text-foreground/80'">Tortor dignissim convallis aenean et tortor at. At ultrices mi tempus imperdiet nulla malesuada. Id cursus metus aliquam eleifend mi. Quis ipsum suspendisse ultrices gravida dictum fusce ut.</p>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li class="text-sm leading-6">
                            <div class="relative group">
                                <div class="absolute transition rounded-lg opacity-15 -inset-1 bg-gradient-to-r from-purple-600 to-pink-600 blur duration-400 group-hover:opacity-80 group-hover:duration-200"></div>
                                <a href="https://twitter.com/dan_schulman" class="cursor-pointer">
                                    <div class="relative p-6 space-y-6 leading-none rounded-lg" :class="isDark ? 'bg-[#1E293B] ring-1 ring-gray-900/5' : 'bg-[#F5EDE2] border border-primary/30'">
                                        <div class="flex items-center space-x-4">
                                            <img src="https://pbs.twimg.com/profile_images/516916920482672641/3jCeLgFb_400x400.jpeg" class="w-12 h-12 bg-center bg-cover border rounded-full" alt="Dan Schulman">
                                            <div>
                                                <h3 class="text-lg font-semibold" :class="isDark ? 'text-white' : 'text-foreground'">Dan Schulman</h3>
                                                <p class="text-md" :class="isDark ? 'text-gray-400' : 'text-muted-foreground'">CEO of PayPal</p>
                                            </div>
                                        </div>
                                        <p class="leading-normal text-md" :class="isDark ? 'text-gray-300' : 'text-foreground/80'">Quam pellentesque nec nam aliquam sem et tortor consequat id. Enim sit amet venenatis urna cursus.</p>
                                    </div>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
    </div>
</template>
