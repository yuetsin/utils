package com.test.test1;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MainActivity extends AppCompatActivity {
  private static byte[] kkkk = "0ops".getBytes();
  
  private Button btn_check;
  
  private EditText editText;
  
  private TextView textView;
  
  private boolean checkflag1(String paramString) {
    boolean bool1;
    boolean bool2;
    boolean bool3;
    boolean bool4;
    boolean bool5;
    boolean bool6;
    boolean bool7;
    boolean bool8;
    boolean bool9;
    boolean bool10;
    byte[] arrayOfByte = paramString.getBytes();
    byte b1 = getSHA256StrJava(9);
    byte b2 = arrayOfByte[3];
    boolean bool11 = true;
    if (b1 == b2) {
      b1 = 1;
    } else {
      b1 = 0;
    } 
    if (getSHA256StrJava(3) == arrayOfByte[5]) {
      b2 = 1;
    } else {
      b2 = 0;
    } 
    getSHA256StrJava(9);
    if (getSHA256StrJava(11) == arrayOfByte[6]) {
      bool1 = true;
    } else {
      bool1 = false;
    } 
    getSHA256StrJava(9);
    if (getSHA256StrJava(5) == arrayOfByte[8]) {
      bool2 = true;
    } else {
      bool2 = false;
    } 
    getSHA256StrJava(9);
    if (getSHA256StrJava(12) == arrayOfByte[7]) {
      bool3 = true;
    } else {
      bool3 = false;
    } 
    if (getSHA256StrJava(23) == arrayOfByte[2]) {
      bool4 = true;
    } else {
      bool4 = false;
    } 
    getSHA256StrJava(9);
    getSHA256StrJava(9);
    if (getSHA256StrJava(6) == arrayOfByte[11]) {
      bool5 = true;
    } else {
      bool5 = false;
    } 
    if (getSHA256StrJava(3) == arrayOfByte[4]) {
      bool6 = true;
    } else {
      bool6 = false;
    } 
    getSHA256StrJava(9);
    getSHA256StrJava(9);
    getSHA256StrJava(9);
    getSHA256StrJava(9);
    getSHA256StrJava(9);
    if (getSHA256StrJava(8) == arrayOfByte[10]) {
      bool7 = true;
    } else {
      bool7 = false;
    } 
    getSHA256StrJava(9);
    getSHA256StrJava(9);
    if (getSHA256StrJava(15) == arrayOfByte[0]) {
      bool8 = true;
    } else {
      bool8 = false;
    } 
    getSHA256StrJava(9);
    getSHA256StrJava(9);
    getSHA256StrJava(9);
    getSHA256StrJava(9);
    getSHA256StrJava(9);
    if (getSHA256StrJava(7) == arrayOfByte[9]) {
      bool9 = true;
    } else {
      bool9 = false;
    } 
    if (getSHA256StrJava(0) == arrayOfByte[1]) {
      bool10 = true;
    } else {
      bool10 = false;
    } 
    getSHA256StrJava(9);
    if (arrayOfByte[12] != 126)
      bool11 = false; 
    return 0x1 & b1 & b2 & bool1 & bool2 & bool3 & bool4 & bool5 & bool6 & bool7 & bool8 & bool9 & bool10 & bool11;
  }
  
  public static byte getSHA256StrJava(int paramInt) {
    try {
      MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
      messageDigest.update(kkkk);
      byte[] arrayOfByte = messageDigest.digest();
      kkkk = (byte[])arrayOfByte.clone();
      return arrayOfByte[paramInt];
    } catch (NoSuchAlgorithmException noSuchAlgorithmException) {
      noSuchAlgorithmException.printStackTrace();
      return 0;
    } 
  }
  
  native boolean checkflag2(String paramString);
  
  protected void onCreate(Bundle paramBundle) {
    super.onCreate(paramBundle);
    setContentView(2131296284);
    this.btn_check = (Button)findViewById(2131165218);
    this.editText = (EditText)findViewById(2131165238);
    this.textView = (TextView)findViewById(2131165321);
    this.btn_check.setOnClickListener(new View.OnClickListener() {
          public void onClick(View param1View) {
            MainActivity.access$002("0ops".getBytes());
            String str = MainActivity.this.editText.getText().toString();
            if (str.length() == 51 && str.startsWith("0ops{") && str.endsWith("}")) {
              str = str.substring(5, 50);
              if (MainActivity.this.checkflag1(str) == true && MainActivity.this.checkflag2(str) == true) {
                MainActivity.this.textView.setText("Right!");
                return;
              } 
              MainActivity.this.textView.setText("Wrong!");
              return;
            } 
            MainActivity.this.textView.setText("Wrong!");
          }
        });
  }
  
  native String stringFromJNI();
  
  static {
    System.loadLibrary("native-lib");
  }
}
