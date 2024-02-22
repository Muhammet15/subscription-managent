<?php
namespace App\Services;

class MockApiServices
{
    public function googleMockApi($receipt){
        if ($receipt!=""){
            $lastc2=substr($receipt, -2);
            if (is_numeric($lastc2)){
                if ($lastc2 %6==0){
                    return [
                        'status' => false,
                        'err_code' => 'rate-limit'
                    ];
                }
            }
            $lastc=substr($receipt, -1);
            if(is_numeric($lastc)){
                if ($lastc %2==0){
                    return [
                        'status' => false,
                        'expire_date' => null,
                        'err_code' => null
                    ];
                }
                else{
                    $date = date('Y-m-d H:i:s', strtotime('UTC-6'));
                    return [
                        'status' => true,
                        'expire_date' => $date,
                        'err_code' => null
                    ];
                }
            }
        }
        return [
            'status' => false,
            'expire_date' => null,
            'err_code' => null
        ];
    }
    public function iosMockApi($receipt){
        if ($receipt!=""){
            $lastc2=substr($receipt, -2);
            if (is_numeric($lastc2)){
                if ($lastc2 %6==0){
                    return [
                        'status' => false,
                        'err_code' => 'rate-limit'
                    ];
                }
            }
            $lastc=substr($receipt, -1);
            if(is_numeric($lastc)){
                if ($lastc %2==0){
                    return [
                        'status' => false,
                        'expire_date' => null,
                        'err_code' => null
                    ];
                }
                else{

                    $date=date('Y-m-d H:i:s', strtotime('UTC-6'));
                    return [
                        'status' => true,
                        'expire_date' => $date,
                        'err_code' => null
                    ];
                }
            }
        }
        return [
            'status' => false,
            'expire_date' => null,
            'err_code' => null
        ];
    }
}
