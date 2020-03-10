package controlador;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTOHerramientas;
import modelo.DTOMateriales;
import modeloDAO.DAOHerramientas;
import modeloDAO.DAOMateriales;

public class Administrador extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String accion = request.getParameter("accion");
        JsonObject gson = new JsonObject();
        JsonArray array = new JsonArray();
//   ******************    ACCIONAS DEL CRUD HERRAMIENTA   ********************
        DTOHerramientas hta = new DTOHerramientas();
        DAOHerramientas htaDAO = new DAOHerramientas();
        if (accion.equalsIgnoreCase("ListarHerramienta")) {//                    ACCION PARA LISTAR LOS DATOS EN LA TABLA INVENTARIO
            for (DTOHerramientas invent : htaDAO.listar()) {
                JsonObject item = new JsonObject();
                item.addProperty("getId_herramientas", invent.getId_herramientas());
                item.addProperty("getNombre", invent.getNombre());
                item.addProperty("getDescripcion", invent.getDescripcion());
                item.addProperty("getPrecio", invent.getPrecio());
                item.addProperty("getCantidad", invent.getCantidad());
                item.addProperty("getTipo_herramientas_Id_tipo_herramientas", invent.getTipo_herramientas_Id_tipo_herramientas());
                item.addProperty("sumarCantidad", " <a id='" + invent.getId_herramientas() + "' class=' anadirSumaaaaaa btn btn-outline-info' data-toggle=\"modal\" data-target=\"#modalAñadirImplemento\" href='#'><i class='fas fa-plus'></i></a>"
                        + "<a id='" + invent.getId_herramientas() + "' class=' btn_QuitarImpl btn btn-outline-danger ' data-toggle=\"modal\" data-target=\"#modalQuitarImplemento\" href='#'><i class=\"fas fa-minus\"></i></a>");
                item.addProperty("Editar", "<a id='" + invent.getId_herramientas() + "' class=\"btn btn-warning btnEditar\" style=\"color: #fff\" id=\"<%=Cotizacion.getId_cotizacion()%>\" data-toggle=\"modal\" data-target=\"#modalEditar\"><i class=\"fas fa-edit\"></i></a>");
                item.addProperty("Eliminar", "<a id='" + invent.getId_herramientas() + "' class=\"btn btn-danger btnEliminar\" style=\"color: #fff\" id=\"ejemplo\" target=\"\"><i class=\"fas fa-trash-alt\"></i></a> ");
                array.add(item);
            }
            gson.add("datos", array);
            out.print(gson.toString());
        } else if (accion.equalsIgnoreCase("AgregarHerramientas")) {
            hta.setNombre(request.getParameter("txtNombre"));
            hta.setDescripcion(request.getParameter("txtDescripcionHta"));
            hta.setPrecio(Integer.parseInt(request.getParameter("txtPrecio")));
            hta.setCantidad(Integer.parseInt(request.getParameter("txtCantidad")));
            hta.setTipo_herramientas_Id_tipo_herramientas(Integer.parseInt(request.getParameter("txtTipo_herramientas_Id_tipo_herramientas")));
            if (htaDAO.agregar(hta)) {
                out.print("1");
            } else {
                out.print("0");
            }
        } else if (accion.equalsIgnoreCase("btnActualizarHta")) {
            hta.setId_herramientas(Integer.parseInt(request.getParameter("txtId_herramientas")));
            hta.setNombre(request.getParameter("txtNombre"));
            hta.setDescripcion(request.getParameter("txtDescripcionHta"));
            hta.setPrecio(Integer.parseInt(request.getParameter("txtPrecio")));
            hta.setCantidad(Integer.parseInt(request.getParameter("txtCantidad")));
            hta.setTipo_herramientas_Id_tipo_herramientas(Integer.parseInt(request.getParameter("txtTipo_herramientas_Id_tipo_herramientas")));
            if (htaDAO.editar(hta)) {
                out.print("1");
            } else {
                out.print("0");
            }
        } else if (accion.equalsIgnoreCase("eliminarHerramientas")) {
            if (htaDAO.eliminar(Integer.parseInt(request.getParameter("Id_herramientas")))) {
                out.print("1");
            } else {
                out.print("0");
            }
        }
        if (accion.equalsIgnoreCase("ListarImplementosEscasosHerra")) {//                    ACCION PARA LISTAR LOS DATOS EN LA TABLA INVENTARIO
            for (DTOHerramientas invent : htaDAO.implementosEscasos()) {
                JsonObject item = new JsonObject();
                item.addProperty("nombreImplementoEscaso", invent.getNombre());
                item.addProperty("cantidadImplementoEscaso", invent.getCantidad());
                array.add(item);
            }
            gson.add("datos", array);
            out.print(gson.toString());
        } else if (accion.equalsIgnoreCase("alertaImpelentoEscososHerra")) {//            ACCION PARA AGREGAR LOS DATOS EN LA TABLA INVENTARIO
            if (htaDAO.implementosEscasosAlerta()) {
                out.print("1");
            }
        } else if (accion.equalsIgnoreCase("sumarImplementosHerra")) {//         ACCION PARA ACTUALIZAR LOS DATOS EN LA TABLA INVENTARIO
            DTOHerramientas mtl1 = new DTOHerramientas(Integer.parseInt(request.getParameter("txtSumarImplemento")));
            if (htaDAO.sumaImplemento(mtl1, Integer.parseInt(request.getParameter("idMaterial")))) {
                out.println("1");
            } else {
                out.println("0");
            }
        } else if (accion.equalsIgnoreCase("restarImplementoHerra")) {//         ACCION PARA ACTUALIZAR LOS DATOS EN LA TABLA INVENTARIO
            DTOHerramientas mtl2 = new DTOHerramientas(Integer.parseInt(request.getParameter("txtRestaImplemento")));
            if (htaDAO.restaImplemento(mtl2, Integer.parseInt(request.getParameter("idMaterial")))) {
                out.println("1");
            } else {
                out.println("0");
            }
        }

