package modelo;

public class DTOMateriales {
    /*Id_materiales
    Nombre
    Descripcion
    Precio
    Cantidad
    Marca_Id_marca
    Tipo_materiales_Id_tipo_materiales*/
    
    int Id_materiales;
    String Nombre, Descripcion, Precio;
    int Marca_Id_marca, Tipo_materiales_Id_tipo_materiales, Cantidad;
    int sumarImplemento;

    public DTOMateriales() {
    }

    public DTOMateriales(int sumarImplemento) {
        this.sumarImplemento = sumarImplemento;
    }
    
    public DTOMateriales(String Nombre, String Descripcion, String Precio, int Cantidad, int Marca_Id_marca, int Tipo_materiales_Id_tipo_materiales) {
        this.Nombre = Nombre;
        this.Descripcion = Descripcion;
        this.Precio = Precio;
        this.Cantidad = Cantidad;
        this.Marca_Id_marca = Marca_Id_marca;
        this.Tipo_materiales_Id_tipo_materiales = Tipo_materiales_Id_tipo_materiales;
    }

    public int getSumarImplemento() {
        return sumarImplemento;
    }

    public void setSumarImplemento(int sumarImplemento) {
        this.sumarImplemento = sumarImplemento;
    }

    public int getId_materiales() {
        return Id_materiales;
    }

    public void setId_materiales(int Id_materiales) {
        this.Id_materiales = Id_materiales;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getPrecio() {
        return Precio;
    }

    public void setPrecio(String Precio) {
        this.Precio = Precio;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public int getMarca_Id_marca() {
        return Marca_Id_marca;
    }

    public void setMarca_Id_marca(int Marca_Id_marca) {
        this.Marca_Id_marca = Marca_Id_marca;
    }

    public int getTipo_materiales_Id_tipo_materiales() {
        return Tipo_materiales_Id_tipo_materiales;
    }

    public void setTipo_materiales_Id_tipo_materiales(int Tipo_materiales_Id_tipo_materiales) {
        this.Tipo_materiales_Id_tipo_materiales = Tipo_materiales_Id_tipo_materiales;
    }

       
}


