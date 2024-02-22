<?php
//Mockapi.io üzerinden oluşturmuştum ancak services kısmında yazdığım daha mantıklı geldiği için onu devreye soktum.
function verifyMock(string $receipt)
 {
     $apiStatus = (int) substr($receipt, -1) % 2 === 1;
     $apiUrlOk = 'https://65d5dcc6f6967ba8e3bcc8b5.mockapi.io/api/OK'; //URL İLE MOCK API İSTEĞİ DE YAPILDI AMA SERVİCES KISMINDAKİ MOCK KULLANILDI.
     if ((int) substr($receipt, -2) % 6 === 0) {
        return [
            'status' => false,
            'expire_date' => null,
        ];
    }
     try {
         $apiUrl = $apiStatus ? $apiUrlOk : '';
         $response = Http::get($apiUrl, $receipt);
         $verificationResult = $response->json();
         if ($verificationResult && is_array($verificationResult)) {
             return [
                 'status' => $verificationResult[0]['status'],
                 'expire_date' => \Carbon\Carbon::parse($verificationResult[0]['expire_date'])->format('Y-m-d H:i:s')
             ];
         } else {
             return [
                 'status' => false,
                 'expire_date' => null,
             ];
         }
     } catch (\Exception $exception) {
         return [
             'status' => false,
             'expire_date' => null,
         ];
     }
 }
