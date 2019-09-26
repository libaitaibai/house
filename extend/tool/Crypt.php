<?php
/**
 * Created by Boume.
 * Date: 2018/3/4
 * Time: 9:17
 */
namespace tool;

class Crypt
{
    protected $key = '185806230c20f90f33dd4a947d86f00160130752af7bd820942d42c504d055e6';

    private function set_key($key = '')
    {
        $this->key = $key ? hash('sha256', $key) : hash('sha256', config('key.admin_key'));
        return $this->key;
    }

    public function encrypt($value, $key = '')
    {
        $encrypt = openssl_encrypt(
            $value,
            'aes-256-cbc',
            $this->set_key($key),
            OPENSSL_RAW_DATA,
            substr($this->key, -16)
        );
        return base64_encode($encrypt);
    }

    public function decrypt($value, $key = '')
    {
        $encrypted = base64_decode($value);
        $decrypted = openssl_decrypt(
            $encrypted,
            'aes-256-cbc',
            $this->set_key($key),
            OPENSSL_RAW_DATA,
            substr($this->key, -16)
        );
        return $decrypted;
    }
}