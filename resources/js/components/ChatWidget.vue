<script setup lang="ts">
import { ref, nextTick, watch } from 'vue';

interface Message {
  id: number;
  text: string;
  sender: 'user' | 'bot';
}

const isOpen = ref(false);
const newMessage = ref('');
const messages = ref<Message[]>([]);
const chatHistoryRef = ref<HTMLElement | null>(null);

// --- Audio Setup ---
// IMPORTANT: Place your sound files in `public/sounds/` and update filenames below
const sendSound = typeof Audio !== "undefined" ? new Audio('/sounds/message-sent.mp3') : null;
const receiveSound = typeof Audio !== "undefined" ? new Audio('/sounds/message-received.mp3') : null;
sendSound?.load(); // Preload sounds
receiveSound?.load();
// --- End Audio Setup ---

const toggleChat = () => {
  isOpen.value = !isOpen.value;
  if (isOpen.value && messages.value.length === 0) {
    // Add initial bot message if chat opens for the first time
    messages.value.push({
      id: Date.now(),
      text: 'Hello! Ask me about FocusFlow.',
      sender: 'bot'
    });
  }
};

const scrollToBottom = () => {
  nextTick(() => {
    if (chatHistoryRef.value) {
      chatHistoryRef.value.scrollTop = chatHistoryRef.value.scrollHeight;
    }
  });
};

watch(messages, scrollToBottom, { deep: true });

// --- Simulated Bot Logic ---
const getBotResponse = (userMessage: string): string => {
  const lowerCaseMessage = userMessage.toLowerCase();

  if (lowerCaseMessage.includes('hello') || lowerCaseMessage.includes('hi')) {
    return 'Hi there! How can I help you with FocusFlow today?';
  }
  if (lowerCaseMessage.includes('pricing')) {
    return 'You can find our pricing details on the Pricing section of our page! We have Basic (Free), Pro, and Enterprise plans.';
  }
  if (lowerCaseMessage.includes('feature')) {
    return 'FocusFlow offers task management, Pomodoro timer, note organization, AI quizzes, study analytics, group studies, and calendar integration. Check the Features section for more!';
  }
  if (lowerCaseMessage.includes('what is focusflow') || lowerCaseMessage.includes('about focusflow')) {
    return 'FocusFlow helps you track learning progress, manage courses, assignments, quizzes, and projects with productivity tools.';
  }
  if (lowerCaseMessage.includes('contact')) {
    return 'You can reach out to us via the Contact form on the page.';
  }
  if (lowerCaseMessage.includes('bye') || lowerCaseMessage.includes('thanks') ){
    return 'You\'re welcome! Let me know if you have more questions.';
  }

  return "Sorry, I didn\'t quite understand that. Can you rephrase? You can ask about features, pricing, or contact info.";
};
// --- End Simulated Bot Logic ---

const sendMessage = () => {
  const text = newMessage.value.trim();
  if (!text) return;

  // Add user message
  messages.value.push({
    id: Date.now(),
    text: text,
    sender: 'user'
  });

  // Play send sound
  sendSound?.play().catch(e => console.error("Error playing send sound:", e));

  newMessage.value = ''; // Clear input

  // Simulate bot response after a short delay
  setTimeout(() => {
    const botText = getBotResponse(text);
    messages.value.push({
      id: Date.now() + 1, // Ensure unique ID
      text: botText,
      sender: 'bot'
    });
    // Play receive sound
    receiveSound?.play().catch(e => console.error("Error playing receive sound:", e));
  }, 600); // Simulate thinking time

};

</script>

