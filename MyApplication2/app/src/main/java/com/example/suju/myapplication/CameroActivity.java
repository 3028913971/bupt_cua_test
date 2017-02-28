package com.example.suju.myapplication;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Environment;
import android.provider.MediaStore;
import android.view.View;

import java.io.File;
import java.io.IOException;

/**
 * Created by suju on 2016/12/25.
 */
public class CameroActivity extends Activity implements  View.OnClickListener{
    private File currentImageFile = null;
    //在按钮点击事件处写上这些东西，这些是在SD卡创建图片文件的:
    @Override
    public void onClick(View v) {
        File dir = new File(Environment.getExternalStorageDirectory(),"pictures");
        if(dir.exists()){
            dir.mkdirs();
        }
        currentImageFile = new File(dir,System.currentTimeMillis() + ".jpg");
        if(!currentImageFile.exists()){
            try {
                currentImageFile.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        Intent it = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        it.putExtra(MediaStore.EXTRA_OUTPUT, Uri.fromFile(currentImageFile));
        startActivityForResult(it, Activity.DEFAULT_KEYS_DIALER);
    }

    //onActivityResult：
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == Activity.DEFAULT_KEYS_DIALER) {
            //img_show.setImageURI(Uri.fromFile(currentImageFile));
        }

}
}
