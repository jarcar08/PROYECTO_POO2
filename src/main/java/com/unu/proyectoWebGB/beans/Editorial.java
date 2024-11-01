package com.unu.proyectoWebGB.beans;

public class Editorial {
	private int idEditorial;
	private String nombre;
	private String contacto;
	private String telefono;

	
	
	
	public Editorial() {
		this(0, "","","");
	}

	public Editorial(int idEditorial, String nombre, String contacto, String telefono) {
		super();
		this.idEditorial = idEditorial;
		this.nombre = nombre;
		this.contacto = contacto;
		this.telefono = telefono;
	}

	public int getIdEditorial() {
		return idEditorial;
	}

	public void setIdEditorial(int idEditorial) {
		this.idEditorial = idEditorial;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getContacto() {
		return contacto;
	}

	public void setContacto(String contacto) {
		this.contacto = contacto;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

}
