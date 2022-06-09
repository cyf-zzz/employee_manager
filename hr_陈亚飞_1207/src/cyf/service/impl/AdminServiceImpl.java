package cyf.service.impl;

import cyf.dao.AdminDao;
import cyf.entity.Admin;
import cyf.service.AdminService;

public class AdminServiceImpl implements AdminService {

    //注入DAO，一定要用接口接收
    private AdminDao adminDao;
    public void setAdminDao(AdminDao adminDao) {
        this.adminDao = adminDao;
    }

    @Override
    public void register(Admin admin) {
        adminDao.save(admin);
    }

    @Override
    public Admin login(Admin admin) {
        return adminDao.findByAdmin(admin);
    }
}
