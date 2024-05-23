/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.util.Date;

/**
 *
 * @author User
 */
public class reservasusu {

    Date f_i, f_f;
    int n_per, total, ced,cantP,idRes;
    String direccion, mascotas;

    public reservasusu() {
    }

    public reservasusu(Date f_i, Date f_f, int n_per, int total, int ced, int cantP, int idRes, String direccion, String mascotas) {
        this.f_i = f_i;
        this.f_f = f_f;
        this.n_per = n_per;
        this.total = total;
        this.ced = ced;
        this.cantP = cantP;
        this.idRes = idRes;
        this.direccion = direccion;
        this.mascotas = mascotas;
    }

    public int getIdRes() {
        return idRes;
    }

    public void setIdRes(int idRes) {
        this.idRes = idRes;
    }

    public Date getF_i() {
        return f_i;
    }

    public void setF_i(Date f_i) {
        this.f_i = f_i;
    }

    public Date getF_f() {
        return f_f;
    }

    public void setF_f(Date f_f) {
        this.f_f = f_f;
    }

    public int getN_per() {
        return n_per;
    }

    public void setN_per(int n_per) {
        this.n_per = n_per;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getCed() {
        return ced;
    }

    public void setCed(int ced) {
        this.ced = ced;
    }

    public int getCantP() {
        return cantP;
    }

    public void setCantP(int cantP) {
        this.cantP = cantP;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getMascotas() {
        return mascotas;
    }

    public void setMascotas(String mascotas) {
        this.mascotas = mascotas;
    }

    @Override
    public String toString() {
        return "reservasusu{" + "f_i=" + f_i + ", f_f=" + f_f + ", n_per=" + n_per + ", total=" + total + ", ced=" + ced + ", cantP=" + cantP + ", idRes=" + idRes + ", direccion=" + direccion + ", mascotas=" + mascotas + '}';
    }
}
