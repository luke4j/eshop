package com.luke.shop.model;

import javax.persistence.*;

/**
 * Created by luke on 2018/7/30.
 */
@Entity
public class TG_Lens extends Model {
    @JoinColumn(nullable = false)
    private Float sph ;
    @JoinColumn(nullable = false)
    private Float cyl ;

    /**标准进货价*/
    private Double pin ;
    /**标准销售价*/
    private Double pout ;

    @ManyToOne
    @JoinColumn(name = "goodsId",nullable = false,foreignKey = @ForeignKey(name = "fk_lens_goods"))
    private TG_Goods goods ;

    @ManyToOne
    @JoinColumn(name = "lensSetupId",nullable = false,foreignKey = @ForeignKey(name = "fk_lens_lensSetup"))
    private TG_LensSetup lensSetup;

    public Double getPin() {
        return pin;
    }

    public void setPin(Double pin) {
        this.pin = pin;
    }

    public Double getPout() {
        return pout;
    }

    public void setPout(Double pout) {
        this.pout = pout;
    }

    public Float getSph() {
        return sph;
    }

    public void setSph(Float sph) {
        this.sph = sph;
    }

    public Float getCyl() {
        return cyl;
    }

    public void setCyl(Float cyl) {
        this.cyl = cyl;
    }

    public TG_Goods getGoods() {
        return goods;
    }

    public void setGoods(TG_Goods goods) {
        this.goods = goods;
    }

    public TG_LensSetup getLensSetup() {
        return lensSetup;
    }

    public void setLensSetup(TG_LensSetup lensSetup) {
        this.lensSetup = lensSetup;
    }
}
