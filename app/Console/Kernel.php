<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    protected $commands = [
        \App\Console\Commands\ExpireDateCheckCommand::class,
        \App\Console\Commands\SubscriptionReport::class,
    ];
    /**
     * Define the application's command schedule.
     */
    protected function schedule(Schedule $schedule): void
    {
        $schedule->command('subscription:expire-date-check'); // kaldırılıp php artisan schedule:run ile hızlıca denenebilir.
        $schedule->command('report:subscriptions'); //Günlük rapor ->daily()
    }

    /**
     * Register the commands for the application.
     */
    protected function commands(): void
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
