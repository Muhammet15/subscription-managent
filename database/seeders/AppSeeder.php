<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\App;
class AppSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // \App\Models\App::factory(10)->create();
        $apps = [
            [
                'name' => "Instagram",
                'endpoint' => "https://api-insta-test.com/"
            ],
            [
                'name' => "Facebook",
                'endpoint' => "https://api-face-test.com/"
            ],
            [
                'name' => "Tinder",
                'endpoint' => "https://api-tinder-test.com/"
            ],
            [
                'name' => "Sence",
                'endpoint' => "https://api-sence-test.com/"
            ],
            [
                'name' => "FindFind",
                'endpoint' => "https://api-find-test.com/"
            ],
            [
                'name' => "Tech",
                'endpoint' => "https://api-tech-test.com/"
            ],
        ];

        foreach ($apps as $app) {
            App::create($app);
        }

    }
}
