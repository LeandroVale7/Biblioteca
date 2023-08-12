package model;

import java.sql.*;
import java.util.ArrayList;

public class MenuDAO extends DataBaseDAO {

    public void cadastrar(Menu m) throws Exception {

        String sql = "INSERT INTO menu (titulo, link, icone) VALUES(?,?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, m.getTitulo());
        pstm.setString(2, m.getLink());
        pstm.setString(3, m.getIcone());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Menu> listar() throws Exception {
        ArrayList<Menu> lista = new ArrayList<>();
        String sql = "SELECT * FROM menu";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Menu m = new Menu();
            m.setIdMenu(rs.getInt("idMenu"));
            m.setTitulo(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            lista.add(m);
        }
        this.desconectar();
        return lista;
    }

    public Menu carregaPorIdMenu(int idMenu) throws Exception {
        Menu m = new Menu();
        String sql = "SELECT * FROM menu WHERE idMenu=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idMenu);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            m.setIdMenu(rs.getInt("idMenu"));
            m.setTitulo(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
        }
        this.desconectar();
        return m;
    }

    public void alterar(Menu m) throws Exception {
        String sql = "UPDATE menu SET titulo=?, link=?, icone=? WHERE idMenu=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, m.getTitulo());
        pstm.setString(2, m.getLink());
        pstm.setString(3, m.getIcone());
        pstm.setInt(4, m.getIdMenu());
        pstm.executeUpdate();
        this.desconectar();
    }

    public void excluir(int idMenu) throws Exception {
        String sql = "DELETE FROM menu WHERE idMenu=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idMenu);
        pstm.execute();
        this.desconectar();
    }
}
