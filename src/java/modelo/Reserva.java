/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.time.LocalDate;
import java.util.Date;

/**
 *
 * @author User
 */
public class Reserva {

    Date f_i, f_f;
    int n_per, total, ced;
    String direccion, mascotas;

    public Reserva() {
    }

    public Reserva(Date f_i, Date f_f, int n_per, int total, int ced, String direccion, String mascotas) {
        this.f_i = f_i;
        this.f_f = f_f;
        this.n_per = n_per;
        this.total = total;
        this.ced = ced;
        this.direccion = direccion;
        this.mascotas = mascotas;
    }

    public int getCed() {
        return ced;
    }

    public void setCed(int ced) {
        this.ced = ced;
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
        return "Reserva{" + "f_i=" + f_i + ", f_f=" + f_f + ", n_per=" + n_per + ", total=" + total + ", ced=" + ced + ", direccion=" + direccion + ", mascotas=" + mascotas + '}';
    }

}
