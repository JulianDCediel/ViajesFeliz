package controlador;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.List;
import modelo.Alojamiento;
import modelo.AlojamientoDAO;
import modelo.Empleado;
import modelo.EmpleadoDAO;
import modelo.Foto;
import modelo.Usuario;
import modelo.UsuarioDAO;

@MultipartConfig
public class Controlador extends HttpServlet {

    Empleado em = new Empleado();
    EmpleadoDAO edao = new EmpleadoDAO();
    Usuario us = new Usuario();
    UsuarioDAO cdao = new UsuarioDAO();
    Alojamiento al = new Alojamiento();
    AlojamientoDAO adao = new AlojamientoDAO();
    Foto fo = new Foto();
    int ide;
    String idd;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if (menu.equals("PrincipalEmp")) {
            request.getRequestDispatcher("principalEmp.jsp").forward(request, response);
        }
        if (menu.equals("PrincipalUsu")) {
            request.getRequestDispatcher("principalUsu.jsp").forward(request, response);
        }
        if (menu.equals("Registrarse")) {
            request.getRequestDispatcher("registro.jsp").forward(request, response);
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
                case "Add":
                    String Direccion = request.getParameter("direccion");
                    int np = Integer.parseInt(request.getParameter("personas"));
                    int nb = Integer.parseInt(request.getParameter("banos"));
                    int nh = Integer.parseInt(request.getParameter("hab"));
                    String t = request.getParameter("tipo");
                    int prm = Integer.parseInt(request.getParameter("precio"));
                    String ma = request.getParameter("mascotas");
                    String ca = request.getParameter("ca");
                    ;
                    al.setDireccion(Direccion);
                    al.setCed_emp(Validar.em.getCed());
                    al.setN_personas(np);
                    al.setN_baños(nb);
                    al.setN_habitaciones(nh);
                    al.setTipo(t);
                    al.setP_min(prm);
                    al.setMascotas(ma);
                    al.setCal_aire(ca);
                    System.out.println(al.getDireccion() + "uuuuuuuuuuuuuu");
                    adao.agregar(al);
                    request.getRequestDispatcher("Controlador?menu=Alojamiento&accion=Listar").forward(request, response);
                    break;
                case "AddIm":
                    Part filePart = request.getPart("fotos");
                    InputStream ii = filePart.getInputStream();
                    fo.setDireccion("calle20norte");
                    fo.setFoto(ii);
                    request.getRequestDispatcher("Controlador?menu=Alojamiento&accion=Listar").forward(request, response);
                    break;
                case "Delete":
                    idd = request.getParameter("id");
                    adao.deleteFot(idd);
                    adao.deleteAl(idd);
                    request.getRequestDispatcher("Controlador?menu=Alojamiento&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("alojamiento.jsp").forward(request, response);
        }
        if (menu.equals("AlojamientoUsu")) {
            switch (accion) {
                case "Listar":
                    List<Alojamiento> lista = adao.listar();
                    request.setAttribute("Alojamientos", lista);
                    break;
                    
                case "Delete":
                    idd = request.getParameter("id");
                    adao.deleteFot(idd);
                    adao.deleteAl(idd);
                    request.getRequestDispatcher("Controlador?menu=Alojamiento&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("alojamientoUsu.jsp").forward(request, response);
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
