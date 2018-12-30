## Set background color on XML

```xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="vertical"
    android:layout_width="fill_parent"
    android:layout_height="fill_parent"
  android:background="@color/green"
    >
<TextView
   android:id="@+id/textview1"
    android:layout_width="fill_parent"
    android:layout_height="wrap_content"
    android:text="@string/pleaseinput"
   android:textColor="@color/orange"
    />
<EditText
 android:id="@+id/edittext1"
 android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:hint="@string/hinttext" >
    </EditText>
<Button
    android:id="@+id/button1"
  android:layout_width="wrap_content"
    android:layout_height="wrap_content"
   android:text="@string/buttonclick"
 android:layout_gravity="center">
 </Button>
</LinearLayout>
```

[文字色と背景色](http://androidhacker.blog94.fc2.com/blog-entry-20.html)
