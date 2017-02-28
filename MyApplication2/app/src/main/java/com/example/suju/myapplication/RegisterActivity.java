package com.example.blindgo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import com.example.blindgo.User;

public class RegisterActivity extends Activity {

	// 注册组件
	private EditText et_nameRegister, et_password1, et_password2,
			et_phoneRegister;

	// 注册检测用的字符串
	private String username, password1, password2, phone;

	// 服务器返回数据
	private boolean result;
	@SuppressWarnings("unused")
	private String detail;

	private CustomTitleBar title = new CustomTitleBar();

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		// 在主线程中访问HTTP请求
		StrictMode.setThreadPolicy(new StrictMode.ThreadPolicy.Builder()
				.detectDiskReads().detectDiskWrites().detectNetwork()
				.penaltyLog().build());

		StrictMode.setVmPolicy(new StrictMode.VmPolicy.Builder()
				.detectLeakedSqlLiteObjects().detectLeakedClosableObjects()
				.penaltyLog().penaltyDeath().build());

		title.getTitleBar(this, "账号注册");
		setContentView(R.layout.activity_register);

		// 初始化组件数据
		et_nameRegister = (EditText) findViewById(R.id.et_nameRegister);
		et_password1 = (EditText) findViewById(R.id.et_password1);
		et_password2 = (EditText) findViewById(R.id.et_password2);
		et_phoneRegister = (EditText) findViewById(R.id.et_phoneRegister);
	}

	// 点击注册按钮时统一进行相应的检查
	public void clickButtonRegister(View v) {
		username = et_nameRegister.getText().toString();
		password1 = et_password1.getText().toString();
		password2 = et_password2.getText().toString();
		phone = et_phoneRegister.getText().toString();

		// 注册检查成功就发送http请求
		if (registerTest())
			httpRegister();
	}

	// 开始进行注册检测
	public boolean registerTest() {
		if (username.length() == 0) {
			Toast.makeText(RegisterActivity.this, "请输入用户名", Toast.LENGTH_SHORT)
					.show();
			return false;
		}

		if (password1.length() < 6 || password1.length() > 16) {
			Toast.makeText(RegisterActivity.this, "输入密码不合法，密码长度为6~16位字符",
					Toast.LENGTH_SHORT).show();
			return false;
		}

		if (password2.length() < 6 || password2.length() > 16) {
			Toast.makeText(RegisterActivity.this, "输入密码不合法，密码长度为6~16位字符",
					Toast.LENGTH_SHORT).show();
			return false;
		}

		if (!password1.equals(password2)) {
			Toast.makeText(RegisterActivity.this, "两次输入密码不符",
					Toast.LENGTH_SHORT).show();
			return false;
		}

		if (phone.length() == 0) {
			Toast.makeText(RegisterActivity.this, "请输入电话号码", Toast.LENGTH_SHORT)
					.show();
			return false;
		}

		return true;
	}

	public void httpRegister() {
		try {
			String url = "http://123.206.231.163/BlindGoServer1/RegisterServlet?username="
					+ username + "&password=" + password1 + "&phone=" + phone;
			Log.i("注册信息", username + password1 + phone);
			URL httpURL = new URL(url);
			HttpURLConnection conn = (HttpURLConnection) httpURL
					.openConnection();
			conn.setRequestMethod("GET");
			conn.setReadTimeout(5000);
			conn.connect();
			Log.i("注册连接上了", "OK");

			final StringBuffer sb = new StringBuffer();
			String str;
			BufferedReader bfr = new BufferedReader(new InputStreamReader(
					conn.getInputStream()));
			while ((str = bfr.readLine()) != null) {
				sb.append(str);
			}
			JSONObject json = new JSONObject(sb.toString());
			result = json.getBoolean("result");
			detail = json.getString("detail");

			Log.i("注册返回数据", Boolean.toString(result));
			if (result) {

				// 刷新共享类
				User.setUserName(username);
				User.setPassword(password1);
				User.setUserPhone(phone);

				Toast.makeText(RegisterActivity.this, "注册成功",
						Toast.LENGTH_SHORT).show();

				// 注册成功进行跳转
				Intent intent = new Intent(RegisterActivity.this,
						LoginActivity.class);
				startActivity(intent);

			} else {
				Toast.makeText(RegisterActivity.this, "注册失败",
						Toast.LENGTH_SHORT).show();
			}
			conn.disconnect();
		} catch (MalformedURLException ex) {
			ex.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}
}