<template>
  <div>
    <!-- Chat Icon Button -->
    <button
      @click="toggleChat"
      aria-label="Chat with FocusFlow bot"
      class="fixed bottom-5 right-5 z-50 p-3 bg-primary text-primary-foreground rounded-full shadow-lg hover:bg-primary/90 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 transition-transform transform hover:scale-110"
    >
      <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
        <path stroke-linecap="round" stroke-linejoin="round" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z" />
      </svg>
    </button>

    <!-- Chat Panel -->
    <transition
      enter-active-class="transition ease-out duration-200"
      enter-from-class="transform opacity-0 scale-95 translate-y-4"
      enter-to-class="transform opacity-100 scale-100 translate-y-0"
      leave-active-class="transition ease-in duration-150"
      leave-from-class="transform opacity-100 scale-100 translate-y-0"
      leave-to-class="transform opacity-0 scale-95 translate-y-4"
    >
      <div
        v-if="isOpen"
        class="fixed bottom-20 right-5 z-40 w-full max-w-sm h-[70vh] max-h-[500px] flex flex-col bg-background border border-border rounded-lg shadow-xl dark:bg-gray-800 dark:border-gray-700 overflow-hidden"
      >
        <!-- Header -->
        <div class="flex-shrink-0 p-4 border-b border-border dark:border-gray-700 bg-gray-50 dark:bg-gray-900/50">
          <div class="flex justify-between items-center">
            <h3 class="text-lg font-semibold text-foreground dark:text-white">FocusFlow Assistant</h3>
            <button
              @click="toggleChat"
              aria-label="Close chat"
              class="text-muted-foreground hover:text-foreground dark:text-gray-400 dark:hover:text-white p-1 rounded-full hover:bg-accent dark:hover:bg-gray-700"
            >
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>
        </div>

        <!-- Chat History -->
        <div ref="chatHistoryRef" class="flex-grow p-4 space-y-4 overflow-y-auto">
          <div v-for="message in messages" :key="message.id" class="flex" :class="message.sender === 'user' ? 'justify-end' : 'justify-start'">
            <div
              class="max-w-[75%] px-4 py-2 rounded-lg shadow"
              :class="{
                'bg-primary text-primary-foreground': message.sender === 'user',
                'bg-accent text-accent-foreground dark:bg-gray-700 dark:text-gray-200': message.sender === 'bot'
              }"
            >
              <p class="text-sm">{{ message.text }}</p>
            </div>
          </div>
        </div>

        <!-- Input Area -->
        <div class="flex-shrink-0 p-4 border-t border-border dark:border-gray-700 bg-gray-50 dark:bg-gray-900/50">
          <form @submit.prevent="sendMessage" class="flex items-center space-x-2">
            <input
              v-model="newMessage"
              type="text"
              placeholder="Ask about FocusFlow..."
              autocomplete="off"
              class="flex-grow px-3 py-2 text-sm bg-background dark:bg-gray-700 text-foreground dark:text-white border border-border dark:border-gray-600 rounded-md focus:outline-none focus:ring-1 focus:ring-primary dark:focus:ring-primary"
            />
            <button
              type="submit"
              :disabled="!newMessage.trim()"
              class="p-2 rounded-md bg-primary text-primary-foreground hover:bg-primary/90 disabled:opacity-50 disabled:cursor-not-allowed focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-1 transition-colors"
            >
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                <path d="M10.894 2.553a1 1 0 00-1.789 0l-7 14a1 1 0 001.169 1.409l5-1.429A1 1 0 009 16.571V11.5a1 1 0 011-1h.094a1 1 0 01.999.999v5.071a1 1 0 00.627.928l5 1.428a1 1 0 001.17-1.408l-7-14z" />
              </svg>
            </button>
          </form>
        </div>
      </div>
    </transition>
  </div>
</template>

<style scoped>
/* Custom scrollbar for chat history (optional) */
.overflow-y-auto::-webkit-scrollbar {
  width: 6px;
}

.overflow-y-auto::-webkit-scrollbar-track {
  background: transparent;
}

.overflow-y-auto::-webkit-scrollbar-thumb {
  background-color: rgba(156, 163, 175, 0.5); /* gray-400 with opacity */
  border-radius: 3px;
}

.dark .overflow-y-auto::-webkit-scrollbar-thumb {
  background-color: rgba(107, 114, 128, 0.5); /* gray-500 with opacity */
}
</style>
