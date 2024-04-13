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

public class Validar extends HttpServlet {

    EmpleadoDAO edao = new EmpleadoDAO();
    Empleado em = new Empleado();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if (accion.equalsIgnoreCase("Log In")) {
            
            String corr = request.getParameter("email");
            String pass = asegurarClave(request.getParameter("password"));
            
            Empleado item = new Empleado();

            item.setCorreo(corr);
            item.setContra(pass);
            em = edao.validar(item);
            if (em.getNom()!= null){
                request.setAttribute("user", em);
                request.getRequestDispatcher("Controlador?menu=PrincipalEmp").forward(request, response);
            } else if (corr.equals("david321@hotmail.com") && pass.equals("123")) {
                em.setNom("Julian Cediel");
                request.setAttribute("user", em);
                request.getRequestDispatcher("Controlador?menu=PrincipalUsu").forward(request, response);
            } else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
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
