package controlador;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import modelo.Empleado;
import modelo.EmpleadoDAO;
import modelo.Nacionalidad;
import modelo.Usuario;
import modelo.UsuarioDAO;

public class Validar extends HttpServlet {

    EmpleadoDAO edao = new EmpleadoDAO();
    static Empleado em = new Empleado();
    static Usuario us = new Usuario();
    UsuarioDAO cdao = new UsuarioDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if (accion.equalsIgnoreCase("Log In")) {

            String corr = request.getParameter("email");
            String pass = asegurarClave(request.getParameter("password"));

            Empleado item = new Empleado();
            Usuario itm = new Usuario();

            itm.setCorreo(corr);
            itm.setContra(pass);
            item.setCorreo(corr);
            item.setContra(pass);
            em = edao.validar(item);
            us = cdao.validar(itm);
            if (em.getNom() != null) {
                request.setAttribute("user", em);
                request.getRequestDispatcher("Controlador?menu=PrincipalEmp").forward(request, response);
            } else if (us.getNom() != null) {
                request.setAttribute("user", us);
                request.getRequestDispatcher("Controlador?menu=PrincipalUsu").forward(request, response);
            } else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        } else if (accion.equalsIgnoreCase("Registrarse")) {
            request.getRequestDispatcher("Controlador?menu=Registrarse").forward(request, response);
        } else if (accion.equalsIgnoreCase("Registro")) {

            String nombre = request.getParameter("nombres");
            String apell = request.getParameter("apellidos");
            int ced = Integer.parseInt(request.getParameter("cedula"));
            String dir = request.getParameter("Direccion");
            String corr = request.getParameter("email");
            int tele = Integer.parseInt(request.getParameter("telefono"));
            String nac = request.getParameter("nac");
            String pass = asegurarClave(request.getParameter("password"));
            Usuario u = new Usuario(ced, tele, nombre, apell,dir, corr, pass, nac);
            Nacionalidad naci = cdao.buscarNac(u.getNaci());
            cdao.agregar(u, naci);
            cdao.agregartele(u);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
