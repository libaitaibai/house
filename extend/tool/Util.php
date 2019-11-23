<?php

namespace tool;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;



class Util{

    const EMAIL_PORT = 465;
    const EMAIL_NAME = 'UNKNOWN';

    public static function sendEmail($receiver,$body=[],$conf=[]){

        if(empty($receiver)){
            return ['code'=>0,'msg'=>'参数错误'];   
        }
    
        $config = config('mail_config');
        if(!empty($conf)){
             $config = array_merge($config,$conf);
        }

        $sender_name = $config['send_name'];
        $sender_email = $config['send_email'];
        $port = $config['mail_port']?$config['mail_port']:self::EMAIL_PORT;

        $mail = new PHPMailer(true);
        try {
            $mail->CharSet ="UTF-8";                     //设定邮件编码 
            $mail->SMTPDebug = 0;                        // 调试模式输出 
            $mail->isSMTP();                             // 使用SMTP 
            $mail->Host = $config['mail_host'];                // SMTP服务器 
            $mail->SMTPAuth = true;                      // 允许 SMTP 认证 
            $mail->Username = $config['mail_username'];                // SMTP 用户名  即邮箱的用户名 
            $mail->Password = $config['mail_password'];             // SMTP 密码  部分邮箱是授权码(例如163邮箱) 
            $mail->SMTPSecure = 'ssl';                    // 允许 TLS 或者ssl协议 
            $mail->Port = $port;                
            
            $mail->setFrom($sender_email, $sender_name);  
            $mail->addReplyTo($sender_email,$sender_name); 

            $receiver_arr = explode(',',$receiver);
            foreach($receiver_arr as $v){
                  $tmp = preg_split('/#/',$v);
                  $mail->addAddress($tmp[1], $tmp[0]??self::EMAIL_NAME); 
            }

            //Content 
            $mail->isHTML(true);                                 
            $mail->Subject = $body['subject']??''; 
            $mail->Body    = $body['body']??''; 
            $mail->AltBody = $body['alt_body']??''; 
            $mail->send(); 
            
        } catch (Exception $e) {
            return ['code'=>101,'msg'=>$mail->ErrorInfo];
        }

       return ['code'=>0,'msg'=>''];       

    }










}