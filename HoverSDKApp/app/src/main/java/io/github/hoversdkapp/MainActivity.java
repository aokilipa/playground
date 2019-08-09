package io.github.hoversdkapp;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;

import com.hover.sdk.api.Hover;
import com.hover.sdk.api.HoverParameters;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Hover.initialize(this);

        Intent i = new HoverParameters.Builder(this)
                .request("20c936dd")
                .extra("Buy Bundle", "")
                .buildIntent();
        startActivityForResult(i, 0);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == 0 && resultCode == Activity.RESULT_OK) {
            String[] sessionTextArr = data.getStringArrayExtra("ussd_messages");
            String uuid = data.getStringExtra("uuid");
        } else if (requestCode == 0 && resultCode == Activity.RESULT_CANCELED) {
            Toast.makeText(this, "Error: " + data.getStringExtra("error"), Toast.LENGTH_LONG).show();
        }
    }
}