//   ******************    ACCIONAS DEL CRUD MATERIALES   ********************
        DTOMateriales mtl = new DTOMateriales();
        DAOMateriales mtlDAO = new DAOMateriales();
        if (accion.equalsIgnoreCase("ListarMateriales")) {//                    ACCION PARA LISTAR LOS DATOS EN LA TABLA INVENTARIO
            for (DTOMateriales invent : mtlDAO.listar()) {
                JsonObject item = new JsonObject();
                item.addProperty("getId_materiales", invent.getId_materiales());
                item.addProperty("getNombre", invent.getNombre());
                item.addProperty("getDescripcion", invent.getDescripcion());
                item.addProperty("getPrecio", invent.getPrecio());
                item.addProperty("getCantidad", invent.getCantidad());
                item.addProperty("getMarca_Id_marca", invent.getMarca_Id_marca());
                item.addProperty("getTipo_materiales_Id_tipo_materiales", invent.getTipo_materiales_Id_tipo_materiales());
                item.addProperty("sumarCantidad", " <a id='" + invent.getId_materiales() + "' class=' anadirSumaaaaaa btn btn-outline-info' data-toggle=\"modal\" data-target=\"#modalAñadirImplemento\" href='#'><i class='fas fa-plus'></i></a>"
                        + "<a id='" + invent.getId_materiales() + "' class=' btn_QuitarImpl btn btn-outline-danger ' data-toggle=\"modal\" data-target=\"#modalQuitarImplemento\" href='#'><i class=\"fas fa-minus\"></i></a>");
                item.addProperty("Editar", "<a id='" + invent.getId_materiales() + "' class=\"btn btn-warning btnEditar\" style=\"color: #fff\" id=\"<%=Cotizacion.getId_cotizacion()%>\" data-toggle=\"modal\" data-target=\"#modalEditar\"><i class=\"fas fa-edit\"></i></a>");
                item.addProperty("Eliminar", "<a id='" + invent.getId_materiales() + "' class=\"btn btn-danger btnEliminar\" style=\"color: #fff\" id=\"ejemplo\" target=\"\"><i class=\"fas fa-trash-alt\"></i></a> ");
                array.add(item);
            }
            gson.add("datos", array);
            out.print(gson.toString());
        } else if (accion.equalsIgnoreCase("AgregarMateriales")) {
            mtl.setNombre(request.getParameter("txtNombre"));
            mtl.setDescripcion(request.getParameter("txtDescripcionMtl"));
            mtl.setPrecio(request.getParameter("txtPrecio"));
            mtl.setCantidad(Integer.parseInt(request.getParameter("txtCantidad")));
            mtl.setMarca_Id_marca(Integer.parseInt(request.getParameter("txtMarca_Id_marca")));
            mtl.setTipo_materiales_Id_tipo_materiales(Integer.parseInt(request.getParameter("txtTipo_materiales_Id_tipo_materiales")));
            if (mtlDAO.agregar(mtl)) {
                out.print("1");
            } else {
                out.print("0");
            }
        } else if (accion.equalsIgnoreCase("btnActualizarHtaMateriales")) {
            mtl.setId_materiales(Integer.parseInt(request.getParameter("txtId_materiales")));
            mtl.setNombre(request.getParameter("txtNombre"));
            mtl.setDescripcion(request.getParameter("txtDescripcionMtl"));
            mtl.setPrecio(request.getParameter("txtPrecio"));
            mtl.setCantidad(Integer.parseInt(request.getParameter("txtCantidad")));
            mtl.setMarca_Id_marca(Integer.parseInt(request.getParameter("txtMarca_Id_marca")));
            mtl.setTipo_materiales_Id_tipo_materiales(Integer.parseInt(request.getParameter("txtTipo_materiales_Id_tipo_materiales")));
            if (mtlDAO.editar(mtl)) {
                out.print("1");
            } else {
                out.print("0");
            }
        } else if (accion.equalsIgnoreCase("eliminarMateriales")) {
            if (mtlDAO.eliminar(Integer.parseInt(request.getParameter("Id_materiales")))) {
                out.print("1");
            } else {
                out.print("0");
            }
        }
        if (accion.equalsIgnoreCase("ListarImplementosEscasos")) {//                    ACCION PARA LISTAR LOS DATOS EN LA TABLA INVENTARIO
            for (DTOMateriales invent : mtlDAO.implementosEscasos()) {
                JsonObject item = new JsonObject();
                item.addProperty("nombreImplementoEscaso", invent.getNombre());
                item.addProperty("cantidadImplementoEscaso", invent.getCantidad());
                array.add(item);
            }
            gson.add("datos", array);
            out.print(gson.toString());
        } else if (accion.equalsIgnoreCase("alertaImpelentoEscosos")) {//ACCION PARA AGREGAR LOS DATOS EN LA TABLA INVENTARIO
            if (mtlDAO.implementosEscasosAlerta()) {
                out.print("1");
            }
        } else if (accion.equalsIgnoreCase("sumarImplementos")) {//ACCION PARA ACTUALIZAR LOS DATOS EN LA TABLA INVENTARIO
            DTOMateriales mtl1 = new DTOMateriales(Integer.parseInt(request.getParameter("txtSumarImplemento")));
            if (mtlDAO.sumaImplemento(mtl1, Integer.parseInt(request.getParameter("idMaterial")))) {
                out.println("1");
            } else {
                out.println("0");
            }
        } else if (accion.equalsIgnoreCase("restarImplemento")) {//ACCION PARA ACTUALIZAR LOS DATOS EN LA TABLA INVENTARIO
            DTOMateriales mtl2 = new DTOMateriales(Integer.parseInt(request.getParameter("txtRestaImplemento")));
            if (mtlDAO.restaImplemento(mtl2, Integer.parseInt(request.getParameter("idMaterial")))) {
                out.println("1");
            } else {
                out.println("0");
            }
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
