import { ref, onMounted, watch } from 'vue';

export function useTheme() {
    const isDark = ref(false);

    const updateTheme = () => {
        isDark.value = document.documentElement.classList.contains('dark');
    };

    onMounted(() => {
        updateTheme();
        const observer = new MutationObserver(updateTheme);
        observer.observe(document.documentElement, {
            attributes: true,
            attributeFilter: ['class']
        });
    });

    return {
        isDark
    };
}
