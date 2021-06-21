package com.liefox.controller;

import com.liefox.pojo.User;
import com.liefox.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @Author zjh
 * @Date 2021/4/10 上午 1:15
 **/
@Controller
public class upUserInfoController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    /**
     *
     * @param user
     * @return 登录页面
     * @描述  用户信息修改页面
     */
    @RequestMapping("/updateUserInfo")
    public String updateUserInfo(HttpSession session, User user){
        System.out.println(user);
        userService.updateUserInfo(user);
        session.setAttribute("info", "修改成功！");
        return "redirect:/login.jsp";
    }

    /*图片上传，待完成*/
    /*@RequestMapping("/getImage")
    @ResponseBody
    public void getImagesId(HttpServletResponse rp) {
        String filePath = "D:\\idea\\HealthCheck\\web\\static\\pic\\img.png";
        File imageFile = new File(filePath);
        if (imageFile.exists()) {
            FileInputStream fis = null;
            OutputStream os = null;
            try {
                fis = new FileInputStream(imageFile);
                os = rp.getOutputStream();
                int count = 0;
                byte[] buffer = new byte[1024 * 8];
                while ((count = fis.read(buffer)) != -1) {
                    os.write(buffer, 0, count);
                    os.flush();
                }

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    fis.close();
                    os.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }
    }*/
}
