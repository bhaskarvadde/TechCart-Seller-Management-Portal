package com.techcart.dao;

import com.techcart.model.LoginModel;
import com.techcart.model.SellerModel;

public interface UserDAOInterface {

    SellerModel getUser(LoginModel lm);

    boolean registerSeller(SellerModel seller);
}