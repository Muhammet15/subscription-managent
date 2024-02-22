<?php

namespace App\Http\Requests;
use App\Traits\ApiResponse;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;

class RegisterRequest extends FormRequest
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
            'uid' => 'required|string',
            'appId' => 'required|numeric|exists:apps,id',
            'language' => 'required|string',
            'os' => 'required|string|in:ios,android',
        ];
    }

    /**
     * Get the error messages for the defined validation rules.
     *
     * @return array<string, string>
     */
    public function messages(): array
    {
        return [
            'uid.required' => 'UID is required!',
            'appId.required' => 'App ID is required!',
            'language.required' => 'Language is required!',
            'os.required' => 'OS is required!',
            'os.in' => 'OS must be either ios or android.',
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

