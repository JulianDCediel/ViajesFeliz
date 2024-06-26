/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class ReservasDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public void agregar(Reserva em) {
        con = cn.Conexion();
        String sql = "INSERT INTO reserva (Id_estado,Total) VALUES (?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, 1);
            ps.setInt(2, em.getTotal());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("ytytttttt" + e);
        }
    }

    public reservasusu buscarReser() {
        con = cn.Conexion();
        reservasusu rr = new reservasusu();
        String sql = "SELECT * FROM reserva WHERE Id = (SELECT MAX(Id) FROM reserva)";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                rr.setIdRes(rs.getInt("Id"));
                rr.setTotal(rs.getInt("Total"));
            }
        } catch (Exception e) {
            System.out.println("ttwqtetqtweq" + e);
        }
        return rr;
    }

    public void updResR() {
        con = cn.Conexion();
        String sql = "UPDATE reserva set Id_estado=2 where Id =(SELECT MAX(Id) FROM reserva)";
        try {
            ps = con.prepareStatement(sql);
            ps.execute();
            System.out.println("biennnnnnnnnnnnn");
        } catch (Exception e) {
            System.out.println("ttwqtetqtweq" + e);
        }
    }

    public void updResfinn(int id) {
        con = cn.Conexion();
        String sql = "UPDATE reserva set Id_estado=2 where Id =?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
            System.out.println("biennnnnnnnnnnnn");
        } catch (Exception e) {
            System.out.println("ttwqtetqtweq" + e);
        }
    }

    public void updResfinalizar(int id) {
        con = cn.Conexion();
        String sql = "UPDATE reserva set Id_estado=3 where Id =?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
            System.out.println("biennnnnnnnnnnnn");
        } catch (Exception e) {
            System.out.println("ttwqtetqtweq" + e);
        }
    }

    public void agregarDet(Reserva em, int re) {
        con = cn.Conexion();
        String sql = "INSERT INTO detalle (Id_alojamiento,Id_usuario,N_personas,Mascotas,F_entrada,F_salida,Id_reserva) VALUES (?,?,?,?,?,?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, em.getDireccion());
            ps.setInt(2, em.getCed());
            ps.setInt(3, em.getN_per());
            ps.setString(4, em.getMascotas());
            java.sql.Date fecha_i_sql = new java.sql.Date(em.getF_i().getTime());
            java.sql.Date fecha_f_sql = new java.sql.Date(em.getF_f().getTime());
            ps.setDate(5, fecha_i_sql);
            ps.setDate(6, fecha_f_sql);
            ps.setInt(7, re);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("ioiiooiio " + e);
        }
    }

    public List<Reserva> obtenerReservas(String id) {
        List<Reserva> reservas = new ArrayList<>();
        con = cn.Conexion();
        String sql = "SELECT Id_alojamiento, Id_usuario, N_personas, Mascotas, F_entrada, F_salida FROM detalle where Id_alojamiento = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Reserva reserva = new Reserva();
                reserva.setDireccion(rs.getString("Id_alojamiento"));
                reserva.setCed(rs.getInt("Id_usuario"));
                reserva.setN_per(rs.getInt("N_personas"));
                reserva.setMascotas(rs.getString("Mascotas"));
                reserva.setF_i(rs.getDate("F_entrada"));
                reserva.setF_f(rs.getDate("F_salida"));
                System.out.println(reserva.toString());
                reservas.add(reserva);

            }
        } catch (Exception e) {
            System.out.println("Error al obtener las reservas: " + e);
        }

        return reservas;
    }

    public List<reservasusu> obtenerListaReservas(int id) {
        List<reservasusu> reservas = new ArrayList<>();
        con = cn.Conexion();
        String sql = "SELECT SUM(p.Cantidad) cantidadP,r.*,d.*,p.*,e.* FROM detalle d join reserva r on d.Id_reserva=r.Id join pago p on p.Id_reserva = r.Id join estado e on e.Id = r.Id_estado where d.Id_Usuario=? GROUP BY r.Id";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                reservasusu reserva = new reservasusu();
                reserva.setDireccion(rs.getString("d.Id_alojamiento"));
                reserva.setCed(rs.getInt("d.Id_usuario"));
                reserva.setN_per(rs.getInt("d.N_personas"));
                reserva.setMascotas(rs.getString("d.Mascotas"));
                reserva.setF_i(rs.getDate("d.F_entrada"));
                reserva.setF_f(rs.getDate("d.F_salida"));
                reserva.setTotal(rs.getInt("r.Total"));
                reserva.setCantP(rs.getInt("cantidadP"));
                reserva.setIdRes(rs.getInt("r.Id"));
                reserva.setEstado(rs.getString("e.estado"));
                System.out.println(reserva.toString());
                reservas.add(reserva);

            }
        } catch (Exception e) {
            System.out.println("Error al obtener las reservas: " + e);
        }

        return reservas;
    }

    public reservasusu obtenerRes(int id) {
        con = cn.Conexion();
        reservasusu reserva = new reservasusu();
        String sql = "SELECT SUM(p.Cantidad) cantidadP,r.*,d.*,p.* FROM detalle d join reserva r on d.Id_reserva=r.Id join pago p on p.Id_reserva = r.Id where r.Id= ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                reserva.setDireccion(rs.getString("d.Id_alojamiento"));
                reserva.setCed(rs.getInt("d.Id_usuario"));
                reserva.setN_per(rs.getInt("d.N_personas"));
                reserva.setMascotas(rs.getString("d.Mascotas"));
                reserva.setF_i(rs.getDate("d.F_entrada"));
                reserva.setF_f(rs.getDate("d.F_salida"));
                reserva.setTotal(rs.getInt("r.Total"));
                reserva.setCantP(rs.getInt("cantidadP"));
                reserva.setIdRes(rs.getInt("r.Id"));
                System.out.println(reserva.toString());
            }
        } catch (Exception e) {
            System.out.println("Error al obtener las reservas: " + e);
        }

        return reserva;
    }

    public void calificacion(int cal, String comen, int id) {
        con = cn.Conexion();
        String sql = "INSERT INTO encuesta (Clasificacion,Comentarios,Id_reserva) VALUES (?,?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, cal);
            ps.setString(2, comen);
            ps.setInt(3, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("ytytttttt" + e);
        }
    }

    public encuesta Busccalificacion(int id) {
        con = cn.Conexion();
        encuesta encu = new encuesta();
        String sql = "select * from encuesta where Id_reserva=?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                encu.setId(rs.getInt("Id_reserva"));
                encu.setComen(rs.getString("Comentarios"));
                encu.setCal(rs.getInt("Clasificacion"));
            }
        } catch (Exception e) {
            System.out.println("Error al obtener las reservas: " + e);
        }

        return encu;
    }
}
