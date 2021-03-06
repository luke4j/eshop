package com.luke.shop.eshop.login.service.impl;

import com.luke.shop.eshop.login.dao.ILoginDao;
import com.luke.shop.eshop.login.service.ILoginService;
import com.luke.shop.eshop.login.vo.VOLogin;
import com.luke.shop.eshop.login.vo.VOLoginEditPassword;
import com.luke.shop.eshop.login.vo.VOLoginUserInfo;
import com.luke.shop.model.TSYS_SetupCom;
import com.luke.shop.model.TU_Com;
import com.luke.shop.model.TU_Message;
import com.luke.shop.model.TU_User;
import com.luke.shop.tool.Assertion;
import com.luke.shop.tool.LK;
import com.luke.shop.tool.LKMap;
import com.luke.shop.tool.LoginTuken;
import com.luke.shop.tool.vo.VOIdName;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service
public class LoginService implements ILoginService {

    private static final Logger log = Logger.getLogger(LoginService.class) ;

    @Resource
    private ILoginDao loginDao ;

    @Override
    public List<VOIdName> findCom_5() throws Exception {
        List<TU_Com> listCom = this.loginDao.findCom_5() ;
        final List<VOIdName>  listResult = new ArrayList<>(listCom.size()) ;

        listCom.forEach((TU_Com com)->{
            VOIdName vo = new VOIdName() ;
            vo.setId(com.getId());
            vo.setName(com.getName());
            listResult.add(vo) ;
        });
        return listResult;
    }




    @Override
    public LoginTuken findLogin_2(VOLogin vo) throws Exception {
        LoginTuken tuken = this.loginDao.findlogin_2_1(vo) ;
        Assertion.NotEmpty(tuken,"exp-00002");
        if(LoginTuken.UserType.Root.equals(tuken.getUserType())){
            return tuken ;
        }
        Assertion.NotEmpty(vo.getComId(),"请选择公司");
        Assertion.Equals(vo.getComId(),tuken.getComId(),"异常：exp-00001");
        Assertion.NotEmpty(tuken.getStoreId(),"用户没有分配站点，不能登录");

        TU_Com com = this.loginDao.get(TU_Com.class,tuken.getComId()) ;
        Assertion.True(com.getIsJy(),"公司已被禁用");

        TU_User user = this.loginDao.get(TU_User.class,tuken.getId()) ;
        Assertion.True(user.getB_isDel(),"用户已被禁用");
        return tuken;
    }

    @Override
    public Map<String, Object> getInfo_3(LoginTuken sessionTuken) throws Exception {
        Map<String,Object> resultMap = new HashMap<>(10) ;
        TU_User user = this.loginDao.get(TU_User.class,sessionTuken.getId()) ;
        List<TU_Message> listMessage = this.loginDao.getInfo_3_message(user) ;
        log.info("load msg");
        resultMap.put("msgs", LK.ListObjToListMap(listMessage, new LKMap<String, String>().putEx("reader", "reader").putEx("b_isDel", "b_isDel").putEx("isRead", "isRead"))) ;

        log.info("load role");
        if(LK.ObjIsNotNull(user.getRole())){
            resultMap.put("role",LK.getModelId(user.getRole())) ;
        }

        if(LK.ObjIsNotNull(user.getRole())){
            resultMap.put("funs",LK.getModelId(user.getRole().getListFun()));
        }


        log.info(("load system setup"));
        List<TSYS_SetupCom> listSetupCom = this.loginDao.getInfo_3_system_setup(sessionTuken.getComId()) ;
        resultMap.put("listSetupCom", listSetupCom) ;

        log.info("load time");
        resultMap.put("sysTime", new Date().getTime()) ;

        return resultMap;
    }

    @Override
    public void editPassword_6(LoginTuken sessionTuken, VOLoginEditPassword vo) throws Exception {
        this.loginDao.editPassword_6(vo,sessionTuken.getId()) ;
    }

    @Override
    public VOLoginUserInfo getUserInfo_7(LoginTuken sessionTuken) throws Exception {
        TU_User user =  this.loginDao.get(TU_User.class,sessionTuken.getId());
        VOLoginUserInfo info = new VOLoginUserInfo() ;
        BeanUtils.copyProperties(user,info);
        info.setBrithday(LK.DateToStr_YMD(user.getBrithday()));
        info.setStoreName(user.getStore().getName());
        return info ;
    }
}
