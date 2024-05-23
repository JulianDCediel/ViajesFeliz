/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author User
 */
public class PagoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public void agregar(Pago em, int res) {
        con = cn.Conexion();
        String sql = "INSERT INTO pago (Fecha,Cantidad,Id_reserva,Id_usuario) VALUES (?,?,?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            java.sql.Date fecha_i_sql = new java.sql.Date(em.getF_p().getTime());
            ps.setDate(1, fecha_i_sql);
            ps.setInt(2, em.getCantidad());
            ps.setInt(3, res);
            ps.setInt(4, em.getCed());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("ytytttttt" + e);
        }
    }
}
