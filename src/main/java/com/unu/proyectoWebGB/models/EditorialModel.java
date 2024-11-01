package com.unu.proyectoWebGB.models;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.unu.proyectoWebGB.beans.Autor;
import com.unu.proyectoWebGB.beans.Editorial;

public class EditorialModel extends Conexion {

	CallableStatement cs;
	ResultSet rs;

	public List<Editorial> listarEditorial() {

		/*
		 * ArrayList<Autor> autores = new ArrayList<>(); autores.add(new
		 * Autor(1,"García Marquez", "Colombiana")); autores.add(new Autor(2,"Borges",
		 * "Argentina")); autores.add(new Autor(3,"Allende", "Chilena")); return
		 * autores;
		 */

		try {

			List<Editorial> lista = new ArrayList<>();

			String sql = "CALL sp_listarEditorial()";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			while (rs.next()) {
				Editorial edit = new Editorial();
				edit.setIdEditorial(rs.getInt(1));
				edit.setNombre(rs.getString(2));
				edit.setContacto(rs.getString(3));
				edit.setTelefono(rs.getString(4));
				lista.add(edit);
			}
			this.cerrarConexion();
			return lista;

		} catch (Exception e) {
			this.cerrarConexion();
			return null;
		}

	}

	public int insertarEditorial(Editorial edit) throws SQLException {
		try {
			int filasAfectadas = 0;
			String sql = "CALL sp_insertarEditorial(?,?,?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setString(1, edit.getNombre());
			cs.setString(2, edit.getContacto());
			cs.setString(3, edit.getTelefono());
			filasAfectadas = cs.executeUpdate();
			this.cerrarConexion();
			return filasAfectadas;
		} catch (Exception e) {
			this.cerrarConexion();
			return 0;
		}

	}

	public Editorial obtenerEditorial(int ideditorial) {
		Editorial edit = new Editorial();
		try {
			String sql = "CALL sp_obtenerEditorial(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, ideditorial);
			rs = cs.executeQuery();
			if (rs.next()) {
				edit.setIdEditorial(rs.getInt(1));
				edit.setNombre(rs.getString(2));
				edit.setContacto(rs.getString(3));
				edit.setTelefono(rs.getString(4));
				this.cerrarConexion();
			}

		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
			return null;
		}
		return edit;
	}

	public int modificarEditoral(Editorial edit) throws SQLException {
		try {
			int filasAfectadas = 0;
			String sql = "CALL sp_modificarEditorial(?,?,?,?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, edit.getIdEditorial());
			cs.setString(2, edit.getNombre());
			cs.setString(3, edit.getContacto());
			cs.setString(4, edit.getTelefono());
			filasAfectadas = cs.executeUpdate();
			this.cerrarConexion();
			return filasAfectadas;
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
			return 0;
		}

	}

	public int eliminarEditorial(int ideditorial) throws SQLException {
		try {
			int filasAfectadas = 0;
			String sql = "CALL sp_eliminarEditorial(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, ideditorial);
			filasAfectadas = cs.executeUpdate();
			this.cerrarConexion();
			return filasAfectadas;
		} catch (Exception e) {
			this.cerrarConexion();
			return 0;
		}

	}

}
