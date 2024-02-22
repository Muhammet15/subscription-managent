<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Jobs\ExpireDateCheckJob;

class ExpireDateCheckCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'subscription:expire-date-check';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Check and update expire dates for subscriptions';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        ExpireDateCheckJob::dispatch();
        $this->info('Expire date check job dispatched.');
    }
}
