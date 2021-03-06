package com.desafiolatam.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.desafiolatam.entidades.InscripcionDTO;
import com.desafiolatam.entidades.InscripcionDTO2;
import com.desafiolatam.facade.Facade;

/*
 * 2. En el servlet PosInscripcion se debe agregar al objeto request, los valores que se
guardaron en la base de datos, para luego enviarlos al jsp confirmación.
 */


@WebServlet("/posInscripcion")
public class PosInscripcion extends HttpServlet {
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	   {
	      // obtener los datos del formulario
	      String nombre = request.getParameter("nombre");
	      String celular = request.getParameter("celular");
	      int idCurso = Integer.parseInt(request.getParameter("idCurso"));
	      int idFormaDePago = Integer.parseInt(request.getParameter("idFormaPago"));
	       // instanciar el DTO y asignar los datos
	      InscripcionDTO dto = new InscripcionDTO();
	      dto.setNombre(nombre);
	      dto.setCelular(celular);
	      dto.setIdCurso(idCurso);
	      dto.setIdFormaDePago(idFormaDePago);
	      // invocar al facade para procesar la inscripción
	      Facade facade = new Facade();
	      int idInsc = 0;
	      InscripcionDTO2 dto2 = new InscripcionDTO2();
			try {
					idInsc = facade.registrarInscripcion(dto);
					dto2 = facade.obtieneUltimo();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	       // adjuntar el resultado como atributo en el request
	      request.setAttribute("idInsc", idInsc);
	      request.setAttribute("dto2", dto2);
	       // redireccionar el control hacia la siguiente vista, hacia su servlet de pre-confirmación
	      request.getRequestDispatcher("/preConfirmacion").forward(request, response);
	   }
}
