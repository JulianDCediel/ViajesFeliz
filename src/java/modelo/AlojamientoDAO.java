/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import config.Conexion;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class AlojamientoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r, id_tipo, id_ca;

    public List listar() {
        String sql = "select a.*,f.*,t.*,c.* from alojamiento a join fotos f on a.Direccion = f.Id_alojamiento join tipo t on a.Id_tipo = t.Id join cal_aire c on c.Id= a.Id_cal_aire where f.Id_foto = 1";
        List<Alojamiento> lista = new ArrayList();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Alojamiento em = new Alojamiento();
                String dir = rs.getString("a.Direccion");
                em.setDireccion(dir);
                String direccion = URLEncoder.encode(dir, "UTF-8");
                em.setDenco(direccion);
                em.setCed_emp(rs.getInt("a.Id_empleado"));
                em.setN_personas(rs.getInt("a.N_personas"));
                em.setN_baños(rs.getInt("a.N_banos"));
                em.setN_habitaciones(rs.getInt("a.N_habitaciones"));
                em.setTipo(rs.getString("t.Tipo"));
                em.setP_min(rs.getInt("a.P_min"));
                em.setMascotas(rs.getString("a.Mascotas"));
                em.setCal_aire(rs.getString("c.Opcion"));
                em.setFp(rs.getBinaryStream("f.Fotos"));
                lista.add(em);
            }
        } catch (Exception e) {
        }

        return lista;
    }

    public void listarFoto(String id, HttpServletResponse response) {
        System.out.println(id + "-----");
        String sql = "select a.*,f.* from alojamiento a join fotos f on a.Direccion = f.Id_alojamiento where a.Direccion =? and f.Id_foto = 1";
        InputStream inputstream = null;
        OutputStream outputstream = null;
        BufferedInputStream bufferIn = null;
        BufferedOutputStream bufferou = null;

        try {
            outputstream = response.getOutputStream();
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            System.out.println("uuuuuuuuuuuuuuuu");
            if (rs.next()) {
                System.out.println("qqqqqqqqqqqqqqqqqqqq");
                inputstream = rs.getBinaryStream("f.Fotos");
                bufferIn = new BufferedInputStream(inputstream);
                bufferou = new BufferedOutputStream(outputstream);

                int i = 0;
                while ((i = bufferIn.read()) != -1) {
                    bufferou.write(i);
                }
            }
        } catch (Exception e) {
            System.out.println(e.toString() + "llllllllllllllllllllllllllll");
        }
    }

    public int agregar(Alojamiento em) {

        String sql = "insert into alojamiento(Direccion,Id_empleado,N_personas,N_banos,N_habitaciones,Id_tipo,P_min,Mascotas,Id_cal_aire) values (?,?,?,?,?,?,?,?,?)";
        System.out.println(em.getCal_aire());
        System.out.println(em.getTipo());
        System.out.println(em.getMascotas());
        System.out.println(em.getCed_emp());
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, em.getDireccion());
            ps.setInt(2, em.getCed_emp());
            ps.setInt(3, em.getN_personas());
            ps.setInt(4, em.getN_baños());
            ps.setInt(5, em.getN_habitaciones());
            if (em.getTipo().equals("casa")) {
                id_tipo = 1;
            } else if (em.getTipo().equals("cabaña")) {
                id_tipo = 2;
            }
            System.out.println(id_tipo + "qqqqqqqqqqqq");
            ps.setInt(6, id_tipo);
            ps.setInt(7, em.getP_min());
            ps.setString(8, em.getMascotas());
            if (em.getCal_aire().equals("Calefaccion")) {
                id_ca = 1;
            } else if (em.getCal_aire().equals("Aire")) {
                id_ca = 2;
            } else if (em.getCal_aire().equals("Ambos")) {
                id_ca = 3;
            } else if (em.getCal_aire().equals("Ninguno")) {
                id_ca = 4;
            }
            ps.setInt(9, id_ca);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.toString() + "rrrrrrrrrrrrrrrrrrrrrrrrrr");
        }
        return r;
    }

    public int agregarFoto(Foto em) {

        String sql = "insert into fotos(Fotos,Id_alojamiento) values (?,?)";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, em.getDireccion());
            ps.setBlob(2, em.getFoto());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.toString()+"qqqqqqqqqqqqqqqqqqqqqqq");
        }
        return r;
    }

    public void deleteFot(String id) {
        String sql = "delete from fotos where Id_alojamiento=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(equals(e.toString() + "iiiiiiiiiiiii"));
        }

    }

    public void deleteAl(String id) {
        String sql = "delete from alojamiento where Direccion=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(equals(e.toString() + "ttttttttttttttttttt"));
        }

    }
}
