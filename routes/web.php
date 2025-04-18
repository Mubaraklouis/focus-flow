<?php

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

Route::get('/', function () {
    return Inertia::render('Welcome');
})->name('home');

Route::get('dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth'])->name('dashboard');

use Laravel\Socialite\Facades\Socialite;

Route::get('google/auth/redirect', function () {
    return Socialite::driver('google')->redirect();
})->name('google.auth.redirect');

Route::get('auth/google/callback', function () {
    try {
        $googleUser = Socialite::driver('google')->user();

        // Check if user already exists by email
        $existingUser = User::where('email', $googleUser->email)->first();

        if ($existingUser) {
            // User exists, just login and remember the user
            Auth::login($existingUser, true);
        } else {
            // Create new user
            $newUser = User::create([
                'name' => $googleUser->name,
                'email' => $googleUser->email,
                'google_id' => $googleUser->id,
                'password' => bcrypt(Str::random(16)),
                'email_verified_at' => now(), // Already verified by OAuth provider
            ]);

            Auth::login($newUser, true);
        }

        return redirect('/dashboard');
    } catch (\Exception $e) {
        return redirect()->route('login')->with('status', 'Google authentication failed: ' . $e->getMessage());
    }
});

Route::get('github/auth/redirect', function () {
    return Socialite::driver('github')->redirect();
})->name('github.auth.redirect');

Route::get('auth/github/callback', function () {
    try {
        $githubUser = Socialite::driver('github')->user();

        // Check if this GitHub user already exists
        $existingGithubUser = User::where('github_id', $githubUser->id)->first();

        if ($existingGithubUser) {
            // User exists with this GitHub ID, just login and remember
            Auth::login($existingGithubUser, true);
            return redirect('/dashboard');
        }

        // If GitHub provided an email, check if user exists with that email
        if ($githubUser->email) {
            $existingEmailUser = User::where('email', $githubUser->email)->first();

            if ($existingEmailUser) {
                // User exists with this email, just login and remember
                Auth::login($existingEmailUser, true);
                return redirect('/dashboard');
            }
        }

        // Create new user if not found
        $newUser = User::create([
            'name' => $githubUser->name ?? $githubUser->nickname,
            'email' => $githubUser->email ?? "{$githubUser->nickname}@github.user",
            'github_id' => $githubUser->id,
            'password' => bcrypt(Str::random(16)),
            'email_verified_at' => now(),
        ]);

        Auth::login($newUser, true);
        return redirect('/dashboard');
    } catch (\Exception $e) {
        return redirect()->route('login')->with('status', 'GitHub authentication failed: ' . $e->getMessage());
    }
});

require __DIR__.'/settings.php';
require __DIR__.'/auth.php';
