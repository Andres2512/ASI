/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;
import modelo.DTOViaticos;

/**
 *
 * @author Vannesa
 */
public interface IntViaticos {
   
    public List listar();

    public DTOViaticos list(int id_viaticos);

    public boolean add(DTOViaticos vi);

    public boolean edit(DTOViaticos vi);

    public boolean eliminar(int id_viaticos);

   
}
