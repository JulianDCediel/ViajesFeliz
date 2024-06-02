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

    public Usuario buscar(int dni) {
        Usuario cl = new Usuario();
        String sql = "SELECT * FROM usuario u JOIN tel_usu t on u.Id = t.Id_usu JOIN nacionalidad n on n.Id = u.Id_Nac where u.Id=" + dni;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                cl.setCed(rs.getInt("u.Id"));
                cl.setNom(rs.getString("u.Nombres"));
                cl.setApell(rs.getString("u.Apellidos"));
                cl.setDireccion(rs.getString("u.Direccion"));
                cl.setNaci(rs.getString("n.Nombre_pais"));
                cl.setCorreo(rs.getString("u.Correo"));
                cl.setContra(rs.getString("u.Contraseña"));
                cl.setTel(rs.getInt("t.Telefono"));
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

    public Long buscarTel(int id) {
        long tel = 0;
        String sql = "select * from tel_usu where id_usu=" + id;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                tel = rs.getLong("Telefono");
            }
        } catch (Exception e) {
            System.out.println("bbbbbbbbbbbbbbbbbbb" + e);
        }

        return tel;
    }

    public int agregartele(Usuario telefono) {
        String sql = "insert into tel_usu(Telefono,id_usu) values (?,?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setLong(1, telefono.getTel());
            ps.setInt(2, telefono.getCed());

            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
    public int editartele(Usuario telefono) {
        String sql = "UPDATE tel_usu SET Telefono=? WHERE id_usu =?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setLong(1, telefono.getTel());
            ps.setInt(2, telefono.getCed());

            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
    public List listar() {
        String sql = "select u.*,n.*,t.* from usuario u join nacionalidad n on u.Id_Nac = n.Id join tel_usu t on u.Id = t.id_usu";
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
                cl.setTel(rs.getLong("t.Telefono"));
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

    public int editarU(Usuario cl, Nacionalidad n) {
        String sql = "UPDATE usuario SET Nombres=?,Apellidos=?,Id_Nac=?,Direccion=?,Correo=?,Contraseña=? where Id=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);

            ps.setString(1, cl.getNom());
            ps.setString(2, cl.getApell());
            ps.setInt(3, n.getId());
            ps.setString(4, cl.getDireccion());
            ps.setString(5, cl.getCorreo());
            ps.setString(6, cl.getContra());
            ps.setInt(7, cl.getCed());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee" + e);
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
                em.setTel(buscarTel(id));
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
            System.out.println("aaaadasd" +e);
        }
    }
}
