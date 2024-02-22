<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use App\Models\Subscription;
class SubscriptionReport extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'report:subscriptions';

    /**
     * The console command description.
     *
     * @var string
     */

    protected $description = 'Generate subscription report';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        try {
            $report = Subscription::join('devices', 'subscriptions.device_id', '=', 'devices.id')
            ->selectRaw('DATE(subscriptions.expire_date) AS date, devices.os, subscriptions.status, COUNT(*) AS total_subscriptions')
            ->groupBy('date', 'os', 'subscriptions.status')
            ->get();

            \Log::info('Rapor oluşturuldu: ' . json_encode($report));
            $this->info('Rapor başarıyla oluşturuldu log klasörüne bakınız.');


        } catch (\Exception $e) {
            \Log::error('Rapor oluşturma hatası: ' . $e->getMessage());
            $this->error('Rapor oluşturma hatası: ' . $e->getMessage());
        }
    }
}
