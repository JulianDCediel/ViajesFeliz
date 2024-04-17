/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.io.InputStream;

public class Alojamiento {
    String Direccion,denco,mascotas,Cal_aire,tipo;
    int N_personas,N_baños,N_habitaciones,P_min,ced_emp;
    InputStream fp;
    public Alojamiento() {
    }

    public Alojamiento(String Direccion, String denco, String mascotas, String Cal_aire, String tipo, int N_personas, int N_baños, int N_habitaciones, int P_min, int ced_emp, InputStream fp) {
        this.Direccion = Direccion;
        this.denco = denco;
        this.mascotas = mascotas;
        this.Cal_aire = Cal_aire;
        this.tipo = tipo;
        this.N_personas = N_personas;
        this.N_baños = N_baños;
        this.N_habitaciones = N_habitaciones;
        this.P_min = P_min;
        this.ced_emp = ced_emp;
        this.fp = fp;
    }

    public String getDenco() {
        return denco;
    }

    public void setDenco(String denco) {
        this.denco = denco;
    }


    public InputStream getFp() {
        return fp;
    }

    public void setFp(InputStream fp) {
        this.fp = fp;
    }
    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getMascotas() {
        return mascotas;
    }

    public void setMascotas(String mascotas) {
        this.mascotas = mascotas;
    }

    public String getCal_aire() {
        return Cal_aire;
    }

    public void setCal_aire(String Cal_aire) {
        this.Cal_aire = Cal_aire;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getN_personas() {
        return N_personas;
    }

    public void setN_personas(int N_personas) {
        this.N_personas = N_personas;
    }

    public int getN_baños() {
        return N_baños;
    }

    public void setN_baños(int N_baños) {
        this.N_baños = N_baños;
    }

    public int getN_habitaciones() {
        return N_habitaciones;
    }

    public void setN_habitaciones(int N_habitaciones) {
        this.N_habitaciones = N_habitaciones;
    }

    public int getP_min() {
        return P_min;
    }

    public void setP_min(int P_min) {
        this.P_min = P_min;
    }

    public int getCed_emp() {
        return ced_emp;
    }

    public void setCed_emp(int ced_emp) {
        this.ced_emp = ced_emp;
    }

    @Override
    public String toString() {
        return "Alojamiento{" + "Direccion=" + Direccion + ", mascotas=" + mascotas + ", Cal_aire=" + Cal_aire + ", tipo=" + tipo + ", N_personas=" + N_personas + ", N_ba\u00f1os=" + N_baños + ", N_habitaciones=" + N_habitaciones + ", P_min=" + P_min + ", ced_emp=" + ced_emp + ", fp=" + fp + '}';
    }
        
}
