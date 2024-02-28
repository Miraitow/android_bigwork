package com.meituan;

import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.test.context.junit4.SpringRunner;
import javax.sql.DataSource;

@Slf4j
@SpringBootApplication
@ServletComponentScan
@RunWith(SpringRunner.class)
@SpringBootTest(classes = {MeiTuanApplication.class})
public class MeiTuanApplication {
    public static void main(String[] args) {
        SpringApplication.run(MeiTuanApplication.class,args);
        log.info("项目启动成功。。。");
    }
    @Autowired
    DataSource dataSource;

    @Test
    public void contextLoads() throws Exception{
        System.out.println("获取的数据库连接为:"+dataSource.getConnection());
    }
}
