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
public class Pago {
     Date f_p;
    int cantidad, ced;
    String direccion;

    public Pago() {
    }

    public Pago(Date f_p, int cantidad, int ced, String direccion) {
        this.f_p = f_p;
        this.cantidad = cantidad;
        this.ced = ced;
        this.direccion = direccion;
    }

    public Date getF_p() {
        return f_p;
    }

    public void setF_p(Date f_p) {
        this.f_p = f_p;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getCed() {
        return ced;
    }

    public void setCed(int ced) {
        this.ced = ced;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
}
