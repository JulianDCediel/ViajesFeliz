package modelo;

public class Usuario {

    int ced;
    String nom, apell, direccion, correo, contra, naci;

    public Usuario() {
    }

    public Usuario(int ced, String nom, String apell, String direccion, String correo, String contra, String naci) {
        this.ced = ced;
        this.nom = nom;
        this.apell = apell;
        this.direccion = direccion;
        this.correo = correo;
        this.contra = contra;
        this.naci = naci;
    }

    public String getNaci() {
        return naci;
    }

    public void setNaci(String naci) {
        this.naci = naci;
    }

    public int getCed() {
        return ced;
    }

    public void setCed(int ced) {
        this.ced = ced;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getApell() {
        return apell;
    }

    public void setApell(String apell) {
        this.apell = apell;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

}
