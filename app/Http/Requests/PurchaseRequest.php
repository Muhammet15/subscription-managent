<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use App\Traits\ApiResponse;
use Illuminate\Contracts\Validation\Validator;

class PurchaseRequest extends FormRequest
{
    use ApiResponse;

    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'receipt' => 'required|string',
            'app_id' => 'required|numeric|exists:apps,id',
        ];
    }

        /**
     * Handle a failed validation attempt.
     *
     * @param Validator $validator
     */

     protected function failedValidation(Validator $validator)
     {
         throw new \Illuminate\Validation\ValidationException($validator, $this->errorResponse(false, 'Validation Error', $validator->errors(), 422));
     }
}
