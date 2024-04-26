package modelo;

import config.Conexion;
import controlador.Validar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Usuario validar(Usuario item) {
        Usuario cl = new Usuario();
        Validar v = new Validar();

        String sql = "select u.*,n.* from usuario u join nacionalidad n on u.Id_Nac = n.Id where u.correo = ? and u.contraseña = ?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, item.correo);
            ps.setString(2, item.contra);
            rs = ps.executeQuery();

            while (rs.next()) {
                cl.setCed(rs.getInt("u.Id"));
                cl.setNom(rs.getString("u.Nombres"));
                cl.setApell(rs.getString("u.Apellidos"));
                cl.setNaci(rs.getString("n.Nombre_pais"));
                System.out.println(cl.getNaci());
                cl.setDireccion(rs.getString("u.Direccion"));
                cl.setCorreo(rs.getString("u.Correo"));
                cl.setContra(rs.getString("u.Contraseña"));
            }
            con.close();
        } catch (Exception e) {
        }

        return cl;
    }

    public Usuario buscar(String dni) {
        Usuario cl = new Usuario();
        String sql = "select * from cliente where Id=" + dni;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                cl.setCed(rs.getInt(1));
                cl.setNom(rs.getString(2));
                cl.setApell(rs.getString(3));
                cl.setDireccion(rs.getString(4));
                cl.setNaci(rs.getString(5));
                cl.setCorreo(rs.getString(6));
                cl.setContra(rs.getString(7));
            }
        } catch (Exception e) {
        }

        return cl;
    }

    public Nacionalidad buscarNac(String Nac) {
        Nacionalidad cl = new Nacionalidad();
        String sql = "select * from nacionalidad where Nombre_pais=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, Nac);
            rs = ps.executeQuery();

            if (rs.next()) {
                cl.setId(rs.getInt("Id"));
                cl.setNom(rs.getString("Nombre_pais"));
            }
        } catch (Exception e) {
        }

        return cl;
    }

    public Nacionalidad buscarNacId(int id) {
        Nacionalidad cl = new Nacionalidad();
        String sql = "select * from nacionalidad where Id=" + id;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                cl.setId(rs.getInt("Id"));
                cl.setNom(rs.getString("Nombre_pais"));
            }
        } catch (Exception e) {
        }

        return cl;
    }
    public int agregartele(Telefono telefono) {
        String sql = "insert into tel_usu(Telefono,id_usu) values (?,?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, telefono.getNumero());
            ps.setInt(2, telefono.getCedula());

            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
    public List listar() {
        String sql = "select u.*,n.* from usuario u join nacionalidad n on u.Id_Nac = n.Id";
        List<Usuario> lista = new ArrayList();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario cl = new Usuario();
                Nacionalidad n = new Nacionalidad();
                cl.setCed(rs.getInt("u.Id"));
                cl.setNom(rs.getString("u.Nombres"));
                cl.setApell(rs.getString("u.Apellidos"));
                cl.setNaci(rs.getString("n.Nombre_pais"));
                cl.setDireccion(rs.getString("u.Direccion"));
                cl.setCorreo(rs.getString("u.Correo"));
                cl.setContra(rs.getString("u.Contraseña"));
                lista.add(cl);
            }

        } catch (Exception e) {

        }

        return lista;
    }

    public int agregar(Usuario cl, Nacionalidad n) {
        String sql = "insert into usuario(Id,Nombres,Apellidos,Id_nac,Direccion,Correo,Contraseña) values (?,?,?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, cl.getCed());
            ps.setString(2, cl.getNom());
            ps.setString(3, cl.getApell());
            ps.setInt(4, n.getId());
            ps.setString(5, cl.getDireccion());
            ps.setString(6, cl.getCorreo());
            ps.setString(7, cl.getContra());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }

    public Usuario listarId(int id) {
        Usuario em = new Usuario();
        Nacionalidad n = new Nacionalidad();
        String sql = "select * from usuario where Id=" + id;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                em.setCed(rs.getInt("Id"));
                em.setNom(rs.getString("Nombres"));
                em.setApell(rs.getString("Apellidos"));
                em.setCorreo(rs.getString("Correo"));
                em.setDireccion(rs.getString("Direccion"));
                n = buscarNacId(rs.getInt("Id_Nac"));
                em.setNaci(n.getNom());
                em.setContra(rs.getString("Contraseña"));
            }
        } catch (Exception e) {
        }

        return em;
    }

    public void delete(int id) {
        String sql = "delete from usuario where Id=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
