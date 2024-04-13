package modelo;

import config.Conexion;
import controlador.Validar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Empleado validar(Empleado item) {
         Empleado em = new Empleado();
         Validar v = new Validar();

        String sql = "select * from empleado where correo = ? and contraseña = ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, item.correo);
            ps.setString(2, item.contra);
            rs = ps.executeQuery();

            while (rs.next()) {
                em.setCed(rs.getInt("Id"));
                em.setNom(rs.getString("Nombres"));
                em.setApell(rs.getString("Apellidos"));
                em.setCorreo(rs.getString("Correo"));
                em.setContra(rs.getString("Contraseña"));
            }
            con.close();
        } catch (Exception e) {
        }

        return em;
    }

    //CRUD
    public List listar() {
        String sql = "select * from empleado";
        List<Empleado> lista = new ArrayList();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Empleado em = new Empleado();
                em.setCed(rs.getInt("Id"));
                em.setNom(rs.getString("Nombres"));
                em.setApell(rs.getString("Apellidos"));
                em.setCorreo(rs.getString("Correo"));
                em.setContra(rs.getString("Contraseña"));
                lista.add(em);
            }
        } catch (Exception e) {
        }

        return lista;
    }

    public int agregar(Empleado em) {
        String sql = "insert into empleado(Id,Nombres,Apellidos,Correo,Contraseña) values (?,?,?,?,?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, em.getCed());
            ps.setString(2, em.getNom());
            ps.setString(3, em.getApell());
            ps.setString(4, em.getCorreo());
            ps.setString(5, em.getContra());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }

    public Empleado listarId(int id) {
        Empleado em = new Empleado();
        String sql = "select * from empleado where Id=" + id;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                em.setCed(rs.getInt("Id"));
                em.setNom(rs.getString("Nombres"));
                em.setApell(rs.getString("Apellidos"));
                em.setCorreo(rs.getString("Correo"));
                em.setContra(rs.getString("Contraseña"));
            }
        } catch (Exception e) {
        }

        return em;
    }

    public int actualizar(Empleado em) {
        String sql = "update empleado set Nombres=?,Apellidos=?,Correo=?,Contraseña=? where Id=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, em.getNom());
            ps.setString(2, em.getApell());
            ps.setString(3, em.getCorreo());
            ps.setString(4, em.getContra());
            ps.setInt(5, em.getCed());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }

    public void delete(int id) {
        String sql = "delete from empleado where Id=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

}
