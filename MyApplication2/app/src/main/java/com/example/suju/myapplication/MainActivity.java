package com.example.suju.myapplication;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.view.View;

import java.io.File;
import java.io.IOException;


public class MainActivity extends Activity implements View.OnClickListener{


    public void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }


    @Override
    public void onClick(View v) {
        switch(v.getId()){
            case R.id.btn_camero:
                Intent intent=new Intent(MainActivity.this,CameroActivity.class);
                startActivity(intent);break;
            case R.id.ly_top_search:break;
        }
    }
}
