package cyf.service;

import cyf.entity.Admin;

/**
 * 管理员模块业务逻辑层接口
 */
public interface AdminService {
    /**
     * 注册
     * @param admin
     */
    void register(Admin admin);

    /**
     * 登录
     * @param admin
     * @return
     */
    Admin login(Admin admin);
}
