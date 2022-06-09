package cyf.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import cyf.entity.Admin;
import cyf.service.AdminService;

public class AdminAction extends ActionSupport implements ModelDriven<Admin> {
    private Admin admin;

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    private AdminService adminService;

    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    public String login(){
        Admin adminInfo = adminService.login(admin);
        if(adminInfo == null){
            return "loginFail";
        }else {
            ActionContext.getContext().getSession().put("adminInfo",adminInfo);
            return "index";
        }
    }

    //注册
    public String add(){
        adminService.register(admin);
        return "login";
    }

    public String registerPage(){
        return "registerPage";
    }

    @Override
    public Admin getModel() {
        return admin;
    }
}
