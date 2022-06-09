package cyf.action;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import java.util.Map;

public class UserInterceptor extends AbstractInterceptor {
    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
//        获取当前执行的方法
        String methodName = actionInvocation.getProxy().getMethod();
//        得到session对象
        Map<String, Object> session = actionInvocation.getInvocationContext().getSession();
//        获取session,从session中获取登录的管理员账号
        Object obj = session.get("adminInfo");

        //判断
        if (!"login".equals(methodName) && !"list".equals(methodName) && !"register".equals(methodName) && !"result".equals(methodName)){
            //验证
            if (obj == null){
                return "login";
            }else {
                return actionInvocation.invoke();
            }
        }else {
            return actionInvocation.invoke();
        }
    }
}
