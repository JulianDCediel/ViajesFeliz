package controlador;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.List;
import modelo.Empleado;
import modelo.EmpleadoDAO;

public class Controlador extends HttpServlet {

    Empleado em = new Empleado();
    EmpleadoDAO edao = new EmpleadoDAO();
    int ide;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if (menu.equals("PrincipalEmp")) {
            request.getRequestDispatcher("principalEmp.jsp").forward(request, response);
        }
        if (menu.equals("PrincipalUsu")) {
            request.getRequestDispatcher("principalUsu.jsp").forward(request, response);
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
