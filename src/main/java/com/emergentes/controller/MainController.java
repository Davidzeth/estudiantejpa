/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.emergentes.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import java.sql.Date;
import com.emergentes.bean.BeanEstudiante;
import com.emergentes.entidades.Estudiante;
import com.emergentes.jpa.EstudianteJpaController;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Deyvid
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet implements Serializable {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        HttpSession ses = request.getSession();
        BeanEstudiante dao = new BeanEstudiante();

        switch (op) {
            case "nuevo":
                request.setAttribute("miobjper", new Estudiante());
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                int id = Integer.parseInt(request.getParameter("id"));
                Estudiante objper = dao.buscar(id);
                request.setAttribute("miobjper", objper);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idEliminar);
                response.sendRedirect("listar.jsp");
                break;
            default:
                response.sendRedirect("listar.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        BeanEstudiante dao = new BeanEstudiante();

        Estudiante objper = new Estudiante();
        objper.setId(id);
        objper.setNombre(request.getParameter("nombre"));
        objper.setApellidos(request.getParameter("apellidos"));
        objper.setEmail(request.getParameter("email"));
        objper.setFechaNacimiento(Date.valueOf(request.getParameter("fechanac")));

        if (id == 0) {
            dao.insertar(objper);
        } else {
            dao.editar(objper);
        }

        response.sendRedirect("listar.jsp");
    }

}
