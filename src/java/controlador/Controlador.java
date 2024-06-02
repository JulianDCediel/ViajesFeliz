package controlador;

import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import modelo.Alojamiento;
import modelo.AlojamientoDAO;
import modelo.Empleado;
import modelo.EmpleadoDAO;
import modelo.Foto;
import modelo.Nacionalidad;
import modelo.Pago;
import modelo.PagoDAO;
import modelo.Reserva;
import modelo.ReservasDAO;
import modelo.Usuario;
import modelo.UsuarioDAO;
import modelo.encuesta;
import modelo.reservasusu;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

@MultipartConfig
public class Controlador extends HttpServlet {

    Empleado em = new Empleado();
    EmpleadoDAO edao = new EmpleadoDAO();
    Usuario us = new Usuario();
    UsuarioDAO cdao = new UsuarioDAO();
    Alojamiento al = new Alojamiento();
    AlojamientoDAO adao = new AlojamientoDAO();
    ReservasDAO redao = new ReservasDAO();
    PagoDAO pagdao = new PagoDAO();
    Foto fo = new Foto();
    int ide;
    String idd;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        try {
            if (menu.equals("PrincipalEmp")) {
                request.getRequestDispatcher("principalEmp.jsp").forward(request, response);
            }
            if (menu.equals("PrincipalUsu")) {
                request.getRequestDispatcher("principalUsu.jsp").forward(request, response);
            }
            if (menu.equals("Registrarse")) {
                request.getRequestDispatcher("registro.jsp").forward(request, response);
            }
            if (menu.equals("Inicio")) {
                request.getRequestDispatcher("inicio.jsp").forward(request, response);
            }
            if (menu.equals("Empleado")) {
                switch (accion) {
                    case "Listar":
                        List<Empleado> lista = edao.listar();
                        request.setAttribute("empleados", lista);
                        break;

                    case "Add":
                        String Ced = request.getParameter("txtCed");
                        String nom = request.getParameter("txtNombres");
                        String apel = request.getParameter("txtApellidos");
                        String corr = request.getParameter("txtCorreo");
                        String contr = asegurarClave(request.getParameter("txtContra"));

                        em.setCed(Integer.parseInt(Ced));
                        em.setNom(nom);
                        em.setApell(apel);
                        em.setCorreo(corr);
                        em.setContra(contr);

                        edao.agregar(em);
                        request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                        break;

                    case "Edit":
                        ide = Integer.parseInt(request.getParameter("id"));
                        Empleado e = edao.listarId(ide);
                        request.setAttribute("empleado", e);
                        request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                        break;

                    case "Update":
                        String Id2 = request.getParameter("txtCed");
                        String nom2 = request.getParameter("txtNombres");
                        String apell2 = request.getParameter("txtApellidos");
                        String correo2 = request.getParameter("txtCorreo");
                        String contra2 = asegurarClave(request.getParameter("txtContra"));

                        em.setCed(Integer.parseInt(Id2));
                        em.setNom(nom2);
                        em.setApell(apell2);
                        em.setCorreo(correo2);
                        em.setContra(contra2);

                        edao.actualizar(em);
                        request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                        break;

                    case "Delete":
                        ide = Integer.parseInt(request.getParameter("id"));
                        edao.delete(ide);
                        request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                        break;

                    default:
                        throw new AssertionError();
                }
                request.getRequestDispatcher("empleado.jsp").forward(request, response);
            }
            if (menu.equals("Usuario")) {
                switch (accion) {
                    case "Listar":
                        List<Usuario> lista = cdao.listar();
                        request.setAttribute("Clientes", lista);
                        break;
                    case "Ver":
                        ide = Integer.parseInt(request.getParameter("id"));
                        Usuario c = cdao.listarId(ide);
                        request.setAttribute("Cliente", c);
                        request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
                        break;
                    case "Delete":
                        ide = Integer.parseInt(request.getParameter("id"));
                        cdao.delete(ide);
                        System.out.println("aaaaaaaaaaaaaaaaaaaaaa");
                        request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
                        break;

                    default:
                        throw new AssertionError();
                }
                request.getRequestDispatcher("Usuario.jsp").forward(request, response);
            }

            if (menu.equals("Alojamiento")) {
                switch (accion) {
                    case "Listar":
                        List<Alojamiento> lista = adao.listar();
                        request.setAttribute("Alojamientos", lista);
                        break;
                    case "Delete":
                        idd = request.getParameter("id");
                        System.out.println("wwwwwwwwwwwwwwwwwwwwwwwww" + idd);
                        adao.deleteFot(idd);
                        System.out.println("awwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
                        adao.deleteAl(idd);
                        System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqqddddddddddddddddddd");
                        request.getRequestDispatcher("Controlador?menu=Alojamiento&accion=Listar").forward(request, response);
                        break;
                }
                request.getRequestDispatcher("alojamiento.jsp").forward(request, response);
            }
            if (menu.equals("AlojamientoUPD")) {
                try {
                    String direc = request.getParameter("id");
                    Alojamiento alo = adao.buscar(direc);
                    System.out.println("uuuuuuuuuuuuuuuuuuuu" + alo);
                    request.setAttribute("emp", alo);
                } catch (Exception e) {
                }
                request.getRequestDispatcher("Controlador?menu=Alojamiento&accion=Listar").forward(request, response);
            }
            if (menu.equals("AlojamientoUPDF")) {
                try {
                    String Direccion = request.getParameter("direccion");
                    int np = Integer.parseInt(request.getParameter("personas"));
                    int nb = Integer.parseInt(request.getParameter("banos"));
                    int nh = Integer.parseInt(request.getParameter("hab"));
                    String t = request.getParameter("tipo");
                    int prm = Integer.parseInt(request.getParameter("precio"));
                    String ma = request.getParameter("mascotas");
                    String ca = request.getParameter("ca");
                    String ciu = request.getParameter("Ciudad");
                    String barr = request.getParameter("Barrio");
                    Alojamiento all = new Alojamiento();
                    all.setDireccion(Direccion);
                    all.setCed_emp(Validar.em.getCed());
                    all.setN_personas(np);
                    all.setN_baños(nb);
                    all.setN_habitaciones(nh);
                    all.setTipo(t);
                    all.setP_min(prm);
                    all.setMascotas(ma);
                    all.setCal_aire(ca);
                    all.setCiudad(ciu);
                    all.setBarrio(barr);
                    adao.editar(all);
                    System.out.println("uuuuuuuuuuuuuuuuuuuu");
                } catch (Exception e) {
                }
                request.getRequestDispatcher("Controlador?menu=Alojamiento&accion=Listar").forward(request, response);
            }
            if (menu.equals("AlojamientoFotos")) {
                try {
                    Part filePart = request.getPart("fotos");
                    InputStream ii = filePart.getInputStream();
                    String Direccion = request.getParameter("direccion");
                    int Nfoto = Integer.parseInt(request.getParameter("Nfotos"));
                    String nombI = request.getParameter("nomI");
                    fo.setId(Nfoto);
                    fo.setFoto(ii);
                    fo.setDireccion(Direccion);
                    fo.setNombre(nombI);
                    ServletContext contextt = getServletContext();
                    System.out.println("dddddddddddddddddddddddddddddd" + contextt);
                    adao.agregarFoto(fo, contextt);
                    request.getRequestDispatcher("Controlador?menu=Alojamiento&accion=Listar").forward(request, response);
                } catch (Exception e) {
                    System.out.println("111111111111111 " + e);
                }
                request.getRequestDispatcher("alojamiento.jsp").forward(request, response);
            }

            if (menu.equals("AlojamientoADD")) {
                try {
                    Part filePart = request.getPart("fotos");
                    InputStream ii = filePart.getInputStream();
                    String Direccion = request.getParameter("direccion");
                    int np = Integer.parseInt(request.getParameter("personas"));
                    int nb = Integer.parseInt(request.getParameter("banos"));
                    int nh = Integer.parseInt(request.getParameter("hab"));
                    String t = request.getParameter("tipo");
                    int prm = Integer.parseInt(request.getParameter("precio"));
                    String ma = request.getParameter("mascotas");
                    String ca = request.getParameter("ca");
                    String nombI = request.getParameter("nomI");
                    String ciu = request.getParameter("Ciudad");
                    String barr = request.getParameter("Barrio");
                    int Nfoto = Integer.parseInt(request.getParameter("Nfotos"));
                    al.setDireccion(Direccion);
                    al.setCed_emp(Validar.em.getCed());
                    al.setN_personas(np);
                    al.setN_baños(nb);
                    al.setN_habitaciones(nh);
                    al.setTipo(t);
                    al.setP_min(prm);
                    al.setMascotas(ma);
                    al.setCal_aire(ca);
                    fo.setId(Nfoto);
                    fo.setFoto(ii);
                    fo.setDireccion(Direccion);
                    fo.setNombre(nombI);
                    al.setCiudad(ciu);
                    al.setBarrio(barr);
                    adao.agregar(al);
                    ServletContext context = getServletContext();
                    adao.agregarFoto(fo, context);
                    request.getRequestDispatcher("Controlador?menu=Alojamiento&accion=Listar").forward(request, response);
                } catch (Exception e) {
                    System.out.println("ayudaaaaaaaaaaaaaaa" + e);
                }
                request.getRequestDispatcher("alojamiento.jsp").forward(request, response);
            }
            if (menu.equals("AlojamientoUsu")) {
                switch (accion) {
                    case "Listar":
                        List<Alojamiento> lista = adao.listar();
                        request.setAttribute("Alojamientos", lista);
                        break;
                }
                request.getRequestDispatcher("alojamientoUsu.jsp").forward(request, response);
            }
            if (menu.equals("AlojamientoUsuDet")) {
                switch (accion) {
                    case "listar":
                        idd = request.getParameter("id");
                        Alojamiento deta = new Alojamiento();
                        deta = adao.buscar(idd);
                        List<String> fott = adao.Detalles(idd, response);
                        request.setAttribute("em", deta);
                        request.setAttribute("fotos", fott);
                        break;
                }
                request.getRequestDispatcher("detallesAlo.jsp").forward(request, response);
            }

            if (menu.equals("reservas")) {
                switch (accion) {
                    case "listar":
                        idd = request.getParameter("id");
                        Alojamiento deta = new Alojamiento();
                        deta = adao.buscar(idd);
                        int ced = Validar.us.getCed();
                        List<Reserva> reservas = redao.obtenerReservas(idd);
                        request.setAttribute("reservas", reservas);
                        request.setAttribute("em", deta);
                        request.setAttribute("usu", ced);
                        break;
                }
                request.getRequestDispatcher("reservas.jsp").forward(request, response);
            }
            if (menu.equals("reservar")) {

                try {
                    String Direccion = request.getParameter("direccion");
                    int ced = Integer.parseInt(request.getParameter("usuario"));
                    String fecha_inicio_str = request.getParameter("fecha_inicio");
                    String fecha_fin_str = request.getParameter("fecha_fin");
                    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                    Date ini = formato.parse(fecha_inicio_str);
                    Date fin = formato.parse(fecha_fin_str);
                    int np = Integer.parseInt(request.getParameter("personas"));
                    String ma = request.getParameter("mascotas");
                    int total = (int) Double.parseDouble(request.getParameter("total"));
                    Reserva re = new Reserva(ini, fin, np, total, ced, Direccion, ma);
                    redao.agregar(re);
                    reservasusu rp = redao.buscarReser();
                    redao.agregarDet(re, rp.getIdRes());

                    Alojamiento deta = new Alojamiento();
                    deta = adao.buscar(Direccion);
                    int cedu = Validar.us.getCed();
                    List<Reserva> reservas = redao.obtenerReservas(idd);
                    request.setAttribute("reservas", reservas);
                    request.setAttribute("em", deta);
                    request.setAttribute("usu", cedu);
                    request.setAttribute("total", total);
                } catch (Exception e) {
                    System.out.println("porqqqqqqqqqqqqqqqqqqqq" + e);
                }
                request.getRequestDispatcher("pagar.jsp").forward(request, response);
            }

            if (menu.equals("pago")) {

                try {
                    String Direccion = request.getParameter("direccion");
                    int ced = Integer.parseInt(request.getParameter("usuario"));
                    String fecha_pago_str = request.getParameter("fecha_pago");
                    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                    Date pago = formato.parse(fecha_pago_str);
                    int cantidad = Integer.parseInt(request.getParameter("cantidad"));
                    Pago pag = new Pago(pago, cantidad, ced, Direccion);
                    reservasusu rp = redao.buscarReser();
                    if (pag.getCantidad() < rp.getTotal()) {
                        pagdao.agregar(pag, rp.getIdRes());
                    } else {
                        redao.updResR();
                        pagdao.agregar(pag, rp.getIdRes());
                    }

                } catch (Exception e) {
                    System.out.println("porqqqqqqqqqqqqqqqqqqqq" + e);
                }
                request.getRequestDispatcher("Controlador?menu=AlojamientoUsu&accion=Listar").forward(request, response);
            }
            if (menu.equals("reservasUsu")) {
                switch (accion) {
                    case "listar":
                        int ced = Validar.us.getCed();

                        List<reservasusu> reser = redao.obtenerListaReservas(ced);
                        request.setAttribute("reservas", reser);
                        break;
                }
                request.getRequestDispatcher("reservasUsu.jsp").forward(request, response);
            }
            if (menu.equals("reservarFin")) {

                try {
                    int idRe = Integer.parseInt(request.getParameter("id"));
                    reservasusu resus = redao.obtenerRes(idRe);
                    int cedu = Validar.us.getCed();
                    request.setAttribute("em", resus);
                    request.setAttribute("usu", cedu);
                } catch (Exception e) {
                    System.out.println("porqqqqqqqqqqqqqqqqqqqq" + e);
                }
                request.getRequestDispatcher("pagar2.jsp").forward(request, response);
            }
            if (menu.equals("pagofaltante")) {

                try {
                    int idres = Integer.parseInt(request.getParameter("reserva"));
                    String Direccion = request.getParameter("direccion");
                    int ced = Integer.parseInt(request.getParameter("usuario"));
                    String fecha_pago_str = request.getParameter("fecha_pago");
                    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                    Date pago = formato.parse(fecha_pago_str);
                    int cantidad = Integer.parseInt(request.getParameter("faltante"));
                    Pago pag = new Pago(pago, cantidad, ced, Direccion);
                    pagdao.agregar(pag, idres);
                    redao.updResfinn(idres);
                } catch (Exception e) {
                    System.out.println("porqqqqqqqqqqqqqqqqqqqq" + e);
                }
                request.getRequestDispatcher("Controlador?menu=AlojamientoUsu&accion=Listar").forward(request, response);
            }
            if (menu.equals("CuentaUsu")) {
                switch (accion) {
                    case "Listar":
                        int cedd = Validar.us.getCed();
                        Usuario cuen = cdao.buscar(cedd);

                        System.out.println("qqqqqqqqqq" + cuen.getCed());
                        request.setAttribute("Cliente", cuen);
                        break;
                }
                request.getRequestDispatcher("cuenta.jsp").forward(request, response);
            }
            if (menu.equals("Informes")) {
                switch (accion) {
                    case "listar":

                        break;
                }
                request.getRequestDispatcher("informes.jsp").forward(request, response);
            }
            if (menu.equals("EditarUsu")) {

                try {
                    String nombre = request.getParameter("nombres");
                    String apell = request.getParameter("apellidos");
                    int ced = Integer.parseInt(request.getParameter("cedula"));
                    String dir = request.getParameter("Direccion");
                    String corr = request.getParameter("email");
                    int tele = Integer.parseInt(request.getParameter("telefono"));
                    String nac = request.getParameter("nac");
                    String pass = asegurarClave(request.getParameter("password"));
                    Usuario cuen = new Usuario(ced, tele, nombre, apell, dir, corr, pass, nac);
                    System.out.println("qeqweqweqweqw" + cuen.toString());
                    Nacionalidad naci = cdao.buscarNac(cuen.getNaci());
                    cdao.editarU(cuen, naci);
                    cdao.editartele(cuen);
                } catch (Exception e) {
                    System.out.println("porqqqqqqqqqqqqqqqqqqqq" + e);
                }
                request.getRequestDispatcher("Controlador?menu=CuentaUsu&accion=Listar").forward(request, response);
            }
            if (menu.equals("calificar")) {
                int idddd = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("idres", idddd);
                encuesta en = redao.Busccalificacion(idddd);
                request.setAttribute("cal", en);
                System.out.println("ieuqwueiojhdklsahjdklashd" + en.getId());
                request.getRequestDispatcher("encuesta.jsp").forward(request, response);
            }
            if (menu.equals("EnviarCalificar")) {
                int idddd = Integer.parseInt(request.getParameter("id"));
                String coment = request.getParameter("comen");
                int num = Integer.parseInt(request.getParameter("calificacion"));
                request.setAttribute("idres", idddd);
                redao.calificacion(num, coment, idddd);
                request.getRequestDispatcher("Controlador?menu=reservasUsu&accion=listar").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("popopopopopopop" + e);
            System.out.println(request.getParameter("accion"));
        }
    }

    public String asegurarClave(String textoClaro) {
        String claveSha = null;

        try {
            MessageDigest sha256 = MessageDigest.getInstance("SHA-256");
            sha256.update(textoClaro.getBytes());
            claveSha = Base64.getEncoder().encodeToString(sha256.digest());
            System.out.println("Clave sha es: " + claveSha);
            System.out.println("Longitud:" + claveSha.length());
        } catch (NoSuchAlgorithmException ex) {
            System.out.println("Error en instanciar sha256 " + ex.getMessage());
        }

        return claveSha;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
