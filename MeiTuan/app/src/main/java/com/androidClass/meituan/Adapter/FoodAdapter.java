package com.androidClass.meituan.Adapter;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Color;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.androidClass.meituan.R;
import com.androidClass.meituan.model.Address;
import com.androidClass.meituan.model.Food;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.ImageLoader;

import java.util.List;

public class FoodAdapter extends ArrayAdapter {

    private final int resourceId;

    // 创建ImageLoader对象
    private ImageLoader imageLoader ;
    private Context context;


    public FoodAdapter(Context context, int textViewResourceId, List<Food> foods, ImageLoader imageLoader) {
        super(context, textViewResourceId, foods);
        resourceId = textViewResourceId;
        this.imageLoader = imageLoader;
        this.context=context;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {

        Food food = (Food) getItem(position); // 获取当前项的food实例
        View view = LayoutInflater.from(getContext()).inflate(resourceId, null);//实例化一个对象
        // 获取要动态填充的视图对象
        // 食物图片
        ImageView foodImage_ImageView = (ImageView) view.findViewById(R.id.foodImage_ImageView);
        // 食物名称
        TextView foodName_TextView = (TextView) view.findViewById(R.id.foodName_TextView);
        // 食物月售
        TextView foodMonthSale_TextView = (TextView) view.findViewById(R.id.foodMonthSale_TextView);
        // 食物价格
        TextView foodAmount_TextView = (TextView) view.findViewById(R.id.foodAmount_TextView);
        //添加订单
        ImageButton addFood_Button =( ImageButton) view.findViewById(R.id.addFood_Button);

        // 设置值

        DisplayImageOptions options = new DisplayImageOptions.Builder()
                .cacheInMemory(true)
                .cacheOnDisk(true)
                .build();

        imageLoader.displayImage(food.getFoodImg(),foodImage_ImageView,options);
        foodName_TextView.setText(food.getFoodName());
        foodMonthSale_TextView.setText(String.format("月售%s",food.getMonthSale()));
        foodAmount_TextView.setText(food.getFoodAmount());
        addFood_Button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 弹出对话框询问用户是否要添加该商品到购物车
                AlertDialog.Builder builder = new AlertDialog.Builder(context);
                builder.setTitle("添加到购物车");
                builder.setMessage("确定要添加该商品到购物车吗？");
                builder.setPositiveButton("确定", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        // 将该商品加入购物车
                        // TODO: 添加商品到购物车的逻辑
                        Toast.makeText(context, "已添加到购物车", Toast.LENGTH_SHORT).show();
                    }
                });
                builder.setNegativeButton("取消", null);
                builder.show();
            }
        });

        return view;
    }
}
