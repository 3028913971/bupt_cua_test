package com.example.suju.myapplication;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.InputType;
import android.text.TextWatcher;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.TextView;

/**
 * Created by suju on 2016/12/25.
 */

public class LoginActivity extends Activity implements View.OnClickListener {
    private EditText et_name, et_pass;
    private Button mLoginButton, mLoginError, mRegister, ONLYTEST;
    int selectIndex = 1;
    int tempSelect = selectIndex;
    boolean isReLogin = false;
    private int SERVER_FLAG = 0;
    private RelativeLayout countryselect;
    private TextView coutry_phone_sn, coutryName;//
    // private String [] coutry_phone_sn_array,coutry_name_array;
    public final static int LOGIN_ENABLE = 0x01;    //注册完毕了
    public final static int LOGIN_UNABLE = 0x02;    //注册完毕了
    public final static int PASS_ERROR = 0x03;      //注册完毕了
    public final static int NAME_ERROR = 0x04;      //注册完毕了
    final Handler UiMangerHandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            // TODO Auto-generated method stub
            switch (msg.what) {
                case LOGIN_ENABLE:
                    mLoginButton.setClickable(true);
//    mLoginButton.setText(R.string.login);
                    break;
                case LOGIN_UNABLE:
                    mLoginButton.setClickable(false);
                    break;
                case PASS_ERROR:

                    break;
                case NAME_ERROR:
                    break;
            }
            super.handleMessage(msg);
        }
    };
    private Button bt_username_clear;
    private Button bt_pwd_clear;
    private Button bt_pwd_eye;
    private TextWatcher username_watcher;
    private TextWatcher password_watcher;
    /**
     * ATTENTION: This was auto-generated to implement the App Indexing API.
     * See https://g.co/AppIndexing/AndroidStudio for more information.
     */
    //private GoogleApiClient client;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        et_name = (EditText) findViewById(R.id.username);
        et_pass = (EditText) findViewById(R.id.password);

        bt_username_clear  = (Button) findViewById(R.id.bt_pwd_eye);
        // bt_username_clear.setOnClickListener(this);
        // bt_pwd_clear.setOnClickListener(this);
        //bt_pwd_eye.setOnClickList= (Button) findViewById(R.id.bt_username_clear);
        bt_pwd_clear = (Button) findViewById(R.id.bt_pwd_clear);
        //  bt_pwd_eye = (Button) finener(this);
        //initWatcher();
        et_name.addTextChangedListener(username_watcher);
        et_pass.addTextChangedListener(password_watcher);

        mLoginButton = (Button) findViewById(R.id.login);
        mLoginError = (Button) findViewById(R.id.login_error);
        mRegister = (Button) findViewById(R.id.register);
        //  ONLYTEST = (Button) findViewById(R.id.registfer);
        // ONLYTEST.setOnClickListener(this);
        ONLYTEST.setOnLongClickListener((View.OnLongClickListener) this);
        //  mLoginButton.setOnClickListener(this);
        //  mLoginError.setOnClickListener(this);
        //   mRegister.setOnClickListener(this);

    }

    @Override
    public void onClick(View v) {
        switch(v.getId()){
            case R.id.login://login()
                Intent intent=new Intent(LoginActivity.this,MainActivity.class);
                startActivity(intent);
                finish();
                break;
            case R.id.register://zhuce
                break;
            case R.id.bt_pwd_clear:et_pass.setText("");break;
            case R.id.bt_pwd_eye:
                if(et_pass.getInputType() == (InputType.TYPE_CLASS_TEXT|InputType.TYPE_TEXT_VARIATION_PASSWORD)){
               // bt_pwd_eye.setBackgroundResource(R.drawable.button_eye_n);
                et_pass.setInputType(InputType.TYPE_CLASS_TEXT|InputType.TYPE_TEXT_VARIATION_NORMAL);
            }else{
                //bt_pwd_eye.setBackgroundResource(R.drawable.button_eye_n);
                et_pass.setInputType(InputType.TYPE_CLASS_TEXT|InputType.TYPE_TEXT_VARIATION_PASSWORD);
            }
                et_pass.setSelection(et_pass.getText().toString().length());
                break;
            case R.id.login_error:
                Intent intent2=new Intent(LoginActivity.this,MainActivity.class);
                startActivity(intent2);
                finish();break;
            case R.id.bt_username_clear: et_name.setText("");
                break;





        }
    }
}
